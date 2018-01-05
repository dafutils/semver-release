#!/bin/bash

set -e -u			

rm -rf ./semver-tool
git clone https://github.com/fsaintjacques/semver-tool.git

echo "Attempting to resolve the latest release version tag..."
LAST_RELEASE_TAG=$(git describe --abbrev=0 --tags)
echo "Previous release verion tag: ${LAST_RELEASE_TAG}"
LAST_RELEASED_VERSION=${LAST_RELEASE_TAG#v}
echo "Previous release verion number: ${LAST_RELEASED_VERSION}"

RELEASE_TYPE=$(echo "$1" | tr '[:upper:]' '[:lower:]')
echo "Release type is: ${RELEASE_TYPE}"

RELEASE_VERSION=$(./semver-tool/src/semver bump ${RELEASE_TYPE} ${LAST_RELEASED_VERSION})

echo "The released version is: [${RELEASE_VERSION}]"
# git tag -a "v${RELEASE_VERSION}" -m "sbt-dynver compatible tag for ${RELEASE_VERSION}"
# git push --tags
