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
VALD_CHECKOUT_REF ?= main

ROOTDIR = $(eval ROOTDIR := $(shell git rev-parse --show-toplevel))$(ROOTDIR)
GO_VERSION := $(eval GO_VERSION := $(shell cat GO_VERSION))$(GO_VERSION)
TEST_DATASET_PATH = wordvecs1000.json

MAKELISTS   = Makefile

red    = /bin/echo -e "\x1b[31m\#\# $1\x1b[0m"
green  = /bin/echo -e "\x1b[32m\#\# $1\x1b[0m"
yellow = /bin/echo -e "\x1b[33m\#\# $1\x1b[0m"
blue   = /bin/echo -e "\x1b[34m\#\# $1\x1b[0m"
pink   = /bin/echo -e "\x1b[35m\#\# $1\x1b[0m"
cyan   = /bin/echo -e "\x1b[36m\#\# $1\x1b[0m"

.PHONY: all
## execute clean and proto
all: clean proto mod clean

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
	-@rm -rf $(VALD_DIR)

.PHONY: proto
## proto synchronize VALD_DIR's generated v1 pbgo to v1 dir and patch it
proto: $(VALD_DIR)
	rm -rf $(ROOTDIR)/v1
	cp -r $(VALD_DIR)/apis/grpc/v1 $(ROOTDIR)/v1
	rm -rf $(ROOTDIR)/v1/discoverer \
	    $(ROOTDIR)/v1/agent/sidecar \
	    $(ROOTDIR)/v1/manager \
	    $(ROOTDIR)/v1/rpc
	    # $(ROOTDIR)/v1/mirror \
	find $(ROOTDIR)/v1/* -name '*.go' | xargs sed -i -E "s%github.com/vdaas/vald/internal/net/grpc/codes%google.golang.org/grpc/codes%g"
	find $(ROOTDIR)/v1/* -name '*.go' | xargs sed -i -E "s%github.com/vdaas/vald/internal/net/grpc/status%google.golang.org/grpc/status%g"
	find $(ROOTDIR)/v1/* -name '*.go' | xargs sed -i -E "s%github.com/vdaas/vald/apis/grpc/v1%github.com/vdaas/vald-client-go/v1%g"
	find $(ROOTDIR)/v1/* -name '*.go' | xargs sed -i -E "s%github.com/vdaas/vald/internal/io%io%g"
	find $(ROOTDIR)/v1/* -name '*.go' | xargs sed -i -E "s%github.com/vdaas/vald/internal/sync%sync%g"

$(VALD_DIR):
	git clone https://$(VALDREPO) $(VALD_DIR)

.PHONY: vald/checkout
## checkout vald repository
vald/checkout: $(VALD_DIR)
	cd $(VALD_DIR) && git checkout $(VALD_CHECKOUT_REF)

.PHONY: vald/origin/sha/print
## print origin VALD_SHA value
vald/origin/sha/print: $(VALD_DIR)
	@cd $(VALD_DIR) && git rev-parse HEAD | tr -d '\n'

.PHONY: vald/sha/print
## print VALD_SHA value
vald/sha/print:
	@cat $(VALD_SHA)

.PHONY: vald/sha/update
## update VALD_SHA value
vald/sha/update: $(VALD_DIR)
	(cd $(VALD_DIR); git rev-parse HEAD | tr -d '\n' > ../$(VALD_SHA))

.PHONY: vald/version/print
## print VALD_VERSION value
vald/version/print:
	@cat $(VALD_VERSION)

.PHONY: vald/client/version/print
## print VALD_CLIENT_JAVA_VERSION value
vald/client/version/print: vald/version/print

.PHONY: vald/client/version/update
## update VALD_CLIENT_JAVA_VERSION value
vald/client/version/update: $(VALD_DIR)
	cp $(VALD_DIR)/versions/VALD_VERSION $(VALD_VERSION)
	cp $(VALD_DIR)/versions/GO_VERSION $(ROOTDIR)/GO_VERSION

.PHONY: test
## Execute test
test: $(TEST_DATASET_PATH)
	go test -v ./tests/v1/e2e_test.go

$(TEST_DATASET_PATH):
	curl -L https://raw.githubusercontent.com/rinx/word2vecjson/master/data/wordvecs1000.json -o $(TEST_DATASET_PATH)

.PHONY: ci/deps/install
## install deps for CI environment
ci/deps/install:
	@echo "Nothing do be done"

.PHONY: ci/deps/update
## update deps for CI environment
ci/deps/update: mod

.PHONY: ci/package/prepare
## prepare for publich
ci/package/prepare:
	@echo "Nothing do be done"

.PHONY: ci/package/publish
## publich packages
ci/package/publish:
	@echo "Nothing do be done"

.PHONY: mod
## update go.mod
mod:
	rm -rf $(ROOTDIR)/go.mod $(ROOTDIR)/go.sum
	cp $(ROOTDIR)/go.mod.default $(ROOTDIR)/go.mod
	GOPRIVATE=$(VALDREPO) go mod tidy

.PHONY: version/go
## print go version
version/go:
	@echo $(GO_VERSION)
