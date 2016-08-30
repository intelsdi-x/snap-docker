FROM centos:6
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG BUILD_DATE

ENV SNAP_VERSION="latest"
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Snap Centos 6" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

COPY install_snap /usr/local/bin/install_snap
COPY snapd.conf /etc/snap/snapd.conf

CMD /usr/local/bin/install_snap && /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
