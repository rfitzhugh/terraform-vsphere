## =============================================================================
#  Data Sources - vSphere                                                      #
## =============================================================================
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_host" "host" {
  count         = "${length(var.esxi_hosts)}"
  name          = "${var.esxi_hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}