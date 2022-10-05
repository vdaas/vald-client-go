module github.com/vdaas/vald-client-go

go 1.18

replace (
	cloud.google.com/go => cloud.google.com/go v0.104.1-0.20221004191212-19692735b0fb
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.42.1-0.20221004191212-19692735b0fb
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.6.13
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.9
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20221005025214-4161e89ecf1b
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.5.1
	golang.org/x/net => golang.org/x/net v0.0.0-20221004154528-8021a29435af
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.0.0-20220909003341-f21342109be1
	golang.org/x/sync => golang.org/x/sync v0.0.0-20220929204114-8fcdb60fdcc0
	golang.org/x/sys => golang.org/x/sys v0.0.0-20220928140112-f11e5e49a4ec
	golang.org/x/text => golang.org/x/text v0.3.7
	golang.org/x/tools => golang.org/x/tools v0.1.12
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20220907171357-04be3eba64a2
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20220930163606-c98284e70a91
	google.golang.org/grpc => google.golang.org/grpc v1.49.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.28.1
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20220930155724-c35d6294e998
	google.golang.org/grpc v1.49.0
	google.golang.org/protobuf v1.28.1
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20220909164309-bea034e7d591 // indirect
	golang.org/x/sys v0.0.0-20220908150016-7ac13a9a928d // indirect
	golang.org/x/text v0.3.7 // indirect
)
