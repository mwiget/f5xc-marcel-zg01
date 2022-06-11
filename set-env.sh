eval $(gp env -e)
echo $VOLT_API_P12_FILE | base64 -d > $PWD/.api-creds.p12
export VOLT_API_P12_FILE=$PWD/.api-creds.p12
if [ ! -z "$VOLT_API_CA_CERT" ]; then
  echo $VOLT_API_CA_CERT | base64 -d > $PWD/.public_server_ca.crt
  export VOLT_API_CA_CERT=$PWD/.public_server_ca.crt
  echo VOLT_API_CA_CERT=$VOLT_API_CA_CERT
fi
echo VOLT_API_P12_FILE=$VOLT_API_P12_FILE
echo VOLT_API_URL=$VOLT_API_URL
grep set-env.sh ~/.bashrc >/dev/null || echo "source $PWD/set-env.sh" >> ~/.bashrc
