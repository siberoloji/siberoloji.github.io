---
draft: false

title:  'Ultimate Guide to Proxmox cluster with CEPH or ZFS'
date: '2024-10-19T17:59:05+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

description:  'This guide will walk you through the process of establishing a Proxmox cluster and integrating it with either Ceph or ZFS, focusing on the necessary steps.' 
 
url:  /ultimate-guide-to-proxmox-cluster-with-ceph-or-zfs/
featured_image: /images/proxmox.webp
categories:
    - Virtualization
tags:
    - proxmox
    - virtualization
---


Setting up a Proxmox cluster with either Ceph or ZFS is a powerful way to manage virtualization and storage in a highly available and scalable environment. This guide will walk you through the process of establishing a Proxmox cluster and integrating it with either Ceph or ZFS, focusing on the necessary steps, configurations, and best practices.



## Understanding Proxmox, Ceph, and ZFS



**Proxmox VE** is an open-source virtualization management platform that combines KVM hypervisor and LXC containers. It provides a web-based interface for managing virtual machines (VMs) and containers, making it an ideal choice for both small and large deployments.



**Ceph** is a distributed storage system designed to provide excellent performance, reliability, and scalability. It allows users to create storage pools that can be used for block storage (RBD), object storage (Ceph RADOS Gateway), or file systems (CephFS). Ceph is particularly well-suited for environments requiring high availability and redundancy.



**ZFS**, on the other hand, is a combined file system and logical volume manager designed for data integrity, high storage capacity, and efficient data management. It offers features like snapshots, replication, and built-in RAID capabilities.



Choosing between Ceph and ZFS largely depends on your specific use case, hardware capabilities, and performance requirements.



## Prerequisites



Before starting the setup process, ensure that you have the following:


* **At least three identical Proxmox nodes**: This is crucial for both Ceph and ZFS to ensure redundancy and high availability.

* **Sufficient hardware resources**: Each node should have adequate CPU, RAM, and disk space. For Ceph, consider using SSDs for OSDs (Object Storage Daemons) to enhance performance.

* **Network configuration**: A dedicated network for cluster communication is recommended to minimize latency and maximize throughput.
## Setting Up a Proxmox Cluster



Step 1: Create the Cluster


* **Access the Proxmox Web Interface**: Log in to the web interface of your first Proxmox node.

* **Navigate to Datacenter**: In the left pane, select "Datacenter."

* **Create Cluster**:



* Click on "Cluster" > "Create Cluster."

* Enter a name for your cluster.

* Select the network interface that will be used for cluster communication.

* Click "Create" to initialize the cluster.
Step 2: Join Additional Nodes


* **Join Nodes to Cluster**:



* On each additional node, access the Proxmox web interface.

* Navigate to "Datacenter" > "Cluster" > "Join Cluster."

* Enter the join information provided by the first node (including IP address and join token).

* Click "Join" to add the node to the cluster.
Step 3: Verify Cluster Status



After all nodes have joined successfully, verify that they are visible in the cluster overview. You should see all nodes listed under Datacenter > Cluster.



## Setting Up Ceph Storage



Step 4: Install Ceph


* **Install Ceph on Each Node**:
On each node in the cluster, run:


```bash
`pveceph install
````



This command installs the necessary Ceph packages.



Step 5: Initialize Ceph Configuration


* **Initialize Ceph on One Node**:
On one of your nodes (preferably the one with the most resources), run


```bash
`pveceph init --network <your_network>
````



Replace `<your_network>` with your actual network configuration (e.g., `10.0.0.0/24`).



Step 6: Create Monitors and Managers


* **Create Monitor and Manager Daemons**:
Run these commands on each node:


```bash
`pveceph create mon pveceph create mgr````



Step 7: Create OSDs


* **Prepare Disks for OSDs**:
Identify disks on each node that will be used for Ceph OSDs.



For each disk you want to use as an OSD:


```bash
`ceph-volume lvm zap /dev/<disk> ceph-volume raw prepare --data /dev/<disk> --bluestore ceph-volume raw activate --device /dev/<disk>
````



Step 8: Create Pools


* **Create Storage Pools**:
After setting up OSDs, create pools in your Ceph cluster using:


```bash
`ceph osd pool create <pool_name> <pg_num>
````



Choose an appropriate number of placement groups (`pg_num`) based on your cluster size.



## Setting Up ZFS Storage



Step 9: Install ZFS


* **Install ZFS on Each Node**:
Ensure that ZFS is installed on all nodes by running:


```bash
`apt install zfsutils-linux````



Step 10: Create ZFS Pool


* **Create a ZFS Pool on One Node**:
Choose a disk or partition for your ZFS pool:


```bash
`zpool create <pool_name> <disk>
````


* **Enable Replication Across Nodes** (if needed):



* For high availability with ZFS, consider setting up replication between nodes using `zfs send` and `zfs receive`.
Step 11: Configure Storage in Proxmox


* **Add ZFS Storage to Proxmox**:



* In the Proxmox web interface, go to Datacenter > Storage > Add > ZFS.

* Select your created pool from the dropdown menu.

* Configure options such as content types (e.g., VMs, backups).
## Best Practices for Management


* **Monitor Your Cluster**: Regularly check the health of your Proxmox cluster using built-in monitoring tools or external solutions like Prometheus.

* **Regular Backups**: Implement a robust backup strategy for both VMs and storage configurations.

* **Performance Tuning**: Adjust settings based on workload requirements; consider tuning parameters like I/O scheduler settings or network configurations.
## Conclusion



Setting up a Proxmox cluster with either Ceph or ZFS can significantly enhance your virtualization capabilities by providing high availability and scalability. By following these steps carefully, you can establish a robust infrastructure tailored to your needs. Whether you choose Ceph for its distributed nature or ZFS for its simplicity and data integrity features will depend on your specific use case and resource availability. Always remember to monitor performance continuously and adapt configurations as necessary to ensure optimal operation of your virtualized environment.



Citations: [1] <a href="https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster" target="_blank" rel="noopener" title="">https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster</a> [2] https://www.youtube.com/watch?v=-qk_P9SKYK4 [3] https://www.youtube.com/watch?v=a7OMi3bw0pQ [4] https://forum.proxmox.com/threads/solution-ceph-on-zfs.98437/ [5] https://forum.proxmox.com/threads/for-best-performance-proxmox-cluster-with-ceph-or-zfs.129635/ [6] https://forum.proxmox.com/threads/setting-up-proxmox-cluster-with-zfs-and-ceph-using-4-ssd.144719/ [7] https://www.youtube.com/watch?v=Eli3uYzgC8A [8] https://www.reddit.com/r/Proxmox/comments/1bbhykr/zfs_or_ceph/
