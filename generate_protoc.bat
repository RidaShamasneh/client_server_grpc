@echo off

@setlocal
pushd "%~dp0"

set path=%cd%
set output_client_path=%path%\
set protoc_path=C:\msys64\mingw64\bin\
set grpc_protoc_plugins_path=C:\msys64\mingw64\bin\

%protoc_path%\protoc.exe helloworld.proto --grpc_out=. --plugin=protoc-gen-grpc=%grpc_protoc_plugins_path%\grpc_cpp_plugin.exe
%protoc_path%\protoc.exe helloworld.proto --cpp_out=.

rem Rule for producing the Python protobuf bindings
rem %protoc_path%\protoc.exe helloworld.proto --python_out=. --grpc_out=. --plugin=protoc-gen-grpc=%grpc_protoc_plugins_path%\grpc_python_plugin.exe
C:\Python27\python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. helloworld.proto

popd
@endlocal