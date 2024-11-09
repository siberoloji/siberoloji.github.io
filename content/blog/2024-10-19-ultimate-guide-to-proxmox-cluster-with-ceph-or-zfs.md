---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Virtualization
date: "2024-10-19T17:59:05Z"
excerpt: This guide will walk you through the process of establishing a Proxmox cluster
  and integrating it with either Ceph or ZFS, focusing on the necessary steps.
guid: https://www.siberoloji.com/?p=4017
id: 4017
image: /assets/images/2024/10/proxmox.webp
tags:
- proxmox
- virtualization
title: Ultimate Guide to Proxmox cluster with CEPH or ZFS
url: /ultimate-guide-to-proxmox-cluster-with-ceph-or-zfs/
---

  Setting up a Proxmox cluster with either Ceph or ZFS is a powerful way to manage virtualization and storage in a highly available and scalable environment. This guide will walk you through the process of establishing a Proxmox cluster and integrating it with either Ceph or ZFS, focusing on the necessary steps, configurations, and best practices.
 

 
 ## Understanding Proxmox, Ceph, and ZFS
<!-- /wp:heading -->

  ***Proxmox VE***  is an open-source virtualization management platform that combines KVM hypervisor and LXC containers. It provides a web-based interface for managing virtual machines (VMs) and containers, making it an ideal choice for both small and large deployments.
 

  ***Ceph***  is a distributed storage system designed to provide excellent performance, reliability, and scalability. It allows users to create storage pools that can be used for block storage (RBD), object storage (Ceph RADOS Gateway), or file systems (CephFS). Ceph is particularly well-suited for environments requiring high availability and redundancy.
 

  ***ZFS*** , on the other hand, is a combined file system and logical volume manager designed for data integrity, high storage capacity, and efficient data management. It offers features like snapshots, replication, and built-in RAID capabilities.
 

  Choosing between Ceph and ZFS largely depends on your specific use case, hardware capabilities, and performance requirements.
 

 
 ## Prerequisites
<!-- /wp:heading -->

  Before starting the setup process, ensure that you have the following:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***At least three identical Proxmox nodes*** : This is crucial for both Ceph and ZFS to ensure redundancy and high availability. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Sufficient hardware resources*** : Each node should have adequate CPU, RAM, and disk space. For Ceph, consider using SSDs for OSDs (Object Storage Daemons) to enhance performance. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Network configuration*** : A dedicated network for cluster communication is recommended to minimize latency and maximize throughput. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Setting Up a Proxmox Cluster
<!-- /wp:heading -->


 ### Step 1: Create the Cluster
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Access the Proxmox Web Interface*** : Log in to the web interface of your first Proxmox node. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Navigate to Datacenter*** : In the left pane, select "Datacenter." 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Create Cluster*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- Click on "Cluster" &gt; "Create Cluster." 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enter a name for your cluster. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select the network interface that will be used for cluster communication. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click "Create" to initialize the cluster. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Step 2: Join Additional Nodes
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Join Nodes to Cluster*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- On each additional node, access the Proxmox web interface. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Navigate to "Datacenter" &gt; "Cluster" &gt; "Join Cluster." 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Enter the join information provided by the first node (including IP address and join token). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click "Join" to add the node to the cluster. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Step 3: Verify Cluster Status
<!-- /wp:heading -->

  After all nodes have joined successfully, verify that they are visible in the cluster overview. You should see all nodes listed under Datacenter &gt; Cluster.
 

 
 ## Setting Up Ceph Storage
