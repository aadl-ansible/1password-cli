#!/usr/bin/env /bin/bash

set -eux
set -o pipefail

# Arguments: $1 = version of program, $2 = platform, $3 = install directory
if [ $# -ne 3 ]; then
  echo "Not enough arguments supplied"
  exit 1
fi

OP_VERSION=$1
OP_PLATFORM=$2
INSTALL_PATH=$3
OP_FILE=op_${OP_PLATFORM}_v${OP_VERSION}.zip
OP_URL=https://cache.agilebits.com/dist/1P/op/pkg/v${OP_VERSION}/${OP_FILE}

gpg --keyserver pgp.mit.edu --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22

TMP_DIR=$(mktemp -d)

cd $TMP_DIR
curl -Os $OP_URL
unzip $OP_FILE
gpg --verify op.sig op

if [ $? == 0 ]; then
  mv op $INSTALL_PATH/op
else
  echo "Signature did not match"
fi
