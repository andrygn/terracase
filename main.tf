#############################################
# main.tf (Root)
#############################################


provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "network" {
  source   = "./modules/network"
  rg_name  = azurerm_resource_group.rg.name
  location = var.location
  vnet_name = var.vnet_name
}

module "mongodb_vm" {
  source        = "./modules/mongodb_vm"
  rg_name       = azurerm_resource_group.rg.name
  location      = var.location
  subnet_id     = module.network.public_subnet_id
  aks_subnet_prefix = module.network.aks_subnet_prefix
  ssh_public_key_path = var.ssh_public_key_path
  admin_username = var.admin_username
  vm_size        = var.vm_size
}

module "storage" {
  source                 = "./modules/storage"
  rg_name                = azurerm_resource_group.rg.name
  location               = var.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}

module "aks" {
  source        = "./modules/aks"
  rg_name       = azurerm_resource_group.rg.name
  location      = var.location
  cluster_name  = var.cluster_name
}