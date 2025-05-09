//
// Copyright (C) 2019-2025 vdaas.org vald team <vald@vdaas.org>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// You may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

package vald

import (
	context "context"

	payload "github.com/vdaas/vald-client-go/v1/payload"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	grpc "google.golang.org/grpc"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// UpsertClient is the client API for Upsert service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type UpsertClient interface {
	// Overview
	// Upsert RPC is the method to update the inserted vector to a new single vector or add a new single vector if not inserted before.
	// ---
	// Status Code
	// |  0   | OK                |
	// |  1   | CANCELLED         |
	// |  3   | INVALID_ARGUMENT  |
	// |  4   | DEADLINE_EXCEEDED |
	// |  5   | NOT_FOUND         |
	// |  6   | ALREADY_EXISTS    |
	// |  10  | ABORTED           |
	// |  13  | INTERNAL          |
	// ---
	// Troubleshooting
	// The request process may not be completed when the response code is NOT `0 (OK)`.
	//
	// Here are some common reasons and how to resolve each error.
	//
	// | name              | common reason                                                                                                                                       | how to resolve                                                                           |
	// | :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
	// | CANCELLED         | Executed cancel() of rpc from client/server-side or network problems between client and server.                                                     | Check the code, especially around timeout and connection management, and fix if needed.  |
	// | INVALID_ARGUMENT  | The Dimension of the request vector is NOT the same as Vald Agent's config, the requested vector's ID is empty, or some request payload is invalid. | Check Agent config, request payload, and fix request payload or Agent config.            |
	// | DEADLINE_EXCEEDED | The RPC timeout setting is too short on the client/server side.                                                                                     | Check the gRPC timeout setting on both the client and server sides and fix it if needed. |
	// | ALREADY_EXISTS    | Requested pair of ID and vector is already inserted                                                                                                 | Change request payload or nothing to do if update is unnecessary.                        |
	// | INTERNAL          | Target Vald cluster or network route has some critical error.                                                                                       | Check target Vald cluster first and check network route including ingress as second.     |
	Upsert(ctx context.Context, in *payload.Upsert_Request, opts ...grpc.CallOption) (*payload.Object_Location, error)
	// Overview
	// StreamUpsert RPC is the method to update multiple existing vectors or add new multiple vectors using the [bidirectional streaming RPC](https://grpc.io/docs/what-is-grpc/core-concepts/#bidirectional-streaming-rpc).<br>
	// Using the bidirectional streaming RPC, the upsert request can be communicated in any order between the client and server.
	// Each Upsert request and response are independent.
	// It’s the recommended method to upsert a large number of vectors.
	// ---
	// Status Code
	// |  0   | OK                |
	// |  1   | CANCELLED         |
	// |  3   | INVALID_ARGUMENT  |
	// |  4   | DEADLINE_EXCEEDED |
	// |  5   | NOT_FOUND         |
	// |  6   | ALREADY_EXISTS    |
	// |  10  | ABORTED           |
	// |  13  | INTERNAL          |
	// ---
	// Troubleshooting
	// The request process may not be completed when the response code is NOT `0 (OK)`.
	//
	// Here are some common reasons and how to resolve each error.
	//
	// | name              | common reason                                                                                                                                       | how to resolve                                                                           |
	// | :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
	// | CANCELLED         | Executed cancel() of rpc from client/server-side or network problems between client and server.                                                     | Check the code, especially around timeout and connection management, and fix if needed.  |
	// | INVALID_ARGUMENT  | The Dimension of the request vector is NOT the same as Vald Agent's config, the requested vector's ID is empty, or some request payload is invalid. | Check Agent config, request payload, and fix request payload or Agent config.            |
	// | DEADLINE_EXCEEDED | The RPC timeout setting is too short on the client/server side.                                                                                     | Check the gRPC timeout setting on both the client and server sides and fix it if needed. |
	// | ALREADY_EXISTS    | Requested pair of ID and vector is already inserted                                                                                                 | Change request payload or nothing to do if update is unnecessary.                        |
	// | INTERNAL          | Target Vald cluster or network route has some critical error.                                                                                       | Check target Vald cluster first and check network route including ingress as second.     |
	StreamUpsert(ctx context.Context, opts ...grpc.CallOption) (Upsert_StreamUpsertClient, error)
	// Overview
	// MultiUpsert is the method to update existing multiple vectors and add new multiple vectors in **1** request.
	//
	// <div class="notice">
	// gRPC has a message size limitation.<br>
	// Please be careful that the size of the request exceeds the limit.
	// </div>
	// ---
	// Status Code
	// |  0   | OK                |
	// |  1   | CANCELLED         |
	// |  3   | INVALID_ARGUMENT  |
	// |  4   | DEADLINE_EXCEEDED |
	// |  5   | NOT_FOUND         |
	// |  6   | ALREADY_EXISTS    |
	// |  10  | ABORTED           |
	// |  13  | INTERNAL          |
	// ---
	// Troubleshooting
	// The request process may not be completed when the response code is NOT `0 (OK)`.
	//
	// Here are some common reasons and how to resolve each error.
	//
	// | name              | common reason                                                                                                                                       | how to resolve                                                                           |
	// | :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
	// | CANCELLED         | Executed cancel() of rpc from client/server-side or network problems between client and server.                                                     | Check the code, especially around timeout and connection management, and fix if needed.  |
	// | INVALID_ARGUMENT  | The Dimension of the request vector is NOT the same as Vald Agent's config, the requested vector's ID is empty, or some request payload is invalid. | Check Agent config, request payload, and fix request payload or Agent config.            |
	// | DEADLINE_EXCEEDED | The RPC timeout setting is too short on the client/server side.                                                                                     | Check the gRPC timeout setting on both the client and server sides and fix it if needed. |
	// | ALREADY_EXISTS    | Requested pair of ID and vector is already inserted                                                                                                 | Change request payload or nothing to do if update is unnecessary.                        |
	// | INTERNAL          | Target Vald cluster or network route has some critical error.                                                                                       | Check target Vald cluster first and check network route including ingress as second.     |
	MultiUpsert(ctx context.Context, in *payload.Upsert_MultiRequest, opts ...grpc.CallOption) (*payload.Object_Locations, error)
}

