# f5xc-marcel-zg01

Terraform manifests to provision F5XC IGW CE in my lab.

## F5XC API Credentials

Credentials can be stored in persistent gitpod env variables. 
Create your credentials (see https://docs.cloud.f5.com/docs/how-to/user-mgmt/credentials for details) and download them in the gitpod shell, then provide the filenames and password to the shell script [create-env-vars.sh](create-env-vars.sh):

```
$ ./create-env-vars.sh https://volterra-corp.staging.volterra.us/api \
  volterra-corp.staging.api-creds.p12 \
  mysecretpassword \
  public_server_ca.crt 
```

The public_server_ca.cert is only required when using staging tenants.


