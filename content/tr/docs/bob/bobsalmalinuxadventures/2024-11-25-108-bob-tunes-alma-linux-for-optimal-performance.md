---
draft: false
title: Bob Tunes AlmaLinux for Optimal Performance
linkTitle: Tune AlmaLinux for Optimal Performance
keywords: ""
description: Optimize AlmaLinux for peak performance, ensuring systems ran smoothly and efficiently under heavy workloads.
date: 2024-12-12
url: bob-tunes-almalinux-optimal-performance
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 1080
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next challenge was to optimize AlmaLinux for **peak performance**, ensuring systems ran smoothly and efficiently under heavy workloads. By fine-tuning resources, tweaking system configurations, and monitoring performance metrics, he aimed to maximize speed and reliability.

> *“Optimization is the secret sauce of a powerful system—let’s tune it to perfection!”* Bob said, ready for action.

---

### **Chapter Outline: "Bob Tunes AlmaLinux for Optimal Performance"**

1. **Introduction: Why Performance Tuning Matters**
   - The impact of performance optimization.
   - Key areas for tuning on Linux systems.

2. **Monitoring System Performance**
   - Using tools like `htop`, `iostat`, and `vmstat`.
   - Setting up continuous performance monitoring with Grafana.

3. **Optimizing CPU and Memory**
   - Tweaking CPU scheduling policies.
   - Configuring virtual memory (swap and `sysctl`).

4. **Tuning Disk I/O and Filesystems**
   - Using `iotop` and `blktrace` to analyze disk performance.
   - Optimizing filesystems with `ext4` and `xfs` tweaks.

5. **Optimizing Network Performance**
   - Adjusting TCP/IP settings for low latency.
   - Using `ethtool` for NIC optimization.

6. **Fine-Tuning Services and Applications**
   - Prioritizing critical services with `systemd`.
   - Optimizing database and web server performance.

7. **Conclusion: Bob Reflects on Performance Mastery**

---

### **Part 1: Why Performance Tuning Matters**

Bob learned that performance tuning improves:

- **System Responsiveness**: Reduced lag under heavy loads.
- **Resource Utilization**: Efficient use of CPU, memory, and I/O.
- **Reliability**: Systems remain stable even during peak usage.

#### **Key Areas for Optimization**

- CPU and memory.
- Disk I/O and filesystems.
- Network performance.

> *“Tuning the system turns good performance into great performance!”* Bob said.

---

### **Part 2: Monitoring System Performance**

#### **Step 1: Real-Time Monitoring with `htop`**

- Install and run `htop`:

  ```bash
  sudo dnf install -y htop
  htop
  ```

- Use the interface to monitor:
  - CPU and memory usage.
  - Processes consuming high resources.

#### **Step 2: Analyzing Disk and Network Metrics**

- Monitor disk performance with `iostat`:

  ```bash
  iostat -x 1 10
  ```

- Check virtual memory stats with `vmstat`:

  ```bash
  vmstat 1 10
  ```

- Monitor network performance:

  ```bash
  sudo dnf install -y iftop
  sudo iftop
  ```

#### **Step 3: Setting Up Continuous Monitoring**

- Install Grafana and Prometheus:

  ```bash
  sudo dnf install -y prometheus grafana
  sudo systemctl enable prometheus --now
  sudo systemctl enable grafana-server --now
  ```

> *“Monitoring identifies bottlenecks and guides optimization efforts!”* Bob noted.

---

### **Part 3: Optimizing CPU and Memory**

#### **Step 1: Tweaking CPU Scheduling**

- Adjust CPU scheduling policies:

  ```bash
  sudo nano /etc/sysctl.conf
  ```

  Add:

  ```plaintext
  kernel.sched_min_granularity_ns = 10000000
  kernel.sched_latency_ns = 20000000
  ```

- Apply the changes:

  ```bash
  sudo sysctl -p
  ```

#### **Step 2: Configuring Virtual Memory**

- Optimize `swappiness` for memory usage:

  ```bash
  sudo sysctl vm.swappiness=10
  echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
  ```

- Adjust cache pressure:

  ```bash
  sudo sysctl vm.vfs_cache_pressure=50
  echo "vm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf
  ```

> *“Fine-tuning CPU and memory improves system responsiveness!”* Bob said.

---

### **Part 4: Tuning Disk I/O and Filesystems**

#### **Step 1: Analyzing Disk Performance**

- Use `iotop` to identify I/O bottlenecks:

  ```bash
  sudo dnf install -y iotop
  sudo iotop
  ```

- Trace I/O operations with `blktrace`:

  ```bash
  sudo dnf install -y blktrace
  sudo blktrace -d /dev/sda
  ```

#### **Step 2: Optimizing Filesystems**

- Enable journaling for `ext4`:

  ```bash
  sudo tune2fs -o journal_data_writeback /dev/sda1
  ```

- Mount filesystems with optimal options:

  ```bash
  sudo nano /etc/fstab
  ```

  Add:

  ```plaintext
  /dev/sda1 /data ext4 defaults,noatime 0 2
  ```

> *“Disk performance directly affects application speed!”* Bob noted.

---

### **Part 5: Optimizing Network Performance**

#### **Step 1: Adjusting TCP/IP Settings**

- Configure TCP window sizes:

  ```bash
  sudo nano /etc/sysctl.conf
  ```

  Add:

  ```plaintext
  net.core.rmem_max = 16777216
  net.core.wmem_max = 16777216
  net.ipv4.tcp_rmem = 4096 87380 16777216
  net.ipv4.tcp_wmem = 4096 65536 16777216
  ```

- Apply changes:

  ```bash
  sudo sysctl -p
  ```

#### **Step 2: Using `ethtool` for NIC Optimization**

- Install and configure `ethtool`:

  ```bash
  sudo dnf install -y ethtool
  sudo ethtool -K eth0 tso off
  ```

> *“Optimized networking reduces latency and improves throughput!”* Bob said.

---

### **Part 6: Fine-Tuning Services and Applications**

#### **Step 1: Prioritizing Critical Services**

- Use `systemd` to set CPU affinity for services:

  ```bash
  sudo systemctl set-property httpd.service CPUAffinity=1 2
  ```

- Adjust `Nice` values:

  ```bash
  sudo renice -n -5 -p $(pidof httpd)
  ```

#### **Step 2: Optimizing Databases**

- Optimize MySQL:

  ```bash
  sudo nano /etc/my.cnf
  ```

  Add:

  ```plaintext
  innodb_buffer_pool_size = 1G
  query_cache_size = 64M
  ```

- Restart MySQL:

  ```bash
  sudo systemctl restart mysqld
  ```

> *“Service-level optimizations ensure critical applications run smoothly!”* Bob said.

---

### **Conclusion: Bob Reflects on Performance Mastery**

Bob successfully optimized AlmaLinux for maximum performance, improving CPU, memory, disk, and network efficiency. By monitoring metrics and fine-tuning configurations, he achieved a stable and responsive system ready for demanding workloads.

> Next, Bob plans to explore **Advanced File Systems and Storage Management**, delving into RAID, LVM, and ZFS.
