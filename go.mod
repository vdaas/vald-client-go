module github.com/vdaas/vald-client-go

go 1.21

replace (
	cloud.google.com/go => cloud.google.com/go v0.113.1-0.20240523043952-5fa60baf5636
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.61.1-0.20240523043952-5fa60baf5636
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.0.4
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.6.0
	golang.org/x/crypto => golang.org/x/crypto v0.23.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.17.0
	golang.org/x/net => golang.org/x/net v0.25.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.20.0
	golang.org/x/sync => golang.org/x/sync v0.7.0
	golang.org/x/sys => golang.org/x/sys v0.20.0
	golang.org/x/text => golang.org/x/text v0.15.0
	golang.org/x/tools => golang.org/x/tools v0.21.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20231012003039-104605ab7028
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20240521202816-d264139d666e
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20240521202816-d264139d666e
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20240521202816-d264139d666e
	google.golang.org/grpc => google.golang.org/grpc v1.64.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.34.1
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.34.1-20240508200655-46a4cf4ba109.1
	github.com/planetscale/vtprotobuf v0.6.0
	google.golang.org/genproto/googleapis/api v0.0.0-20240318140521-94a12d6c2237
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240515191416-fc5f0ca64291
	google.golang.org/grpc v1.64.0
	google.golang.org/protobuf v1.34.1
)

require (
	golang.org/x/net v0.22.0 // indirect
	golang.org/x/sys v0.20.0 // indirect
	golang.org/x/text v0.15.0 // indirect
)
