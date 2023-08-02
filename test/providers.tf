terraform {
  required_providers {
    openstack = {
      source                = "terraform-provider-openstack/openstack"
      version               = "1.51.1"
      configuration_aliases = [openstack.openstack-my-kl, openstack.openstack-my-ttdi]
    }
  }
  backend "remote" {
    hostname     = "terrakube-ui:3000"
    organization = "simple"
    workspaces {
      name = "testtest"
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

resource "openstack_compute_keypair_v2" "set-key" {
  name       = var.key_pair_compute.key_name
  public_key = var.key_pair_compute.public_key
}
