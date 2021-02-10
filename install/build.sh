#!/usr/bin/env bash
printf "\n\n######## build ########\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Building ${IMAGE_REPOSITORY} from ${SOURCE_REPOSITORY_URL} on ${SOURCE_REPOSITORY_REF}"

rm -rf .build
mkdir .build

s2i build ${SOURCE_REPOSITORY_URL} --ref ${SOURCE_REPOSITORY_REF} --context-dir / registry.access.redhat.com/ubi8/nodejs-14 ${IMAGE_REPOSITORY} --as-dockerfile .build/Dockerfile

podman build .build -t ${IMAGE_REPOSITORY}
