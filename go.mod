module github.com/vdaas/vald-client-go

go 1.23.3

replace (
	cloud.google.com/go => cloud.google.com/go v0.116.1-0.20241205001554-f087721b7b20
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.64.1-0.20241205001554-f087721b7b20
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.1.0
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.6.0
	golang.org/x/crypto => golang.org/x/crypto v0.30.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.22.0
	golang.org/x/net => golang.org/x/net v0.32.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.24.0
	golang.org/x/sync => golang.org/x/sync v0.10.0
	golang.org/x/sys => golang.org/x/sys v0.28.0
	golang.org/x/text => golang.org/x/text v0.21.0
	golang.org/x/tools => golang.org/x/tools v0.28.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20241202173237-19429a94021a
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20241202173237-19429a94021a
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20241202173237-19429a94021a
	google.golang.org/grpc => google.golang.org/grpc v1.68.1
	google.golang.org/protobuf => google.golang.org/protobuf v1.35.2
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.35.2-20241127180247-a33202765966.1
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20240903143218-8af14fe29dc1
	google.golang.org/genproto/googleapis/rpc v0.0.0-20241118233622-e639e219e697
	google.golang.org/grpc v1.67.1
	google.golang.org/protobuf v1.35.2
)

require (
	golang.org/x/net v0.29.0 // indirect
	golang.org/x/sys v0.28.0 // indirect
	golang.org/x/text v0.21.0 // indirect
)
