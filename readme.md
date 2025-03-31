# ☁️ Azure Three-Tier Vulnerable App Lab

This repository deploys a **deliberately vulnerable three-tier architecture** on Azure using Terraform. It simulates common misconfigurations for security testing, auditing, or demonstration using tools like **Microsoft Defender for Cloud**.

---

## 🔧 Stack Overview

### 🔹 Web Tier
- Containerized app (`tasky`) deployed to AKS
- Publicly accessible LoadBalancer service
- Runs with `cluster-admin` privileges

### 🔹 App/Database Tier
- Outdated Linux VM (Ubuntu 16.04)
- Outdated MongoDB 3.6 with basic auth
- Public SSH access
- MongoDB restricted to AKS subnet
- Contributor role assigned to VM (over-permission)

### 🔹 Storage Tier
- Public Azure Blob Storage
- MongoDB backups stored here
- Blob listing and reading allowed publicly

---

## 🚀 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/your-org/azure-vuln-lab.git
cd azure-vuln-lab
```

### 2. Configure Azure and Terraform
```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
terraform init
```

### 3. Deploy infrastructure
```bash
terraform apply -auto-approve
```

> ⏱ It may take a few minutes to fully provision AKS and VM.

---

## ✅ Validation Checklist

### 🌐 Web Application
- Visit `tasky_web_url` output in your browser
- Ensure `wizexercise.txt` is accessible in the container

### 🛢️ MongoDB VM
- SSH into the VM using the public IP
- Check MongoDB version: `mongo --version`
- Validate DB connection from AKS pod to Mongo

### 💾 Public Backups
- Visit the `mongo_backup_blob_url` output in your browser
- Confirm backups are accessible and downloadable

---

## 🔍 Detection with Microsoft Defender for Cloud
After deployment, Defender should alert on:
- Open SSH port to internet
- Outdated OS on VM
- Public blob storage
- Cluster-admin privileges in AKS
- Public LoadBalancer service

---

## 🧹 Cleanup
```bash
terraform destroy -auto-approve
```

---

## 📄 License
This project is for **educational and security research purposes only**. Do not deploy in production environments.
