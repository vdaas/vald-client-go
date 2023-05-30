# vald-client-go
[![License: Apache 2.0](https://img.shields.io/github/license/vdaas/vald-client-go.svg?style=flat-square)](https://opensource.org/licenses/Apache-2.0)
[![release](https://img.shields.io/github/release/vdaas/vald-client-go.svg?style=flat-square)](https://github.com/vdaas/vald-client-go/releases/latest)
[![Go Reference](https://pkg.go.dev/badge/github.com/vdaas/vald-client-go.svg)](https://pkg.go.dev/github.com/vdaas/vald-client-go)
[![Go Version](https://img.shields.io/github/go-mod/go-version/vdaas/vald-client-go?filename=go.mod)](https://github.com/vdaas/vald-client-go/blob/main/go.mod#L3)
[![Codacy Badge](https://img.shields.io/codacy/grade/a6e544eee7bc49e08a000bb10ba3deed?style=flat-square)](https://www.codacy.com/app/i.can.feel.gravity/vald?utm_source=github.com&utm_medium=referral&utm_content=vdaas/vald&utm_campaign=Badge_Grade)
[![Go Report Card](https://goreportcard.com/badge/github.com/vdaas/vald-client-go?style=flat-square)](https://goreportcard.com/report/github.com/vdaas/vald-client-go)
[![DepShield Badge](https://depshield.sonatype.org/badges/vdaas/vald-client-go/depshield.svg?style=flat-square)](https://depshield.github.io)
[![FOSSA Status](https://app.fossa.com/api/projects/custom%2B21465%2Fvald-client-go.svg?type=small)](https://app.fossa.com/projects/custom%2B21465%2Fvald-client-go?ref=badge_small)
[![DeepSource](https://static.deepsource.io/deepsource-badge-light-mini.svg)](https://deepsource.io/gh/vdaas/vald-client-go/?ref=repository-badge)
[![CLA](https://cla-assistant.io/readme/badge/vdaas/vald-client-go?&style=flat-square)](https://cla-assistant.io/vdaas/vald-client-go)
[![Slack](https://img.shields.io/badge/slack-join-brightgreen?logo=slack&style=flat-square)](https://join.slack.com/t/vald-community/shared_invite/zt-db2ky9o4-R_9p2sVp8xRwztVa8gfnPA)
[![Twitter](https://img.shields.io/badge/twitter-follow-blue?logo=twitter&style=flat-square)](https://twitter.com/vdaas_vald)


### example code

```go
	// Create a Vald clien connection for Vald cluster.
	conn, err := grpc.DialContext(ctx, "addr to cluster", grpc.WithInsecure())
	if err != nil {
		log.Fatal(err)
	}

	// Creates Vald client for gRPC.
	client := vald.NewValdClient(conn)

	// Insert sample vector.
	_, err := client.Insert(ctx, &payload.Insert_Request{
		Vector: &payload.Object_Vector{
			Id:     "id of vector",
			Vector: []float32{0.1, 0.2, 0.3}, // some feature dense vector here.
		}})
	if err != nil {
		log.Fatal(err)
	}

	// WARN you may need to wait a minutes until index creation.

	// Search sample vector.
	res, err := client.Search(ctx, &payload.Search_Request{
		Vector: vec,
		// Conditions for hitting the search.
		Config: &payload.Search_Config{
			Num:     10,        // the number of search results
			Radius:  -1,        // Radius is used to determine the space of search candidate radius for neighborhood vectors. -1 means infinite circle.
			Epsilon: 0.1,       // Epsilon is used to determines how much to expand from search candidate radius.
			Timeout: 100000000, // Timeout is used for search time deadline. The unit is nano-seconds.
		}})
	if err != nil {
		log.Fatal(err)
	}

	// Remove vector.
	_, err := client.Remove(ctx, &payload.Remove_Request{
		Id: &payload.Object_ID{
			Id: "id of vector",
		}})
	if err != nil {
		log.Fatal(err)
	}
```

[![FOSSA Status](https://app.fossa.com/api/projects/custom%2B21465%2Fvald-client-go.svg?type=large)](https://app.fossa.com/projects/custom%2B21465%2Fvald-client-go?ref=badge_large)
