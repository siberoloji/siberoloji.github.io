---
title: Bob Delves into Advanced Security Practices on AlmaLinux
linkTitle: Advenced Security
description: Bob will focus on strengthening the security of his AlmaLinux server and Docker containers. He’ll learn about advanced system hardening, network security
date: 2024-11-13
draft: false
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
weight: 170
keywords:
  - Advanced Security
featured_image: /images/bobs-adventures-with-alma-linux.png
url: bob-delves-advanced-security-practices-alma-linux
translationKey: bob-delves-advanced-security-practices-alma-linux
---

Let’s move on to Chapter 17, *"Bob Delves into Advanced Security Practices"*, where Bob will focus on strengthening the security of his AlmaLinux server and Docker containers. He’ll learn about advanced system hardening, network security, and container-specific security configurations to ensure everything stays protected.

---

## **1. Introduction: Bob’s Security Mission**

As his knowledge grows, Bob realizes that with great power comes great responsibility! His AlmaLinux server and Docker containers are becoming essential parts of the team’s infrastructure, so he decides to take a deep dive into advanced security practices. By hardening his system, he’ll be able to prevent unauthorized access and protect sensitive data.

> *“Time to secure my system against any threats!”* Bob says, ready to step up his security game.

---

## **2. Hardening SSH with Two-Factor Authentication**

Bob has already configured SSH for remote access, but he wants to make it more secure with **two-factor authentication (2FA)**.

- **Installing Google Authenticator**: Bob installs the Google Authenticator PAM module:

  ```bash
  sudo dnf install google-authenticator
  ```

- **Configuring 2FA for SSH**: He runs the following command to set up a QR code for two-factor authentication:

  ```bash
  google-authenticator
  ```

  After scanning the code with his phone, he follows the prompts to set up emergency codes and enable rate limiting.

- **Enabling PAM Authentication for SSH**: Bob edits `/etc/ssh/sshd_config` to require 2FA by setting:

  ```bash
  ChallengeResponseAuthentication yes
  ```

  He then adds `auth required pam_google_authenticator.so` to `/etc/pam.d/sshd`.

- **Restarting SSH**: To apply the new settings, he restarts the SSH service:

  ```bash
  sudo systemctl restart sshd
  ```

> *“With two-factor authentication, my SSH is now much more secure!”* Bob says, feeling more confident about remote access security.

---

**3. Configuring `firewalld` with Advanced Rules**

To further secure network access, Bob decides to use more advanced **`firewalld`** rules to control access by IP and port.

- **Setting Up a Whitelist for SSH**: Bob limits SSH access to specific trusted IP addresses by creating a new zone:

  ```bash
  sudo firewall-cmd --new-zone=trustedssh --permanent
  sudo firewall-cmd --zone=trustedssh --add-service=ssh --permanent
  sudo firewall-cmd --zone=trustedssh --add-source=192.168.1.10/32 --permanent
  sudo firewall-cmd --reload
  ```

  Only users from the trusted IP will now be able to connect via SSH.

- **Restricting Other Ports**: Bob removes access to non-essential ports by disabling those services:

  ```bash
  sudo firewall-cmd --remove-service=ftp --permanent
  sudo firewall-cmd --reload
  ```

> *“Now only the IPs I trust can access my server through SSH!”* Bob says, happy with his locked-down firewall.

---

## **4. Securing Docker Containers with Custom Networks**

Bob learns that containers by default share the same network, which can introduce security risks. He decides to create custom Docker networks to isolate containers.

- **Creating a Custom Network**: He creates a bridge network for specific containers:

  ```bash
  sudo docker network create secure-net
  ```

- **Attaching Containers to the Network**: When running containers, he specifies the `secure-net` network:

  ```bash
  sudo docker run -d --name web-app --network secure-net nginx
  sudo docker run -d --name db --network secure-net mysql
  ```

- **Using `docker network inspect` to Verify Isolation**: Bob verifies the setup to make sure only containers on `secure-net` can communicate with each other:

  ```bash
  sudo docker network inspect secure-net
  ```

