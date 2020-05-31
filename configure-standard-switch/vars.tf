## =============================================================================
#  Variables - Connect to vSphere                                              #
## =============================================================================
variable "vsphere_server" {
  type        = "string"
  description = "vCenter or ESXi host"
}

variable "vsphere_user" {
  type        = "string"
  description = "User with permissions to create VM"
}

variable "vsphere_password" {
  type        = "string"
  description = "Defined user password"
}

## =============================================================================
#  Variables - vSphere                                                         #
## =============================================================================

variable "vsphere_datacenter" {
  type        = "string"
  description = "Defined vSphere data center object"
}

variable "esxi_hosts" {
  default = [
    "esxi11.rubrik.us",
    "esxi12.rubrik.us",
    "esxi13.rubrik.us",
  ]
}