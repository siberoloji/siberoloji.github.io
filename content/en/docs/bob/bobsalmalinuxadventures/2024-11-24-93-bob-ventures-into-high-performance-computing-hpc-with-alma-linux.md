---
draft: false
title: Bob Ventures into High-Performance Computing (HPC) with AlmaLinux
linkTitle: High-Performance Computing
keywords: ""
description: Explore High-Performance Computing on AlmaLinux. HPC clusters process massive workloads, enabling scientific simulations, machine learning.
date: 2024-12-12
url: bob-ventures-high-performance-computing-hpc-almalinux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux

author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 930


featured_image: /images/bobs-adventures-with-alma-linux.png
---
### **Bob Ventures into High-Performance Computing (HPC) with AlmaLinux**

Bob’s next challenge was to explore **High-Performance Computing (HPC)** on AlmaLinux. HPC clusters process massive workloads, enabling scientific simulations, machine learning, and other resource-intensive tasks. Bob aimed to build and manage an HPC cluster to harness this computational power.

> *“HPC unlocks the full potential of servers—time to build my cluster!”* Bob said, eager to tackle the task.

---

### **Chapter Outline: "Bob Ventures into High-Performance Computing (HPC)"**

1. **Introduction: What Is HPC?**
   - Overview of HPC and its use cases.
   - Why AlmaLinux is a strong choice for HPC clusters.

2. **Setting Up the HPC Environment**
   - Configuring the master and compute nodes.
   - Installing key tools: Slurm, OpenMPI, and more.

3. **Building an HPC Cluster**
   - Configuring a shared file system with NFS.
   - Setting up the Slurm workload manager.

4. **Running Parallel Workloads**
   - Writing and submitting batch scripts with Slurm.
   - Running distributed tasks using OpenMPI.

5. **Monitoring and Scaling the Cluster**
   - Using Ganglia for cluster monitoring.
   - Adding nodes to scale the cluster.

6. **Optimizing HPC Performance**
   - Tuning network settings for low-latency communication.
   - Fine-tuning Slurm and OpenMPI configurations.

7. **Conclusion: Bob Reflects on HPC Mastery**

---

### **Part 1: What Is HPC?**

Bob learned that **HPC** combines multiple compute nodes into a single cluster, enabling tasks to run in parallel for faster results. AlmaLinux’s stability and compatibility with HPC tools make it a perfect fit for building and managing clusters.

#### **Key Use Cases for HPC**

- Scientific simulations.
- Machine learning model training.
- Big data analytics.

> *“HPC turns a cluster of machines into a supercomputer!”* Bob said.

---

### **Part 2: Setting Up the HPC Environment**

#### **Step 1: Configuring Master and Compute Nodes**

- Configure the master node:

  ```bash
  sudo dnf install -y slurm slurm-slurmdbd munge
  ```

- Configure compute nodes:

  ```bash
  sudo dnf install -y slurm slurmd munge
  ```

- Synchronize system time across nodes:

  ```bash
  sudo dnf install -y chrony
  sudo systemctl enable chronyd --now
  ```

#### **Step 2: Installing Key HPC Tools**

- Install OpenMPI:

  ```bash
  sudo dnf install -y openmpi
  ```

- Install development tools:

  ```bash
  sudo dnf groupinstall -y "Development Tools"
  ```

> *“The basic environment is ready—time to connect the nodes!”* Bob said.

---

### **Part 3: Building an HPC Cluster**

#### **Step 1: Configuring a Shared File System**

- Install NFS on the master node:

  ```bash
  sudo dnf install -y nfs-utils
  ```

- Export the shared directory:

  ```bash
  echo "/shared *(rw,sync,no_root_squash)" | sudo tee -a /etc/exports
  sudo exportfs -arv
  sudo systemctl enable nfs-server --now
  ```

- Mount the shared directory on compute nodes:

  ```bash
  sudo mount master:/shared /shared
  ```

