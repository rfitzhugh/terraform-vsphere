# Using Terraform to Create vSphere Standard Switch and Port Groups
This can be used to create, update, and destroy vSphere standard switch and port groups. **NOTE** There is cuurently no ability to create VMkernel ports via Terraform. 

When a new port group is needed, edit the `main.tf` file and add the new required resource (pg).

Once the correct resource has been added, use `terraform init` to initialize the directory and download the newest Terraform provider. Then use `terraform plan` to view changes and `terraform apply` to create new tag(s).