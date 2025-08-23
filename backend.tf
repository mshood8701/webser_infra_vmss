terraform {
  backend "azurerm" {
    use_azuread_auth     = true
    tenant_id            = ""                      # Set via ARM_TENANT_ID environment variable
    client_id            = ""                      # Set via ARM_CLIENT_ID environment variable
    client_secret        = ""                      # Set via ARM_CLIENT_SECRET environment variable
    storage_account_name = "train11733"            # Pass via -backend-config or env var
    container_name       = "tfstate"               # Pass via -backend-config
    key                  = "dev.terraform.tfstate" # Pass via -backend-config
  }
}
