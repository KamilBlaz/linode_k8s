variable "region" {
  type = string
}

variable "node_type" {
  type = string
}

variable "node_count" {
  type    = string
  default = 3
}

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "linode_token" {
  type = string
}