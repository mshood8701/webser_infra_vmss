terraform {
  backend "azurerm" {
    use_azuread_auth     = true
    storage_account_name = "train11567"            # Pass via -backend-config
    container_name       = "tfstate"               # Pass via -backend-config
    key                  = "dev.terraform.tfstate" # Pass via -backend-config
  }
}
