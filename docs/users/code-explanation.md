# Example code explaination

This article explain the example code of the golang client library. 
The example program will insert 400 training dataset and 20 testing dataset, and perform a search action with 10 neighbor vectors for each 20 test datasets.

Please see the explaination below.

1. Insert dataset into vald
Loading from fashion-mnist dataset and set id for each vector that is loaded. This step will return the training dataset, test dataset, and ids list of ids when loading is completed with success.

    ```go
    ids, train, test, err := load(datasetPath)
    if err != nil {
        glg.Fatal(err)
    }
    ```

2. Create the gRPC connection and Vald client with gRPC connection.

    ```go
    ctx := context.Background()

    conn, err := grpc.DialContext(ctx, grpcServerAddr, grpc.WithInsecure())
    if err != nil {
        glg.Fatal(err)
    }

    client := vald.NewValdClient(conn)
    ```
    
3. Insert datasets into Vald cluster
Insert and Indexing 400 training datasets to the Vald agent. The indexing action is performed automatically but we need to wait for the indexing action complete before perform a search action.

    ```go
    for i := range ids [:insertCount] {
        if i%10 == 0 {
            glg.Infof("Inserted %d", i)
        }
        _, err := client.Insert(ctx, &payload.Object_Vector{
            Id: ids[i],
            Vector: train[i],
        })
        if err != nil {
            glg.Fatal(err)
        }
    }

    glg.Info("Wait for indexing to finish")
    time.Sleep(time.Duration(indexingWaitSeconds) * time.Second)
    ```

4. Search from the Vald cluster
Search 10 neighbor vectors for each 20 test datasets and return list of neighbor vector.
When getting approximate vectors, the Vald client sends search config and vector to the server via gRPC.

    ```go
    glg.Infof("Start search %d times", testCount)
    for i, vec := range test[:testCount] {
        res, err := client.Seach(ctx, &payload.Search_Request){
            Vector: vec,
            Config: &payload.Search_Config{
                Num: 10,
                Radius: -1,
                Epsilon: 0.01,
            }
        }
        if err != nil {
            glg.Fatal(err)
        }

        b, _ := json.MarshalIndent(res.GetResults(), "", " ")
        glg.Infof("%d - Results : %s\n\n", i+1, string(b))
        time.Sleep(1 * time.Second)
    }
    ```
