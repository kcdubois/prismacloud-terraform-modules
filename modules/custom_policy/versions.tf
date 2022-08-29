terraform {
  required_providers {
    prismacloud = {
      source = "PaloAltoNetworks/prismacloud"
      version = "1.2.8"
    }
  }
}

provider "prismacloud" {
  json_config_file = "~/.prismacloud/terraform.json"
}
