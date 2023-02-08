output "kubeconfig" {
  value     = module.lke.kubeconfig
  sensitive = true
}