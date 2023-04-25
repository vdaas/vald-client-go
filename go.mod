module github.com/vdaas/vald-client-go

go 1.19

replace (
	cloud.google.com/go => cloud.google.com/go v0.110.1-0.20230424202054-e41aae26413f
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.51.1-0.20230424202054-e41aae26413f
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v1.0.0
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.3
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.9
	golang.org/x/crypto => golang.org/x/crypto v0.8.0
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.10.0
	golang.org/x/net => golang.org/x/net v0.9.0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.7.0
	golang.org/x/sync => golang.org/x/sync v0.1.0
	golang.org/x/sys => golang.org/x/sys v0.7.0
	golang.org/x/text => golang.org/x/text v0.9.0
	golang.org/x/tools => golang.org/x/tools v0.8.0
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20230410155749-daa745c078e1
	google.golang.org/grpc => google.golang.org/grpc v1.54.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.30.0
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.9.1
	google.golang.org/genproto v0.0.0-20230110181048-76db0878b65f
	google.golang.org/grpc v1.54.0
	google.golang.org/protobuf v1.30.0
)

require (
	github.com/golang/protobuf v1.5.3 // indirect
	golang.org/x/net v0.9.0 // indirect
	golang.org/x/sys v0.7.0 // indirect
	golang.org/x/text v0.9.0 // indirect
)
