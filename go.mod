module github.com/vdaas/vald-client-go

go 1.24.2

replace (
	cloud.google.com/go => cloud.google.com/go v0.120.2-0.20250418012426-98b8a827b625
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.67.1-0.20250418012426-98b8a827b625
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.2.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.7.0
	golang.org/x/crypto => golang.org/x/crypto v0.37.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20241112194109-818c5a804067
	golang.org/x/mod => golang.org/x/mod v0.24.0
	golang.org/x/net => golang.org/x/net v0.39.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.29.0
	golang.org/x/sync => golang.org/x/sync v0.13.0
	golang.org/x/sys => golang.org/x/sys v0.32.0
	golang.org/x/text => golang.org/x/text v0.24.0
	golang.org/x/tools => golang.org/x/tools v0.32.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20250414145226-207652e42e2e
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20250414145226-207652e42e2e
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20250414145226-207652e42e2e
	google.golang.org/grpc => google.golang.org/grpc v1.71.1
	google.golang.org/protobuf => google.golang.org/protobuf v1.36.6
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.36.6-20250307204501-0409229c3780.1
	github.com/planetscale/vtprotobuf v0.6.1-0.20240319094008-0393e58bdf10
	google.golang.org/genproto/googleapis/api v0.0.0-20250106144421-5f5ef82da422
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250409194420-de1ac958c67a
	google.golang.org/grpc v1.71.0
	google.golang.org/protobuf v1.36.6
)

require (
	golang.org/x/net v0.37.0 // indirect
	golang.org/x/sys v0.32.0 // indirect
	golang.org/x/text v0.24.0 // indirect
)