type upsertClient struct {
	cc grpc.ClientConnInterface
}

func NewUpsertClient(cc grpc.ClientConnInterface) UpsertClient {
	return &upsertClient{cc}
}

func (c *upsertClient) Upsert(
	ctx context.Context, in *payload.Upsert_Request, opts ...grpc.CallOption,
) (*payload.Object_Location, error) {
	out := new(payload.Object_Location)
	err := c.cc.Invoke(ctx, "/vald.v1.Upsert/Upsert", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *upsertClient) StreamUpsert(
	ctx context.Context, opts ...grpc.CallOption,
) (Upsert_StreamUpsertClient, error) {
	stream, err := c.cc.NewStream(ctx, &Upsert_ServiceDesc.Streams[0], "/vald.v1.Upsert/StreamUpsert", opts...)
	if err != nil {
		return nil, err
	}
	x := &upsertStreamUpsertClient{stream}
	return x, nil
}

type Upsert_StreamUpsertClient interface {
	Send(*payload.Upsert_Request) error
	Recv() (*payload.Object_StreamLocation, error)
	grpc.ClientStream
}

type upsertStreamUpsertClient struct {
	grpc.ClientStream
}

func (x *upsertStreamUpsertClient) Send(m *payload.Upsert_Request) error {
	return x.ClientStream.SendMsg(m)
}

func (x *upsertStreamUpsertClient) Recv() (*payload.Object_StreamLocation, error) {
	m := new(payload.Object_StreamLocation)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *upsertClient) MultiUpsert(
	ctx context.Context, in *payload.Upsert_MultiRequest, opts ...grpc.CallOption,
) (*payload.Object_Locations, error) {
	out := new(payload.Object_Locations)
	err := c.cc.Invoke(ctx, "/vald.v1.Upsert/MultiUpsert", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// UpsertServer is the server API for Upsert service.
// All implementations must embed UnimplementedUpsertServer
// for forward compatibility
type UpsertServer interface {
	// Overview
	// Upsert RPC is the method to update the inserted vector to a new single vector or add a new single vector if not inserted before.
	// ---
	// Status Code
	// |  0   | OK                |
	// |  1   | CANCELLED         |
	// |  3   | INVALID_ARGUMENT  |
	// |  4   | DEADLINE_EXCEEDED |
	// |  5   | NOT_FOUND         |
	// |  6   | ALREADY_EXISTS    |
	// |  10  | ABORTED           |
	// |  13  | INTERNAL          |
	// ---
	// Troubleshooting
	// The request process may not be completed when the response code is NOT `0 (OK)`.
	//
	// Here are some common reasons and how to resolve each error.
	//
	// | name              | common reason                                                                                                                                       | how to resolve                                                                           |
	// | :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
	// | CANCELLED         | Executed cancel() of rpc from client/server-side or network problems between client and server.                                                     | Check the code, especially around timeout and connection management, and fix if needed.  |
	// | INVALID_ARGUMENT  | The Dimension of the request vector is NOT the same as Vald Agent's config, the requested vector's ID is empty, or some request payload is invalid. | Check Agent config, request payload, and fix request payload or Agent config.            |
	// | DEADLINE_EXCEEDED | The RPC timeout setting is too short on the client/server side.                                                                                     | Check the gRPC timeout setting on both the client and server sides and fix it if needed. |
	// | ALREADY_EXISTS    | Requested pair of ID and vector is already inserted                                                                                                 | Change request payload or nothing to do if update is unnecessary.                        |
	// | INTERNAL          | Target Vald cluster or network route has some critical error.                                                                                       | Check target Vald cluster first and check network route including ingress as second.     |
	Upsert(context.Context, *payload.Upsert_Request) (*payload.Object_Location, error)
	// Overview
	// StreamUpsert RPC is the method to update multiple existing vectors or add new multiple vectors using the [bidirectional streaming RPC](https://grpc.io/docs/what-is-grpc/core-concepts/#bidirectional-streaming-rpc).<br>
	// Using the bidirectional streaming RPC, the upsert request can be communicated in any order between the client and server.
	// Each Upsert request and response are independent.
	// It’s the recommended method to upsert a large number of vectors.
	// ---
	// Status Code
	// |  0   | OK                |
	// |  1   | CANCELLED         |
	// |  3   | INVALID_ARGUMENT  |
	// |  4   | DEADLINE_EXCEEDED |
	// |  5   | NOT_FOUND         |
	// |  6   | ALREADY_EXISTS    |
	// |  10  | ABORTED           |
	// |  13  | INTERNAL          |
	// ---
	// Troubleshooting
	// The request process may not be completed when the response code is NOT `0 (OK)`.
	//
	// Here are some common reasons and how to resolve each error.
	//
	// | name              | common reason                                                                                                                                       | how to resolve                                                                           |
	// | :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
	// | CANCELLED         | Executed cancel() of rpc from client/server-side or network problems between client and server.                                                     | Check the code, especially around timeout and connection management, and fix if needed.  |
	// | INVALID_ARGUMENT  | The Dimension of the request vector is NOT the same as Vald Agent's config, the requested vector's ID is empty, or some request payload is invalid. | Check Agent config, request payload, and fix request payload or Agent config.            |
	// | DEADLINE_EXCEEDED | The RPC timeout setting is too short on the client/server side.                                                                                     | Check the gRPC timeout setting on both the client and server sides and fix it if needed. |
	// | ALREADY_EXISTS    | Requested pair of ID and vector is already inserted                                                                                                 | Change request payload or nothing to do if update is unnecessary.                        |
	// | INTERNAL          | Target Vald cluster or network route has some critical error.                                                                                       | Check target Vald cluster first and check network route including ingress as second.     |
	StreamUpsert(Upsert_StreamUpsertServer) error
	// Overview
	// MultiUpsert is the method to update existing multiple vectors and add new multiple vectors in **1** request.
	//
	// <div class="notice">
	// gRPC has a message size limitation.<br>
	// Please be careful that the size of the request exceeds the limit.
	// </div>
	// ---
	// Status Code
	// |  0   | OK                |
	// |  1   | CANCELLED         |
	// |  3   | INVALID_ARGUMENT  |
	// |  4   | DEADLINE_EXCEEDED |
	// |  5   | NOT_FOUND         |
	// |  6   | ALREADY_EXISTS    |
	// |  10  | ABORTED           |
	// |  13  | INTERNAL          |
	// ---
	// Troubleshooting
	// The request process may not be completed when the response code is NOT `0 (OK)`.
	//
	// Here are some common reasons and how to resolve each error.
	//
	// | name              | common reason                                                                                                                                       | how to resolve                                                                           |
	// | :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- |
	// | CANCELLED         | Executed cancel() of rpc from client/server-side or network problems between client and server.                                                     | Check the code, especially around timeout and connection management, and fix if needed.  |
	// | INVALID_ARGUMENT  | The Dimension of the request vector is NOT the same as Vald Agent's config, the requested vector's ID is empty, or some request payload is invalid. | Check Agent config, request payload, and fix request payload or Agent config.            |
	// | DEADLINE_EXCEEDED | The RPC timeout setting is too short on the client/server side.                                                                                     | Check the gRPC timeout setting on both the client and server sides and fix it if needed. |
	// | ALREADY_EXISTS    | Requested pair of ID and vector is already inserted                                                                                                 | Change request payload or nothing to do if update is unnecessary.                        |
	// | INTERNAL          | Target Vald cluster or network route has some critical error.                                                                                       | Check target Vald cluster first and check network route including ingress as second.     |
	MultiUpsert(context.Context, *payload.Upsert_MultiRequest) (*payload.Object_Locations, error)
	mustEmbedUnimplementedUpsertServer()
}

// UnimplementedUpsertServer must be embedded to have forward compatible implementations.
type UnimplementedUpsertServer struct{}

func (UnimplementedUpsertServer) Upsert(
	context.Context, *payload.Upsert_Request,
) (*payload.Object_Location, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Upsert not implemented")
}

func (UnimplementedUpsertServer) StreamUpsert(Upsert_StreamUpsertServer) error {
	return status.Errorf(codes.Unimplemented, "method StreamUpsert not implemented")
}

func (UnimplementedUpsertServer) MultiUpsert(
	context.Context, *payload.Upsert_MultiRequest,
) (*payload.Object_Locations, error) {
	return nil, status.Errorf(codes.Unimplemented, "method MultiUpsert not implemented")
}
func (UnimplementedUpsertServer) mustEmbedUnimplementedUpsertServer() {}

// UnsafeUpsertServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to UpsertServer will
// result in compilation errors.
type UnsafeUpsertServer interface {
	mustEmbedUnimplementedUpsertServer()
}

func RegisterUpsertServer(s grpc.ServiceRegistrar, srv UpsertServer) {
	s.RegisterService(&Upsert_ServiceDesc, srv)
}

func _Upsert_Upsert_Handler(
	srv any, ctx context.Context, dec func(any) error, interceptor grpc.UnaryServerInterceptor,
) (any, error) {
	in := new(payload.Upsert_Request)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UpsertServer).Upsert(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/vald.v1.Upsert/Upsert",
	}
	handler := func(ctx context.Context, req any) (any, error) {
		return srv.(UpsertServer).Upsert(ctx, req.(*payload.Upsert_Request))
	}
	return interceptor(ctx, in, info, handler)
}

func _Upsert_StreamUpsert_Handler(srv any, stream grpc.ServerStream) error {
	return srv.(UpsertServer).StreamUpsert(&upsertStreamUpsertServer{stream})
}

type Upsert_StreamUpsertServer interface {
	Send(*payload.Object_StreamLocation) error
	Recv() (*payload.Upsert_Request, error)
	grpc.ServerStream
}

type upsertStreamUpsertServer struct {
	grpc.ServerStream
}

func (x *upsertStreamUpsertServer) Send(m *payload.Object_StreamLocation) error {
	return x.ServerStream.SendMsg(m)
}

func (x *upsertStreamUpsertServer) Recv() (*payload.Upsert_Request, error) {
	m := new(payload.Upsert_Request)
	if err := x.ServerStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func _Upsert_MultiUpsert_Handler(
	srv any, ctx context.Context, dec func(any) error, interceptor grpc.UnaryServerInterceptor,
) (any, error) {
	in := new(payload.Upsert_MultiRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(UpsertServer).MultiUpsert(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/vald.v1.Upsert/MultiUpsert",
	}
	handler := func(ctx context.Context, req any) (any, error) {
		return srv.(UpsertServer).MultiUpsert(ctx, req.(*payload.Upsert_MultiRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// Upsert_ServiceDesc is the grpc.ServiceDesc for Upsert service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Upsert_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "vald.v1.Upsert",
	HandlerType: (*UpsertServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Upsert",
			Handler:    _Upsert_Upsert_Handler,
		},
		{
			MethodName: "MultiUpsert",
			Handler:    _Upsert_MultiUpsert_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "StreamUpsert",
			Handler:       _Upsert_StreamUpsert_Handler,
			ServerStreams: true,
			ClientStreams: true,
		},
	},
	Metadata: "v1/vald/upsert.proto",
}
