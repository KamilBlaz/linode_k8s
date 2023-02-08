

terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.4"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

resource "linode_lke_cluster" "this" {
  label       = var.cluster_name
  k8s_version = var.cluster_version
  region      = var.region

  pool {
    type  = var.node_type
    count = var.node_count
  }
}