#### **Step 2: Setting Up Slurm**

- Configure `slurm.conf` on the master node:

  ```bash
  sudo nano /etc/slurm/slurm.conf
  ```

  Add:

  ```plaintext
  ClusterName=almalinux_hpc
  ControlMachine=master
  NodeName=compute[1-4] CPUs=4 State=UNKNOWN
  PartitionName=default Nodes=compute[1-4] Default=YES MaxTime=INFINITE State=UP
  ```

- Start Slurm services:

  ```bash
  sudo systemctl enable slurmctld --now
  sudo systemctl enable slurmd --now
  ```

> *“Slurm manages all the jobs in the cluster!”* Bob noted.

---

### **Part 4: Running Parallel Workloads**

#### **Step 1: Writing a Batch Script**

Bob wrote a Slurm batch script to simulate a workload:

- Create `job.slurm`:

  ```bash
  nano job.slurm
  ```

  Add:

  ```plaintext
  #!/bin/bash
  #SBATCH --job-name=test_job
  #SBATCH --output=job_output.txt
  #SBATCH --ntasks=4
  #SBATCH --time=00:10:00

  module load mpi
  mpirun hostname
  ```

- Submit the job:

  ```bash
  sbatch job.slurm
  ```

#### **Step 2: Running Distributed Tasks with OpenMPI**

- Compile an MPI program:

  ```c
  #include <mpi.h>
  #include <stdio.h>
  int main(int argc, char** argv) {
      MPI_Init(NULL, NULL);
      int world_size;
      MPI_Comm_size(MPI_COMM_WORLD, &world_size);
      printf("Number of processors: %d ", world_size);
      MPI_Finalize();
      return 0;
  }
  ```

- Save it as `mpi_test.c` and compile:

  ```bash
  mpicc -o mpi_test mpi_test.c
  ```

- Run the program across the cluster:

  ```bash
  mpirun -np 4 -hostfile /etc/hosts ./mpi_test
  ```

> *“Parallel processing is the heart of HPC!”* Bob said.

---

### **Part 5: Monitoring and Scaling the Cluster**

#### **Step 1: Using Ganglia for Monitoring**

- Install Ganglia on the master node:

  ```bash
  sudo dnf install -y ganglia ganglia-gmond ganglia-web
  ```

- Configure Ganglia:

  ```bash
  sudo nano /etc/ganglia/gmond.conf
  ```

  Set `udp_send_channel` to the master node’s IP.

- Start the service:

  ```bash
  sudo systemctl enable gmond --now
  ```

#### **Step 2: Adding Compute Nodes**

- Configure the new node in `slurm.conf`:

  ```plaintext
  NodeName=compute[1-5] CPUs=4 State=UNKNOWN
  ```

- Restart Slurm services:

  ```bash
  sudo systemctl restart slurmctld
  ```

> *“Adding nodes scales the cluster to handle bigger workloads!”* Bob said.

---

### **Part 6: Optimizing HPC Performance**

#### **Step 1: Tuning Network Settings**

- Configure low-latency networking:

  ```bash
  sudo sysctl -w net.core.rmem_max=16777216
  sudo sysctl -w net.core.wmem_max=16777216
  ```

#### **Step 2: Fine-Tuning Slurm and OpenMPI**

- Adjust Slurm scheduling:

  ```plaintext
  SchedulerType=sched/backfill
  ```

- Optimize OpenMPI for communication:

  ```bash
  mpirun --mca btl_tcp_if_include eth0
  ```

> *“Performance tuning ensures the cluster runs at its peak!”* Bob said.

---

### **Conclusion: Bob Reflects on HPC Mastery**

Bob successfully built and managed an HPC cluster on AlmaLinux. With Slurm, OpenMPI, and Ganglia in place, he could run massive workloads efficiently and monitor their performance in real time.

> Next, Bob plans to explore **Linux Kernel Tuning and Customization**, diving deep into the system's core.
