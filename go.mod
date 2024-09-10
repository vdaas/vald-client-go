module github.com/vdaas/vald-client-go

go 1.21

replace (
	cloud.google.com/go => cloud.google.com/go v0.115.2-0.20240909221304-6720291ef1e5
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.62.1-0.20240909221304-6720291ef1e5
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.1.0
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.6.0
	golang.org/x/crypto => golang.org/x/crypto v0.27.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.21.0
	golang.org/x/net => golang.org/x/net v0.29.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.23.0
	golang.org/x/sync => golang.org/x/sync v0.8.0
	golang.org/x/sys => golang.org/x/sys v0.25.0
	golang.org/x/text => golang.org/x/text v0.18.0
	golang.org/x/tools => golang.org/x/tools v0.25.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20240903143218-8af14fe29dc1
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20240903143218-8af14fe29dc1
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20240903143218-8af14fe29dc1
	google.golang.org/grpc => google.golang.org/grpc v1.66.1
	google.golang.org/protobuf => google.golang.org/protobuf v1.34.2
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.34.2-20240717164558-a6c49f84cc0f.2
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20240604185151-ef581f913117
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240827150818-7e3bb234dfed
	google.golang.org/grpc v1.66.0
	google.golang.org/protobuf v1.34.2
)

require (
	golang.org/x/net v0.26.0 // indirect
	golang.org/x/sys v0.25.0 // indirect
	golang.org/x/text v0.18.0 // indirect
)
