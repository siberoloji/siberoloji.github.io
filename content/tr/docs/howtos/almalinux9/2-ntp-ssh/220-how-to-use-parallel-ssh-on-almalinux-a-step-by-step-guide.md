---
title: How to Use Parallel SSH on AlmaLinux
description: In this guide, we’ll explore what Parallel SSH is, its benefits, and how to install and use it effectively on AlmaLinux.
date: 2024-12-09
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
linkTitle: Parallel SSH
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 220
translationKey: how-to-use-parallel-ssh-on-almalinux-a-step-by-step-guide
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
url: parallel-ssh-almalinux
---
Managing multiple servers simultaneously can be a daunting task, especially when executing repetitive commands or deploying updates. Parallel SSH (PSSH) is a powerful tool that simplifies this process by enabling you to run commands on multiple remote systems concurrently. If you’re using AlmaLinux, a secure and enterprise-grade Linux distribution, learning to use Parallel SSH can greatly enhance your efficiency and productivity.

In this guide, we’ll explore what Parallel SSH is, its benefits, and how to install and use it effectively on AlmaLinux.

---

### What Is Parallel SSH?

Parallel SSH is a command-line tool that allows users to execute commands, copy files, and manage multiple servers simultaneously. It is part of the PSSH suite, which includes additional utilities like:

- `pssh`: Run commands in parallel on multiple servers.
- `pscp`: Copy files to multiple servers.
- `pslurp`: Fetch files from multiple servers.
- `pnuke`: Kill processes on multiple servers.

---

### Benefits of Using Parallel SSH

PSSH is particularly useful in scenarios like:

1. **System Administration**: Automate administrative tasks across multiple servers.
2. **DevOps**: Streamline deployment processes for applications or updates.
3. **Cluster Management**: Manage high-performance computing (HPC) clusters.
4. **Consistency**: Ensure the same command or script runs uniformly across all servers.

---

### Prerequisites

Before diving into Parallel SSH, ensure the following:

1. AlmaLinux is installed and updated:

   ```bash
   sudo dnf update
   ```

2. You have SSH access to all target servers.
3. Passwordless SSH authentication is set up for seamless connectivity.

---

### Step-by-Step Guide to Using Parallel SSH on AlmaLinux

---

### 1. **Install Parallel SSH**

Parallel SSH is not included in the default AlmaLinux repositories, but you can install it using Python's package manager, `pip`.

#### Step 1: Install Python and Pip

1. Ensure Python is installed:

   ```bash
   sudo dnf install python3 python3-pip
   ```

2. Verify the installation:

   ```bash
   python3 --version
   pip3 --version
   ```

#### Step 2: Install PSSH

1. Install Parallel SSH via `pip`:

   ```bash
   pip3 install parallel-ssh
   ```

2. Verify the installation:

   ```bash
   pssh --version
   ```

---

### 2. **Set Up Passwordless SSH Authentication**

Passwordless SSH authentication is crucial for PSSH to work seamlessly.

1. **Generate an SSH key pair**:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

2. **Copy the public key to each target server**:

   ```bash
   ssh-copy-id user@remote-server
   ```

   Replace `user@remote-server` with the appropriate username and hostname/IP for each server.

3. Test the connection:

   ```bash
   ssh user@remote-server
   ```

   Ensure no password is required for login.

---

### 3. **Create a Hosts File**

Parallel SSH requires a list of target servers, provided in a hosts file.

1. **Create the hosts file**:

   ```bash
   nano ~/hosts.txt
   ```

2. **Add server details**:
   Add one server per line in the following format:

   ```bash
   user@server1
   user@server2
   user@server3
   ```

   Save the file and exit.

---

### 4. **Run Commands Using PSSH**

With the hosts file ready, you can start using PSSH to run commands across multiple servers.

#### Example 1: Execute a Simple Command

Run the `uptime` command on all servers:

```bash
pssh -h ~/hosts.txt -i "uptime"
```

Explanation:

- `-h`: Specifies the hosts file.
- `-i`: Outputs results interactively.

#### Example 2: Run a Command as Root

If the command requires `sudo`, use the `-A` option to enable interactive password prompts:

```bash
pssh -h ~/hosts.txt -A -i "sudo apt update"
```

#### Example 3: Use a Custom SSH Key

Specify a custom SSH key with the `-x` option:

```bash
pssh -h ~/hosts.txt -x "-i /path/to/private-key" -i "uptime"
```

---

### 5. **Transfer Files Using PSSH**

Parallel SCP (PSCP) allows you to copy files to multiple servers simultaneously.

#### Example: Copy a File to All Servers

```bash
pscp -h ~/hosts.txt local-file /remote/destination/path
```

Explanation:

- `local-file`: Path to the file on your local machine.
- `/remote/destination/path`: Destination path on the remote servers.

#### Example: Retrieve Files from All Servers

Use `pslurp` to download files:

```bash
pslurp -h ~/hosts.txt /remote/source/path local-destination/
```

---

### 6. **Advanced Options and Use Cases**

#### Run Commands with a Timeout

Set a timeout to terminate long-running commands:

```bash
pssh -h ~/hosts.txt -t 30 -i "ping -c 4 google.com"
```

#### Parallel Execution Limit

Limit the number of simultaneous connections:

```bash
pssh -h ~/hosts.txt -p 5 -i "uptime"
```

This example processes only five servers at a time.

#### Log Command Output

Save the output of each server to a log file:

```bash
pssh -h ~/hosts.txt -o /path/to/logs "df -h"
```

---

### 7. **Best Practices for Using Parallel SSH**

To maximize the effectiveness of PSSH:

1. **Use descriptive host files**: Maintain separate host files for different server groups.
2. **Test commands**: Run commands on a single server before executing them across all systems.
3. **Monitor output**: Use the logging feature to debug errors.
4. **Ensure uptime**: Verify all target servers are online before running commands.

---

### 8. **Troubleshooting Common Issues**

#### Issue 1: "Permission Denied"

- **Cause**: SSH keys are not set up correctly.
- **Solution**: Reconfigure passwordless SSH authentication.

#### Issue 2: "Command Not Found"

- **Cause**: Target servers lack the required command or software.
- **Solution**: Ensure the command is available on all servers.

#### Issue 3: "Connection Refused"

- **Cause**: Firewall or network issues.
- **Solution**: Verify SSH access and ensure the `sshd` service is running:

  ```bash
  sudo systemctl status sshd
  ```

---

### Real-World Applications of Parallel SSH

1. **System Updates**:
   - Simultaneously update all servers in a cluster.
2. **Application Deployment**:
   - Deploy code or restart services across multiple servers.
3. **Data Collection**:
   - Fetch logs or performance metrics from distributed systems.
4. **Testing Environments**:
   - Apply configuration changes to multiple test servers.

---

### Conclusion

Parallel SSH is an indispensable tool for managing multiple servers efficiently. By enabling command execution, file transfers, and process management across systems simultaneously, PSSH simplifies complex administrative tasks. AlmaLinux users, especially system administrators and DevOps professionals, can greatly benefit from incorporating PSSH into their workflows.

With this guide, you’re equipped to install, configure, and use Parallel SSH on AlmaLinux. Whether you’re updating servers, deploying applications, or managing clusters, PSSH offers a powerful, scalable solution to streamline your operations.

If you’ve used Parallel SSH or have additional tips, feel free to share them in the comments below. Happy automating!
