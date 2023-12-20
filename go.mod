module github.com/vdaas/vald-client-go

go 1.21

replace (
	cloud.google.com/go => cloud.google.com/go v0.111.1-0.20231218211614-ec9b52686277
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.57.2-0.20231218211614-ec9b52686277
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.0.2
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.3
	github.com/google/go-cmp => github.com/google/go-cmp v0.6.0
	golang.org/x/crypto => golang.org/x/crypto v0.17.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.14.0
	golang.org/x/net => golang.org/x/net v0.19.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.15.0
	golang.org/x/sync => golang.org/x/sync v0.5.0
	golang.org/x/sys => golang.org/x/sys v0.15.0
	golang.org/x/text => golang.org/x/text v0.14.0
	golang.org/x/tools => golang.org/x/tools v0.16.1
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20231212172506-995d672761c0
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20231212172506-995d672761c0
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20231212172506-995d672761c0
	google.golang.org/grpc => google.golang.org/grpc v1.60.1
	google.golang.org/protobuf => google.golang.org/protobuf v1.31.0
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.31.0-20231115204500-e097f827e652.2
	google.golang.org/genproto/googleapis/api v0.0.0-20231211222908-989df2bf70f3
	google.golang.org/genproto/googleapis/rpc v0.0.0-20231211222908-989df2bf70f3
	google.golang.org/grpc v1.60.0
	google.golang.org/protobuf v1.31.0
)

require (
	github.com/golang/protobuf v1.5.3 // indirect
	golang.org/x/net v0.17.0 // indirect
	golang.org/x/sys v0.15.0 // indirect
	golang.org/x/text v0.14.0 // indirect
	google.golang.org/genproto v0.0.0-20231211222908-989df2bf70f3 // indirect
)
