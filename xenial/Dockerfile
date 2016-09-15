FROM ubuntu:16.04
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG BUILD_DATE
ARG SNAP_VERSION=latest

ENV SNAP_VERSION=${SNAP_VERSION}
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Snap Ubuntu 16.04 Snap" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

ADD https://s3-us-west-2.amazonaws.com/snap.ci.snap-telemetry.io/snap/master/${SNAP_VERSION}/snapd  /opt/snap/bin/snapd
ADD https://s3-us-west-2.amazonaws.com/snap.ci.snap-telemetry.io/snap/master/${SNAP_VERSION}/snapctl /opt/snap/bin/snapctl
RUN chmod a+x /opt/snap/bin/* && \
	ln -s /opt/snap/bin/snapd /usr/local/bin/snapd && \
	ln -s /opt/snap/bin/snapctl /usr/local/bin/snapctl && \
	mkdir -p /opt/snap/plugins && \
	mkdir -p /var/log/snap

COPY snapd.conf /etc/snap/snapd.conf

CMD /opt/snap/bin/snapd -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
