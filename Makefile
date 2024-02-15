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

ROOTDIR = $(eval ROOTDIR := $(shell git rev-parse --show-toplevel))$(ROOTDIR)
GO_VERSION := $(eval GO_VERSION := $(shell cat GO_VERSION))$(GO_VERSION)

MAKELISTS   = Makefile

red    = /bin/echo -e "\x1b[31m\#\# $1\x1b[0m"
green  = /bin/echo -e "\x1b[32m\#\# $1\x1b[0m"
yellow = /bin/echo -e "\x1b[33m\#\# $1\x1b[0m"
blue   = /bin/echo -e "\x1b[34m\#\# $1\x1b[0m"
pink   = /bin/echo -e "\x1b[35m\#\# $1\x1b[0m"
cyan   = /bin/echo -e "\x1b[36m\#\# $1\x1b[0m"

.PHONY: all
## execute clean and proto
all: clean sync/v1 mod clean

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

$(VALD_DIR):
	git clone --depth 1 https://$(VALDREPO) $(VALD_DIR)

.PHONY: sync/v1
## sync/v1 synchronize VALD_DIR's generated v1 pbgo to v1 dir and patch it
sync/v1: $(VALD_DIR)
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
	rm -rf $(VALD_DIR)

.PHONY: vald/sha/print
## print VALD_SHA value
vald/sha/print:
	@cat $(VALD_SHA)

.PHONY: vald/sha/update
## update VALD_SHA value
vald/sha/update: $(VALD_DIR)
	(cd $(VALD_DIR); git rev-parse HEAD > ../$(VALD_SHA))
	cp $(VALD_DIR)/versions/VALD_VERSION $(VALD_VERSION)
	cp $(VALD_DIR)/versions/GO_VERSION $(ROOTDIR)/GO_VERSION

.PHONY: vald/version/print
## print VALD_VERSION value
vald/version/print:
	@cat $(VALD_VERSION)

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
