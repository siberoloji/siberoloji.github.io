---
draft: false
title: Bob Automates Infrastructure with Ansible on AlmaLinux
linkTitle: Automate Infrastructure with Ansible
keywords:
  - Automate Infrastructure with Ansible
description: implify system management by learning Ansible, a powerful automation tool for configuring systems, deploying applications, and managing infrastructure.
date: 2024-12-10
url: bob-automates-infrastructure-ansible-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 840
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next adventure was to simplify system management by learning **Ansible**, a powerful automation tool for configuring systems, deploying applications, and managing infrastructure. By mastering Ansible, Bob aimed to reduce manual tasks and ensure consistency across his AlmaLinux servers.

> *“Why repeat myself when Ansible can do it for me?”* Bob asked, diving into automation.

---

### **Chapter Outline: "Bob Automates Infrastructure with Ansible"**

1. **Introduction: What Is Ansible?**
   - Overview of Ansible and its benefits.
   - Key concepts: inventory, playbooks, and modules.

2. **Installing and Configuring Ansible**
   - Installing Ansible on AlmaLinux.
   - Setting up the inventory file.

3. **Writing and Running Ansible Playbooks**
   - Creating YAML-based playbooks.
   - Running playbooks to automate tasks.

4. **Using Ansible Modules**
   - Managing packages, services, and files.
   - Running commands with Ansible ad hoc.

5. **Ansible Roles for Complex Setups**
   - Structuring roles for reusability.
   - Managing dependencies with `ansible-galaxy`.

6. **Automating with Ansible Vault**
   - Encrypting sensitive data.
   - Using Ansible Vault in playbooks.

7. **Conclusion: Bob Reflects on Automation Mastery**

---

### **Part 1: Introduction: What Is Ansible?**

Bob learned that **Ansible** is an agentless automation tool that communicates with systems over SSH, making it lightweight and easy to use. Its YAML-based configuration files (playbooks) are both human-readable and powerful.

#### **Key Concepts**

- **Inventory**: A list of hosts to manage.
- **Playbook**: A YAML file defining tasks to perform.
- **Modules**: Prebuilt scripts for common tasks (e.g., managing files or services).

> *“With Ansible, I can manage servers at scale!”* Bob said.

---

### **Part 2: Installing and Configuring Ansible**

#### **Step 1: Installing Ansible**

- Install Ansible using the EPEL repository:

  ```bash
  sudo dnf install -y epel-release
  sudo dnf install -y ansible
  ```

- Verify the installation:

  ```bash
  ansible --version
  ```

#### **Step 2: Setting Up the Inventory**

- Create an inventory file:

  ```bash
  nano ~/inventory
  ```

- Add the following:

  ```plaintext
  [webservers]
  192.168.1.10
  192.168.1.11

  [dbservers]
  192.168.1.20
  ```

- Test connectivity to the servers:

  ```bash
  ansible -i ~/inventory all -m ping
  ```

> *“Ansible is talking to my servers—time to automate!”* Bob said.

---

### **Part 3: Writing and Running Ansible Playbooks**

#### **Step 1: Creating a Playbook**

- Create a playbook to install Apache:

  ```bash
  nano ~/install_apache.yml
  ```

- Add the following YAML content:

  ```yaml
  ---
  - name: Install Apache
    hosts: webservers
    become: true
    tasks:
      - name: Install Apache
        yum:
          name: httpd
          state: present

      - name: Start and enable Apache
        service:
          name: httpd
          state: started
          enabled: true
  ```

#### **Step 2: Running the Playbook**

- Run the playbook:

  ```bash
  ansible-playbook -i ~/inventory ~/install_apache.yml
  ```

> *“With one command, I installed and configured Apache on all servers!”* Bob said.

---

### **Part 4: Using Ansible Modules**

#### **Step 1: Managing Packages**

- Install a package:

  ```bash
  ansible -i ~/inventory webservers -m yum -a "name=git state=present" --become
  ```

#### **Step 2: Managing Files**

- Copy a file to servers:

  ```bash
  ansible -i ~/inventory webservers -m copy -a "src=/home/bob/index.html dest=/var/www/html/index.html" --become
  ```

#### **Step 3: Running Commands**

- Restart a service:

  ```bash
  ansible -i ~/inventory webservers -m service -a "name=httpd state=restarted" --become
  ```

> *“Modules make automation simple and powerful!”* Bob said.

---

### **Part 5: Ansible Roles for Complex Setups**

#### **Step 1: Creating a Role**

- Initialize a role for setting up Nginx:

  ```bash
  ansible-galaxy init nginx_setup
  ```

- Directory structure:

  ```plaintext
  nginx_setup/
  ├── tasks/
  │   └── main.yml
  ├── handlers/
  │   └── main.yml
  ├── templates/
  ├── vars/
  └── defaults/
  ```

#### **Step 2: Using the Role**

- Add the role to a playbook:

  ```yaml
  ---
  - name: Setup Nginx
    hosts: webservers
    roles:
      - nginx_setup
  ```

- Run the playbook:

  ```bash
  ansible-playbook -i ~/inventory ~/setup_nginx.yml
  ```

> *“Roles keep my configurations organized and reusable!”* Bob said.

---

### **Part 6: Automating with Ansible Vault**

#### **Step 1: Encrypting Sensitive Data**

- Encrypt a file with Ansible Vault:

  ```bash
  ansible-vault encrypt ~/secrets.yml
  ```

- Add encrypted data to a playbook:

  ```yaml
  ---
  - name: Deploy with secrets
    hosts: all
    vars_files:
      - secrets.yml
  ```

#### **Step 2: Running a Playbook with Vault**

- Decrypt and run the playbook:

  ```bash
  ansible-playbook -i ~/inventory ~/deploy.yml --ask-vault-pass
  ```

> *“Ansible Vault keeps my secrets secure!”* Bob noted.

---

### **Conclusion: Bob Reflects on Automation Mastery**

Bob successfully automated system management with Ansible. From deploying applications to managing sensitive data, he streamlined his workflows and saved countless hours.

> Next, Bob plans to explore **Advanced Linux Security Hardening with CIS Benchmarks**.

---

Would you like to proceed with **Advanced Linux Security Hardening**, or explore another topic? Let me know!
