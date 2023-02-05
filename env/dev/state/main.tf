variable "bucket" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "linode_token" {
  type = string
}

module "state" {
  source       = "../../../modules/linode_bucket_state"
  project_name = var.project_name
  environment  = var.environment
  region       = var.region
  linode_token = var.linode_token
  bucket       = var.bucket
}

output "bucket" {
  value = module.state.bucket
}