provider volterra {
}

terraform {
  required_version = ">= 1.2.2"

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.9"
    }
  }
}
