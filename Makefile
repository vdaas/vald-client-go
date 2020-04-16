#
# Copyright (C) 2019 Vdaas.org Vald team ( kpango, kou-m, rinx )
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

REPO       ?= vdaas
NAME        = vald
VALDREPO    = github.com/$(REPO)/$(NAME)
LANGUAGE    = go
PKGNAME     = $(NAME)-client-$(LANGUAGE)
PKGREPO     = github.com/$(REPO)/$(PKGNAME)

VALD_SHA     = VALD_SHA
VALD_VERSION = VALD_VERSION
VALD_DIR     = vald-origin

PROTO_ROOT  = $(VALD_DIR)/apis/proto
PBGO_TMP    = tmp

PROTOS      = gateway/vald/vald.proto agent/agent.proto payload/payload.proto
PROTOS     := $(PROTOS:%=$(PROTO_ROOT)/%)
PBGOS       = $(PROTOS:$(PROTO_ROOT)/%.proto=%.pb.go)

PROTODIRS  := $(shell find $(PROTO_ROOT) -type d | sed -e "s%$(PROTO_ROOT)/%%g" | grep -v "$(PROTO_ROOT)")

PROTO_PATHS = \
	$(PROTODIRS:%=$(PROTO_ROOT)/%) \
	$(GOPATH)/src/github.com/protocolbuffers/protobuf/src \
	$(GOPATH)/src/github.com/gogo/protobuf/protobuf \
	$(GOPATH)/src/github.com/googleapis/googleapis \
	$(GOPATH)/src/github.com/envoyproxy/protoc-gen-validate

MAKELISTS   = Makefile

red    = /bin/echo -e "\x1b[31m\#\# $1\x1b[0m"
green  = /bin/echo -e "\x1b[32m\#\# $1\x1b[0m"
yellow = /bin/echo -e "\x1b[33m\#\# $1\x1b[0m"
blue   = /bin/echo -e "\x1b[34m\#\# $1\x1b[0m"
pink   = /bin/echo -e "\x1b[35m\#\# $1\x1b[0m"
cyan   = /bin/echo -e "\x1b[36m\#\# $1\x1b[0m"

define go-get
	GO111MODULE=off go get -u $1
endef

define mkdir
	mkdir -p $1
endef

.PHONY: all
## execute clean and proto
all: clean proto mod

.PHONY: help
## print all available commands
help:
	@awk '/^[a-zA-Z_0-9%:\\\/-]+:/ { \
	  helpMessage = match(lastLine, /^## (.*)/); \
	  if (helpMessage) { \
	    helpCommand = $$1; \
	    helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
      gsub("\\\\", "", helpCommand); \
      gsub(":+$$", "", helpCommand); \
	    printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
	  } \
	} \
	{ lastLine = $$0 }' $(MAKELISTS) | sort -u
	@printf "\n"

.PHONY: clean
## clean
clean:
	rm -rf $(PROTODIRS)
	rm -rf $(PBGO_TMP)
	rm -rf $(VALD_DIR)

.PHONY: proto
## build proto
proto: $(PBGOS)

