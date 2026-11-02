module github.com/vdaas/vald-client-go

go 1.27.2

replace (
	cloud.google.com/go => cloud.google.com/go v0.123.1-0.20261102034311-1fcd6f6c8b55
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.86.2-0.20261102080544-867fe707ef38
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.3.3
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.7.0
	golang.org/x/crypto => golang.org/x/crypto v0.58.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.42.0
	golang.org/x/net => golang.org/x/net v0.62.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.37.0
	golang.org/x/sync => golang.org/x/sync v0.24.0
	golang.org/x/sys => golang.org/x/sys v0.49.0
	golang.org/x/text => golang.org/x/text v0.43.0
	golang.org/x/tools => golang.org/x/tools v0.52.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20261026165753-2ffab32bce7e
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20261026165753-2ffab32bce7e
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20261026165753-2ffab32bce7e
	google.golang.org/grpc => google.golang.org/grpc v1.85.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.36.12
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.12-20260825204119-511051f7f437.2
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20260817212433-ac3dfec99bb1
	google.golang.org/genproto/googleapis/rpc v0.0.0-20261019180522-ce908d29299b
	google.golang.org/grpc v1.83.1
	google.golang.org/protobuf v1.36.12
)

require (
	golang.org/x/net v0.60.0 // indirect
	golang.org/x/sys v0.49.0 // indirect
	golang.org/x/text v0.43.0 // indirect
)
