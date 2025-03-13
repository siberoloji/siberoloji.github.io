---
title: How to Create a MariaDB Galera Cluster on AlmaLinux
linkTitle: MariaDB Galera Cluster
description: In this guide, we’ll walk you through the process of setting up a MariaDB Galera Cluster on AlmaLinux.
date: 2024-12-22
weight: 1150
url: create-mariadb-galera-cluster-almalinux
draft: true
tags:
  - AlmaLinux
  - galera cluster
  - mariadb
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: create-mariadb-galera-cluster-almalinux
keywords:
  - AlmaLinux
  - Galera Cluster
featured_image: /images/almalinux.webp
---
**MariaDB Galera Cluster** is a powerful solution for achieving high availability, scalability, and fault tolerance in your database environment. By creating a Galera Cluster, you enable a multi-master replication setup where all nodes in the cluster can process both read and write requests. This eliminates the single point of failure and provides real-time synchronization across nodes.

**AlmaLinux**, a community-driven RHEL-based Linux distribution, is an excellent platform for hosting MariaDB Galera Cluster due to its reliability, security, and performance.

In this guide, we’ll walk you through the process of setting up a MariaDB Galera Cluster on AlmaLinux, ensuring a robust database infrastructure capable of meeting high-availability requirements.

---

### Table of Contents

1. What is a Galera Cluster?
2. Benefits of Using MariaDB Galera Cluster
3. Prerequisites
4. Installing MariaDB on AlmaLinux
5. Configuring the First Node
6. Adding Additional Nodes to the Cluster
7. Starting the Cluster
8. Testing the Cluster
9. Best Practices for Galera Cluster Management
10. Troubleshooting Common Issues
11. Conclusion

---

### 1. What is a Galera Cluster?

A **Galera Cluster** is a synchronous multi-master replication solution for MariaDB. Unlike traditional master-slave setups, all nodes in a Galera Cluster are equal, and changes on one node are instantly replicated to the others.

Key features:

- **High Availability:** Ensures continuous availability of data.
- **Scalability:** Distributes read and write operations across multiple nodes.
- **Data Consistency:** Synchronous replication ensures data integrity.

---

### 2. Benefits of Using MariaDB Galera Cluster

- **Fault Tolerance:** If one node fails, the cluster continues to operate without data loss.
- **Load Balancing:** Spread database traffic across multiple nodes for improved performance.
- **Real-Time Updates:** Changes are immediately replicated to all nodes.
- **Ease of Management:** Single configuration for all nodes simplifies administration.

---

### 3. Prerequisites

Before proceeding, ensure the following:

1. **AlmaLinux Instances:** At least three servers running AlmaLinux for redundancy.
2. **MariaDB Installed:** The same version of MariaDB installed on all nodes.
3. **Network Configuration:** All nodes can communicate with each other over a private network.
4. **Firewall Rules:** Allow MariaDB traffic on the required ports:
   - **3306:** MariaDB service.
   - **4567:** Galera replication traffic.
   - **4568:** Incremental State Transfer (IST) traffic.
   - **4444:** State Snapshot Transfer (SST) traffic.

Update and configure all servers:

```bash
sudo dnf update -y
sudo hostnamectl set-hostname <hostname>
```

---

### 4. Installing MariaDB on AlmaLinux

Install MariaDB on all nodes:

1. **Add the MariaDB Repository:**

   ```bash
   sudo dnf install -y https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
   sudo mariadb_repo_setup --mariadb-server-version=10.11
   ```

2. **Install MariaDB Server:**

   ```bash
   sudo dnf install -y mariadb-server
   ```

3. **Enable and Start MariaDB:**

   ```bash
   sudo systemctl enable mariadb
   sudo systemctl start mariadb
   ```

4. **Secure MariaDB:**
   Run the security script:

   ```bash
   sudo mysql_secure_installation
   ```

   Follow the prompts to set a root password, remove anonymous users, and disable remote root login.

---

### 5. Configuring the First Node

1. **Edit the MariaDB Configuration File:**
   Open the configuration file:

   ```bash
   sudo nano /etc/my.cnf.d/galera.cnf
   ```

