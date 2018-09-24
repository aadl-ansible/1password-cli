#!/usr/bin/env /bin/bash

set -eux
set -o pipefail

# Arguments: $1 = version of program, $2 = platform, $3 = install directory, $4 = check GPG signature of SHASUM file
if [ $# -ne 4 ]; then
  echo "Not enough arguments supplied"
  exit 1
fi

OP_VERSION=$1
OP_PLATFORM=$2
INSTALL_PATH=$3
GPG_CHECK=$4
OP_FILE=op_${OP_PLATFORM}_v${OP_VERSION}.zip
OP_URL=https://cache.agilebits.com/dist/1P/op/pkg/v${OP_VERSION}/${OP_FILE}

TMP_DIR=$(mktemp -d)

cd $TMP_DIR
curl -Os $OP_URL
unzip $OP_FILE

if [[ $GPG_CHECK == "true" ]]; then
  gpg --verify op.sig op

  if [ $? -ne 0 ]; then
    echo "GPG signature did not match"
    exit 1
  fi
fi

if [ $? -eq 0 ]; then
  mv op $INSTALL_PATH/op
else
  echo "Checksum did not match"
  exit 1
fi
