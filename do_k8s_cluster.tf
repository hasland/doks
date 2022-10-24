resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.k8s_name
  region  = var.k8s_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = var.k8s_version

  node_pool {
    name       = var.k8s_node_pool_name
    size       = var.k8s_node_pool_size
    node_count = var.k8s_node_count
  }
}