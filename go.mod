module github.com/vdaas/vald-client-go

go 1.18

replace (
	cloud.google.com/go => cloud.google.com/go v0.97.1-0.20211108205434-5a2ed6b2cd1c
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.24.1-0.20211106003501-0138b86d100d
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.6.7
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.7
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20220411220226-7b82a4e95df4
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.5.1
	golang.org/x/net => golang.org/x/net v0.0.0-20220425223048-2871e0cb64e4
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.0.0-20220411215720-9780585627b5
	golang.org/x/sync => golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
	golang.org/x/sys => golang.org/x/sys v0.0.0-20220422013727-9388b58f7150
	golang.org/x/text => golang.org/x/text v0.3.7
	golang.org/x/tools => golang.org/x/tools v0.1.10
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20220411194840-2f41105eb62f
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20220422154200-b37d22cd5731
	google.golang.org/grpc => google.golang.org/grpc v1.46.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.28.0
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20211104193956-4c6863e31247
	google.golang.org/grpc v1.45.0
	google.golang.org/protobuf v1.28.0
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd // indirect
	golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e // indirect
	golang.org/x/text v0.3.7 // indirect
)
