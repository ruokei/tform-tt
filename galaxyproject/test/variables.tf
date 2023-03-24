variable "key_pair_compute" {
  description = "Key Pair and Instance List"
  type = object({
    instance_name = string
    key_name      = string
    public_key    = string
    location      = list(string)
  })
}

variable "flavor_setup" {
  description = "Flavor Settings"
  type = object({
    name  = string
    ram   = string
    vcpus = string
    disk  = string
  })
}

variable "secgroup" {
  description = "Security Group"
  type = list(object({
    name        = string
    description = string
    rule = list(object({
      name        = string
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr        = string
    }))
  }))
}

variable "network" {
  description = "List of Networks"
  type        = list(string)
}

variable "volume" {
  description = "Volume Settings"
  type = object({
    name        = string
    description = string
    size        = number
  })
}
