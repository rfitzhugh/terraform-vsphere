# Using Terraform to Create vSphere Distributed Switch and Port Group
This can be used to create, update, and destroy vSphere distributed switch and port groups. 

When a new port group is needed, edit the `main.tf` file and add the new required resource (pg).

Once the correct resource has been added, use `terraform init` to initialize the directory and download the newest Terraform provider. Then use `terraform plan` to view changes and `terraform apply` to create new tag(s).