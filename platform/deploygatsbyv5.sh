#!/usr/bin/env bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DEFAULT_PROJECT="${SCRIPT_DIR}/.."

PROJECT="${1:-${DEFAULT_PROJECT}}"
GATSBY="${PROJECT}/gatsby5"
PLATFORM="${PROJECT}/platform"

echo PROJECT DIR: $PROJECT
echo GATSBY DIR: $GATSBY
echo PLATFORM DIR: $PLATFORM

cd $GATSBY

gatsby build

cd ./public

aws s3 sync . s3://peterbean.net --delete

echo "http://peterbean.net.s3-website-us-west-2.amazonaws.com/"