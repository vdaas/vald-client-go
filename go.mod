module github.com/vdaas/vald-client-go

go 1.17

replace (
	cloud.google.com/go => cloud.google.com/go v0.94.1-0.20210831223037-27c3ed022c83
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.22.1-0.20210831223037-27c3ed022c83
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.6.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.6
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.5.0
	golang.org/x/net => golang.org/x/net v0.0.0-20210825183410-e898025ed96a
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.0.0-20210819190943-2bc19b11175f
	golang.org/x/sync => golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
	golang.org/x/sys => golang.org/x/sys v0.0.0-20210831042530-f4d43177bf5e
	golang.org/x/text => golang.org/x/text v0.3.7
	golang.org/x/tools => golang.org/x/tools v0.1.5
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20210831024726-fe130286e0e2
	google.golang.org/grpc => google.golang.org/grpc v1.40.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.27.1
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20210831024726-fe130286e0e2
	google.golang.org/grpc v1.40.0
	google.golang.org/protobuf v1.27.1
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20210503060351-7fd8e65b6420 // indirect
	golang.org/x/sys v0.0.0-20210823070655-63515b42dcdf // indirect
	golang.org/x/text v0.3.6 // indirect
)
