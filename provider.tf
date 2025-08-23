terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }

  required_version = ">= 1.9.0"
}

provider "azurerm" {
  features {

  }

  subscription_id                 = "a2b28c85-1948-4263-90ca-bade2bac4df4"
  resource_provider_registrations = "none"
}
