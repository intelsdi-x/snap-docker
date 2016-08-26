FROM centos:6
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG SNAP_VERSION
ARG BUILD_DATE

ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Centos 6 Snap ${SNAP_VERSION}" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version.is-beta= \
      io.snap-telemetry.snap.version=$SNAP_VERSION

EXPOSE 8181

COPY install_snap /usr/local/bin/install_snap
RUN /usr/local/bin/install_snap
COPY snapd.conf /etc/snap/snapd.conf

CMD /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
