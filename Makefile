#
# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

CXX = g++
CPPFLAGS += -IC:/msys64/mingw64/include -IC:/msys64/mingw64/include/grpcpp
CXXFLAGS += -std=c++11
LDFLAGS += -L/usr/local/lib -LC:/msys64/mingw64/lib -lprotobuf -lgrpc++ -lgpr -Wl,--no-as-needed

PROTOC = protoc
GRPC_CPP_PLUGIN = grpc_cpp_plugin.exe
GRPC_CPP_PLUGIN_PATH ?= `which $(GRPC_CPP_PLUGIN)`

PROTOS_PATH = ../../protos

vpath %.proto $(PROTOS_PATH)

all: greeter_client greeter_server greeter_async_client greeter_async_client2 greeter_async_server

greeter_client: helloworld.pb.o helloworld.grpc.pb.o greeter_client.o
	$(CXX) $^ $(LDFLAGS) -o $@

greeter_server: helloworld.pb.o helloworld.grpc.pb.o greeter_server.o
	$(CXX) $^ $(LDFLAGS) -o $@

greeter_async_client: helloworld.pb.o helloworld.grpc.pb.o greeter_async_client.o
	$(CXX) $^ $(LDFLAGS) -o $@

greeter_async_client2: helloworld.pb.o helloworld.grpc.pb.o greeter_async_client2.o
	$(CXX) $^ $(LDFLAGS) -o $@

greeter_async_server: helloworld.pb.o helloworld.grpc.pb.o greeter_async_server.o
	$(CXX) $^ $(LDFLAGS) -o $@

.PRECIOUS: %.grpc.pb.cc
%.grpc.pb.cc: %.proto
	$(PROTOC) -I $(PROTOS_PATH) --grpc_out=. --plugin=protoc-gen-grpc=$(GRPC_CPP_PLUGIN_PATH) $<

.PRECIOUS: %.pb.cc
%.pb.cc: %.proto
	$(PROTOC) -I $(PROTOS_PATH) --cpp_out=. $<

clean:
	rm -f *.o *.pb.cc *.pb.h greeter_client greeter_server greeter_async_client greeter_async_client2 greeter_async_server