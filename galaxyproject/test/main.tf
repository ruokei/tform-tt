terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.49.0"
    }
  }
}

# resource "openstack_compute_keypair_v2" "set-key" {
#   name       = var.key_pair_compute.key_name
#   public_key = var.key_pair_compute.public_key
# }

# resource "openstack_compute_flavor_v2" "set-flavor" {
#   name  = var.flavor_setup.name
#   ram   = var.flavor_setup.ram
#   vcpus = var.flavor_setup.vcpus
#   disk  = var.flavor_setup.disk
# }

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  for_each    = { for v in var.secgroup: v.name=>v }
  name        = each.value.name
  description = each.value.description

  dynamic "rule" {
    for_each = each.value.rule

    content {
      from_port   = rule.value.from_port
      to_port     = rule.value.to_port
      ip_protocol = rule.value.ip_protocol
      cidr        = rule.value.cidr
    }
  }
}

# resource "openstack_compute_instance_v2" "my-instance" {
#   name            = var.key_pair_compute.instance_name
#   image_name      = "CentOS-7-x86_64-GenericCloud-2111"
#   flavor_name     = openstack_compute_flavor_v2.set_flavor.name
#   key_pair        = var.key_pair_compute.key_name
#   security_groups = ["default"]

#   network {
#     name = "server_vlan"
#   }
# }
