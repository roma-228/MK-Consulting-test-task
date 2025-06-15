# Automated Deployment of a Static Web Page on AWS

## Overview

This project demonstrates a fully automated CI/CD pipeline for deploying and updating a static web page on AWS infrastructure. The contents of the page are sourced from a `hello.txt` file in the Git repository. Whenever this file is updated, the change is automatically reflected on the deployed web page after the pipeline runs.

### 1. **Version Control (Git + GitHub)**

* Hosted the source code, including Terraform, Ansible, and `hello.txt`, in a public GitHub repository.
* Tracked changes and triggered CI/CD pipeline on updates to `hello.txt`.

### 2. **Infrastructure as Code (Terraform)**

* Provisioned an EC2 instance on AWS (Free Tier).
* Configured a security group to allow HTTP and SSH access on ports 80 and 22.
* Installed Python via remote-exec provisioner (required for Ansible connectivity).
* Exposed the public IP as an output variable.

### 3. **Configuration Management (Ansible)**

* Installed and configured Nginx on the EC2 instance.
* Copied `hello.txt` to `/var/www/html/index.html`.
* Ensured the playbook is idempotent and can safely re-run without duplicating changes.

### 4. **CI/CD Automation (GitHub Actions)**

* Created a GitHub Actions workflow triggered on push events to `main` or changes to `hello.txt`.
* Executed the Ansible playbook to deploy updated content from `hello.txt`.

### 5. **Web Hosting (AWS EC2)**

* Served the content of `hello.txt` as a simple static web page using Nginx.
* Made the web page publicly accessible via EC2 public IP.
