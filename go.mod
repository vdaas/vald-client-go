module github.com/vdaas/vald-client-go

go 1.17

replace (
	cloud.google.com/go => cloud.google.com/go v0.97.1-0.20211012163212-0f7457c6a9ef
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.24.1-0.20211012163212-0f7457c6a9ef
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.6.1
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.6
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20210921155107-089bfa567519
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.5.1
	golang.org/x/net => golang.org/x/net v0.0.0-20211011170408-caeb26a5c8c0
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.0.0-20211005180243-6b3c2da341f1
	golang.org/x/sync => golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
	golang.org/x/sys => golang.org/x/sys v0.0.0-20211007075335-d3039528d8ac
	golang.org/x/text => golang.org/x/text v0.3.7
	golang.org/x/tools => golang.org/x/tools v0.1.7
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20211013025323-ce878158c4d4
	google.golang.org/grpc => google.golang.org/grpc v1.41.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.27.1
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20211012143446-e1d23e1da178
	google.golang.org/grpc v1.40.0
	google.golang.org/protobuf v1.27.1
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20210805182204-aaa1db679c0d // indirect
	golang.org/x/sys v0.0.0-20210917161153-d61c044b1678 // indirect
	golang.org/x/text v0.3.6 // indirect
)
