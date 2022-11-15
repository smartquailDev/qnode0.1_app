#
# Exportamos nuestra key SSH

resource "digitalocean_ssh_key" "qnd01" {
  name       = "qnd01"
  public_key = "${file("id_rsa.pub")}"
}