> *“Isolating containers on separate networks keeps them safer!”* Bob notes, glad for the added control.

---

## **5. Setting Resource Limits on Containers**

Bob realizes that resource limits can prevent containers from monopolizing system resources, which is crucial in case a container gets compromised.

- **Setting CPU and Memory Limits**: To limit a container’s resource usage, Bob uses the `--memory` and `--cpus` options:

  ```bash
  sudo docker run -d --name limited-app --memory="512m" --cpus="0.5" nginx
  ```

  This restricts the container to 512 MB of RAM and 50% of one CPU core.

> *“Now each container is limited to a safe amount of resources!”* Bob says, pleased to know his system won’t be overrun.

---

**6. Using Docker Security Scanning with `docker scan`**

Bob learns that `docker scan` is a built-in tool for identifying vulnerabilities in images, helping him spot potential security risks.

- **Scanning an Image for Vulnerabilities**: Bob scans his custom Nginx image for vulnerabilities:

  ```bash
  sudo docker scan my-nginx
  ```

  This command generates a report of any vulnerabilities and suggests fixes, allowing Bob to address issues before deploying the container.

> *“Scanning images is a quick way to catch vulnerabilities early on,”* Bob says, feeling proactive.

---

## **7. Enabling SELinux on AlmaLinux**

Bob knows that SELinux (Security-Enhanced Linux) can add another layer of security by enforcing strict access policies.

- **Checking SELinux Status**: He checks if SELinux is already enabled:

  ```bash
  sudo sestatus
  ```

  If SELinux is in permissive or disabled mode, he switches it to enforcing by editing `/etc/selinux/config` and setting:

  ```bash
  SELINUX=enforcing
  ```

- **Enabling SELinux Policies for Docker**: If needed, Bob installs the SELinux policies for Docker:

  ```bash
  sudo dnf install container-selinux
  ```

  This ensures that containers follow SELinux rules, adding extra protection against unauthorized access.

> *“With SELinux, I have even tighter control over access and security,”* Bob says, happy to add this layer of defense.

---

## **8. Setting Up Fail2ban for Intrusion Prevention**

Bob installs **Fail2ban**, a tool that automatically bans IP addresses after multiple failed login attempts, preventing brute-force attacks.

- **Installing Fail2ban**: He installs the package:

  ```bash
  sudo dnf install fail2ban
  ```

- **Configuring Fail2ban for SSH**: Bob creates a configuration file to monitor SSH:

  ```bash
  sudo nano /etc/fail2ban/jail.local
  ```

  In the file, he sets up basic rules to ban IPs with failed login attempts:

  ```bash
  [sshd]
  enabled = true
  port = 2222
  logpath = /var/log/secure
  maxretry = 5
  ```

- **Starting Fail2ban**: To activate Fail2ban, he starts the service:

  ```bash
  sudo systemctl start fail2ban
  sudo systemctl enable fail2ban
  ```

> *“Fail2ban will keep persistent intruders out automatically,”* Bob says, feeling even more secure.

---

## **9. Regular Security Audits with Lynis**

Bob decides to set up **Lynis**, a powerful auditing tool for regular system checks.

- **Installing Lynis**: He downloads and installs Lynis:

  ```bash
  sudo dnf install lynis
  ```

- **Running an Audit**: He runs a full audit with:

  ```bash
  sudo lynis audit system
  ```

  Lynis provides detailed recommendations on improving system security, helping Bob stay ahead of any potential vulnerabilities.

> *“With regular audits, I’ll always know where my security stands,”* Bob notes, appreciating the thoroughness of Lynis.

---

## **10. Conclusion: Bob’s Hardened Security Setup**

Bob has implemented two-factor authentication, firewall restrictions, container isolation, SELinux policies, Fail2ban, and more. His AlmaLinux server and Docker containers are now highly secure, ready to withstand a wide range of threats.

> Next up, Bob is eager to explore **Linux scripting and automation** to enhance his workflow and manage tasks efficiently.

*Stay tuned for the next chapter: "Bob’s Guide to Linux Scripting and Automation!"*
