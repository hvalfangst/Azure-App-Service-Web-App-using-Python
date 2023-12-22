terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "hvalfangst" {
  location = "West Europe"
  name = "hvalfangstresourcegroup"
}

resource "azurerm_service_plan" "hvalfangst" {
  name = "hvalfangstserviceplan"
  location = azurerm_resource_group.hvalfangst.location
  resource_group_name = azurerm_resource_group.hvalfangst.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "hvalfangst" {
  name = "hvalfangstlinuxwebapp"
  location = azurerm_resource_group.hvalfangst.location
  resource_group_name = azurerm_resource_group.hvalfangst.name
  service_plan_id = azurerm_service_plan.hvalfangst.id
  site_config {
    always_on = false
    application_stack{
      python_version = "3.11"
    }
  }
}