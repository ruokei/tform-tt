terraform {
  required_providers {
    openstack = {
      source                = "terraform-provider-openstack/openstack"
      version               = "1.49.0"
      configuration_aliases = [openstack.openstack-my-kl, openstack.openstack-my-ttdi]
    }
  }
}

provider "openstack" {
  insecure    = true
  alias       = "openstack-my-kl"
  user_name   = "admin"
  password    = "WQRv9Ax2G=wNmJ^s"
  tenant_name = "Admin"
  auth_url    = "https://10.151.255.35:5000/v3"
}

provider "openstack" {
  insecure    = true
  alias       = "openstack-my-ttdi"
  user_name   = "admin"
  password    = "WQRv9Ax2G=wNmJ^s"
  tenant_name = "Admin"
  auth_url    = "https://10.150.255.45:5000/v3"
}

module "site-ttdi" {
  source = "./test1"
  for_each = {
    for o in var.key_pair_compute : o.key_name => o if contains(o.location, "openstack-my-ttdi")
  }

  providers = {
    openstack = openstack.openstack-my-ttdi
  }

  key_pair_compute = each.value
}

module "site-kl" {
  source = "./test1"
  for_each = {
    for o in var.key_pair_compute : o.key_name => o if contains(o.location, "openstack-my-kl")
  }

  providers = {
    openstack = openstack.openstack-my-kl
  }

  key_pair_compute = each.value
}

# key_pair        = openstack_compute_keypair_v2.my-cloud-key[].name
