#!/bin/bash

# Decrypt the file
gpg --quiet --batch --yes --decrypt --passphrase="$TB_TEST_ASSET_PASSPHRASE" \
    --output "${2:-${1%.gpg}}" "$1"
