module github.com/vdaas/vald-client-go

go 1.24.0

replace (
	cloud.google.com/go => cloud.google.com/go v0.118.3-0.20250217104740-ce7299f855b5
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.66.3-0.20250217104740-ce7299f855b5
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.2.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.6.0
	golang.org/x/crypto => golang.org/x/crypto v0.33.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.23.0
	golang.org/x/net => golang.org/x/net v0.35.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.26.0
	golang.org/x/sync => golang.org/x/sync v0.11.0
	golang.org/x/sys => golang.org/x/sys v0.30.0
	golang.org/x/text => golang.org/x/text v0.22.0
	golang.org/x/tools => golang.org/x/tools v0.30.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20250212204824-5a70512c5d8b
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20250212204824-5a70512c5d8b
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20250212204824-5a70512c5d8b
	google.golang.org/grpc => google.golang.org/grpc v1.70.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.36.5
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.5-20250130201111-63bb56e20495.1
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20241202173237-19429a94021a
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250124145028-65684f501c47
	google.golang.org/grpc v1.67.1
	google.golang.org/protobuf v1.36.5
)

require (
	golang.org/x/net v0.33.0 // indirect
	golang.org/x/sys v0.30.0 // indirect
	golang.org/x/text v0.22.0 // indirect
)
