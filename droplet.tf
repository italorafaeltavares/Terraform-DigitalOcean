# resource "digitalocean_ssh_key" "default" {
#   name       = "Terraform Example"
#   public_key = file("./key/digital-key.pub")
# }

data "digitalocean_ssh_key" "terraform" {
  name = var.ssh_key_name
}

resource "digitalocean_droplet" "jenkins" {
  image    = "ubuntu-22-04-x64"
  name     = "jenkins"
  region   = var.region
  size     = var.size
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
  # ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}