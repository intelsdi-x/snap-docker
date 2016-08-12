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

RUN mkdir -p /opt/snap/bin && \
    mkdir -p /opt/snap/plugins && \
    mkdir -p /etc/snap

RUN curl "https://s3-us-west-2.amazonaws.com/intelsdi-x/snap/${SNAP_VERSION}/snapd" > /opt/snap/bin/snapd && \
    curl "https://s3-us-west-2.amazonaws.com/intelsdi-x/snap/${SNAP_VERSION}/snapctl" > /opt/snap/bin/snapctl && \
    chmod 775 /opt/snap/bin/snapd && \
    chmod 775 /opt/snap/bin/snapctl && \
    ln -s /opt/snap/bin/snapd /usr/local/bin/snapd && \
    ln -s /opt/snap/bin/snapctl /usr/local/bin/snapctl

COPY snapd.conf /etc/snap/snapd.conf

CMD /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
