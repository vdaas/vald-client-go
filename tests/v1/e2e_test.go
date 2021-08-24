package main

import (
	"context"
	"encoding/json"
	"io"
	"io/ioutil"
	"log"
	"os"
	"sync"
	"testing"

	"github.com/vdaas/vald-client-go/v1/agent/core"
	"github.com/vdaas/vald-client-go/v1/payload"
	"github.com/vdaas/vald-client-go/v1/vald"
	"google.golang.org/grpc"
)

const addr = "localhost:8081"

var (
	conn *grpc.ClientConn

	client      vald.Client
	agentClient core.AgentClient

	ctx context.Context

	data []Datum

	insertConfig = &payload.Insert_Config{
		SkipStrictExistCheck: true,
	}

	searchNum    = 3
	searchConfig = &payload.Search_Config{
		Num:     uint32(searchNum),
		Radius:  -1.0,
		Epsilon: 0.1,
		Timeout: 3000000000,
	}

	updateConfig = &payload.Update_Config{
		SkipStrictExistCheck: true,
	}

	upsertConfig = &payload.Upsert_Config{
		SkipStrictExistCheck: true,
	}

	removeConfig = &payload.Remove_Config{
		SkipStrictExistCheck: true,
	}
)

type Datum struct {
	ID     string    `json:"id"`
	Vector []float32 `json:"vector"`
}

func init() {
	ctx = context.Background()

	err := readJSON()
	if err != nil {
		log.Fatalf("error: %s", err)
	}
}

func readJSON() error {
	f, err := os.Open("../../wordvecs1000.json")
	if err != nil {
		return err
	}

	defer f.Close()

	bytes, err := ioutil.ReadAll(f)
	if err != nil {
		return err
	}

	return json.Unmarshal(bytes, &data)
}

func beforeEach() (err error) {
	conn, err = grpc.DialContext(ctx, addr, grpc.WithInsecure())
	if err != nil {
		return err
	}

	client = vald.NewValdClient(conn)
	agentClient = core.NewAgentClient(conn)

	return nil
}

func afterEach() {
	conn.Close()
}

