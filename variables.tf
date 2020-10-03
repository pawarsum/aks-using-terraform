variable "resource_group_name" {
  type        = string
  description = "Resource group name for all kubernetes resources."
  default     = "terrakube"
}

variable "location" {
  type        = string
  description = "Azure resource location."
  default     = "centralindia"
}

variable "nodecount" {
  type        = number
  description = "Number of nodes for a k8 cluster"
}
variable "prefix" {
  type        = string
  description = "Prefix that will be added to resource"
}

variable "vmsize" {
  type        = string
  description = "VM size to for k8s nodes"
}

variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
  default = {
    "environment" = "dev"
  }
}

variable "password" {
  type        = string
  description = "Client password to connect Azure"
}

variable "appId" {
  type        = string
  description = "App id to connect Azure"
}