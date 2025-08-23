terraform {
  backend "azurerm" {
    use_azuread_auth     = true
    tenant_id            = "30fe8ff1-adc6-444d-ba94-1238894df42c"
    client_id            = "738a4098-9a34-4171-b2fb-c581ad851a3c"
    client_secret        = "KxD8Q~nbUSHdtctwTxjQMyLBhL5szeMyF5D_rbrF"
    resource_group_name  = "kml_rg_main-1a21c94512594f06"
    storage_account_name = "train11733"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
