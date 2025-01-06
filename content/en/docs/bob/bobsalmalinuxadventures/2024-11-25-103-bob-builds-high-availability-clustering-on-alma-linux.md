---
draft: false
title: Bob Builds High Availability Clustering on AlmaLinux
linkTitle: High Availability Clustering
keywords:
  - High Availability Clustering
description: Create a High Availability (HA) cluster on AlmaLinux by ensuring minimal downtime and maximizing reliability.
date: 2024-12-12
url: bob-builds-high-availability-clustering-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 1030


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to create a **High Availability (HA) cluster** on AlmaLinux. By ensuring minimal downtime and maximizing reliability, he aimed to make critical applications resilient to failures, keeping systems running smoothly even in adverse conditions.

> *“Uptime is key—let’s make sure our applications never go down!”* Bob said, ready to embrace high availability.

---

### **Chapter Outline: "Bob Builds High Availability Clustering on AlmaLinux"**

1. **Introduction: What Is High Availability?**
   - Overview of HA clustering.
   - Use cases for HA setups in production.

2. **Setting Up the HA Environment**
   - Preparing nodes for clustering.
   - Configuring shared storage with NFS or iSCSI.

3. **Installing and Configuring Pacemaker and Corosync**
   - Setting up cluster communication.
   - Configuring Pacemaker for resource management.

4. **Adding High Availability to Services**
   - Ensuring HA for Apache.
   - Managing HA for databases like MySQL.

5. **Monitoring and Managing the Cluster**
   - Using tools like `pcs` to manage the cluster.
   - Monitoring cluster health and logs.

6. **Testing and Optimizing the Cluster**
   - Simulating node failures to test failover.
   - Optimizing cluster configurations for performance.

7. **Conclusion: Bob Reflects on HA Clustering Mastery**

---

### **Part 1: What Is High Availability?**

Bob learned that **HA clustering** involves linking multiple servers into a single, resilient system. If one node fails, the workload is automatically shifted to another, ensuring minimal disruption.

#### **HA Use Cases**

- **Web Servers**: Ensuring websites stay online during outages.
- **Databases**: Keeping critical data accessible at all times.
- **Applications**: Avoiding downtime for essential business tools.

> *“High availability means peace of mind for users and administrators!”* Bob said.

---

### **Part 2: Setting Up the HA Environment**

#### **Step 1: Preparing Nodes for Clustering**

- Set static IPs for the nodes:

  ```bash
  nmcli connection modify ens33 ipv4.addresses 192.168.1.101/24 ipv4.method manual
  nmcli connection modify ens33 ipv4.gateway 192.168.1.1
  nmcli connection up ens33
  ```

- Synchronize time across nodes using Chrony:

  ```bash
  sudo dnf install -y chrony
  sudo systemctl enable chronyd --now
  ```

#### **Step 2: Configuring Shared Storage**

- Install NFS on the primary node:

  ```bash
  sudo dnf install -y nfs-utils
  sudo mkdir /shared
  echo "/shared *(rw,sync,no_root_squash)" | sudo tee -a /etc/exports
  sudo exportfs -arv
  sudo systemctl enable nfs-server --now
  ```

- Mount shared storage on other nodes:

  ```bash
  sudo mount 192.168.1.101:/shared /mnt
  ```

> *“Shared storage ensures all nodes have access to the same data!”* Bob noted.

---

### **Part 3: Installing and Configuring Pacemaker and Corosync**

#### **Step 1: Installing Cluster Software**

- Install Pacemaker and Corosync on all nodes:

  ```bash
  sudo dnf install -y pacemaker pcs corosync
  ```

- Enable and start services:

  ```bash
  sudo systemctl enable pcsd --now
  sudo systemctl enable corosync --now
  sudo systemctl enable pacemaker --now
  ```

#### **Step 2: Configuring the Cluster**

- Authenticate nodes:

  ```bash
  sudo pcs cluster auth node1 node2 --username hacluster --password password
  ```

- Create the cluster:

  ```bash
  sudo pcs cluster setup --name ha-cluster node1 node2
  ```

- Start the cluster:

  ```bash
  sudo pcs cluster start --all
  ```

- View the cluster status:

  ```bash
  sudo pcs status
  ```

> *“Pacemaker and Corosync form the backbone of my HA cluster!”* Bob said.

---

### **Part 4: Adding High Availability to Services**

#### **Step 1: Configuring HA for Apache**

- Install Apache on all nodes:

  ```bash
  sudo dnf install -y httpd
  ```

- Create a shared configuration:

  ```bash
  echo "Welcome to the HA Apache Server" | sudo tee /shared/index.html
  sudo ln -s /shared /var/www/html/shared
  ```

- Add Apache as a cluster resource:

  ```bash
  sudo pcs resource create apache ocf:heartbeat:apache configfile=/etc/httpd/conf/httpd.conf \
  statusurl="http://127.0.0.1/server-status" op monitor interval=30s
  ```

#### **Step 2: Managing HA for MySQL**

- Install MySQL on all nodes:

  ```bash
  sudo dnf install -y mysql-server
  ```

- Configure MySQL to use shared storage for data:

  ```bash
  sudo nano /etc/my.cnf
  ```

  Add:

  ```plaintext
  datadir=/shared/mysql
  ```

- Add MySQL as a cluster resource:

  ```bash
  sudo pcs resource create mysql ocf:heartbeat:mysql binary=/usr/bin/mysqld \
  config="/etc/my.cnf" datadir="/shared/mysql" op monitor interval=30s
  ```

> *“Apache and MySQL are now protected by the cluster!”* Bob said.

---

### **Part 5: Monitoring and Managing the Cluster**

#### **Step 1: Managing with `pcs`**

- List cluster resources:

  ```bash
  sudo pcs resource
  ```

- Check resource status:

  ```bash
  sudo pcs status resources
  ```

#### **Step 2: Monitoring Cluster Health**

- View cluster logs:

  ```bash
  sudo journalctl -u corosync
  sudo journalctl -u pacemaker
  ```

- Monitor cluster nodes:

  ```bash
  sudo pcs status nodes
  ```

> *“Regular monitoring keeps my HA cluster healthy!”* Bob noted.

---

### **Part 6: Testing and Optimizing the Cluster**

#### **Step 1: Simulating Node Failures**

- Stop a node:

  ```bash
  sudo pcs cluster stop node1
  ```

- Verify failover:

  ```bash
  sudo pcs status
  ```

#### **Step 2: Optimizing Cluster Performance**

- Adjust resource priorities:

  ```bash
  sudo pcs resource meta apache resource-stickiness=100
  ```

- Optimize fencing for node recovery:

  ```bash
  sudo pcs stonith create fence-node1 fence_ipmilan ipaddr=192.168.1.101 \
  login=root passwd=password action=reboot
  ```

> *“Testing failovers ensures my cluster is truly resilient!”* Bob said.

---

### **Conclusion: Bob Reflects on HA Clustering Mastery**

Bob successfully built and managed an HA cluster on AlmaLinux, ensuring high availability for Apache and MySQL services. With robust monitoring, failover testing, and shared storage in place, he was confident in the resilience of his infrastructure.

> Next, Bob plans to explore **Advanced Linux Troubleshooting**, learning to diagnose and fix complex system issues.
