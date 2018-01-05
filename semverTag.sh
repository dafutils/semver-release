#!/bin/bash

set -e -u
shopt -s nocasematch				

rm -rf ./semver-tool
git clone https://github.com/fsaintjacques/semver-tool.git

LAST_RELEASE_TAG=$(git describe --abbrev=0 --tags)
LAST_RELEASED_VERSION=${LAST_RELEASE_TAG#v}

case "$1" in
	"MAJOR" ) RELEASE_VERSION=$(./semver-tool/src/semver bump major ${LAST_RELEASED_VERSION}) ;;
	"MINOR" ) RELEASE_VERSION=$(./semver-tool/src/semver bump minor ${LAST_RELEASED_VERSION}) ;;
	"PATCH" ) RELEASE_VERSION=$(./semver-tool/src/semver bump patch ${LAST_RELEASED_VERSION}) ;;
esac

echo "The released version is: [${RELEASE_VERSION}]"
# git tag -a "v${RELEASE_VERSION}" -m "sbt-dynver compatible tag for ${RELEASE_VERSION}"
# git push --tags
