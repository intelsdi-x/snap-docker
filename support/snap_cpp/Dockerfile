FROM ubuntu:xenial
MAINTAINER Nan Liu <nan.liu@gmail.com>

LABEL vendor="Intelsdi-X" \
      name="Snap C++ Plugin Build" \
      license="Apache 2.0"

RUN apt-get update && apt-get install -y autoconf cpio cmake curl git libtool \
    build-essential protobuf-compiler libprotobuf-dev libprotoc-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/grpc/grpc && \
    cd grpc && \
    git checkout tags/v1.0.1 && git submodule update --init && \
    make && make install && \
    cd ./third_party/protobuf && \
    make install && \
    rm -rf /grpc

RUN git clone https://github.com/intelsdi-x/snap-plugin-lib-cpp.git && \
    cd snap-plugin-lib-cpp && \
    ./autogen.sh && ./configure && make && make install && \
    rm -rf /snap-plugin-lib-cpp
