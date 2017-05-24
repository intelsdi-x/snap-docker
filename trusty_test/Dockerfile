FROM ubuntu:14.04

ARG BUILD_DATE

ENV SNAP_VERSION="latest_build"
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Snap Ubuntu 14.04" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version=$SNAP_VERSION \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

RUN apt-get update && apt-get install -y curl jq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY init_snap /usr/local/bin/init_snap
COPY snapteld.conf /etc/snap/snapteld.conf

CMD /usr/local/bin/init_snap && /opt/snap/sbin/snapteld -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
