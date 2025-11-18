module github.com/vdaas/vald-client-go

go 1.25.3

replace (
	cloud.google.com/go => cloud.google.com/go v0.123.1-0.20251118064006-180e103bd3a5
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.72.1-0.20251118064006-180e103bd3a5
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.2.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.7.0
	golang.org/x/crypto => golang.org/x/crypto v0.44.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.30.0
	golang.org/x/net => golang.org/x/net v0.47.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.33.0
	golang.org/x/sync => golang.org/x/sync v0.18.0
	golang.org/x/sys => golang.org/x/sys v0.38.0
	golang.org/x/text => golang.org/x/text v0.31.0
	golang.org/x/tools => golang.org/x/tools v0.39.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20251111163417-95abcf5c77ba
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20251111163417-95abcf5c77ba
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20251111163417-95abcf5c77ba
	google.golang.org/grpc => google.golang.org/grpc v1.77.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.36.10
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.10-20250912141014-52f32327d4b0.1
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20251022142026-3a174f9686a8
	google.golang.org/genproto/googleapis/rpc v0.0.0-20251103181224-f26f9409b101
	google.golang.org/grpc v1.71.0
	google.golang.org/protobuf v1.36.10
)

require (
	golang.org/x/net v0.46.1-0.20251013234738-63d1a5100f82 // indirect
	golang.org/x/sys v0.38.0 // indirect
	golang.org/x/text v0.31.0 // indirect
)
