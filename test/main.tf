terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.49.0"
    }
  }
}

resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = var.key_pair_compute.key_name
  public_key = var.key_pair_compute.public_key
}

resource "openstack_compute_instance_v2" "my-instance" {
  name            = var.key_pair_compute.instance_name
  image_name      = "CentOS-7-x86_64-GenericCloud-2111"
  flavor_name     = "medium"
  key_pair        = var.key_pair_compute.key_name
  security_groups = ["default"]

  network {
    name = "server_vlan"
  }
}
