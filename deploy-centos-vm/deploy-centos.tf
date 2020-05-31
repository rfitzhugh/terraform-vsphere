## =============================================================================
#  Create VM from Template                                                     #
## =============================================================================

resource "vsphere_virtual_machine" "vm1" {
  name             = "${var.hostname}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.cpu}"
  memory   = "${var.memory}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${var.disk_size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "${var.hostname}"
        domain    = "${var.domain}"
      }

      network_interface { }
    }
  }

## =============================================================================
#  OS Customizations                                                           #
## =============================================================================
  provisioner "file" {
    source = "files/certificates/"
    destination = "/etc/pki/ca-trust/source/anchors"
    connection {
      host        = "vm1"
      type        = "ssh"
      user        = "root"
    }
  }
  provisioner "file" {
    source = "files/sshd_config"
    destination = "/etc/ssh/sshd_config"
    connection {
      host        = "vm1"
      type        = "ssh"
      user        = "root"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # update machine and install required packages
      "yum -y update",
      "yum install -y ca-certificates realmd sssd samba-common-tools",
      
      # disable firewall
      "systemctl disable firewalld",
      "systemctl stop firewalld",
      
      # reload ssh
      "systemctl restart sshd",

      #join domain
      "echo 'PASSWORD' | realm join -U terraform",

      #allow group AD
      "realm permit -g 'Admin'",
      
      #restart sssd
      "service sssd restart",

      #Create partition using all space
      "parted -a opt /dev/sda unit mb mkpart primary xfs 9983 100%",
      "pvcreate /dev/sda3",
      "vgextend /dev/centos /dev/sda3",
      "lvextend -L +${(var.disk_size*var.root_size_percentage)/100}G /dev/centos/root",
      "lvextend -L +${(var.disk_size*var.var_size_percentage)/100}G /dev/centos/var",
      "xfs_growfs /dev/centos/root",
      "xfs_growfs /dev/centos/var",

      #disable SELINUX
      "setenforce 0",

      #update certificates
      "update-ca-trust force-enable",

      #Install docker
      "yum install -y yum-utils device-mapper-persistent-data lvm2",
      "yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
      "yum -y install docker-ce",
      "systemctl enable docker",
      "systemctl start docker",


    ]
    connection {
      type        = "ssh"
      host        = "vm1"
      user        = "root"
      password    = "Rubrik123!"
    }
  }
  provisioner "file" {
    source = "files/sssd.conf"
    destination = "/etc/sssd/sssd.conf"
    connection {
      type        = "ssh"
      host        = "vm1"
      user        = "root"
      password    = "Rubrik123!"
    }
  }
  provisioner "file" {
    source = "files/visudo"
    destination = "/etc/sudoers"
    connection {
      type        = "ssh"
      host        = "vm1"
      user        = "root"
      password    = "Rubrik123!"
    }
  }
  provisioner "file" {
    source = "files/selinux"
    destination = "/etc/selinux/config"
    connection {
      type        = "ssh"
      host        = "vm1"
      user        = "root"
      password    = "Rubrik123!"
    }
  }
}