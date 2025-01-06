---
draft: false
title: Bob Explores Real-Time Applications with AlmaLinux
linkTitle: Real-Time Applications
keywords:
  - Real-Time Applications
description: Optimize AlmaLinux for real-time applications, where ultra-low latency and deterministic response times are critical.
date: 2024-12-12
url: bob-explores-real-time-applications-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 950


featured_image: /images/bobs-adventures-with-alma-linux.png
---
Bob’s next adventure was to optimize AlmaLinux for **real-time applications**, where ultra-low latency and deterministic response times are critical. From configuring the real-time kernel to tuning the system, Bob aimed to create an environment suitable for industrial automation, telecommunications, and other time-sensitive workloads.

> *“Real-time computing is all about speed and precision—let’s make AlmaLinux the fastest it can be!”* Bob said, ready to dive in.

---

### **Chapter Outline: "Bob Explores Real-Time Applications with AlmaLinux"**

1. **Introduction: What Are Real-Time Applications?**
   - Overview of real-time computing and use cases.
   - Hard real-time vs. soft real-time.

2. **Setting Up a Real-Time Kernel**
   - Installing and enabling the real-time kernel.
   - Verifying real-time kernel features.

3. **Tuning AlmaLinux for Real-Time Performance**
   - Configuring system parameters for low latency.
   - Optimizing CPU isolation and scheduling.

4. **Testing and Measuring Latency**
   - Using tools like `cyclictest` for latency analysis.
   - Interpreting test results to identify bottlenecks.

5. **Implementing Real-Time Applications**
   - Running a real-time application on the configured system.
   - Managing resources to ensure predictable performance.

6. **Monitoring and Maintaining Real-Time Systems**
   - Continuous monitoring with performance tools.
   - Ensuring system stability and reliability.

7. **Conclusion: Bob Reflects on Real-Time Optimization**

---

### **Part 1: What Are Real-Time Applications?**

Bob learned that **real-time systems** guarantee a specific response time to events, which is critical in applications like robotics, video streaming, and financial trading.

#### **Hard vs. Soft Real-Time**

- **Hard Real-Time**: Failure to respond within the deadline is unacceptable (e.g., medical devices).
- **Soft Real-Time**: Occasional missed deadlines are tolerable (e.g., live video streaming).

> *“AlmaLinux can handle both types of real-time tasks with the right tweaks!”* Bob said.

---

### **Part 2: Setting Up a Real-Time Kernel**

#### **Step 1: Installing the Real-Time Kernel**

- Add the real-time repository:

  ```bash
  sudo dnf install -y epel-release
  sudo dnf install -y kernel-rt kernel-rt-core
  ```

- Update the GRUB configuration to use the real-time kernel:

  ```bash
  sudo grub2-mkconfig -o /boot/grub2/grub.cfg
  ```

- Reboot into the real-time kernel:

  ```bash
  sudo reboot
  ```

#### **Step 2: Verifying Real-Time Kernel Features**

- Check the active kernel version:

  ```bash
  uname -r
  ```

- Verify real-time patches:

  ```bash
  dmesg | grep -i "rt"
  ```

> *“The real-time kernel is installed and ready to go!”* Bob said.

---

### **Part 3: Tuning AlmaLinux for Real-Time Performance**

#### **Step 1: Configuring CPU Isolation**

- Edit the GRUB configuration to isolate CPUs for real-time tasks:

  ```bash
  sudo nano /etc/default/grub
  ```

  Add the following to `GRUB_CMDLINE_LINUX`:

  ```plaintext
  isolcpus=2,3 nohz_full=2,3 rcu_nocbs=2,3
  ```

- Update GRUB and reboot:

  ```bash
  sudo grub2-mkconfig -o /boot/grub2/grub.cfg
  sudo reboot
  ```

#### **Step 2: Adjusting Kernel Parameters**

- Optimize for low latency:

  ```bash
  sudo sysctl -w kernel.sched_rt_runtime_us=-1
  ```

- Persist the change:

  ```bash
  echo "kernel.sched_rt_runtime_us=-1" | sudo tee -a /etc/sysctl.conf
  ```

#### **Step 3: Using Priority Scheduling**

- Allow non-root users to use real-time priorities:

  ```bash
  sudo nano /etc/security/limits.conf
  ```

  Add:

  ```plaintext
  * hard rtprio 99
  * soft rtprio 99
  ```

> *“CPU isolation and priority scheduling ensure real-time tasks aren’t interrupted!”* Bob said.

---

### **Part 4: Testing and Measuring Latency**

#### **Step 1: Installing `cyclictest`**

- Install `cyclictest` from the `rt-tests` package:

  ```bash
  sudo dnf install -y rt-tests
  ```

#### **Step 2: Running Latency Tests**

- Run `cyclictest` to measure latency:

  ```bash
  sudo cyclictest --smp --threads=4 --priority=99 --interval=1000
  ```

- Interpret the results:
  - **Max Latency**: The longest time the system took to respond.
  - **Average Latency**: The average response time.

> *“Low and stable latencies mean my system is ready for real-time workloads!”* Bob noted.

---

### **Part 5: Implementing Real-Time Applications**

#### **Step 1: Writing a Real-Time Program**

Bob wrote a simple real-time program in C:

```c
#include <stdio.h>
#include <time.h>
#include <sched.h>

int main() {
    struct sched_param param;
    param.sched_priority = 99;
    if (sched_setscheduler(0, SCHED_FIFO, &param) == -1) {
        perror("sched_setscheduler failed");
        return 1;
    }
    while (1) {
        struct timespec ts;
        clock_gettime(CLOCK_REALTIME, &ts);
        printf("Real-time task running at %ld.%09ld ", ts.tv_sec, ts.tv_nsec);
    }
    return 0;
}
```

- Compile and run the program:

  ```bash
  gcc -o realtime realtime.c
  sudo ./realtime
  ```

#### **Step 2: Managing Resources**

- Use `taskset` to bind the program to specific CPUs:

  ```bash
  sudo taskset -c 2 ./realtime
  ```

> *“Real-time applications run smoothly when system resources are managed effectively!”* Bob said.

---

### **Part 6: Monitoring and Maintaining Real-Time Systems**

#### **Step 1: Monitoring System Performance**

- Use `htop` to monitor CPU usage:

  ```bash
  htop
  ```

- Monitor kernel events:

  ```bash
  dmesg -T | tail
  ```

#### **Step 2: Ensuring System Stability**

- Schedule regular health checks:

  ```bash
  crontab -e
  ```

  Add:

  ```plaintext
  0 * * * * sudo cyclictest --smp --threads=4 --priority=99 --interval=1000 > /var/log/cyclictest.log
  ```

- Review logs for latency spikes:

  ```bash
  cat /var/log/cyclictest.log
  ```

> *“Continuous monitoring ensures my real-time system stays reliable!”* Bob noted.

---

### **Conclusion: Bob Reflects on Real-Time Optimization**

Bob successfully configured AlmaLinux for real-time applications, achieving low and stable latencies. With optimized kernels, system tuning, and performance monitoring, he was ready to deploy time-sensitive workloads.

> Next, Bob plans to explore **Deploying and Managing AlmaLinux in a Hybrid Cloud Environment**, combining local and cloud resources.
