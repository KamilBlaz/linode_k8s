
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

data "linode_object_storage_cluster" "this" {
  id = var.region
}

resource "linode_object_storage_key" "this" {
  label = "terraform_state_${var.project_name}"
}

resource "linode_object_storage_bucket" "this" {
  access_key = linode_object_storage_key.this.access_key
  secret_key = linode_object_storage_key.this.secret_key

  cluster = data.linode_object_storage_cluster.this.id
  label   = var.bucket
}

