## =============================================================================
#  vSphere Tags                                                                #
## =============================================================================

## =============================================================================
#  Tags Categories                                                             #
## =============================================================================

resource "vsphere_tag_category" "tag-owner" {
    name        = "Owner"
    cardinality = "MULTIPLE"
    description = "Primary owner for maintenance and issues - set by Terraform"
    associable_types = [
        "VirtualMachine"
    ]
}

resource "vsphere_tag_category" "tag-management" {
    name        = "Rubrik_SLA_Cluster_A"
    cardinality = "MULTIPLE"
    description = "Management Cluster - set by Terraform"
    associable_types = [
        "VirtualMachine"
    ]
}

resource "vsphere_tag_category" "tag-production" {
    name        = "Rubrik_SLA_Cluster_B"
    cardinality = "MULTIPLE"
    description = "Production Cluster - set by Terraform"
    associable_types = [
        "VirtualMachine"
    ]
}

resource "vsphere_tag_category" "tag-test" {
    name        = "Rubrik_SLA_Cluster_C"
    cardinality = "MULTIPLE"
    description = "Test Cluster - set by Terraform"
    associable_types = [
        "VirtualMachine"
    ]
}

## =============================================================================
#  Tags - Owner                                                                #
## =============================================================================
resource "vsphere_tag" "tag-owner-rfitzhugh" {
    name        = "RFITZHUGH"
    category_id = "${vsphere_tag_category.tag-owner.id}"
    description = "Managed by Rebecca"
}

resource "vsphere_tag" "tag-owner-melliott" {
    name        = "MELLIOTT"
    category_id = "${vsphere_tag_category.tag-owner.id}"
    description = "Managed by Matt"
}

resource "vsphere_tag" "tag-owner-jbrasser" {
    name        = "JBRASSER"
    category_id = "${vsphere_tag_category.tag-owner.id}"
    description = "Managed by Jaap"
}

resource "vsphere_tag" "tag-owner-mpreston" {
    name        = "MPRESTON"
    category_id = "${vsphere_tag_category.tag-owner.id}"
    description = "Managed by Mike"
}

## =============================================================================
#  Tags - Management                                                           #
## =============================================================================
resource "vsphere_tag" "tag-management-dnd" {
    name        = "Management DND"
    category_id = "${vsphere_tag_category.tag-management.id}"
    description = "Management VMs"
}

## =============================================================================
#  Tags - Production                                                           #
## =============================================================================
resource "vsphere_tag" "tag-production-dnd" {
    name        = "Production DND"
    category_id = "${vsphere_tag_category.tag-production.id}"
    description = "Production Demo VMs"
}

## =============================================================================
#  Tags - Test                                                                 #
## =============================================================================
resource "vsphere_tag" "tag-test-dnd" {
    name        = "Test DND"
    category_id = "${vsphere_tag_category.tag-test.id}"
    description = "Test VMs"
}