module github.com/vdaas/vald-client-go

go 1.24.5

replace (
	cloud.google.com/go => cloud.google.com/go v0.121.5-0.20250730221355-e455b54ee859
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.69.1-0.20250730221355-e455b54ee859
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.2.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.7.0
	golang.org/x/crypto => golang.org/x/crypto v0.40.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.26.0
	golang.org/x/net => golang.org/x/net v0.42.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.30.0
	golang.org/x/sync => golang.org/x/sync v0.16.0
	golang.org/x/sys => golang.org/x/sys v0.34.0
	golang.org/x/text => golang.org/x/text v0.27.0
	golang.org/x/tools => golang.org/x/tools v0.35.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20250728155136-f173205681a0
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20250728155136-f173205681a0
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20250728155136-f173205681a0
	google.golang.org/grpc => google.golang.org/grpc v1.74.2
	google.golang.org/protobuf => google.golang.org/protobuf v1.36.6
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.6-20250717185734-6c6e0d3c608e.1
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20250528174236-200df99c418a
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250721164621-a45f3dfb1074
	google.golang.org/grpc v1.71.0
	google.golang.org/protobuf v1.36.6
)

require (
	golang.org/x/net v0.40.0 // indirect
	golang.org/x/sys v0.34.0 // indirect
	golang.org/x/text v0.27.0 // indirect
)
