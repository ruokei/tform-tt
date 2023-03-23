variable "key_pair_compute" {
  description = "Key Pair and Instance List"
  type = object({
    instance_name = string
    key_name      = string
    public_key    = string
    location      = list(string)
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
