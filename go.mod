module github.com/vdaas/vald-client-go

go 1.21

replace (
	cloud.google.com/go => cloud.google.com/go v0.115.1-0.20240718060516-29b52dc40f3d
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.61.1-0.20240718060516-29b52dc40f3d
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.0.4
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.4
	github.com/google/go-cmp => github.com/google/go-cmp v0.6.0
	golang.org/x/crypto => golang.org/x/crypto v0.25.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.19.0
	golang.org/x/net => golang.org/x/net v0.27.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.21.0
	golang.org/x/sync => golang.org/x/sync v0.7.0
	golang.org/x/sys => golang.org/x/sys v0.22.0
	golang.org/x/text => golang.org/x/text v0.16.0
	golang.org/x/tools => golang.org/x/tools v0.23.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20240716161551-93cc26a95ae9
	google.golang.org/appengine => google.golang.org/appengine v1.6.8
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20240711142825-46eb208f015d
	google.golang.org/genproto/googleapis/api => google.golang.org/genproto/googleapis/api v0.0.0-20240711142825-46eb208f015d
	google.golang.org/genproto/googleapis/rpc => google.golang.org/genproto/googleapis/rpc v0.0.0-20240711142825-46eb208f015d
	google.golang.org/grpc => google.golang.org/grpc v1.65.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.34.2
)

require (
	buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go v1.34.2-20240717164558-a6c49f84cc0f.2
	github.com/planetscale/vtprotobuf v0.6.0
	google.golang.org/genproto/googleapis/api v0.0.0-20240528184218-531527333157
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240701130421-f6361c86f094
	google.golang.org/grpc v1.64.1
	google.golang.org/protobuf v1.34.2
)

require (
	golang.org/x/net v0.26.0 // indirect
	golang.org/x/sys v0.22.0 // indirect
	golang.org/x/text v0.16.0 // indirect
)
