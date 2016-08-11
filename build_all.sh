#!/bin/bash

set -e
set -u
set -o pipefail

version=$1

find . -not -path '*/\.*' -name Dockerfile -exec dirname {} \; |cut -c 3- | xargs -n1 -I{} ./build.sh {} "${version}"
