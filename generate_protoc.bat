@echo off

@setlocal
pushd "%~dp0"

set path=%cd%
set output_client_path=%path%\
set protoc_path=C:\msys64\mingw64\bin\
set grpc_protoc_plugins_path=C:\msys64\mingw64\bin\

%protoc_path%\protoc.exe helloworld.proto --grpc_out=%output_client_path% --plugin=protoc-gen-grpc=%grpc_protoc_plugins_path%\grpc_cpp_plugin.exe --proto_path=.\
%protoc_path%\protoc.exe helloworld.proto --cpp_out=%output_client_path% --proto_path=.\

popd
@endlocal