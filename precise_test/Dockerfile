FROM ubuntu:12.04
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG BUILD_DATE

ENV SNAP_VERSION="latest_build"
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Snap Ubuntu 12.04" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version=$SNAP_VERSION \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/bin/jq
RUN chmod 755 /usr/bin/jq

RUN apt-get update && apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY init_snap /usr/local/bin/init_snap
COPY snapd.conf /etc/snap/snapd.conf

CMD /usr/local/bin/init_snap && /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
