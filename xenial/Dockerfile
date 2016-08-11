FROM ubuntu:16.04
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG SNAP_VERSION
ARG BUILD_DATE

ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Ubuntu 16.04 Snap ${SNAP_VERSION}" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version.is-beta= \
      io.snap-telemetry.snap.version=$SNAP_VERSION

EXPOSE 8181

RUN apt-get update && apt-get install -y curl
RUN curl -sfL "https://packagecloud.io/intelsdi-x/snap/packages/ubuntu/xenial/snap-telemetry_${SNAP_VERSION}-1xenial_amd64.deb/download" -o snap-telemetry.deb && dpkg -i snap-telemetry.deb && rm snap-telemetry.deb

CMD /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
