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
#  Variables - Environmental                                                   #
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

variable "vsphere_network" {
  type        = "string"
  description = "vSphere network"

variable "template" {
  type        = "string"
  description = "vSphere VM template"
}

## =============================================================================
#  Variables - VM Configurations                                               #
## =============================================================================
variable "hostname" {
  type        = "string"
  description = "Hostname for new VM"
}

variable "disk_size" {
  type        = "string"
  description = "size in GB"
}

variable "domain" {
  type        = "string"
  description = "AD domain for VM to join"
}

variable "root_size_percentage" {
  type        = "string"
  description = "size percentage for root"
}

variable "var_size_percentage" {
  type        = "string"
  description = "size percentage for var"
}

variable "cpu" { 
  type        = "string"
  description = "number of vCPUs"}
}

variable "memory" {
  type        = "string"
  description = "vSphere VM template"
}