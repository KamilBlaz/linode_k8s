
output "kubeconfig" {
  value     = base64decode(linode_lke_cluster.this.kubeconfig)
  sensitive = true
}