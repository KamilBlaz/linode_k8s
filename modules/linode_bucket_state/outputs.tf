output "bucket" {
  value = linode_object_storage_bucket.this.id
}

output "access_key" {
  value = linode_object_storage_key.this.access_key
}

output "secret_key" {
  value = linode_object_storage_key.this.secret_key
}
