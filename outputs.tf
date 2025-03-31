#############################################
# outputs.tf
#############################################

output "aks_cluster_name" {
  value       = module.aks.cluster_name
  description = "Name of the AKS cluster"
}

output "mongo_vm_public_ip" {
  value       = module.mongodb_vm.mongo_vm_public_ip
  description = "Public IP address of the MongoDB VM"
}

output "mongo_backup_blob_url" {
  value       = module.storage.public_blob_url
  description = "Public URL to access MongoDB backups"
}

output "tasky_web_url" {
  value       = module.aks.tasky_web_url
  description = "Public URL of the Tasky web application"
}