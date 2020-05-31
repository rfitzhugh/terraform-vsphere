## =============================================================================
#  Data Sources - vSphere                                                      #
## =============================================================================
data "vsphere_datacenter" "dc" {
  name = "Coresite"
}

data "vsphere_host" "host" {
  count         = "${length(var.esxi_hosts)}"
  name          = "${var.esxi_hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}