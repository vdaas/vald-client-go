module github.com/vdaas/vald-client-go

go 1.18

replace (
	cloud.google.com/go => cloud.google.com/go v0.104.1-0.20221019040412-d14ee26877ef
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.42.1-0.20221019040412-d14ee26877ef
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.6.13
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.9
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20221012134737-56aed061732a
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.5.1
	golang.org/x/net => golang.org/x/net v0.0.0-20221019024206-cb67ada4b0ad
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.0.0-20221014153046-6fdb5e3db783
	golang.org/x/sync => golang.org/x/sync v0.1.0
	golang.org/x/sys => golang.org/x/sys v0.1.0
	golang.org/x/text => golang.org/x/text v0.4.0
	golang.org/x/tools => golang.org/x/tools v0.1.12
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20221018160656-63c7b68cfc55
	google.golang.org/grpc => google.golang.org/grpc v1.50.1
	google.golang.org/protobuf => google.golang.org/protobuf v1.28.1
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20221014213838-99cd37c6964a
	google.golang.org/grpc v1.50.1
	google.golang.org/protobuf v1.28.1
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20221012135044-0b7e1fb9d458 // indirect
	golang.org/x/sys v0.0.0-20221010170243-090e33056c14 // indirect
	golang.org/x/text v0.3.7 // indirect
)