func TestE2E(t *testing.T) {
	// Insert

	t.Run(`Test for Insert operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Insert_Request{
			Vector: &payload.Object_Vector{
				Id:     data[0].ID,
				Vector: data[0].Vector,
			},
			Config: insertConfig,
		}

		result, err := client.Insert(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if result == nil {
			t.Fatal("error: returned result is nil")
		}

		if len(result.GetIps()) != 1 {
			t.Fatal("error: invalid number of ips")
		}
	})

	t.Run(`Test for MultiInsert operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		requests := make([]*payload.Insert_Request, 0)

		for i := 1; i < 11; i++ {
			requests = append(requests, &payload.Insert_Request{
				Vector: &payload.Object_Vector{
					Id:     data[i].ID,
					Vector: data[i].Vector,
				},
				Config: insertConfig,
			})
		}

		req := &payload.Insert_MultiRequest{
			Requests: requests,
		}

		results, err := client.MultiInsert(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if results == nil {
			t.Fatal("error: returned results is nil")
		}

		for _, result := range results.GetLocations() {
			if len(result.GetIps()) != 1 {
				t.Fatal("error: invalid number of ips")
			}
		}
	})

	t.Run(`Test for StreamInsert operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamInsert(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := new(sync.WaitGroup)
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)
					continue
				}

				if result == nil {
					t.Error("error: returned results is nil")
					continue
				}

				loc := result.GetLocation()
				if loc == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if len(loc.GetIps()) != 1 {
					t.Error("error: invalid number of ips")
				}
			}
		}()

		for i := 11; i < 100; i++ {
			req := &payload.Insert_Request{
				Vector: &payload.Object_Vector{
					Id:     data[i].ID,
					Vector: data[i].Vector,
				},
				Config: insertConfig,
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})

	// Agent

	t.Run(`Test for CreateIndex operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Control_CreateIndexRequest{
			PoolSize: 10000,
		}

		_, err = agentClient.CreateIndex(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}
	})

	t.Run(`Test for SaveIndex operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Empty{}

		_, err = agentClient.SaveIndex(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}
	})

	t.Run(`Test for IndexInfo operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Empty{}

		result, err := agentClient.IndexInfo(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if result.GetStored() != 100 {
			t.Errorf("stored is not same as expected. received: %d, expected: %d", result.GetStored(), 100)
		}

		if result.GetUncommitted() != 0 {
			t.Errorf("uncommitted is not same as expected. received: %d, expected: %d", result.GetUncommitted(), 0)
		}
	})

	// Exists

	t.Run(`Test for Exists operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Object_ID{
			Id: data[0].ID,
		}

		result, err := client.Exists(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if result.GetId() == "" {
			t.Error("expected ID is not found")
		}
	})

	// GetObject
	t.Run(`Test for GetObject operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Object_VectorRequest{
			Id: &payload.Object_ID{
				Id: data[0].ID,
			},
		}

		result, err := client.GetObject(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if result.GetId() != data[0].ID {
			t.Error("returned ID is not same as expected")
		}

		for i, elem := range result.GetVector() {
			if elem != data[0].Vector[i] {
				t.Error("returned vector is not same as expected")
			}
		}
	})

	t.Run(`Test for StreamGetObject operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamGetObject(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := sync.WaitGroup{}
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)
					continue
				}

				if result == nil {
					t.Error("error: returned result is nil")
					continue
				}

				res := result.GetVector()
				if res == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if res.GetId() == "" {
					t.Error("returned ID is empty")
				}

				if len(res.GetVector()) == 0 {
					t.Error("returned vector is empty")
				}
			}
		}()

		for i := 0; i < 11; i++ {
			req := &payload.Object_VectorRequest{
				Id: &payload.Object_ID{
					Id: data[i].ID,
				},
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})

	// Search

	t.Run(`Test for Search operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Search_Request{
			Vector: data[0].Vector,
			Config: searchConfig,
		}

		result, err := client.Search(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if result == nil {
			t.Fatal("result is nil")
		}

		if len(result.GetResults()) != searchNum {
			t.Errorf("result length is not expected. received: %d, expected: %d", len(result.GetResults()), searchNum)
		}
	})

	t.Run(`Test for MultiSearch operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		requests := make([]*payload.Search_Request, 0)
		for i := 1; i < 11; i++ {
			requests = append(requests, &payload.Search_Request{
				Vector: data[i].Vector,
				Config: searchConfig,
			})
		}

		req := &payload.Search_MultiRequest{
			Requests: requests,
		}

		results, err := client.MultiSearch(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if results == nil {
			t.Fatal("result is nil")
		}

		for _, result := range results.GetResponses() {
			if len(result.GetResults()) != searchNum {
				t.Errorf("result length is not expected. received: %d, expected: %d", len(result.GetResults()), searchNum)
			}
		}
	})

	t.Run(`Test for StreamSearch operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamSearch(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := new(sync.WaitGroup)
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)

					continue
				}

				if result == nil {
					t.Error("error: returned results is nil")
					continue
				}

				res := result.GetResponse()
				if res == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if len(res.GetResults()) != searchNum {
					t.Errorf("result length is not expected. received: %d, expected: %d", len(res.GetResults()), searchNum)
				}
			}
		}()

		for i := 11; i < 21; i++ {
			req := &payload.Search_Request{
				Vector: data[i].Vector,
				Config: searchConfig,
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})

	t.Run(`Test for SearchByID operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Search_IDRequest{
			Id:     data[0].ID,
			Config: searchConfig,
		}

		result, err := client.SearchByID(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if result == nil {
			t.Fatal("result is nil")
		}

		if len(result.GetResults()) != searchNum {
			t.Errorf("result length is not expected. received: %d, expected: %d", len(result.GetResults()), searchNum)
		}
	})

	t.Run(`Test for MultiSearchByID operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		requests := make([]*payload.Search_IDRequest, 0)
		for i := 1; i < 11; i++ {
			requests = append(requests, &payload.Search_IDRequest{
				Id:     data[i].ID,
				Config: searchConfig,
			})
		}

		req := &payload.Search_MultiIDRequest{
			Requests: requests,
		}

		results, err := client.MultiSearchByID(ctx, req)
		if err != nil {
			t.Errorf("error: %s", err)
		}

		if results == nil {
			t.Fatal("result is nil")
		}

		for _, result := range results.GetResponses() {
			if len(result.GetResults()) != searchNum {
				t.Errorf("result length is not expected. received: %d, expected: %d", len(result.GetResults()), searchNum)
			}
		}
	})

	t.Run(`Test for StreamSearchByID operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamSearchByID(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := new(sync.WaitGroup)
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)

					continue
				}

				if result == nil {
					t.Error("error: returned results is nil")
					continue
				}

				res := result.GetResponse()
				if res == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if len(res.GetResults()) != searchNum {
					t.Errorf("result length is not expected. received: %d, expected: %d", len(res.GetResults()), searchNum)
				}
			}
		}()

		for i := 11; i < 21; i++ {
			req := &payload.Search_IDRequest{
				Id:     data[i].ID,
				Config: searchConfig,
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})

	// Update

	t.Run(`Test for Update operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Update_Request{
			Vector: &payload.Object_Vector{
				Id:     data[0].ID,
				Vector: data[1].Vector,
			},
			Config: updateConfig,
		}

		result, err := client.Update(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if result == nil {
			t.Fatal("error: returned result is nil")
		}

		if len(result.GetIps()) != 1 {
			t.Fatal("error: invalid number of ips")
		}
	})

	t.Run(`Test for MultiUpdate operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		requests := make([]*payload.Update_Request, 0)

		for i := 1; i < 11; i++ {
			requests = append(requests, &payload.Update_Request{
				Vector: &payload.Object_Vector{
					Id:     data[i].ID,
					Vector: data[i+1].Vector,
				},
				Config: updateConfig,
			})
		}

		req := &payload.Update_MultiRequest{
			Requests: requests,
		}

		results, err := client.MultiUpdate(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if results == nil {
			t.Fatal("error: returned results is nil")
		}

		for _, result := range results.GetLocations() {
			if len(result.GetIps()) != 1 {
				t.Fatal("error: invalid number of ips")
			}
		}
	})

	t.Run(`Test for StreamUpdate operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamUpdate(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := new(sync.WaitGroup)
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)
					continue
				}

				if result == nil {
					t.Error("error: returned results is nil")
					continue
				}

				loc := result.GetLocation()
				if loc == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if len(loc.GetIps()) != 1 {
					t.Error("error: invalid number of ips")
				}
			}
		}()

		for i := 11; i < 21; i++ {
			req := &payload.Update_Request{
				Vector: &payload.Object_Vector{
					Id:     data[i].ID,
					Vector: data[i+1].Vector,
				},
				Config: updateConfig,
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})

	// Upsert

	t.Run(`Test for Upsert operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Upsert_Request{
			Vector: &payload.Object_Vector{
				Id:     data[0].ID,
				Vector: data[0].Vector,
			},
			Config: upsertConfig,
		}

		result, err := client.Upsert(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if result == nil {
			t.Fatal("error: returned result is nil")
		}

		if len(result.GetIps()) != 1 {
			t.Fatal("error: invalid number of ips")
		}
	})

	t.Run(`Test for MultiUpsert operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		requests := make([]*payload.Upsert_Request, 0)

		for i := 1; i < 11; i++ {
			requests = append(requests, &payload.Upsert_Request{
				Vector: &payload.Object_Vector{
					Id:     data[i].ID,
					Vector: data[i].Vector,
				},
				Config: upsertConfig,
			})
		}

		req := &payload.Upsert_MultiRequest{
			Requests: requests,
		}

		results, err := client.MultiUpsert(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if results == nil {
			t.Fatal("error: returned results is nil")
		}

		for _, result := range results.GetLocations() {
			if len(result.GetIps()) != 1 {
				t.Fatal("error: invalid number of ips")
			}
		}
	})

	t.Run(`Test for StreamUpsert operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamUpsert(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := new(sync.WaitGroup)
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)
					return
				}

				if result == nil {
					t.Error("error: returned results is nil")
					continue
				}

				loc := result.GetLocation()
				if loc == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if len(loc.GetIps()) != 1 {
					t.Error("error: invalid number of ips")
				}
			}
		}()

		for i := 11; i < 21; i++ {
			req := &payload.Upsert_Request{
				Vector: &payload.Object_Vector{
					Id:     data[i].ID,
					Vector: data[i].Vector,
				},
				Config: upsertConfig,
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})

	// Remove

	t.Run(`Test for Remove operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		req := &payload.Remove_Request{
			Id: &payload.Object_ID{
				Id: data[0].ID,
			},
			Config: removeConfig,
		}

		result, err := client.Remove(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if result == nil {
			t.Fatal("error: returned result is nil")
		}

		if len(result.GetIps()) != 1 {
			t.Fatal("error: invalid number of ips")
		}
	})

	t.Run(`Test for MultiRemove operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		requests := make([]*payload.Remove_Request, 0)

		for i := 1; i < 11; i++ {
			requests = append(requests, &payload.Remove_Request{
				Id: &payload.Object_ID{
					Id: data[i].ID,
				},
				Config: removeConfig,
			})
		}

		req := &payload.Remove_MultiRequest{
			Requests: requests,
		}

		results, err := client.MultiRemove(ctx, req)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		if results == nil {
			t.Fatal("error: returned results is nil")
		}

		for _, result := range results.GetLocations() {
			if len(result.GetIps()) != 1 {
				t.Fatal("error: invalid number of ips")
			}
		}
	})

	t.Run(`Test for StreamRemove operation`, func(t *testing.T) {
		err := beforeEach()
		if err != nil {
			t.Fatalf("error: %s", err)
		}
		t.Cleanup(afterEach)

		stream, err := client.StreamRemove(ctx)
		if err != nil {
			t.Fatalf("error: %s", err)
		}

		wg := new(sync.WaitGroup)
		wg.Add(1)
		go func() {
			defer wg.Done()

			for {
				result, err := stream.Recv()
				if err != nil {
					if err == io.EOF {
						return
					}

					t.Errorf("error: %s", err)
					continue
				}

				if result == nil {
					t.Error("error: returned results is nil")
					continue
				}

				loc := result.GetLocation()
				if loc == nil {
					if result.GetStatus().GetCode() != 0 {
						t.Errorf("result code is %d", result.GetStatus().GetCode())
						continue
					}

					t.Error("location is nil")
					continue
				}

				if len(loc.GetIps()) != 1 {
					t.Error("error: invalid number of ips")
				}
			}
		}()

		for i := 11; i < 21; i++ {
			req := &payload.Remove_Request{
				Id: &payload.Object_ID{
					Id: data[i].ID,
				},
				Config: removeConfig,
			}

			err = stream.Send(req)
			if err != nil {
				t.Errorf("error: %s", err)
			}
		}

		stream.CloseSend()

		wg.Wait()
	})
}
