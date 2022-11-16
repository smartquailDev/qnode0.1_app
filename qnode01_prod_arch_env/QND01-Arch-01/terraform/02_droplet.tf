#
# Creamos el droplet

resource "digitalocean_droplet" "QNODE01" {
  image     = "ubuntu-22-04-x64"
  name      = "QNODE01"
  region    = "sfo3"
  size      = "s-2vcpu-2gb"
  user_data = "${file("docker.yaml")}"
  ssh_keys  = ["${digitalocean_ssh_key.qnd01.fingerprint}"]
}