$(PROTODIRS):
	$(call mkdir, $@)
	$(call rm, -rf, $@/*)

$(PBGOS): $(VALD_DIR) proto/deps $(PROTODIRS)
	@$(call green, "generating .pb.go files...")
	$(call mkdir, $(PBGO_TMP))
	sed -i -e '/^.*gql\.proto.*$$\|^.*gql\..*_type.*$$/d' $(patsubst %.pb.go,$(PROTO_ROOT)/%.proto,$@)
	protoc \
		$(PROTO_PATHS:%=-I %) \
		--gogofast_out=plugins=grpc:$(PBGO_TMP) \
		$(patsubst %.pb.go,$(PROTO_ROOT)/%.proto,$@)
	mv $(PBGO_TMP)/$(VALDREPO)/apis/grpc/$@ $(dir $@)
	rm -rf $(PBGO_TMP)
	sed -i 's:$(VALDREPO)/apis/grpc:$(PKGREPO):g' $@

$(VALD_DIR):
	git clone --depth 1 https://$(VALDREPO) $(VALD_DIR)

.PHONY: vald/sha/print
## print VALD_SHA value
vald/sha/print:
	@cat $(VALD_SHA)

.PHONY: vald/sha/update
## update VALD_SHA value
vald/sha/update: $(VALD_DIR)
	(cd $(VALD_DIR); git rev-parse HEAD > ../$(VALD_SHA))
	cp $(VALD_DIR)/versions/VALD_VERSION $(VALD_VERSION)

.PHONY: vald/version/print
## print VALD_VERSION value
vald/version/print:
	@cat $(VALD_VERSION)

.PHONY: mod
## update go.mod
mod:
	go mod tidy
	go mod vendor
	rm -rf vendor

.PHONY: proto/deps
## install proto deps
proto/deps: \
	$(GOPATH)/bin/protoc-gen-doc \
	$(GOPATH)/bin/protoc-gen-go \
	$(GOPATH)/bin/protoc-gen-gogo \
	$(GOPATH)/bin/protoc-gen-gofast \
	$(GOPATH)/bin/protoc-gen-gogofast \
	$(GOPATH)/bin/protoc-gen-gogofaster \
	$(GOPATH)/bin/protoc-gen-gogoslick \
	$(GOPATH)/bin/protoc-gen-grpc-gateway \
	$(GOPATH)/bin/protoc-gen-swagger \
	$(GOPATH)/bin/protoc-gen-validate \
	$(GOPATH)/bin/prototool \
	$(GOPATH)/bin/swagger \
	$(GOPATH)/src/google.golang.org/genproto \
	$(GOPATH)/src/github.com/protocolbuffers/protobuf \
	$(GOPATH)/src/github.com/googleapis/googleapis

$(GOPATH)/src/github.com/protocolbuffers/protobuf:
	git clone \
		--depth 1 \
		https://github.com/protocolbuffers/protobuf \
		$(GOPATH)/src/github.com/protocolbuffers/protobuf

$(GOPATH)/src/github.com/googleapis/googleapis:
	git clone \
		--depth 1 \
		https://github.com/googleapis/googleapis \
		$(GOPATH)/src/github.com/googleapis/googleapis

$(GOPATH)/src/google.golang.org/genproto:
	$(call go-get, google.golang.org/genproto/...)

$(GOPATH)/bin/protoc-gen-go:
	$(call go-get, github.com/golang/protobuf/protoc-gen-go)

$(GOPATH)/bin/protoc-gen-gogo:
	$(call go-get, github.com/gogo/protobuf/protoc-gen-gogo)

$(GOPATH)/bin/protoc-gen-gofast:
	$(call go-get, github.com/gogo/protobuf/protoc-gen-gofast)

$(GOPATH)/bin/protoc-gen-gogofast:
	$(call go-get, github.com/gogo/protobuf/protoc-gen-gogofast)

$(GOPATH)/bin/protoc-gen-gogofaster:
	$(call go-get, github.com/gogo/protobuf/protoc-gen-gogofaster)

$(GOPATH)/bin/protoc-gen-gogoslick:
	$(call go-get, github.com/gogo/protobuf/protoc-gen-gogoslick)

$(GOPATH)/bin/protoc-gen-grpc-gateway:
	$(call go-get, github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway)

$(GOPATH)/bin/protoc-gen-swagger:
	$(call go-get, github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger)

$(GOPATH)/bin/protoc-gen-validate:
	$(call go-get, github.com/envoyproxy/protoc-gen-validate)

$(GOPATH)/bin/prototool:
	$(call go-get, github.com/uber/prototool/cmd/prototool)

$(GOPATH)/bin/protoc-gen-doc:
	$(call go-get, github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc)

$(GOPATH)/bin/swagger:
	$(call go-get, github.com/go-swagger/go-swagger/cmd/swagger)
