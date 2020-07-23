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

data "openstack_images_image_v2" "centos_packer" {
   most_recent = true
   tag  = "packer-image"
}

resource "openstack_compute_instance_v2" "terraform_vm" {

  for_each        =  var.instance_name
  name            =  each.key
  image_id        = data.openstack_images_image_v2.centos_packer.id
  flavor_id       = "3"
  key_pair        = "openstack-key"
  security_groups = ["default"]

  network {
    name = "Project-network"
  }
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
   pool = "floating-ip-pool"
   for_each        =  var.instance_name
}


resource "openstack_compute_floatingip_associate_v2" "fip_associate" {
   for_each        =  var.instance_name
   floating_ip = openstack_networking_floatingip_v2.floating_ip[each.key].address
   instance_id = openstack_compute_instance_v2.terraform_vm[each.key].id
}
