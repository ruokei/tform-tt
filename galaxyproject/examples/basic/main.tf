module "test" {
  source = "../.."

  key_pair_compute = [
    # {
    #   instance_name = "instance1",
    #   key_name      = "k1",
    #   public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSH2bofwlm9cxToxK/sr7EF2c/NCpqX6S+oIZoUBe0isrVJgSkBmv+r2nBclN8xSm6NOXsLKacYFImIe45/buRHxgQiSzV/feu8oWcznIApOcWgIeUdpAswr2oh+5bZ4y3eCDLodgg9QVS/KZN/WUDhajk3mV2WzkbbU5XFYtzt+TW+bHFmgDFPQnmkEzqLAamt6krxtn6TJsL+qMHy0TxaRaRahmpRWZbAqmsjz8dO+GV+EBJGAmPGGyvvGEs4+x3vLx7imp8tpJwrT/aOysrUEhrtsgqYqfmOL2h2Dc7fN6NL4F8fj1p001gDp4NomJpW7Kx6yD2hLJrdGayAlGJkMKwPC0V+uPi+/qEsvSRoGN3YvoaYDlcAgxFYh9WxKeFJMUonR0xAcZe+EIKo3mbzmuuHWuY17SlYeOkJEUZHV7+C4W/F/cCbRY71zCbfSokFTDGmCo6WIyGpyY3l35YXNNSpJmrbm+pf6kZoTseNEzl9gXE4sfNzyDV0DpB3n8= user@user-System-Product-Name",
    #   location      = ["openstack-my-kl", "openstack-my-ttdi"]
    # },
    {
      instance_name = "instance-m",
      key_name      = "k2",
      public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtqsWySIAjQJEqXXuRt6oeOzC7OhU3N0FD+os+ppsozT2yvA8KmIqnsblF77lg5XRNsoqcw8Rz5thrEYn9VeKsot9d3hOG+6NvNfoQWXBS+aiksceTiE7FL0tPl4S46SARKBkI0+/tV3KWx9Ee34ZRFGjbSdhhbnhBq71Pdv5pw239pjlOpFL0hjxXQhzCgNl1ycCqvSEfl08XFKXR1r6IdAJtLq8LQ3A3Dui/jrvxEq0B2r8FCdTuSsp/qLX5aGgm6wVXxCSOtgw2i4/xSkRRYpja5Rn76/M1rJWcnTosqf3uwX9H8yb2NKlErzEEqRH7nBDFN9ogyfUOJEsexYIoAjGMyBgJ/VwnXNMm8zZVLXPySXR3GWstLWuJgzW0YKCZIckdO4Ug1DXOUIWsICHgvefbsiT+qPKfuUYtjkCi4kQ4FZUpQ2vSSv7ha7hNUK0F2HqtpTAhtNAAAl32R7FDMTbw7SRYHHpNM1XINB6dImBj1JO42+b3EeMBlF4eSY0= user@user-System-Product-Name",
      location      = ["openstack-my-kl"]
    },
  ]
}