<!-- /wp:heading -->


 ### Step 4: Install Ceph
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Install Ceph on Each Node*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  On each node in the cluster, run:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>pveceph install</code></code></pre>
<!-- /wp:code -->

  This command installs the necessary Ceph packages.
 


 ### Step 5: Initialize Ceph Configuration
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Initialize Ceph on One Node*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  On one of your nodes (preferably the one with the most resources), run
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>pveceph init --network &lt;your_network&gt;</code></code></pre>
<!-- /wp:code -->

  Replace <code>&lt;your_network&gt;</code> with your actual network configuration (e.g., <code>10.0.0.0/24</code>).
 


 ### Step 6: Create Monitors and Managers
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Create Monitor and Manager Daemons*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Run these commands on each node:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>pveceph create mon pveceph create mgr</code></code></pre>
<!-- /wp:code -->


 ### Step 7: Create OSDs
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Prepare Disks for OSDs*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Identify disks on each node that will be used for Ceph OSDs.
 

  For each disk you want to use as an OSD:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>ceph-volume lvm zap /dev/&lt;disk&gt; ceph-volume raw prepare --data /dev/&lt;disk&gt; --bluestore ceph-volume raw activate --device /dev/&lt;disk&gt;</code></code></pre>
<!-- /wp:code -->


 ### Step 8: Create Pools
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Create Storage Pools*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  After setting up OSDs, create pools in your Ceph cluster using:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>ceph osd pool create &lt;pool_name&gt; &lt;pg_num&gt;</code></code></pre>
<!-- /wp:code -->

  Choose an appropriate number of placement groups (<code>pg_num</code>) based on your cluster size.
 

 
 ## Setting Up ZFS Storage
<!-- /wp:heading -->


 ### Step 9: Install ZFS
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Install ZFS on Each Node*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Ensure that ZFS is installed on all nodes by running:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>apt install zfsutils-linux</code></code></pre>
<!-- /wp:code -->


 ### Step 10: Create ZFS Pool
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Create a ZFS Pool on One Node*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Choose a disk or partition for your ZFS pool:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>zpool create &lt;pool_name&gt; &lt;disk&gt;</code></code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Enable Replication Across Nodes***  (if needed): 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- For high availability with ZFS, consider setting up replication between nodes using <code>zfs send</code> and <code>zfs receive</code>. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Step 11: Configure Storage in Proxmox
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Add ZFS Storage to Proxmox*** : 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- In the Proxmox web interface, go to Datacenter &gt; Storage &gt; Add &gt; ZFS. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select your created pool from the dropdown menu. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Configure options such as content types (e.g., VMs, backups). 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Best Practices for Management
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Monitor Your Cluster*** : Regularly check the health of your Proxmox cluster using built-in monitoring tools or external solutions like Prometheus. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Regular Backups*** : Implement a robust backup strategy for both VMs and storage configurations. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Performance Tuning*** : Adjust settings based on workload requirements; consider tuning parameters like I/O scheduler settings or network configurations. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

 
 ## Conclusion
<!-- /wp:heading -->

  Setting up a Proxmox cluster with either Ceph or ZFS can significantly enhance your virtualization capabilities by providing high availability and scalability. By following these steps carefully, you can establish a robust infrastructure tailored to your needs. Whether you choose Ceph for its distributed nature or ZFS for its simplicity and data integrity features will depend on your specific use case and resource availability. Always remember to monitor performance continuously and adapt configurations as necessary to ensure optimal operation of your virtualized environment.
 

  Citations:<br>[1] <a href="https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster" target="_blank" rel="noopener" title="">https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster</a><br>[2] https://www.youtube.com/watch?v=-qk_P9SKYK4<br>[3] https://www.youtube.com/watch?v=a7OMi3bw0pQ<br>[4] https://forum.proxmox.com/threads/solution-ceph-on-zfs.98437/<br>[5] https://forum.proxmox.com/threads/for-best-performance-proxmox-cluster-with-ceph-or-zfs.129635/<br>[6] https://forum.proxmox.com/threads/setting-up-proxmox-cluster-with-zfs-and-ceph-using-4-ssd.144719/<br>[7] https://www.youtube.com/watch?v=Eli3uYzgC8A<br>[8] https://www.reddit.com/r/Proxmox/comments/1bbhykr/zfs_or_ceph/
 