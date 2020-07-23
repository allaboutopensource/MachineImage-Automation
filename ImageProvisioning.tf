provider "openstack" {
  user_name   = "username"
  tenant_name = "project-name"
  password    = "password"
  auth_url    = "https://openstack-URL:5000/v3"
  tenant_id   =  "project-ID"
  region      = "us-east-1"
  user_domain_name    =   "company.com"
  project_domain_id   =   "project-domain-ID"
}

resource "openstack_compute_instance_v2" "terraform-vm" {

  name            = "automated-vm"
  count =         2
  image_id        = "Image-ID"
  flavor_id       = "3"
  key_pair        = "openstack-key"
  security_groups = ["default"]

  network {
    name = "Project-network"
  }
}
