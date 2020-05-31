# Using Terraform to Create vSphere Tags
This can be used to create, update, and destroy vSphere tags. Currently information on how the Tags are design, please see internal [Confluence page](https://rubrik.atlassian.net/wiki/spaces/TML/pages/471564648/vSphere). 

When a new tag is needed, edit the `main.tf` file and add the new required resource (Category or Tag).

This is defined as either:

* vSphere Tag Category (Parent Grouping)

```
resource "vsphere_tag_category" "category" {
  name        = "terraform-test-category"
  cardinality = "MULTIPLE"
  description = "Managed by Terraform"

  associable_types = [
    "VirtualMachine",
    "Datastore",
  ]
}
```

* vSphere Tag (Child to Category)
```
resource "vsphere_tag" "tag" {
  name        = "terraform-test-tag"
  category_id = "${vsphere_tag_category.category.id}"
  description = "Managed by Terraform"
}
```

Once the correct resource has been added, use `terraform init` to initialize the directory and download the newest Terraform provider. Then use `terraform plan` to view changes and `terraform apply` to create new tag(s).