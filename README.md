# Automated Deployment of a Static Web Page on AWS

## Overview

This project demonstrates a fully automated CI/CD pipeline for deploying and updating a static web page on AWS infrastructure. The contents of the page are sourced from a `hello.txt` file in the Git repository. Whenever this file is updated, the change is automatically reflected on the deployed web page after the pipeline runs.

---

### 1. **Version Control (Git + GitHub)**

* Hosted the source code, including Terraform, Ansible, and `hello.txt`, in a public GitHub repository.
* Tracked changes and triggered the CI/CD pipeline on updates to `hello.txt`.

### 2. **Infrastructure as Code (Terraform)**

* Provisioned an EC2 instance on AWS (Free Tier).
* Configured a security group to allow HTTP and SSH access on ports 80 and 22.
* Installed Python via a remote-exec provisioner (required for Ansible connectivity).
* Exposed the EC2 public IP as an output variable.

### 3. **Configuration Management (Ansible)**

* Installed and configured Nginx on the EC2 instance.
* Copied the contents of `hello.txt` to `/var/www/html/index.html`.
* Ensured the playbook is idempotent and can be safely re-run without duplicating changes.

### 4. **CI/CD Automation (GitHub Actions)**

* Created a GitHub Actions workflow that triggers on push events to the `main` branch or changes to the `hello.txt` file.
* The workflow automatically installs Ansible, connects to the EC2 instance using SSH, and runs the Ansible playbook to deploy the updated content.

### 5. **Web Hosting (AWS EC2)**

* The contents of the `hello.txt` file are served as a simple static web page using Nginx.
* The web page is publicly accessible via the EC2 public IP address.

---

## How to View the Deployed Web Page

To view the current contents of the deployed `hello.txt` file, open the following URL in your browser:

**[http://100.28.53.162/](http://100.28.53.162/)**

This page always displays the latest version of the `hello.txt` file deployed via the CI/CD pipeline.

---

## How to Update the Web Page

To request a change to the contents of the web page, follow these steps:

1. **Go to the GitHub repository.**

2. **Create a new Issue.**

   * Click on the "Issues" tab, then click “New issue”.

3. **Set the issue title to:**

   ```
   update-hello
   ```

4. **In the issue description, write the new text** you want to display on the web page.

5. **Submit the issue.**

Once the issue is created, the GitHub Actions workflow will automatically detect it, extract the content, update the `hello.txt` file, and trigger a new deployment. After a short delay, the new content will appear at:

**[http://100.28.53.162/](http://100.28.53.162/)**

