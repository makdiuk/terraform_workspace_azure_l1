variable "location" {
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
  type        = string
  default     = "eastus"
}
