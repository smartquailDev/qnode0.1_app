# Creamos un dominio nuevo
resource "digitalocean_domain" "juansilvaphoto" {
  name = "juansilvaphoto.com"
  ip_address = digitalocean_droplet.QNODE01.ipv4_address
}

# Add a record to the domain
resource "digitalocean_record" "www" {
  domain = "${digitalocean_domain.juansilvaphoto.name}"
  type   = "A"
  name   = "juansilvaphoto.com"
  ttl    = "50"
  value  = "${digitalocean_droplet.QNODE01.ipv4_address}"
}

