---
draft: false
title: Bob’s Guide to Mastering SSH on AlmaLinux
linkTitle: Mastering SSH on AlmaLinux
keywords:
  - Mastering SSH on AlmaLinux
description: "He could control over any server in the company, all from his desk. But first, he needed to learn how SSH worked and configure it properly on AlmaLinux.  "
date: 2024-11-23
url: bobs-guide-mastering-ssh-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs
prev: ""
next: ""
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 610
toc: true
excludeSearch: false
sidebar:
  open: true
featured_image: /images/bobs-adventures-with-alma-linux.png
---
## **Introduction: Bob Discovers SSH**

It was a typical morning at the office when Bob, our enthusiastic junior system administrator, found himself in a sticky situation. The company’s database server had gone offline, and Bob needed to restart it immediately. There was just one problem—the server was located in a secure data center miles away.  

His manager chuckled and handed Bob a sticky note with two cryptic words: *"Use SSH."*  

> *“SSH? Is that some kind of secret handshake?”* Bob muttered to himself as he sat back at his desk. A quick internet search revealed that SSH, or Secure Shell, was a protocol used to securely access remote systems over a network.  

With this newfound knowledge, Bob felt a rush of excitement. For the first time, he realized he could wield control over any server in the company, all from his desk. But first, he needed to learn how SSH worked and configure it properly on AlmaLinux.

> *“If I can master SSH,”* Bob thought, *“I’ll never have to leave my cozy chair to fix servers again!”*

---

As Bob embarked on his SSH adventure, he began by setting up SSH on a test server. Little did he know that this simple tool would become an indispensable part of his admin toolkit, unlocking the power to manage servers securely and efficiently, no matter where he was.

---

### Setting Up SSH on AlmaLinux

Bob rolled up his sleeves, ready to dive into the magical world of SSH. He knew the first step was to enable SSH on his AlmaLinux server. Armed with his favorite text editor and the terminal, he began configuring the remote access that would change how he managed servers forever.

---

#### **Step 1: Installing the SSH Server**

Bob checked if SSH was already installed on his AlmaLinux system. By default, AlmaLinux comes with OpenSSH, the most widely used SSH server, but it’s always good to confirm.  

- To install the OpenSSH server:

  ```bash
  sudo dnf install -y openssh-server
  ```

- To verify the installation:

  ```bash
  ssh -V
  ```

  > *“Version check, complete! Looks like OpenSSH is good to go,”* Bob said, satisfied.

---

#### **Step 2: Enabling and Starting the SSH Service**

Now, Bob had to make sure the SSH service was running and configured to start at boot.  

- To enable and start the SSH service:

  ```bash
  sudo systemctl enable sshd --now
  ```

- To check the status of the SSH service:

  ```bash
  sudo systemctl status sshd
  ```

  If running successfully, Bob would see an active (running) status:

  ```bash
  ● sshd.service - OpenSSH server daemon
       Active: active (running) since ...
  ```

> *“The SSH service is running—this is going to be fun!”* Bob thought, as he moved to the next step.

---

#### **Step 3: Testing SSH Locally**

Bob wanted to confirm that SSH was working on the server before attempting remote connections.

- He used the `ssh` command to connect to his own machine:

  ```bash
  ssh localhost
  ```

  When prompted for the password, Bob entered it, and voilà—he was logged into his own server.  

> *“I’m officially SSHing into my server! Now, let’s try it remotely.”*  

---

#### **Step 4: Testing SSH Remotely**

Bob then tried accessing the server from another machine. He found the server’s IP address with:

```bash
ip addr
```

For example, if the IP was `192.168.1.10`, he connected with:

```bash
ssh bob@192.168.1.10
```

He entered his password when prompted, and within seconds, he was in.

> *“This is amazing—I don’t even need to leave my desk to manage my server!”* Bob exclaimed.

---

#### **Step 5: Configuring the SSH Daemon**

Bob wanted to make SSH more secure and tailored to his needs by tweaking its configuration file.

- He opened the SSH daemon configuration file:

  ```bash
  sudo nano /etc/ssh/sshd_config
  ```

Here are some of the changes Bob made:

- **Disable root login**:

  ```plaintext
  PermitRootLogin no
  ```

  > *“No one messes with root on my watch!”* Bob declared.

- **Specify the allowed users**:

  ```plaintext
  AllowUsers bob
  ```

  > This ensures only Bob can log in via SSH.

- **Set a custom port**:

  ```plaintext
  Port 2222
  ```

  > Using a non-default port reduces the risk of automated attacks.

- **Save and restart the SSH service**:

  ```bash
  sudo systemctl restart sshd
  ```

---

#### **Step 6: Allowing SSH Through the Firewall**

Bob realized he needed to allow SSH through the server’s firewall.

- If using the default port (22):

  ```bash
  sudo firewall-cmd --permanent --add-service=ssh
  sudo firewall-cmd --reload
  ```

- If using a custom port (e.g., 2222):

  ```bash
  sudo firewall-cmd --permanent --add-port=2222/tcp
  sudo firewall-cmd --reload
  ```

> *“Firewall configured, and SSH is secure—what could possibly go wrong?”* Bob said confidently.

---

### What’s Next?

Bob now had a fully functional SSH setup on AlmaLinux. He felt a surge of pride as he effortlessly managed his server remotely. However, he quickly realized that typing passwords for every login could be tedious—and perhaps less secure than using SSH keys.  

> *“Passwordless authentication is the future,”* Bob mused. He grabbed his coffee and prepared to tackle **SSH Key Management**.
