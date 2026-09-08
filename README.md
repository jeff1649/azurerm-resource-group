# AzureRM Resource Group Module

Reusable Terraform module for creating an Azure Resource Group using the AzureRM provider.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.5.0 |
| AzureRM | ~> 4.0 |

## Usage

```hcl
module "resource_group" {
  source = "git::https://github.com/jeff1649/azurerm-resource-group.git?ref=v1.0.0"

  name     = "rg-example-poc"
  location = "centralus"

  tags = {
    environment = "poc"
    managed_by  = "terraform"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Name of the resource group. | `string` | n/a | yes |
| location | Azure region for the resource group. | `string` | n/a | yes |
| tags | Tags applied to the resource group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | ID of the resource group. |
| name | Name of the resource group. |
| location | Location of the resource group. |

## Resources

This module creates:

- `azurerm_resource_group`