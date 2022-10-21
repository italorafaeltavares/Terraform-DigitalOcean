resource "digitalocean_kubernetes_cluster" "foo" {
  name    = "k8s"
  region  = var.region
  version = "1.24.4-do.1"

  node_pool {
    name       = "default"
    size       = var.size
    node_count = 2
  }
}
