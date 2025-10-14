module github.com/vdaas/vald-client-go

go 1.24.5

replace (
	cloud.google.com/go => cloud.google.com/go v0.123.1-0.20251013201426-8fffca2819fa
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.71.1-0.20251013201426-8fffca2819fa
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.2.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.7.0
	golang.org/x/crypto => golang.org/x/crypto v0.43.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.29.0
	golang.org/x/net => golang.org/x/net v0.46.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.32.0
	golang.org/x/sync => golang.org/x/sync v0.17.0
	golang.org/x/sys => golang.org/x/sys v0.37.0
	golang.org/x/text => golang.org/x/text v0.30.0
	golang.org/x/tools => golang.org/x/tools v0.38.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20251007200510-49b9836ed3ff
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20251007200510-49b9836ed3ff
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20251007200510-49b9836ed3ff
	google.golang.org/grpc => google.golang.org/grpc v1.76.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.36.10
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.10-20250912141014-52f32327d4b0.1
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20250804133106-a7a43d27e69b
	google.golang.org/genproto/googleapis/rpc v0.0.0-20251002232023-7c0ddcbb5797
	google.golang.org/grpc v1.71.0
	google.golang.org/protobuf v1.36.10
)

require (
	golang.org/x/net v0.42.0 // indirect
	golang.org/x/sys v0.37.0 // indirect
	golang.org/x/text v0.30.0 // indirect
)
