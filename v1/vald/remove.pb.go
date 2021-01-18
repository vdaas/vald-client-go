// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: vald-origin/apis/proto/v1/vald/remove.proto

package vald

import (
	context "context"
	fmt "fmt"
	proto "github.com/gogo/protobuf/proto"
	payload "github.com/vdaas/vald-client-go/v1/payload"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

func init() {
	proto.RegisterFile("vald-origin/apis/proto/v1/vald/remove.proto", fileDescriptor_0720d43b3a1951df)
}

var fileDescriptor_0720d43b3a1951df = []byte{
	// 312 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x8c, 0x91, 0xc1, 0x4a, 0x33, 0x31,
	0x14, 0x85, 0xff, 0x74, 0xd1, 0x42, 0xfe, 0x2e, 0x64, 0xc0, 0xcd, 0xb4, 0x54, 0x1c, 0x17, 0x8a,
	0x62, 0x62, 0x75, 0xe7, 0xb2, 0x6b, 0x45, 0x69, 0xd1, 0x85, 0x1b, 0x49, 0x67, 0x42, 0x8c, 0x64,
	0xe6, 0xc6, 0x4c, 0x1a, 0x70, 0xeb, 0x2b, 0xf8, 0x00, 0xbe, 0x8e, 0x4b, 0xc1, 0x17, 0x90, 0xe2,
	0x83, 0x48, 0x92, 0x99, 0xa2, 0x50, 0xc4, 0x55, 0xc2, 0x3d, 0xf7, 0x7c, 0xf7, 0xc0, 0xc1, 0x07,
	0x8e, 0xa9, 0xe2, 0x10, 0x8c, 0x14, 0xb2, 0xa2, 0x4c, 0xcb, 0x9a, 0x6a, 0x03, 0x16, 0xa8, 0x1b,
	0x53, 0xaf, 0x50, 0xc3, 0x4b, 0x70, 0x9c, 0x84, 0x61, 0xd2, 0xf3, 0x23, 0xe2, 0xc6, 0xe9, 0xce,
	0xcf, 0x4d, 0xcd, 0x1e, 0x15, 0xb0, 0xa2, 0x7d, 0xe3, 0x76, 0x3a, 0x14, 0x00, 0x42, 0x71, 0x4f,
	0xa5, 0xac, 0xaa, 0xc0, 0x32, 0x2b, 0xa1, 0xaa, 0xa3, 0x7a, 0xfc, 0xd2, 0xc1, 0xdd, 0x69, 0x80,
	0x27, 0x57, 0xab, 0x5f, 0x4a, 0x5a, 0x84, 0x1b, 0x93, 0x38, 0x23, 0x53, 0xfe, 0xb0, 0xe0, 0xb5,
	0x4d, 0x07, 0xdf, 0xb5, 0x8b, 0xf9, 0x3d, 0xcf, 0x2d, 0x39, 0x83, 0x3c, 0x40, 0xb3, 0xe4, 0xe9,
	0xfd, 0xf3, 0xb9, 0xd3, 0xcf, 0x7a, 0x4d, 0xe0, 0x53, 0xb4, 0x9f, 0xcc, 0x70, 0x7f, 0x66, 0x0d,
	0x67, 0xe5, 0x1f, 0xe0, 0xdb, 0x6b, 0xe0, 0xd1, 0xbc, 0x3a, 0xf1, 0x6f, 0x0f, 0x1d, 0xa1, 0x44,
	0xe2, 0xff, 0xe7, 0x0b, 0x65, 0x65, 0xc3, 0xdc, 0x5a, 0xc3, 0x6c, 0xf4, 0x08, 0x1e, 0xfe, 0x92,
	0xba, 0xce, 0x06, 0x21, 0xf6, 0x66, 0xb6, 0xd1, 0xc4, 0xa6, 0xa5, 0xf7, 0x6a, 0xe5, 0xf3, 0x4f,
	0x6e, 0x5f, 0x97, 0x23, 0xf4, 0xb6, 0x1c, 0xa1, 0x8f, 0xe5, 0x08, 0xe1, 0x14, 0x8c, 0x20, 0xae,
	0x60, 0xac, 0x26, 0xa1, 0x05, 0xa6, 0xa5, 0x47, 0xfa, 0xff, 0x04, 0x5f, 0x33, 0x55, 0xc4, 0xeb,
	0x97, 0xe8, 0x66, 0x57, 0x48, 0x7b, 0xb7, 0x98, 0x93, 0x1c, 0x4a, 0x1a, 0x0c, 0xb1, 0xc9, 0x50,
	0x99, 0x30, 0x3a, 0x6f, 0xbb, 0x9d, 0x77, 0x43, 0x13, 0x27, 0x5f, 0x01, 0x00, 0x00, 0xff, 0xff,
	0x3e, 0xfe, 0x82, 0x57, 0x04, 0x02, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// RemoveClient is the client API for Remove service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type RemoveClient interface {
	Remove(ctx context.Context, in *payload.Remove_Request, opts ...grpc.CallOption) (*payload.Object_Location, error)
	StreamRemove(ctx context.Context, opts ...grpc.CallOption) (Remove_StreamRemoveClient, error)
	MultiRemove(ctx context.Context, in *payload.Remove_MultiRequest, opts ...grpc.CallOption) (*payload.Object_Locations, error)
}

type removeClient struct {
	cc *grpc.ClientConn
}

func NewRemoveClient(cc *grpc.ClientConn) RemoveClient {
	return &removeClient{cc}
}

func (c *removeClient) Remove(ctx context.Context, in *payload.Remove_Request, opts ...grpc.CallOption) (*payload.Object_Location, error) {
	out := new(payload.Object_Location)
	err := c.cc.Invoke(ctx, "/vald.v1.Remove/Remove", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *removeClient) StreamRemove(ctx context.Context, opts ...grpc.CallOption) (Remove_StreamRemoveClient, error) {
	stream, err := c.cc.NewStream(ctx, &_Remove_serviceDesc.Streams[0], "/vald.v1.Remove/StreamRemove", opts...)
	if err != nil {
		return nil, err
	}
	x := &removeStreamRemoveClient{stream}
	return x, nil
}

type Remove_StreamRemoveClient interface {
	Send(*payload.Remove_Request) error
	Recv() (*payload.Object_StreamLocation, error)
	grpc.ClientStream
}

type removeStreamRemoveClient struct {
	grpc.ClientStream
}

func (x *removeStreamRemoveClient) Send(m *payload.Remove_Request) error {
	return x.ClientStream.SendMsg(m)
}

func (x *removeStreamRemoveClient) Recv() (*payload.Object_StreamLocation, error) {
	m := new(payload.Object_StreamLocation)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *removeClient) MultiRemove(ctx context.Context, in *payload.Remove_MultiRequest, opts ...grpc.CallOption) (*payload.Object_Locations, error) {
	out := new(payload.Object_Locations)
	err := c.cc.Invoke(ctx, "/vald.v1.Remove/MultiRemove", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// RemoveServer is the server API for Remove service.
type RemoveServer interface {
	Remove(context.Context, *payload.Remove_Request) (*payload.Object_Location, error)
	StreamRemove(Remove_StreamRemoveServer) error
	MultiRemove(context.Context, *payload.Remove_MultiRequest) (*payload.Object_Locations, error)
}

// UnimplementedRemoveServer can be embedded to have forward compatible implementations.
type UnimplementedRemoveServer struct {
}

func (*UnimplementedRemoveServer) Remove(ctx context.Context, req *payload.Remove_Request) (*payload.Object_Location, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Remove not implemented")
}
func (*UnimplementedRemoveServer) StreamRemove(srv Remove_StreamRemoveServer) error {
	return status.Errorf(codes.Unimplemented, "method StreamRemove not implemented")
}
func (*UnimplementedRemoveServer) MultiRemove(ctx context.Context, req *payload.Remove_MultiRequest) (*payload.Object_Locations, error) {
	return nil, status.Errorf(codes.Unimplemented, "method MultiRemove not implemented")
}

func RegisterRemoveServer(s *grpc.Server, srv RemoveServer) {
	s.RegisterService(&_Remove_serviceDesc, srv)
}

func _Remove_Remove_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(payload.Remove_Request)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(RemoveServer).Remove(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/vald.v1.Remove/Remove",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(RemoveServer).Remove(ctx, req.(*payload.Remove_Request))
	}
	return interceptor(ctx, in, info, handler)
}

func _Remove_StreamRemove_Handler(srv interface{}, stream grpc.ServerStream) error {
	return srv.(RemoveServer).StreamRemove(&removeStreamRemoveServer{stream})
}

type Remove_StreamRemoveServer interface {
	Send(*payload.Object_StreamLocation) error
	Recv() (*payload.Remove_Request, error)
	grpc.ServerStream
}

type removeStreamRemoveServer struct {
	grpc.ServerStream
}

func (x *removeStreamRemoveServer) Send(m *payload.Object_StreamLocation) error {
	return x.ServerStream.SendMsg(m)
}

func (x *removeStreamRemoveServer) Recv() (*payload.Remove_Request, error) {
	m := new(payload.Remove_Request)
	if err := x.ServerStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func _Remove_MultiRemove_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(payload.Remove_MultiRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(RemoveServer).MultiRemove(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/vald.v1.Remove/MultiRemove",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(RemoveServer).MultiRemove(ctx, req.(*payload.Remove_MultiRequest))
	}
	return interceptor(ctx, in, info, handler)
}

var _Remove_serviceDesc = grpc.ServiceDesc{
	ServiceName: "vald.v1.Remove",
	HandlerType: (*RemoveServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Remove",
			Handler:    _Remove_Remove_Handler,
		},
		{
			MethodName: "MultiRemove",
			Handler:    _Remove_MultiRemove_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "StreamRemove",
			Handler:       _Remove_StreamRemove_Handler,
			ServerStreams: true,
			ClientStreams: true,
		},
	},
	Metadata: "vald-origin/apis/proto/v1/vald/remove.proto",
}
