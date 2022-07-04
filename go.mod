module github.com/vdaas/vald-client-go

go 1.18

replace (
	cloud.google.com/go => cloud.google.com/go v0.97.1-0.20211108205434-5a2ed6b2cd1c
	cloud.google.com/go/bigquery => cloud.google.com/go/bigquery v1.24.1-0.20211106003501-0138b86d100d
	github.com/envoyproxy/protoc-gen-validate => github.com/envoyproxy/protoc-gen-validate v0.6.7
	github.com/golang/protobuf => github.com/golang/protobuf v1.5.2
	github.com/google/go-cmp => github.com/google/go-cmp v0.5.8
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20220622213112-05595931fe9d
	golang.org/x/lint => golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/mod => golang.org/x/mod v0.5.1
	golang.org/x/net => golang.org/x/net v0.0.0-20220630215102-69896b714898
	golang.org/x/oauth2 => golang.org/x/oauth2 v0.0.0-20220630143837-2104d58473e0
	golang.org/x/sync => golang.org/x/sync v0.0.0-20220601150217-0de741cfad7f
	golang.org/x/sys => golang.org/x/sys v0.0.0-20220702020025-31831981b65f
	golang.org/x/text => golang.org/x/text v0.3.7
	golang.org/x/tools => golang.org/x/tools v0.1.11
	golang.org/x/xerrors => golang.org/x/xerrors v0.0.0-20220609144429-65e65417b02f
	google.golang.org/appengine => google.golang.org/appengine v1.6.7
	google.golang.org/genproto => google.golang.org/genproto v0.0.0-20220630174209-ad1d48641aa7
	google.golang.org/grpc => google.golang.org/grpc v1.47.0
	google.golang.org/protobuf => google.golang.org/protobuf v1.28.0
)

require (
	github.com/envoyproxy/protoc-gen-validate v0.1.0
	google.golang.org/genproto v0.0.0-20220616135557-88e70c0c3a90
	google.golang.org/grpc v1.47.0
	google.golang.org/protobuf v1.28.0
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20220624214902-1bab6f366d9e // indirect
	golang.org/x/sys v0.0.0-20220610221304-9f5ed59c137d // indirect
	golang.org/x/text v0.3.7 // indirect
)
