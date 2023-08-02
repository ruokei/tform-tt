variable "key_pair_compute" {
  description = "Key Pair and Instance List"
  type = list(object({
    instance_name = string
    key_name      = string
    public_key    = string
    location      = list(string)
  }))
}
