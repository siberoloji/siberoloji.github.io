---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Virtualization
date: "2024-10-20T20:10:33Z"
excerpt: One of its standout features is Proxmox live migration, which allows users
  to move running virtual machines between physical hosts without any downtime.
guid: https://www.siberoloji.com/?p=4069
id: 4069
image: /assets/images/2024/10/proxmox.webp
tags:
- proxmox
- virtualization
title: How Proxmox Live Migration Feature Works?
url: /how-proxmox-live-migration-feature-works/
---

 <p>Proxmox Virtual Environment (PVE) is an open-source platform designed for running virtual machines (VMs) and containers. It combines the functionality of KVM (Kernel-based Virtual Machine) and LXC (Linux Containers) into one easy-to-use solution, providing a robust and scalable environment for managing virtualized infrastructure. One of its standout features is Proxmox <strong>live migration</strong>, which allows users to move running virtual machines between physical hosts without any downtime. This is invaluable for maintaining system availability, performing hardware maintenance, or balancing load across multiple hosts.</p>
 

 <p>In this blog post, we will explore the <strong>live migration</strong> feature in Proxmox, how it works under the hood, its benefits, and step-by-step instructions on how to perform a live migration in Proxmox.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### What Is Live Migration?</h3>
<!-- /wp:heading -->

 <p>Live migration is the process of transferring an active VM or container from one physical host (also known as a "node") to another with minimal disruption to the services running on the VM. It ensures that the guest system continues running during the migration process without significant downtime.</p>
 

 <p>Live migration is an essential tool for high-availability environments where uptime is critical, such as in data centers, enterprise applications, and production workloads. By using live migration, administrators can:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Perform hardware maintenance without shutting down services.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Rebalance loads between servers.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Reduce the risk of failures caused by overloading a single node.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Upgrade server hardware or software without affecting end-users.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 <p><a href="https://www.siberoloji.com/proxmox-must-know-powerful-open-source-virtualization-solution/" target="_blank" rel="noopener" title="Proxmox: Must Know Powerful Open-Source Virtualization Solution">Proxmox</a> integrates live migration seamlessly into its web-based management interface, making it straightforward to migrate VMs between nodes in a cluster.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### How Does Proxmox Live Migration Work?</h3>
<!-- /wp:heading -->

 <p>The live migration feature in <a href="https://www.proxmox.com/en/" target="_blank" rel="noopener" title="">Proxmox</a> is built on top of the KVM/QEMU virtualization technologies, leveraging the underlying Linux kernel's capabilities. Here’s an in-depth look at how Proxmox’s live migration process works:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Cluster Setup and Shared Storage</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>To perform live migration, Proxmox needs to operate within a <strong>cluster</strong>, where multiple Proxmox nodes are connected and communicate with each other. Each node in the cluster can share the same virtual network and storage backend.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Live migration typically requires <strong>shared storage</strong>, where all the virtual machine's data (such as virtual disks) are accessible from both the source and destination nodes. Proxmox supports various shared storage solutions, including NFS, iSCSI, Ceph, GlusterFS, and more.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Pre-Migration Setup</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Before migration begins, Proxmox checks if the source and destination nodes are compatible. Both nodes should have the necessary CPU architecture, network configuration, and access to the shared storage that holds the VM’s disk images.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Proxmox also ensures that sufficient resources (like RAM and CPU) are available on the destination node to handle the incoming VM.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Memory State Transfer</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>The key to live migration is transferring the <strong>memory state</strong> of the VM. The migration process begins by copying the entire memory contents of the VM from the source node to the destination node while the VM continues running.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The memory pages are copied in <strong>iterations</strong>. During the first iteration, Proxmox copies all the memory pages. However, since the VM is still running and writing to memory, some of the pages get modified. In the next iteration, only the modified pages (also known as "dirty pages") are copied.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>This process of copying dirty pages continues iteratively until the number of modified pages becomes small enough that they can be transferred in a single step. The key goal is to keep the final data transfer window very short, minimizing downtime.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Finalizing the Migration</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Once the bulk of the memory has been transferred, Proxmox pauses the VM briefly on the source node and copies the remaining dirty pages and CPU state (such as registers and current instructions) to the destination node. This brief pause typically lasts for milliseconds to a few seconds.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The VM is then resumed on the destination node, and users or applications experience little to no interruption in service.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Network Reconfiguration</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>During the migration, Proxmox reconfigures the network so that the VM on the destination node retains its IP address and network settings. Proxmox ensures that the VM continues to communicate with external systems without interruption.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Clean Up</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>After the Proxmox Live migration completes, the resources (memory, CPU) allocated to the VM on the source node are freed, and the VM is no longer present on the source node.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The Proxmox management interface reflects the new location of the VM, and from this point onward, the VM runs entirely on the destination node.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Benefits of Proxmox Live Migration</h3>
