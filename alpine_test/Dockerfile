FROM alpine:3.4
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG BUILD_DATE

ENV SNAP_VERSION="latest_build"
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1
ENV SNAP_URL="http://127.0.0.1:8181"

LABEL vendor="Intelsdi-X" \
      name="Snap Alpine 3.4" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version=$SNAP_VERSION \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

RUN apk update && \
    apk add curl && \
    apk add bash && \
    apk add jq && \
    rm -rf /var/cache/apk/*

COPY init_snap /usr/local/bin/init_snap
COPY snapteld.conf /etc/snap/snapteld.conf

CMD /usr/local/bin/init_snap && /opt/snap/sbin/snapteld -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
