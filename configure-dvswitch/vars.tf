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
variable "esxi_hosts" {
  default = [
    "esxi11.domain.com",
    "esxi12.domain.com",
    "esxi13.domain.com",
  ]
}

variable "network_interfaces" {
  default = [
    "vmnic0",
    "vmnic1"
  ]
}