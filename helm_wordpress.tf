resource "random_password" "password" {
  length           = 24
  special          = true
  override_special = "_-$#@!&"
}

resource "helm_release" "wordpress" {
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  version    = var.helm_chart_version

  set {
    name  = "wordpressUsername"
    value = var.wordpress_username
  }

  set {
    name  = "wordpressPassword"
    value = random_password.password.result
  }
}