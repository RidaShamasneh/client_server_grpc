install grpc on mingw64

$ pacman -Sy mingw-w64-x86_64-openssl

$ pacman -Sy mingw-w64-x86_64-grpc

(1/4) installing mingw-w64-x86_64-c-ares                                             
(2/4) installing mingw-w64-x86_64-gflags                                             
(3/4) installing mingw-w64-x86_64-protobuf                                           
(4/4) installing mingw-w64-x86_64-grpc

$ open powershell and execute " .\generate_protoc.bat"

$ last step is 'make'


References:

https://www.cnblogs.com/qq952693358/p/6942354.html
https://github.com/eliben/code-for-blog/blob/master/2016/grpc-stringdb/tester_client.py
https://grpc.io/docs/quickstart/python.html
https://github.com/plasticbox/grpc-windows/blob/master/grpc_helloworld/test_protoc.bat
https://chromium.googlesource.com/external/github.com/grpc/grpc/+/v1.11.1/examples/cpp#try-it
https://grpc.io/docs/quickstart/cpp.html
https://www.boost.org/doc/libs/1_39_0/libs/python/doc/tutorial/doc/html/index.html
https://stackoverflow.com/questions/33013214/rpc-c-server-and-python-client
https://eli.thegreenplace.net/2016/grpc-sample-in-c-and-python/
https://github.com/grpc/grpc
https://github.com/rpclib/rpclib
https://grpc.io/docs/quickstart/csharp.html
https://chromium.googlesource.com/external/github.com/grpc/grpc/+/v1.11.1/INSTALL.md
https://chromium.googlesource.com/external/github.com/grpc/grpc/+/v1.11.1/examples/cpp/helloworld
