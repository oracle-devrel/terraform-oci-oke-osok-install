#!/bin/bash

# Set platform information
export ARCH=$(case $(uname -m) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(uname -m) ;; esac)
export OS=$(uname | awk '{print tolower($0)}')

# Download Binary
export OPERATOR_SDK_DL_URL=https://github.com/operator-framework/operator-sdk/releases/download/v1.18.0
curl -LO ${OPERATOR_SDK_DL_URL}/operator-sdk_${OS}_${ARCH}

# Import the operator-sdk release GPG key from keyserver.ubuntu.com
gpg --keyserver keyserver.ubuntu.com --recv-keys 052996E2A20B5C7E

# Download the checksums file and its signature, then verify the signature:
curl -LO ${OPERATOR_SDK_DL_URL}/checksums.txt
curl -LO ${OPERATOR_SDK_DL_URL}/checksums.txt.asc
gpg -u "Operator SDK (release) <cncf-operator-sdk@cncf.io>" --verify checksums.txt.asc

# Make sure the checksums match:
grep operator-sdk_${OS}_${ARCH} checksums.txt | sha256sum -c -

#Install the release binary in your PATH
chmod +x operator-sdk_${OS}_${ARCH} && sudo mv operator-sdk_${OS}_${ARCH} /usr/local/bin/operator-sdk

#check if OLM installed and skip if installed

olm=$(operator-sdk olm status)
if [[ ! -z "$olm" ]]
then
  echo "OLM already installed skip installation"
else
  operator-sdk olm install --version 0.20.0
fi

# Verify Installation
operator-sdk olm status

# install OSOK Operator
operator-sdk run bundle iad.ocir.io/idotidhmwg5o/oci-service-operator-bundle:1.0.36 -n oci-service-operator-system --timeout 5m

