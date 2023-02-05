
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
  cluster_name = "${var.project_name}-${var.environment}"
}

module "lke" {
  source = "../linode_kubernetes_engine"
  region = var.region

  cluster_name    = local.cluster_name
  cluster_version = "1.25"
  node_type       = "g6-dedicated-2"
  linode_token    = var.linode_token

}
