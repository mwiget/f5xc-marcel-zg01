#!/bin/bash
VOLT_API_P12_FILE=$1
VES_P12_PASSWORD=$2
VOLT_API_CA_CERT=$3
if [ -z "$VES_P12_PASSWORD" ]; then
  echo "$0 <volt_api_p12_file> ves_p12_password [<volt_api_ca_cert>]"
  exit 1
fi

echo "saving credentials to gitpod env ..."
gp env VOLT_API_P12_FILE=$(base64 -w0 $VOLT_API_P12_FILE) >/dev/null
gp env VES_P12_PASSWORD=$VES_P12_PASSWORD >/dev/null
if [ ! -z "$VOLT_API_CA_CERT" ]; then
  gp env VOLT_API_CA_CERT=$(base64 -w0 $VOLT_API_CA_CERT) >/dev/null
fi

echo "creating credential files from gitpod env and referencing them via local env variables ..."
eval $(gp env -e) >/dev/null
echo $VOLT_API_P12_FILE | base64 -d > ~/.api-creds.p12
export VOLT_API_P12_FILE=~/.api-creds.p12
if [ ! -z "$VOLT_API_CA_CERT" ]; then
  echo $VOLT_API_CA_CERT | base64 -d > ~/.public_server_ca.crt
  export VOLT_API_CA_CERT=~/.public_server_ca.crt
fi

echo VOLT_API_P12_FILE=$VOLT_API_P12_FILE
echo VOLT_API_CA_CERT=$VOLT_API_CA_CERT
echo VES_P12_PASSWORD=$VES_P12_PASSWORD
