terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.51.1"
    }
  }
}

locals {
  secgroup = flatten([
    for group in var.secgroup : [
      for rule in group.rule : [
        {
          name        = group.name
          description = group.description
          rulename    = rule.name
          from_port   = rule.from_port
          to_port     = rule.to_port
          ip_protocol = rule.ip_protocol
          cidr        = rule.cidr
        }
      ]
    ]
  ])

  # servergroup_variables = merge([
  #   for servergroup in var.servergroup :
  #   {
  #     for variable in servergroup["groups"]["variables"] :
  #     "${servergroup.name}-${variable.policy}" => {
  #       servergroup_name        = servergroup["name"]
  #       var_policy              = variable.policy
  #       var_max_server_per_host = variable.policy != "anti-affinity" ? 0 : variable.max_server_per_host
  #     }
  #   }
  # ]...)

  # servergroup_variables = merge([
  #   for servergroup in var.servergroup :
  #   {
  #     for variable in servergroup["groups"]["variables"] :
  #     "${servergroup.name}-${variable.policy}" => {
  #       servergroup_name        = servergroup["name"]
  #       var_policy              = variable.policy
  #       var_max_server_per_host = variable.policy != "anti-affinity" ? 0 : variable.max_server_per_host
  #     }...
  #   }
  # ]...)
}

# resource "openstack_compute_servergroup_v2" "svrg-1" {

#   for_each = local.servergroup_variables
#   name     = each.value.servergroup_name
#   policies = [each.value.var_policy]

#   # max_server_per_host becomes 0 if policy is not "anti-affinity"

#   dynamic "rules" {
#     for_each = each.value.var_max_server_per_host != 0 ? [each.value.var_max_server_per_host] : []

#     content {
#       max_server_per_host = rules.value
#     }
#   }
# }

resource "openstack_compute_keypair_v2" "set-key" {
  name       = var.key_pair_compute.key_name
  public_key = var.key_pair_compute.public_key
}

# resource "openstack_compute_flavor_v2" "set-flavor" {
#   name  = var.flavor_setup.name
#   ram   = var.flavor_setup.ram
#   vcpus = var.flavor_setup.vcpus
#   disk  = var.flavor_setup.disk
# }

# resource "openstack_compute_secgroup_v2" "secgroup_1" {
#   for_each    = { for v in var.secgroup : v.name => v }
#   name        = each.value.name
#   description = each.value.description

#   dynamic "rule" {
#     for_each = each.value.rule

#     content {
#       from_port   = rule.value.from_port
#       to_port     = rule.value.to_port
#       ip_protocol = rule.value.ip_protocol
#       cidr        = rule.value.cidr
#     }
#   }
# }

# resource "openstack_blockstorage_volume_v3" "volume_1" {
#   name        = var.volume.name
#   description = var.volume.description
#   size        = var.volume.size
# }

# resource "openstack_blockstorage_volume_attach_v3" "va_1" {
#   volume_id = openstack_blockstorage_volume_v3.volume_1.id
#   host_name = openstack_compute_instance_v2.instance_1.name
# }

# resource "openstack_compute_instance_v2" "instance_1" {
#   name            = var.key_pair_compute.instance_name
#   image_name      = "CentOS-7-x86_64-GenericCloud-2111"
# #  flavor_id       = openstack_compute_flavor_v2.set-flavor.id
#   flavor_name       = "INEEDFATCPU"
#   key_pair        = var.key_pair_compute.key_name
#   security_groups = ["default"]

#   dynamic "network" {
#     for_each = var.network

#     content {
#       name = network.value
#     }
#   }
# }

output "full" {
  # value = openstack_compute_servergroup_v2.svrg-1
  # value = openstack_compute_instance_v2.instance_1.access_ip_v4
  # value = openstack_compute_flavor_v2.set-flavor.id
  # value = openstack_compute_secgroup_v2.secgroup_1
  value = openstack_compute_keypair_v2.set-key
}
