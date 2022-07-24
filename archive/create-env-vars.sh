#!/bin/bash
VOLT_API_URL=$1
VOLT_API_P12_FILE=$2
VES_P12_PASSWORD=$3
VOLT_API_CA_CERT=$4
if [ -z "$VES_P12_PASSWORD" ]; then
  echo "$0 <api_url> <volt_api_p12_file> ves_p12_password [<volt_api_ca_cert>]"
  exit 1
fi

echo "saving credentials to gitpod env ..."
gp env VOLT_API_URL=$VOLT_API_URL
gp env VOLT_API_P12_FILE=$(base64 -w0 $VOLT_API_P12_FILE) >/dev/null
gp env VES_P12_PASSWORD=$VES_P12_PASSWORD >/dev/null
if [ ! -z "$VOLT_API_CA_CERT" ]; then
  gp env VOLT_API_CA_CERT=$(base64 -w0 $VOLT_API_CA_CERT) >/dev/null
fi

echo "creating credential files from gitpod env and referencing them via local env variables ..."
eval $(gp env -e) >/dev/null
echo $VOLT_API_P12_FILE | base64 -d > $PWD/.api-creds.p12
export VOLT_API_P12_FILE=$PWD/.api-creds.p12
if [ ! -z "$VOLT_API_CA_CERT" ]; then
  echo $VOLT_API_CA_CERT | base64 -d > $PWD/.public_server_ca.crt
  export VOLT_API_CA_CERT=$PWD/.public_server_ca.crt
fi

echo VOLT_API_P12_FILE=$VOLT_API_P12_FILE
echo VOLT_API_CA_CERT=$VOLT_API_CA_CERT
echo VES_P12_PASSWORD=$VES_P12_PASSWORD
