## =============================================================================
#  Create Standard Switch - ESXi11                                             #
## =============================================================================
resource "vsphere_host_virtual_switch" "switch11" {
  name           = "vSwitch-Test"
  host_system_id = "${data.vsphere_host.host.0.id}"

  network_adapters = ["vmnic0", "vmnic1"]

  active_nics  = ["vmnic0", "vmnic1"]
  standby_nics  = []
}

## =============================================================================
#  Create VM Port Groups - ESXi11                                              #
## =============================================================================
resource "vsphere_host_port_group" "pg-vm-mgmt11" {
  name                = "VM_Management-2"
  host_system_id      = "${data.vsphere_host.host.0.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch11.name}"

  vlan_id = 10
}

resource "vsphere_host_port_group" "pg-vm-prod11" {
  name                = "VM_Production-2"
  host_system_id      = "${data.vsphere_host.host.0.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch11.name}"

  vlan_id = 15
}

## =============================================================================
#  Create Standard Switch - ESXi12                                             #
## =============================================================================
resource "vsphere_host_virtual_switch" "switch12" {
  name           = "vSwitch-Test"
  host_system_id = "${data.vsphere_host.host.1.id}"

  network_adapters = ["vmnic0", "vmnic1"]

  active_nics  = ["vmnic0", "vmnic1"]
  standby_nics  = []
}

## =============================================================================
#  Create VM Port Groups - ESXi12                                              #
## =============================================================================
resource "vsphere_host_port_group" "pg-vm-mgmt12" {
  name                = "VM_Management-2"
  host_system_id      = "${data.vsphere_host.host.1.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch12.name}"

  vlan_id = 10
}

resource "vsphere_host_port_group" "pg-vm-prod12" {
  name                = "VM_Production-2"
  host_system_id      = "${data.vsphere_host.host.1.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch12.name}"

  vlan_id = 15
}

## =============================================================================
#  Create Standard Switch - ESXi13                                             #
## =============================================================================
resource "vsphere_host_virtual_switch" "switch13" {
  name           = "vSwitch-Test"
  host_system_id = "${data.vsphere_host.host.2.id}"

  network_adapters = ["vmnic0", "vmnic1"]

  active_nics  = ["vmnic0", "vmnic1"]
  standby_nics  = []
}

## =============================================================================
#  Create VM Port Groups - ESXi13                                              #
## =============================================================================
resource "vsphere_host_port_group" "pg-vm-mgmt13" {
  name                = "VM_Management-2"
  host_system_id      = "${data.vsphere_host.host.2.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch13.name}"

  vlan_id = 10
}

resource "vsphere_host_port_group" "pg-vm-prod13" {
  name                = "VM_Production-2"
  host_system_id      = "${data.vsphere_host.host.2.id}"
  virtual_switch_name = "${vsphere_host_virtual_switch.switch13.name}"

  vlan_id = 15
}