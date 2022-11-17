variable "digitalocean_token" {
  description = "Digital Ocean Token:qnd01"
  default     = "dop_v1_d060da2c678f65257090c208ce1bcaec8dc7261815072af57a6131a63f5bc2f4"
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



