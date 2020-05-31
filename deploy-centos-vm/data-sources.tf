## =============================================================================
#  Data Sources - vSphere                                                      #
## =============================================================================
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere_cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
## =============================================================================
#  Data Sources - VM Template                                                  #
## =============================================================================
data "vsphere_virtual_machine" "template" {
  name          = "${var.template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}