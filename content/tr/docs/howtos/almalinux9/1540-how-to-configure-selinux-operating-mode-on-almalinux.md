---
title: 
linkTitle: 
description: 
date: 
weight: 1540
slug: 
draft: true
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
type: docs
prev: 
next: 
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

toc: true
keywords:
  - AlmaLinux
excludeSearch: false


featured_image: /images/almalinux.webp
---
# How to Configure SELinux Operating Mode on AlmaLinux  

Security-Enhanced Linux (SELinux) is a robust security mechanism built into Linux systems, including AlmaLinux, that enforces mandatory access controls (MAC). SELinux helps safeguard systems by restricting access to files, processes, and resources based on security policies.  

Understanding and configuring SELinux's operating modes is essential for maintaining a secure and compliant system. In this detailed guide, we’ll explore SELinux’s operating modes, how to determine its current configuration, and how to modify its mode on AlmaLinux to suit your system's needs.  

---

### **What Is SELinux?**  

SELinux is a Linux kernel security module that provides fine-grained control over what users and processes can do on a system. It uses policies to define how processes interact with each other and with system resources. This mechanism minimizes the impact of vulnerabilities and unauthorized access.  

---

### **SELinux Operating Modes**  

SELinux operates in one of three modes:  

1. **Enforcing Mode**  
   - SELinux enforces its policies, blocking unauthorized actions.  
   - Violations are logged in audit logs.  
   - Best for production environments requiring maximum security.  

2. **Permissive Mode**  
   - SELinux policies are not enforced, but violations are logged.  
   - Ideal for testing and troubleshooting SELinux configurations.  

3. **Disabled Mode**  
   - SELinux is completely turned off.  
   - Not recommended unless SELinux causes unavoidable issues or is unnecessary for your use case.  

---

### **Checking the Current SELinux Mode**  

Before configuring SELinux, determine its current mode.  

#### Method 1: Using `sestatus`  

Run the `sestatus` command to view SELinux status and mode:  

```bash
sestatus
```  

Sample output:  

```plaintext
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      31
```  

Focus on the following fields:  

- **Current mode**: Indicates the active SELinux mode.  
- **Mode from config file**: Specifies the mode set in the configuration file.  

#### Method 2: Using `getenforce`  

To display only the current SELinux mode, use:  

```bash
getenforce
```  

The output will be one of the following: `Enforcing`, `Permissive`, or `Disabled`.

---

### **Changing SELinux Operating Mode Temporarily**

You can change the SELinux mode temporarily without modifying configuration files. These changes persist only until the next reboot.  

#### Command: `setenforce`  

Use the `setenforce` command to toggle between **Enforcing** and **Permissive** modes.  

- To switch to Enforcing mode:  

  ```bash
  sudo setenforce 1
  ```  

- To switch to Permissive mode:  

  ```bash
  sudo setenforce 0
  ```  

Verify the change:  

```bash
getenforce
```  

#### Notes on Temporary Changes  

- Temporary changes are useful for testing purposes.  
- SELinux will revert to the mode defined in its configuration file after a reboot.  

---

### **Changing SELinux Operating Mode Permanently**

To make a permanent change, you need to modify the SELinux configuration file.  

#### Step 1: Edit the Configuration File  

Open the `/etc/selinux/config` file in a text editor:  

```bash
sudo nano /etc/selinux/config
```  

#### Step 2: Update the SELINUX Parameter  

Locate the following line:  

```plaintext
SELINUX=enforcing
```  

Change the value to your desired mode:  

- `enforcing` for Enforcing mode.  
- `permissive` for Permissive mode.  
- `disabled` to disable SELinux.  

Example:  

```plaintext
SELINUX=permissive
```  

Save and exit the file.  

#### Step 3: Reboot the System  

For the changes to take effect, reboot your system:  

```bash
sudo reboot
```  

#### Step 4: Verify the New Mode  

After rebooting, verify the active SELinux mode:  

