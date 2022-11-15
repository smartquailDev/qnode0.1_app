resource "digitalocean_spaces_bucket" "qnd01-staticfiles" {
  name   = "qnd01-staticfiles"
  region = "sfo3"
  acl = "public-read"
}

