# AzureRM Resource Group Module

Reusable Terraform module for creating an Azure Resource Group using the AzureRM provider.

The resource group name is generated using the following convention:

```text
rg-{app_abbreviation}-{environment}-{subscription}-{instance}
```

Example:

```text
rg-pay-poc-lab-001
```

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.5.0 |
| AzureRM | ~> 4.0 |

## Usage

```hcl
module "resource_group" {
  source = "git::https://github.com/jeff1649/azurerm-resource-group.git?ref=v1.0.0"

  app_abbreviation = "pay"
  environment      = "poc"
  subscription     = "lab"
  location         = "centralus"

  tags = {
    environment = "poc"
    managed_by  = "terraform"
  }
}
```

This creates:

```text
rg-pay-poc-lab-001
```

To create another resource group using the same naming components:

```hcl
instance = 2
```

This creates:

```text
rg-pay-poc-lab-002
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| app_abbreviation | Abbreviated application name used in the resource group name. | `string` | n/a | yes |
| environment | Environment name. Allowed values: `poc`, `dev`, `test`, `prod`. | `string` | n/a | yes |
| subscription | Subscription abbreviation used in the resource group name. | `string` | n/a | yes |
| instance | Instance number appended as a three-digit value. | `number` | `1` | no |
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