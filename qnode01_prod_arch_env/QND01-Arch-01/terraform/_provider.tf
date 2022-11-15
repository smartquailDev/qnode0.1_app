variable "digitalocean_token" {
  description = "Digital Ocean Token:juansilvaphoto"
  default     = "dop_v1_4d56140b201077922088cb2a49b03ced13a9f8b695b25ed315056b1fc2ba6db8"
}

variable "spaces_access_id" {
  description = "Digital Ocean Spaces Acees ID"
  default     = "DO009JKYEJXLCUN744QW"
}
variable "spaces_secret_key" {
  description = "Digital Ocean Spaces Secret Key"
  default     = "21B4zjvTKCg7GerLlOWBB9ot3WR7MYiJ+goP09CroOQ"
}

terraform {
  required_version = ">= 0.14.0"  
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    }
  }
}

# Configure the DigitalOcean Provider

provider "digitalocean" {
  token = var.digitalocean_token
  spaces_access_id  = var.spaces_access_id
  spaces_secret_key = var.spaces_secret_key
}



