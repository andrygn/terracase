#############################################
# variables.tf
#############################################

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
  default     = "vuln-lab-rg"
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vuln-lab-vnet"
}

variable "cluster_name" {
  description = "AKS Cluster name"
  type        = string
  default     = "vuln-aks"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  description = "Size of VM for MongoDB"
  type        = string
  default     = "Standard_B1s"
}

variable "mongo_password" {
  description = "MongoDB root password"
  type        = string
  default     = "P@ssw0rd1234"
}

variable "storage_account_name" {
  description = "Name for Azure Storage Account"
  type        = string
  default     = "vulnbackupsacct"
}

variable "storage_container_name" {
  description = "Blob container name"
  type        = string
  default     = "backups"
}

variable "mongo_backup_interval_minutes" {
  description = "How often to back up MongoDB in minutes"
  type        = number
  default     = 15
}