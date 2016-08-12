#!/bin/bash

set -e
set -u
set -o pipefail

os=$1
version=$2
org=nanliu

cmd="docker build -t ${org}/snap:${version}_${os} \
  --build-arg BUILD_DATE=$(date +%Y-%m-%d) \
  --build-arg SNAP_VERSION=${version}"

if [[ $version == "latest" ]]; then
  sha=$(curl -s https://api.github.com/repos/intelsdi-x/snap/commits | jq -r .\[0\].sha)
  cmd="${cmd} \
    --label io.snap-telemetry.snap.sha=${sha}"
fi

$cmd -f "${os}/Dockerfile" .
