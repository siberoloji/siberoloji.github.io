---
draft: false
title: SSH Key Management on AlmaLinux
linkTitle: SSH Key Management on AlmaLinux
keywords:
  - SSH Key Management
description: Passwordless login would save him time and eliminate the risk of weak passwords being compromised. SSH Key Management is our subject.
date: 2024-11-23
url: ssh-key-management-alma-linux
tags:
  - AlmaLinux
  - bob system administrator
categories:
  - Linux
type: docs


author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

weight: 620
toc: true
excludeSearch: false


featured_image: /images/bobs-adventures-with-alma-linux.png
---
### **SSH Key Management on AlmaLinux**

With his SSH setup running smoothly, Bob decided it was time to enhance security and convenience by using SSH keys for authentication. Passwordless login would save him time and eliminate the risk of weak passwords being compromised.

> *“If I never have to type my password again, it’ll still be too soon!”* Bob thought, ready to dive in.

---

#### **Step 1: Generating an SSH Key Pair**  

Bob’s first step was to create an SSH key pair—a private key (kept secret) and a public key (shared with the server).

- To generate the key pair, Bob used `ssh-keygen`:
  ```bash
  ssh-keygen -t rsa -b 4096 -C "bob@example.com"
  ```
  - `-t rsa`: Specifies the RSA algorithm.
  - `-b 4096`: Sets a strong key length of 4096 bits.
  - `-C "bob@example.com"`: Adds a comment (usually an email) to identify the key.

> Bob was prompted to save the key. He pressed Enter to accept the default location (`~/.ssh/id_rsa`).  

He could also set a passphrase for added security. While optional, Bob chose a strong passphrase to protect his private key.

> *“Key pair generated! I feel like a secret agent!”* Bob joked.

---

#### **Step 2: Copying the Public Key to the Server**  

Bob needed to share his public key (`~/.ssh/id_rsa.pub`) with the remote server.  

- The simplest way was to use `ssh-copy-id`:
  ```bash
  ssh-copy-id -i ~/.ssh/id_rsa.pub bob@192.168.1.10
  ```

  This command securely added Bob’s public key to the server’s `~/.ssh/authorized_keys` file.  

  If `ssh-copy-id` wasn’t available, Bob could manually copy the key:  
  - Display the key content:
    ```bash
    cat ~/.ssh/id_rsa.pub
    ```
  - Append it to the server’s `~/.ssh/authorized_keys`:
    ```bash
    echo "public-key-content" >> ~/.ssh/authorized_keys
    ```

- Ensure correct permissions for the `.ssh` directory and the `authorized_keys` file:
  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/authorized_keys
  ```

> *“Key copied! Let’s see if this magic works.”* Bob said, excited to test it.

---

#### **Step 3: Testing Passwordless Login**  

Bob tested the setup by connecting to the server:
```bash
ssh bob@192.168.1.10
```

If everything was configured correctly, Bob was logged in without being prompted for a password.

> *“Success! No more passwords—this is the life!”* Bob cheered, logging in with ease.

---

#### **Step 4: Configuring SSH for Multiple Servers**  

Managing multiple servers was now much easier with passwordless login, but Bob wanted to simplify it further by setting up SSH aliases.

- He edited the `~/.ssh/config` file:
  ```plaintext
  Host myserver
      HostName 192.168.1.10
      User bob
      Port 2222
      IdentityFile ~/.ssh/id_rsa
  ```

  Now, Bob could connect to the server with a simple command:
  ```bash
  ssh myserver
  ```

> *“Aliases save me so much time—I love it!”* Bob said, feeling like a pro.

---

#### **Step 5: Securing the Private Key**  

Bob knew that keeping his private key safe was critical.  

- He ensured proper permissions on the private key:
  ```bash
  chmod 600 ~/.ssh/id_rsa
  ```

- To add another layer of protection, Bob used an SSH agent to temporarily store the key in memory:
  ```bash
  ssh-agent bash
  ssh-add ~/.ssh/id_rsa
  ```

> *“Now my key is secure and easy to use—it’s the best of both worlds!”* Bob thought.

---

#### **Step 6: Troubleshooting Common Issues**

Bob encountered a few hiccups along the way, but he quickly resolved them:  

- **“Permission denied (publickey)” error:**  
  - Bob ensured the `~/.ssh/authorized_keys` file on the server had the correct permissions (`600`).  
  - He verified the `sshd_config` file allowed key authentication:
    ```plaintext
    PubkeyAuthentication yes
    ```

- **Passphrase prompts every time:**  
  - Bob added his key to the agent:
    ```bash
    ssh-add ~/.ssh/id_rsa
    ```

- **Key not working after reboot:**  
  - Bob used `eval` to start the agent on login:
    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```

> *“A little troubleshooting goes a long way!”* Bob said, relieved.

---

### What’s Next?

With SSH keys in place, Bob felt unstoppable. However, his manager pointed out that even the most secure systems could be targeted by brute force attacks.  

> *“Time to take SSH security to the next level!”* Bob decided, as he prepared to install **Fail2Ban** and set up **Two-Factor Authentication**.
