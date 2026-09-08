locals {
  resource_group_name = format(
    "rg-%s-%s-%s-%03d",
    var.app_abbreviation,
    var.environment,
    var.subscription,
    var.instance
  )
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = var.location

  tags = var.tags
}