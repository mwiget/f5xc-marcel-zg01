eval $(gp env -e)
echo $VOLT_API_P12_FILE | base64 -d > $PWD/.api-creds.p12
export VOLT_API_P12_FILE=$PWD/.api-creds.p12
if [ ! -z "$VOLT_API_CA_CERT" ]; then
  echo $VOLT_API_CA_CERT | base64 -d > $PWD/.public_server_ca.crt
  export VOLT_API_CA_CERT=$PWD/.public_server_ca.crt
fi
echo VOLT_API_P12_FILE=$VOLT_API_P12_FILE
grep set-env.sh ~/.bashrc || echo "source $PWD/set-env.sh" >> ~/.bashrc