2. **Add the Galera Configuration:**
   Replace `<node_ip>` and `<cluster_name>` with your values:

   ```plaintext
   [galera]
   wsrep_on=ON
   wsrep_provider=/usr/lib64/galera/libgalera_smm.so
   wsrep_cluster_name="my_galera_cluster"
   wsrep_cluster_address="gcomm://<node1_ip>,<node2_ip>,<node3_ip>"
   wsrep_node_name="node1"
   wsrep_node_address="<node1_ip>"
   wsrep_sst_method=rsync
   ```

   Key parameters:
   - **wsrep_on:** Enables Galera replication.
   - **wsrep_provider:** Specifies the Galera library.
   - **wsrep_cluster_name:** Sets the name of your cluster.
   - **wsrep_cluster_address:** Lists the IP addresses of all cluster nodes.
   - **wsrep_node_name:** Specifies the node’s name.
   - **wsrep_sst_method:** Determines the synchronization method (e.g., `rsync`).

3. **Allow Galera Ports in the Firewall:**

   ```bash
   sudo firewall-cmd --permanent --add-port=3306/tcp
   sudo firewall-cmd --permanent --add-port=4567/tcp
   sudo firewall-cmd --permanent --add-port=4568/tcp
   sudo firewall-cmd --permanent --add-port=4444/tcp
   sudo firewall-cmd --reload
   ```

---

### 6. Adding Additional Nodes to the Cluster

Repeat the same steps for the other nodes, with slight modifications:

1. **Edit `/etc/my.cnf.d/galera.cnf` on each node.**
2. Update the `wsrep_node_name` and `wsrep_node_address` parameters for each node.

For example, on the second node:

```plaintext
wsrep_node_name="node2"
wsrep_node_address="<node2_ip>"
```

On the third node:

```plaintext
wsrep_node_name="node3"
wsrep_node_address="<node3_ip>"
```

---

### 7. Starting the Cluster

1. **Bootstrap the First Node:**
   On the first node, start the Galera Cluster:

   ```bash
   sudo galera_new_cluster
   ```

   Check the logs to verify the cluster has started:

   ```bash
   sudo journalctl -u mariadb
   ```

2. **Start MariaDB on Other Nodes:**
   On the second and third nodes, start MariaDB normally:

   ```bash
   sudo systemctl start mariadb
   ```

3. **Verify Cluster Status:**
   Log in to MariaDB on any node and check the cluster size:

   ```sql
   SHOW STATUS LIKE 'wsrep_cluster_size';
   ```

   Output example:

   ```plaintext
   +--------------------+-------+
   | Variable_name      | Value |
   +--------------------+-------+
   | wsrep_cluster_size | 3     |
   +--------------------+-------+
   ```

---

### 8. Testing the Cluster

1. **Create a Test Database:**
   On any node, create a test database:

   ```sql
   CREATE DATABASE galera_test;
   ```

2. **Check Replication:**
   Log in to other nodes and verify the database exists:

   ```sql
   SHOW DATABASES;
   ```

---

### 9. Best Practices for Galera Cluster Management

1. **Use an Odd Number of Nodes:**
   To avoid split-brain scenarios, use an odd number of nodes (e.g., 3, 5).

2. **Monitor Cluster Health:**
   Use `SHOW STATUS` to monitor variables like `wsrep_cluster_status` and `wsrep_cluster_size`.

3. **Back Up Data:**
   Regularly back up your data using tools like `mysqldump` or `mariabackup`.

4. **Avoid Large Transactions:**
   Large transactions can slow down synchronization.

5. **Secure Communication:**
   Use SSL/TLS to encrypt Galera replication traffic.

---

### 10. Troubleshooting Common Issues

#### Cluster Fails to Start

- **Check Logs:** Look at `/var/log/mariadb/mariadb.log` for errors.
- **Firewall Rules:** Ensure required ports are open on all nodes.

#### Split-Brain Scenarios

- Reboot the cluster with a quorum node as the bootstrap:

   ```bash
   sudo galera_new_cluster
   ```

#### Slow Synchronization

- Use `rsync` or `xtrabackup` for faster state snapshot transfers (SST).

---

### 11. Conclusion

Setting up a MariaDB Galera Cluster on AlmaLinux is a powerful way to achieve high availability, scalability, and fault tolerance in your database environment. By following the steps in this guide, you can create a robust multi-master replication cluster capable of handling both read and write traffic seamlessly.

With proper monitoring, backup strategies, and security configurations, your MariaDB Galera Cluster will provide a reliable and resilient foundation for your applications.
