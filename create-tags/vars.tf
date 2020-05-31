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
  description = "vSphere datacenter"
}

variable "vsphere_cluster" {
    type      = "string"
    description = "vSphere cluster"
}

variable "vsphere_datastore" {
  type        = "string"
  description = "vSphere storage"
}
