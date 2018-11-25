# pip install grpcio
# pip install protobuff
# python -m pip install grpcio-tools

import grpc
import sys

sys.path.append(r".")
import helloworld_pb2
import helloworld_pb2_grpc

if __name__ == '__main__':
    channel = grpc.insecure_channel('localhost:50051')
    stub = helloworld_pb2_grpc.GreeterStub(channel)
    response = stub.SayHello(helloworld_pb2.HelloRequest(name='Rida'))
    print("Greeter client received: " + response.message)
