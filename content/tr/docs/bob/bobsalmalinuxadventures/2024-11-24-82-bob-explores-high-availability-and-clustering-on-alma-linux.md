---
draft: false
title: Bob Explores High Availability and Clustering on AlmaLinux
linkTitle: High Availability and Clustering
keywords:
  - High Availability and Clustering
description: Bob learned that high availability* ensures continuous access to services, even in the face of hardware or software failures.
date: 2024-12-10
url: bob-explores-high-availability-clustering-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 820
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next adventure was to implement **high availability (HA)** and **clustering** to ensure his services stayed online even during hardware failures or peak loads. He learned to use tools like **Pacemaker**, **Corosync**, and **HAProxy** to build resilient and scalable systems.

> *“Downtime isn’t an option—let’s make my server unshakable!”* Bob declared, diving into HA and clustering.

---

### **Chapter Outline: "Bob Explores High Availability and Clustering"**

1. **Introduction: What Is High Availability?**
   - Understanding HA concepts.
   - Key tools: Pacemaker, Corosync, and HAProxy.

2. **Setting Up a High-Availability Cluster**
   - Installing and configuring Pacemaker and Corosync.
   - Creating and managing a cluster.

3. **Implementing Load Balancing with HAProxy**
   - Installing and configuring HAProxy.
   - Balancing traffic between multiple backend servers.

4. **Testing Failover and Recovery**
   - Simulating failures.
   - Monitoring cluster health.

5. **Optimizing the HA Setup**
   - Fine-tuning resources and fencing.
   - Automating with cluster scripts.

6. **Conclusion: Bob Reflects on High Availability Mastery**

---

### **Part 1: Introduction: What Is High Availability?**

Bob learned that **high availability** ensures continuous access to services, even in the face of hardware or software failures. Clustering combines multiple servers to act as a single system, providing redundancy and scalability.

#### **Key HA Concepts**

- **Failover**: Automatically shifting workloads to healthy nodes during a failure.
- **Load Balancing**: Distributing traffic across multiple servers to avoid overloading.
- **Fencing**: Isolating failed nodes to prevent data corruption.

#### **Tools for HA on AlmaLinux**

1. **Pacemaker**: Resource management and failover.
2. **Corosync**: Cluster communication.
3. **HAProxy**: Load balancing traffic.

> *“With HA, my services will always stay online!”* Bob said.

---

### **Part 2: Setting Up a High-Availability Cluster**

#### **Step 1: Installing Pacemaker and Corosync**

Bob installed the necessary packages on two nodes (`node1` and `node2`).

- Install HA tools:

  ```bash
  sudo dnf install -y pacemaker corosync pcs
  ```

- Enable and start the `pcsd` service:

  ```bash
  sudo systemctl enable pcsd --now
  ```

- Set a cluster password:

  ```bash
  sudo pcs cluster auth node1 node2
  ```

#### **Step 2: Configuring the Cluster**

- Create the cluster:

  ```bash
  sudo pcs cluster setup --name mycluster node1 node2
  ```

- Start the cluster:

  ```bash
  sudo pcs cluster start --all
  ```

- Enable the cluster at boot:

  ```bash
  sudo pcs cluster enable --all
  ```

- Check the cluster status:

  ```bash
  sudo pcs status
  ```

> *“The cluster is live—time to add resources!”* Bob said.

#### **Step 3: Adding Resources to the Cluster**

Bob added a virtual IP as the primary resource:

- Add a virtual IP resource:

  ```bash
  sudo pcs resource create VirtualIP ocf:heartbeat:IPaddr2 ip=192.168.1.100 cidr_netmask=24
  ```

- Verify the resource:

  ```bash
  sudo pcs resource show
  ```

---

### **Part 3: Implementing Load Balancing with HAProxy**

#### **Step 1: Installing HAProxy**

- Install HAProxy:

  ```bash
  sudo dnf install -y haproxy
  ```

- Enable and start HAProxy:

  ```bash
  sudo systemctl enable haproxy --now
  ```

#### **Step 2: Configuring HAProxy**

Bob configured HAProxy to balance traffic between two web servers.

- Edit the HAProxy configuration file:

  ```bash
  sudo nano /etc/haproxy/haproxy.cfg
  ```

- Add a load balancing configuration:

  ```plaintext
  frontend http_front
      bind *:80
      default_backend http_back

  backend http_back
      balance roundrobin
      server web1 192.168.1.11:80 check
      server web2 192.168.1.12:80 check
  ```

- Restart HAProxy:

  ```bash
  sudo systemctl restart haproxy
  ```

- Verify HAProxy is balancing traffic:

  ```bash
  curl http://<load-balancer-ip>
  ```

> *“HAProxy is routing traffic seamlessly!”* Bob said.

---

### **Part 4: Testing Failover and Recovery**

#### **Step 1: Simulating Node Failures**

Bob tested failover by stopping services on `node1`:

```bash
sudo pcs cluster stop node1
```

- Check if the virtual IP moved to `node2`:

  ```bash
  ping 192.168.1.100
  ```

#### **Step 2: Monitoring Cluster Health**

Bob used the following commands to monitor cluster status:

- View detailed cluster information:

  ```bash
  sudo pcs status
  ```

- Check resource logs:

  ```bash
  sudo pcs resource debug-start VirtualIP
  ```

> *“The cluster handled the failure like a champ!”* Bob said.

---

### **Part 5: Optimizing the HA Setup**

#### **Step 1: Configuring Fencing**

Bob configured fencing to isolate failed nodes.

- Enable fencing:

  ```bash
  sudo pcs stonith create fence_ipmilan fence_ipmilan pcmk_host_list="node1 node2" ipaddr="192.168.1.50" login="admin" passwd="password"
  ```

- Test the fencing configuration:

  ```bash
  sudo pcs stonith fence node1
  ```

#### **Step 2: Automating with Cluster Scripts**

Bob automated resource recovery using custom scripts:

- Add a script as a resource:

  ```bash
  sudo pcs resource create MyScript ocf:heartbeat:Anything params binfile=/path/to/script.sh
  ```

> *“With fencing and automation, my cluster is truly resilient!”* Bob noted.

---

### **Conclusion: Bob Reflects on High Availability Mastery**

Bob successfully built a highly available cluster with Pacemaker, Corosync, and HAProxy. By testing failover and optimizing his setup, he ensured his services could withstand hardware failures and peak loads.

> Next, Bob plans to explore **Linux Virtualization with KVM** on AlmaLinux.
