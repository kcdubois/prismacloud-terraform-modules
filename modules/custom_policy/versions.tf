terraform {
  required_providers {
    prismacloud = {
      source = "PaloAltoNetworks/prismacloud"
      version = "1.2.8"
    }
  }
}

provider "prismacloud" {
  json_config_file = var.json_config_file
}