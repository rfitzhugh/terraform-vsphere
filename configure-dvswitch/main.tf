## =============================================================================
#  Create dvSwitch                                                             #
## =============================================================================
resource "vsphere_distributed_virtual_switch" "dvs" {
  name            = "DSwitch-2"
  datacenter_id   = "${data.vsphere_datacenter.dc.id}"
  
  uplinks         = ["Uplink 1", "Uplink 2"]
  active_uplinks  = ["Uplink 1", "Uplink 2"]

  host {
    host_system_id = "${data.vsphere_host.host.0.id}"
    devices        = ["vmnic0", "vmnic1"]
  }

  host {
    host_system_id = "${data.vsphere_host.host.1.id}"
    devices        = ["vmnic0", "vmnic1"]
  }

  host {
    host_system_id = "${data.vsphere_host.host.2.id}"
    devices        = ["vmnic0", "vmnic1"]
  }
}

## =============================================================================
#  Create VM_Network Port Group                                                #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-vm" {
  name                            = "VM_Network-2"
  vlan_id                         = 1500
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}

## =============================================================================
#  Create Management Port Group                                                #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-mgmt" {
  name                            = "Management-2"
  vlan_id                         = 1000
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}

## =============================================================================
#  Create vMotion_A Port Group                                                 #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-vmotion-a" {
  name                            = "vMotion_A-2"
  vlan_id                         = 1200
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"

    
  active_uplinks                  = ["Uplink 1"]
  standby_uplinks                 = ["Uplink 2"]
}

## =============================================================================
#  Create vMotion_B Port Group                                                 #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-vmotion-b" {
  name                            = "vMotion_B-2"
  vlan_id                         = 1300
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
    
  active_uplinks                  = ["Uplink 2"]
  standby_uplinks                 = ["Uplink 1"]
}

## =============================================================================
#  Create Storage_iSCSI_A Port Group                                           #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-iscsi-a" {
  name                            = "Storage_iSCSI_A-2"
  vlan_id                         = 1001
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
  
  active_uplinks                  = ["Uplink 1"]
  standby_uplinks                 = ["Uplink 2"]
}

## =============================================================================
#  Create Storage_iSCSI_B Port Group                                           #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-iscsi-b" {
  name                            = "Storage_iSCSI_B-2"
  vlan_id                         = 1010
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
  
  active_uplinks                  = ["Uplink 2"]
  standby_uplinks                 = ["Uplink 1"]
}

## =============================================================================
#  Create Storage_vSAN_A Port Group                                            #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-vsan-a" {
  name                            = "Storage_vSAN_A-2"
  vlan_id                         = 1101
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"

    
  active_uplinks                  = ["Uplink 1"]
  standby_uplinks                 = ["Uplink 2"]
}

## =============================================================================
#  Create Storage_vSAN_B Port Group                                            #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-vsan-b" {
  name                            = "Storage_vSAN_B-2"
  vlan_id                         = 1110
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
  
  active_uplinks                  = ["Uplink 2"]
  standby_uplinks                 = ["Uplink 1"]
}

## =============================================================================
#  Create Storage_NFS Port Group                                               #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-nfs" {
  name                            = "Storage_NFS-2"
  vlan_id                         = 1050
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}

## =============================================================================
#  Create Rubrik_Data Port Group                                               #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-rubrik" {
  name                            = "Rubrik_Data-2"
  vlan_id                         = 1501
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}

## =============================================================================
#  Create Compute_OOB Port Group                                               #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-oob" {
  name                            = "Compute_OOB-2"
  vlan_id                         = 2000
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}

## =============================================================================
#  Create Isolated Port Group                                                  #
## =============================================================================
resource "vsphere_distributed_port_group" "pg-isolated" {
  name                            = "Isolated-2"
  vlan_id                         = 450
  distributed_virtual_switch_uuid = "${vsphere_distributed_virtual_switch.dvs.id}"
}