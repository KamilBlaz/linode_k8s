terraform {

  backend "s3" {
    key = "main.tfstate"
  }

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

module "this" {
  source = "../../modules/main"

  region       = var.region
  linode_token = var.linode_token
  project_name = var.project_name
  environment  = var.environment

}
