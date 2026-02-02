
---

```markdown
# Terraform AWS ALB + EC2 Project

This project demonstrates how to provision a complete AWS infrastructure using **Terraform**, deploying EC2 instances behind an **Application Load Balancer (ALB)** and bootstrapping them with Apache using **user data** on **Ubuntu 24.04**.

The setup follows real-world best practices including proper security groups, load balancing, and hardened cloud-init scripts.

---

## 🏗️ Architecture Overview

```

Internet
|
v
Application Load Balancer (ALB)
|
v
Target Group
|
v
EC2 Instance(s) (Ubuntu 24.04 + Apache)

```

- Incoming HTTP traffic is handled by an ALB
- Requests are forwarded to EC2 instances
- Apache serves a simple HTML page displaying the instance ID

---

## 🚀 Features

- Infrastructure provisioned using **Terraform**
- **Ubuntu 24.04 LTS** EC2 instances
- Apache installed and configured via **user-data**
- Application Load Balancer with health checks
- Security Groups allowing HTTP (80) and SSH (22)
- Clean `.gitignore` for Terraform projects
- Fully reproducible and destroyable infrastructure

---

## 📁 Project Structure

terraform_project/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── userdata.sh
├── terraform.tfvars.example
├── .gitignore
└── README.md
````

---

## ⚙️ Prerequisites

Before running this project, make sure you have:

- AWS account
- AWS CLI configured (`aws configure`)
- Terraform installed (v1.x recommended)
- An existing EC2 key pair in AWS

---

## 🔧 How to Deploy

### 1️⃣ Clone the repository
```bash
git clone <your-repo-url>
cd terraform_project
````

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Validate configuration

```bash
terraform validate
```

### 4️⃣ Review the execution plan

```bash
terraform plan
```

### 5️⃣ Apply the configuration

```bash
terraform apply
```

Confirm with `yes` when prompted.

---

## 🌐 Access the Application

After successful deployment, Terraform outputs the ALB DNS name:

```text
loadbalancerdns = "myalb-xxxxxxxx.us-east-1.elb.amazonaws.com"
```

Open it in your browser:

```
http://<loadbalancer-dns-name>
```

You should see a webpage showing:

* Project title
* EC2 instance ID
* Confirmation Apache is running

---

## 🧹 Cleanup (Important)

To avoid AWS charges, destroy all resources when done:

```bash
terraform destroy
```

---

## 🛠️ Important Implementation Notes

### User Data Execution

* User data runs **only once**, during the first boot of the EC2 instance
* The script includes safeguards to handle **apt lock issues** on Ubuntu 24.04
* Apache installation failures were resolved by waiting for dpkg locks to release

### Ubuntu 24.04 Consideration

Ubuntu 24.04 introduces aggressive `apt` locking during initial boot.
The user-data script explicitly waits for locks to prevent failures.

---

## 🔐 Security Considerations

* No credentials or secrets are committed to Git
* Terraform state files are excluded via `.gitignore`
* Security Groups restrict access to required ports only

---

## 📈 Possible Enhancements

* Add Auto Scaling Group (ASG)
* Enable HTTPS using ACM
* Use S3 + DynamoDB for Terraform remote backend
* Convert user-data script to cloud-init YAML
* Add monitoring with CloudWatch
* Modularize Terraform code

---

## 🧠 Learning Outcomes

This project helped solidify understanding of:

* Terraform resource lifecycle
* AWS networking and load balancing
* Cloud-init and user-data debugging
* Ubuntu 24.04 boot-time behavior
* Real-world DevOps troubleshooting

---

## 👤 Author

**Balamanikanta Anantha**
Terraform | AWS | DevOps | Cloud Engineering

```

---
