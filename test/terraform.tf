resource "openstack_compute_instance_v2" "ins" {
  name            = "instance-d"
  image_name      = "CentOS-7-x86_64-GenericCloud-2111"
  flavor_name     = "small"
  key_pair        = "derrick"
  security_groups = ["default"]

  network = ["server_vlan"]
}
