module github.com/vdaas/vald-client-go

go 1.19

replace (
	cloud.google.com/go => cloud.google.com/go v0.109.1-0.20230123202212-26c04f4cd508
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.45.1-0.20230123202212-26c04f4cd508
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.9.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.9
	golang.org/x/crypto => golang.org/x/crypto v0.5.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.7.0
	golang.org/x/net => golang.org/x/net v0.5.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.4.0
	golang.org/x/sync => golang.org/x/sync v0.1.0
	golang.org/x/sys => golang.org/x/sys v0.4.0
	golang.org/x/text => golang.org/x/text v0.6.0
	golang.org/x/tools => golang.org/x/tools v0.5.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20230123190316-2c411cf9d197
	google.golang.org/grpc => google.golang.org/grpc v1.52.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.28.1
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20221118155620-16455021b5e6
	google.golang.org/grpc v1.51.0
	google.golang.org/protobuf v1.28.1
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.4.0 // indirect
	golang.org/x/sys v0.4.0 // indirect
	golang.org/x/text v0.6.0 // indirect
)
