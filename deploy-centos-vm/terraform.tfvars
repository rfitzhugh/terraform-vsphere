## =============================================================================
#  Variables Definitions - Environment                                         #
## =============================================================================
vsphere_server = "vcsa.domain.com"
vsphere_user = "administrator@vsphere.local"
vsphere_password = "P@$$W0RD"
vsphere_datacenter = "Datacenter"
vsphere_cluster = "Production"
vsphere_datastore = "vSAN"
vsphere_network = "VM_Network"

## =============================================================================
#  Variables Definitions - VM Configuration                                    #
## =============================================================================
hostname = "test-tf"
template = "TMPL_CENTOS7"
disk_size = "20"
cpu = "2"
memory = "6144"

## =============================================================================
#  Variables Definitions - VM Customization                                    #
## =============================================================================
root_size_percentage = "10"
var_size_percentage = "10"
domain = "domain.com"