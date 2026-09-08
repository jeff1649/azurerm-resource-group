variable "app_abbreviation" {
  description = "Abbreviated application name used in the resource group name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.app_abbreviation))
    error_message = "app_abbreviation must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment name used in the resource group name."
  type        = string

  validation {
    condition     = contains(["poc", "dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: poc, dev, test, prod."
  }
}

variable "subscription" {
  description = "Subscription abbreviation used in the resource group name."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.subscription))
    error_message = "subscription must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "instance" {
  description = "Three-digit instance number appended to the resource group name."
  type        = number
  default     = 1

  validation {
    condition     = var.instance >= 1 && var.instance <= 999
    error_message = "instance must be between 1 and 999."
  }
}

variable "location" {
  description = "Azure region for the resource group."
  type        = string
}

variable "tags" {
  description = "Tags applied to the resource group."
  type        = map(string)
  default     = {}
}