<!-- /wp:heading -->

 <p>The live migration feature provides several key advantages that make it a vital tool for system administrators:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Zero Downtime</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>One of the most significant benefits is the ability to move VMs between hosts without shutting them down. This means users and applications experience little to no interruption, making it ideal for high-availability services.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Load Balancing</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>As workloads increase, you can easily migrate VMs to other nodes with more available resources, effectively balancing the load across your cluster. This ensures that no single node is overwhelmed, optimizing performance.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Simplified Maintenance</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>Hardware maintenance, such as replacing faulty components, upgrading systems, or applying security patches, can be done without shutting down the services. By migrating VMs to another node temporarily, administrators can work on the physical server without disrupting operations.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Resource Optimization</strong>:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li>With live migration, you can consolidate VMs onto fewer nodes during off-peak hours to reduce power consumption and then distribute them again when the workload increases.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Step-by-Step Guide to Performing Proxmox Live Migration</h3>
<!-- /wp:heading -->

 <p>Now that we’ve covered how Proxmox’s live migration works, let’s walk through the actual process of migrating a VM between nodes in a Proxmox cluster.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Cluster Configuration</h4>
<!-- /wp:heading -->

 <p>Ensure that both the source and destination nodes are part of the same Proxmox cluster and that they share access to the same storage backend. This is typically done when initially setting up the cluster, and Proxmox offers built-in tools for clustering nodes.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Check Resource Availability</h4>
<!-- /wp:heading -->

 <p>Verify that the destination node has sufficient resources (CPU, memory, storage) to handle the migrated VM.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Navigate to the Proxmox Web Interface</h4>
<!-- /wp:heading -->

 <p>Open the Proxmox web interface and select the VM you wish to migrate. From the VM’s overview screen, click on the <strong>"Migrate"</strong> button.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Select the Target Node</h4>
<!-- /wp:heading -->

 <p>In the migration dialog, select the destination node from the list of available nodes in the cluster. Proxmox will perform a series of compatibility checks to ensure that the migration can proceed.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 5: Start the Migration</h4>
<!-- /wp:heading -->

 <p>Once you have selected the target node and verified the configuration, click <strong>"Migrate"</strong> to begin the process. Proxmox will start the memory transfer as described earlier, ensuring the VM remains operational throughout the migration.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 6: Monitor the Migration</h4>
<!-- /wp:heading -->

 <p>You can monitor the migration process through the Proxmox web interface. The task log will show the progress of the migration and inform you once it is complete.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 7: Confirm the Migration</h4>
<!-- /wp:heading -->

 <p>Once the migration is finished, the VM will now be running on the destination node. Verify that the VM is functioning correctly by checking its status and ensuring that all services are operational.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Common Issues and Troubleshooting</h3>
<!-- /wp:heading -->

 <p>While Proxmox’s live migration feature is designed to be reliable, a few issues may arise during the migration process:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Storage Incompatibility</strong>: If the source and destination nodes do not have access to the same shared storage, the migration will fail. Always ensure that both nodes have access to the same storage backend.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Network Latency</strong>: High network latency between nodes can slow down the migration process or cause it to fail. For best results, ensure that your nodes are connected via a low-latency network.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Inconsistent Hardware</strong>: Although Proxmox can handle minor differences in hardware between nodes, significant differences (such as different CPU architectures) may prevent live migration. Ensure that the nodes are relatively similar in terms of hardware.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

 <p>Proxmox live migration feature is an essential tool for managing a virtualized infrastructure, offering flexibility, resource optimization, and high availability. By enabling administrators to move VMs between nodes without downtime, Proxmox simplifies system maintenance and improves operational efficiency.</p>
 

 <p>Whether you’re running a large data center or a small-scale virtualized environment, Proxmox live migration capabilities provide the reliability and control needed to keep your systems running smoothly.</p>
 