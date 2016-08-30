FROM ubuntu:16.04
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG BUILD_DATE

ENV SNAP_VERSION="latest"
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Snap Ubuntu 16.04 Snap" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

RUN apt-get update && \
    (apt-get install -y curl || apt-get install -o Acquire::BrokenProxy=true -o Acquire::http::Pipeline-Depth="0" -y curl) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY install_snap /usr/local/bin/install_snap
COPY snapd.conf /etc/snap/snapd.conf

CMD /usr/local/bin/install_snap && /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
