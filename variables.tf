variable "k8s_name" {
  type        = string
  description = "A name for the Kubernetes cluster."
}

variable "k8s_region" {
  type        = string
  description = "The slug identifier for the region where the Kubernetes cluster will be created."
}

variable "k8s_version" {
  type        = string
  description = "The slug identifier for the version of Kubernetes used for the cluster."
}

variable "k8s_node_pool_name" {
  type        = string
  description = "A name for the node pool."
}

variable "k8s_node_pool_size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
}

variable "k8s_node_count" {
  type        = number
  description = "The number of Droplet instances in the node pool."
}

variable "wordpress_username" {
  type        = string
  description = "Wordpress admin username. Defaults to 'admin'."
  default     = "admin"
}

variable "helm_chart_version" {
  type        = string
  description = "Bitnami wordpress helm chart version. Defaults to 15.2.6"
  default     = "15.2.6"
}