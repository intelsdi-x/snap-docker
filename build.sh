#!/bin/bash

set -e
set -u
set -o pipefail

os=$1
org=${2:-"intelsdi"}
ver=${3:-"latest"}

cmd="docker build -t ${org}/snap:${ver}_${os} \
  --build-arg BUILD_DATE=$(date +%Y-%m-%d) \
  --build-arg SNAP_VERSION=$ver"

${cmd} -f "${os}/Dockerfile" .

if [ $ver == "latest" ]; then
	docker tag ${org}/snap:${ver}_${os} ${org}/snap:${os}
fi