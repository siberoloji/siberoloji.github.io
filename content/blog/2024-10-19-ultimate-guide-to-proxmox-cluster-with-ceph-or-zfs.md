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

  Setting up a Proxmox cluster with either Ceph or ZFS is a powerful way to manage virtualization and storage in a highly available and scalable environment. This guide will walk you through the process of establishing a Proxmox cluster and integrating it with either Ceph or ZFS, focusing on the necessary steps, configurations, and best practices.</p>
 

 
 ## Understanding Proxmox, Ceph, and ZFS</h2>
<!-- /wp:heading -->

  <strong>Proxmox VE</strong> is an open-source virtualization management platform that combines KVM hypervisor and LXC containers. It provides a web-based interface for managing virtual machines (VMs) and containers, making it an ideal choice for both small and large deployments.</p>
 

  <strong>Ceph</strong> is a distributed storage system designed to provide excellent performance, reliability, and scalability. It allows users to create storage pools that can be used for block storage (RBD), object storage (Ceph RADOS Gateway), or file systems (CephFS). Ceph is particularly well-suited for environments requiring high availability and redundancy.</p>
 

  <strong>ZFS</strong>, on the other hand, is a combined file system and logical volume manager designed for data integrity, high storage capacity, and efficient data management. It offers features like snapshots, replication, and built-in RAID capabilities.</p>
 

  Choosing between Ceph and ZFS largely depends on your specific use case, hardware capabilities, and performance requirements.</p>
 

 
 ## Prerequisites</h2>
<!-- /wp:heading -->

  Before starting the setup process, ensure that you have the following:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>At least three identical Proxmox nodes</strong>: This is crucial for both Ceph and ZFS to ensure redundancy and high availability.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Sufficient hardware resources</strong>: Each node should have adequate CPU, RAM, and disk space. For Ceph, consider using SSDs for OSDs (Object Storage Daemons) to enhance performance.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Network configuration</strong>: A dedicated network for cluster communication is recommended to minimize latency and maximize throughput.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Setting Up a Proxmox Cluster</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Step 1: Create the Cluster</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Access the Proxmox Web Interface</strong>: Log in to the web interface of your first Proxmox node.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Navigate to Datacenter</strong>: In the left pane, select "Datacenter."</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Create Cluster</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Click on "Cluster" &gt; "Create Cluster."</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enter a name for your cluster.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the network interface that will be used for cluster communication.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click "Create" to initialize the cluster.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 2: Join Additional Nodes</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Join Nodes to Cluster</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>On each additional node, access the Proxmox web interface.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Navigate to "Datacenter" &gt; "Cluster" &gt; "Join Cluster."</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Enter the join information provided by the first node (including IP address and join token).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click "Join" to add the node to the cluster.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 3: Verify Cluster Status</h3>
<!-- /wp:heading -->

  After all nodes have joined successfully, verify that they are visible in the cluster overview. You should see all nodes listed under Datacenter &gt; Cluster.</p>
 

 
 ## Setting Up Ceph Storage</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Step 4: Install Ceph</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Install Ceph on Each Node</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  On each node in the cluster, run:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>pveceph install</code></code></pre>
<!-- /wp:code -->

  This command installs the necessary Ceph packages.</p>
 

<!-- wp:heading {"level":3} -->
 ### Step 5: Initialize Ceph Configuration</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Initialize Ceph on One Node</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  On one of your nodes (preferably the one with the most resources), run</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>pveceph init --network &lt;your_network&gt;</code></code></pre>
<!-- /wp:code -->

  Replace <code>&lt;your_network&gt;</code> with your actual network configuration (e.g., <code>10.0.0.0/24</code>).</p>
 

<!-- wp:heading {"level":3} -->
 ### Step 6: Create Monitors and Managers</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Create Monitor and Manager Daemons</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Run these commands on each node:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>pveceph create mon pveceph create mgr</code></code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 7: Create OSDs</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Prepare Disks for OSDs</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Identify disks on each node that will be used for Ceph OSDs.</p>
 

  For each disk you want to use as an OSD:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>ceph-volume lvm zap /dev/&lt;disk&gt; ceph-volume raw prepare --data /dev/&lt;disk&gt; --bluestore ceph-volume raw activate --device /dev/&lt;disk&gt;</code></code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 8: Create Pools</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Create Storage Pools</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  After setting up OSDs, create pools in your Ceph cluster using:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>ceph osd pool create &lt;pool_name&gt; &lt;pg_num&gt;</code></code></pre>
<!-- /wp:code -->

  Choose an appropriate number of placement groups (<code>pg_num</code>) based on your cluster size.</p>
 

 
 ## Setting Up ZFS Storage</h2>
<!-- /wp:heading -->

<!-- wp:heading {"level":3} -->
 ### Step 9: Install ZFS</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Install ZFS on Each Node</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Ensure that ZFS is installed on all nodes by running:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>apt install zfsutils-linux</code></code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### Step 10: Create ZFS Pool</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Create a ZFS Pool on One Node</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Choose a disk or partition for your ZFS pool:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash"><code>zpool create &lt;pool_name&gt; &lt;disk&gt;</code></code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Enable Replication Across Nodes</strong> (if needed):</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>For high availability with ZFS, consider setting up replication between nodes using <code>zfs send</code> and <code>zfs receive</code>.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Step 11: Configure Storage in Proxmox</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Add ZFS Storage to Proxmox</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>In the Proxmox web interface, go to Datacenter &gt; Storage &gt; Add &gt; ZFS.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select your created pool from the dropdown menu.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Configure options such as content types (e.g., VMs, backups).</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Best Practices for Management</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Monitor Your Cluster</strong>: Regularly check the health of your Proxmox cluster using built-in monitoring tools or external solutions like Prometheus.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Regular Backups</strong>: Implement a robust backup strategy for both VMs and storage configurations.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Performance Tuning</strong>: Adjust settings based on workload requirements; consider tuning parameters like I/O scheduler settings or network configurations.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## Conclusion</h2>
<!-- /wp:heading -->

  Setting up a Proxmox cluster with either Ceph or ZFS can significantly enhance your virtualization capabilities by providing high availability and scalability. By following these steps carefully, you can establish a robust infrastructure tailored to your needs. Whether you choose Ceph for its distributed nature or ZFS for its simplicity and data integrity features will depend on your specific use case and resource availability. Always remember to monitor performance continuously and adapt configurations as necessary to ensure optimal operation of your virtualized environment.</p>
 

  Citations:<br>[1] <a href="https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster" target="_blank" rel="noopener" title="">https://pve.proxmox.com/wiki/Deploy_Hyper-Converged_Ceph_Cluster</a><br>[2] https://www.youtube.com/watch?v=-qk_P9SKYK4<br>[3] https://www.youtube.com/watch?v=a7OMi3bw0pQ<br>[4] https://forum.proxmox.com/threads/solution-ceph-on-zfs.98437/<br>[5] https://forum.proxmox.com/threads/for-best-performance-proxmox-cluster-with-ceph-or-zfs.129635/<br>[6] https://forum.proxmox.com/threads/setting-up-proxmox-cluster-with-zfs-and-ceph-using-4-ssd.144719/<br>[7] https://www.youtube.com/watch?v=Eli3uYzgC8A<br>[8] https://www.reddit.com/r/Proxmox/comments/1bbhykr/zfs_or_ceph/</p>
 