```bash
sestatus
```  

---

### **Common SELinux Policies on AlmaLinux**

SELinux policies define the rules and constraints that govern system behavior. AlmaLinux comes with the following common SELinux policies:  

1. **Targeted Policy**  
   - Applies to specific services and processes.  
   - Default policy in most distributions, including AlmaLinux.  

2. **Strict Policy**  
   - Enforces SELinux rules on all processes.  
   - Not commonly used due to its complexity.  

3. **MLS (Multi-Level Security) Policy**  
   - Designed for environments requiring hierarchical data sensitivity classifications.  

You can view the currently loaded policy in the output of the `sestatus` command under the **Loaded policy name** field.

---

### **Switching SELinux Policies**

If you need to change the SELinux policy, follow these steps:  

#### Step 1: Install the Desired Policy  

Ensure the required policy is installed on your system. For example, to install the strict policy:  

```bash
sudo dnf install selinux-policy-strict
```  

#### Step 2: Modify the Configuration File  

Edit the `/etc/selinux/config` file and update the `SELINUXTYPE` parameter:  

```plaintext
SELINUXTYPE=targeted
```  

Replace `targeted` with the desired policy type (e.g., `strict`).  

#### Step 3: Reboot the System  

Reboot to apply the new policy:  

```bash
sudo reboot
```  

---

### **Testing SELinux Policies in Permissive Mode**

Before enabling a stricter SELinux mode in production, test your policies in Permissive mode.  

#### Steps to Test

1. Set SELinux to Permissive mode temporarily:  

   ```bash
   sudo setenforce 0
   ```  

2. Test applications, services, and configurations to identify potential SELinux denials.  

3. Review logs for denials in `/var/log/audit/audit.log` or using the `ausearch` tool:  

   ```bash
   sudo ausearch -m avc
   ```  

4. Address denials by updating SELinux policies or fixing misconfigurations.  

---

### **Disabling SELinux (When Necessary)**

Disabling SELinux is not recommended for most scenarios, as it weakens system security. However, if required:  

1. Edit the configuration file:  

   ```bash
   sudo nano /etc/selinux/config
   ```  

2. Set `SELINUX=disabled`.  

3. Save the file and reboot the system.  

4. Confirm that SELinux is disabled:  

   ```bash
   sestatus
   ```  

---

### **Troubleshooting SELinux Configuration**

#### Issue 1: Service Fails to Start with SELinux Enabled  

- Check for SELinux denials in the logs:  

  ```bash
  sudo ausearch -m avc
  ```  

- Adjust SELinux rules or contexts to resolve the issue.  

#### Issue 2: Incorrect SELinux File Contexts  

- Restore default SELinux contexts using the `restorecon` command:  

  ```bash
  sudo restorecon -Rv /path/to/file_or_directory
  ```  

#### Issue 3: Persistent Denials in Enforcing Mode  

- Use Permissive mode temporarily to identify the root cause.  

---

### **Best Practices for Configuring SELinux**

1. **Use Enforcing Mode in Production**  
   Always run SELinux in Enforcing mode in production environments to maximize security.  

2. **Test in Permissive Mode**  
   Test new configurations in Permissive mode to identify potential issues before enforcing policies.  

3. **Monitor Audit Logs**  
   Regularly review SELinux logs for potential issues and policy adjustments.  

4. **Apply Contexts Consistently**  
   Use tools like `semanage` and `restorecon` to maintain correct file contexts.  

---

### **Conclusion**

Configuring SELinux operating mode on AlmaLinux is a critical step in hardening your system against unauthorized access and vulnerabilities. By understanding the different operating modes, testing policies, and applying best practices, you can create a secure and stable environment for your applications.  

Whether you’re new to SELinux or looking to optimize your current setup, the flexibility of AlmaLinux and SELinux ensures that you can tailor security to your specific needs.  

Need help crafting custom SELinux policies or troubleshooting SELinux-related issues? Let us know, and we’ll guide you through the process!
