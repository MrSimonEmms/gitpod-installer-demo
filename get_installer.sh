#!/bin/bash

set -e

VERSION="${1}"

if [ -z "${VERSION}" ]; then
    echo "Version is expected"
    exit 1
fi

docker create -ti --name installer "eu.gcr.io/gitpod-core-dev/build/installer:${VERSION}"
docker cp installer:/app/installer ./installer
docker rm -f installer