data "digitalocean_kubernetes_cluster" "k8s" {
  name = digitalocean_kubernetes_cluster.k8s.name
}

data "kubernetes_service" "wordpress_svc" {
  metadata {
    name = "wordpress"
  }
  depends_on = [
    helm_release.wordpress
  ]
}