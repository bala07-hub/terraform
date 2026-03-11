# ☁️ Terraform Infrastructure Projects

## 🚀 Overview

This repository contains **multiple Terraform projects and infrastructure examples** used to practice and demonstrate **Infrastructure as Code (IaC)** using Terraform.

The goal of this repository is to build **real-world cloud infrastructure on AWS** using Terraform while following best practices such as:

* Modular infrastructure
* Remote state management
* Infrastructure automation
* Reusable Terraform configurations

Each folder in this repository represents a **separate Terraform project** that provisions specific AWS infrastructure resources.

---

# 🧰 Technologies Used

| Category                    | Tools         |
| --------------------------- | ------------- |
| Infrastructure as Code      | Terraform     |
| Cloud Platform              | AWS           |
| Version Control             | Git & GitHub  |
| Infrastructure Provisioning | Terraform CLI |

---

# 📚 Terraform Concepts Covered

This repository demonstrates several important Terraform concepts including:

* Terraform Providers
* Terraform Resources
* Variables and Outputs
* Terraform Modules
* Terraform State Management
* Remote Backend Configuration
* Infrastructure Lifecycle Management
* Dependency Management

---

# 🏗 AWS Services Implemented

The Terraform projects in this repository provision various AWS resources such as:

* EC2 Instances
* VPC and Networking
* Security Groups
* IAM Roles and Policies
* S3 Buckets
* Load Balancers
* EKS Clusters
* Other supporting cloud infrastructure

---

# 📂 Repository Structure

Example structure of the repository:

```bash
terraform
│
├── ec2-instance
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── vpc-network
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── s3-bucket
│   ├── main.tf
│   └── variables.tf
│
├── eks-cluster
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
└── README.md
```

Each directory contains an **independent Terraform configuration** that can be initialized and applied separately.

---

# ⚙️ How to Run a Terraform Project

Navigate to any Terraform project directory.

Example:

```bash
cd ec2-instance
```

### Step 1 — Initialize Terraform

```bash
terraform init
```

### Step 2 — Validate Configuration

```bash
terraform validate
```

### Step 3 — Preview Infrastructure Changes

```bash
terraform plan
```

### Step 4 — Apply Infrastructure

```bash
terraform apply
```

---

# 🔁 Terraform Workflow

The standard Terraform workflow used in this repository:

```
Write Terraform Code
        │
        ▼
terraform init
        │
        ▼
terraform plan
        │
        ▼
terraform apply
        │
        ▼
Infrastructure Created on AWS
```

---

# 🎯 Purpose of This Repository

This repository serves as:

* A **Terraform learning lab**
* A collection of **Infrastructure as Code examples**
* A reference for **Terraform best practices**
* Supporting infrastructure for **DevOps projects**

---

# 📖 Learning Outcomes

Through these projects, you will learn:

* How to automate AWS infrastructure provisioning
* How to manage infrastructure with Terraform
* How to structure Terraform repositories
* How to deploy cloud infrastructure consistently

---

# 👨‍💻 Author

**BalaManikanta Anantha**

DevOps | Cloud | Kubernetes | DevSecOps/MLOps Enthusiast
