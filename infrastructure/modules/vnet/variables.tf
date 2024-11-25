variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "ccprojectvnet"
}

variable "location" {
  description = "The location where the VNet will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network (e.g., 10.0.0.0/16)"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_configs" {
  description = "Configuration for the subnets, including name and address prefixes"
  type        = list(object({
    name             = string
    address_prefixes = list(string)
  }))
  default     = [
    {
        name             = "mainvnet"
        address_prefixes = ["10.0.1.0/24"]
  }]
}