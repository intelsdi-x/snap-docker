FROM centos:6

ARG BUILD_DATE

ENV SNAP_VERSION="latest_build"
ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1

LABEL vendor="Intelsdi-X" \
      name="Snap Centos 6" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version=$SNAP_VERSION \
      io.snap-telemetry.snap.version.is-beta=

EXPOSE 8181

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/bin/jq
RUN chmod 755 /usr/bin/jq

COPY init_snap /usr/local/bin/init_snap
COPY snapteld.conf /etc/snap/snapteld.conf

CMD /usr/local/bin/init_snap && /opt/snap/sbin/snapteld -t ${SNAP_TRUST_LEVEL} -l ${SNAP_LOG_LEVEL} -o ''
