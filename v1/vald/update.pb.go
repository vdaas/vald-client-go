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

// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.36.6
// 	protoc        (unknown)
// source: v1/vald/update.proto

package vald

import (
	reflect "reflect"
	unsafe "unsafe"

	payload "github.com/vdaas/vald-client-go/v1/payload"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

var File_v1_vald_update_proto protoreflect.FileDescriptor

const file_v1_vald_update_proto_rawDesc = "" +
	"\n" +
	"\x14v1/vald/update.proto\x12\avald.v1\x1a\x1cgoogle/api/annotations.proto\x1a\x18v1/payload/payload.proto2\x92\x03\n" +
	"\x06Update\x12U\n" +
	"\x06Update\x12\x1a.payload.v1.Update.Request\x1a\x1b.payload.v1.Object.Location\"\x12\x82\xd3\xe4\x93\x02\f:\x01*\"\a/update\x12S\n" +
	"\fStreamUpdate\x12\x1a.payload.v1.Update.Request\x1a!.payload.v1.Object.StreamLocation\"\x00(\x010\x01\x12i\n" +
	"\vMultiUpdate\x12\x1f.payload.v1.Update.MultiRequest\x1a\x1c.payload.v1.Object.Locations\"\x1b\x82\xd3\xe4\x93\x02\x15:\x01*\"\x10/update/multiple\x12q\n" +
	"\x0fUpdateTimestamp\x12#.payload.v1.Update.TimestampRequest\x1a\x1b.payload.v1.Object.Location\"\x1c\x82\xd3\xe4\x93\x02\x16:\x01*\"\x11/update/timestampBS\n" +
	"\x1aorg.vdaas.vald.api.v1.valdB\n" +
	"ValdUpdateP\x01Z'github.com/vdaas/vald-client-go/v1/valdb\x06proto3"

var file_v1_vald_update_proto_goTypes = []any{
	(*payload.Update_Request)(nil),          // 0: payload.v1.Update.Request
	(*payload.Update_MultiRequest)(nil),     // 1: payload.v1.Update.MultiRequest
	(*payload.Update_TimestampRequest)(nil), // 2: payload.v1.Update.TimestampRequest
	(*payload.Object_Location)(nil),         // 3: payload.v1.Object.Location
	(*payload.Object_StreamLocation)(nil),   // 4: payload.v1.Object.StreamLocation
	(*payload.Object_Locations)(nil),        // 5: payload.v1.Object.Locations
}

var file_v1_vald_update_proto_depIdxs = []int32{
	0, // 0: vald.v1.Update.Update:input_type -> payload.v1.Update.Request
	0, // 1: vald.v1.Update.StreamUpdate:input_type -> payload.v1.Update.Request
	1, // 2: vald.v1.Update.MultiUpdate:input_type -> payload.v1.Update.MultiRequest
	2, // 3: vald.v1.Update.UpdateTimestamp:input_type -> payload.v1.Update.TimestampRequest
	3, // 4: vald.v1.Update.Update:output_type -> payload.v1.Object.Location
	4, // 5: vald.v1.Update.StreamUpdate:output_type -> payload.v1.Object.StreamLocation
	5, // 6: vald.v1.Update.MultiUpdate:output_type -> payload.v1.Object.Locations
	3, // 7: vald.v1.Update.UpdateTimestamp:output_type -> payload.v1.Object.Location
	4, // [4:8] is the sub-list for method output_type
	0, // [0:4] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_v1_vald_update_proto_init() }
func file_v1_vald_update_proto_init() {
	if File_v1_vald_update_proto != nil {
		return
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: unsafe.Slice(unsafe.StringData(file_v1_vald_update_proto_rawDesc), len(file_v1_vald_update_proto_rawDesc)),
			NumEnums:      0,
			NumMessages:   0,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_v1_vald_update_proto_goTypes,
		DependencyIndexes: file_v1_vald_update_proto_depIdxs,
	}.Build()
	File_v1_vald_update_proto = out.File
	file_v1_vald_update_proto_goTypes = nil
	file_v1_vald_update_proto_depIdxs = nil
}
