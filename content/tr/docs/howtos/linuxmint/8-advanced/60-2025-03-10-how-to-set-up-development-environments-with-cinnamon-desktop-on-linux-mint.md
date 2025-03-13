---
draft: true
title: How to Set Up Development Environments with Cinnamon Desktop on Linux Mint
linkTitle: How to Set Up Development Environments
translationKey: how-to-set-up-development-environments-with-cinnamon-desktop
description: Learn how to set up a development environment with Cinnamon desktop on Linux Mint.
url: how-to-set-up-development-environments-with-cinnamon-desktop
weight: 60
date: 2025-03-10
tags:
  - Linux Mint
  - how-to guides
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - Linux Mint
  - set up development environments
featured_image: /images/linuxmint1.webp
---
Linux Mint, with its Cinnamon desktop environment, is a popular choice for developers who seek a stable, user-friendly, and customizable operating system. Cinnamon provides a modern and intuitive interface, making it an excellent platform for setting up development environments. Whether you're a web developer, data scientist, or software engineer, Linux Mint offers the flexibility and tools needed to create a productive workspace.

In this blog post, we’ll walk you through the process of setting up a development environment on Linux Mint with the Cinnamon desktop. We’ll cover everything from installing essential tools to configuring your workspace for maximum productivity. By the end of this guide, you’ll have a fully functional development environment tailored to your needs.

---

## Why Choose Linux Mint with Cinnamon for Development?

Before diving into the setup process, let’s briefly discuss why Linux Mint and Cinnamon are great choices for developers:

1. **Stability**: Linux Mint is based on Ubuntu LTS (Long-Term Support) releases, ensuring a stable and reliable foundation for your work.
2. **User-Friendly**: Cinnamon’s desktop environment is intuitive and easy to navigate, even for beginners.
3. **Customizability**: Cinnamon allows you to tweak your desktop to suit your workflow, from keyboard shortcuts to applets and desklets.
4. **Lightweight**: Compared to other desktop environments, Cinnamon is relatively lightweight, ensuring smooth performance even on older hardware.
5. **Open-Source**: Linux Mint and Cinnamon are open-source, meaning you have full control over your system and can modify it as needed.

---

## Step 1: Update Your System

Before setting up your development environment, it’s essential to ensure your system is up to date. Open a terminal and run the following commands:

```bash
sudo apt update
sudo apt upgrade
```

This will update your package list and upgrade all installed packages to their latest versions.

---

## Step 2: Install Essential Development Tools

### Install Build Essentials

Most development workflows require basic build tools like `gcc`, `make`, and `g++`. Install them using:

```bash
sudo apt install build-essential
```

### Install Git

Git is a must-have for version control. Install it with:

```bash
sudo apt install git
```

After installation, configure your Git username and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Install Curl and Wget

These tools are useful for downloading files and scripts from the internet:

```bash
sudo apt install curl wget
```

---

## Step 3: Set Up Your Programming Languages

### Python

Python is pre-installed on Linux Mint, but you may want to install the latest version or manage multiple versions using `pyenv`.

1. Install Python and pip:

   ```bash
   sudo apt install python3 python3-pip
   ```

2. (Optional) Install `pyenv` for version management:

   ```bash
   curl https://pyenv.run | bash
   ```

   Add the following lines to your `~/.bashrc` file:

   ```bash
   export PATH="$HOME/.pyenv/bin:$PATH"
   eval "$(pyenv init --path)"
   eval "$(pyenv init -)"
   eval "$(pyenv virtualenv-init -)"
   ```

   Reload your shell:

   ```bash
   source ~/.bashrc
   ```

   Now you can install and switch between Python versions using `pyenv`.

### Node.js and npm

For JavaScript development, install Node.js and npm:

1. Install Node.js from the NodeSource repository:

   ```bash
   curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
   sudo apt install -y nodejs
   ```

2. Verify the installation:

   ```bash
   node -v
   npm -v
   ```

### Java

To install Java Development Kit (JDK):

```bash
sudo apt install default-jdk
```

Verify the installation:

```bash
java -version
javac -version
```

---

## Step 4: Install and Configure Your IDE or Text Editor

### Visual Studio Code

Visual Studio Code (VS Code) is a popular code editor for developers. To install it:

1. Download the `.deb` package from the [official website](https://code.visualstudio.com/).
2. Install it using:

   ```bash
   sudo apt install ./<downloaded-file>.deb
   ```

3. Install useful extensions like Python, ESLint, and Docker from the Extensions Marketplace.

### IntelliJ IDEA (for Java/Kotlin)

For Java or Kotlin development, IntelliJ IDEA is a powerful IDE:

1. Download the Community Edition from the [official website](https://www.jetbrains.com/idea/download/).
2. Extract the tarball and run the `idea.sh` script:

   ```bash
   tar -xzf ideaIC-*.tar.gz
   cd idea-IC-*/bin
   ./idea.sh
   ```

### Sublime Text

Sublime Text is a lightweight and fast text editor:

1. Install Sublime Text:

   ```bash
   wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
   sudo apt install apt-transport-https
   echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
   sudo apt update
   sudo apt install sublime-text
   ```

2. Install Package Control and useful packages like Emmet and GitGutter.

---

## Step 5: Set Up Version Control and Collaboration Tools

### GitHub CLI

The GitHub CLI tool simplifies working with GitHub repositories:

```bash
sudo apt install gh
```

Authenticate with GitHub:

```bash
gh auth login
```

### Docker

Docker is essential for containerized development:

1. Install Docker:

   ```bash
   sudo apt install docker.io
   ```

2. Add your user to the `docker` group:

   ```bash
   sudo usermod -aG docker $USER
   ```

3. Start and enable Docker:

   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

---

## Step 6: Customize Your Cinnamon Desktop for Productivity

### Keyboard Shortcuts

Cinnamon allows you to create custom keyboard shortcuts for frequently used commands. For example:

1. Go to **Menu > Preferences > Keyboard > Shortcuts**.
2. Add a new shortcut for opening your terminal or IDE.

### Workspaces

Use workspaces to organize your tasks:

1. Enable workspaces in **Menu > Preferences > Workspaces**.
2. Switch between workspaces using `Ctrl + Alt + Arrow Keys`.

### Applets and Desklets

Enhance your desktop with applets like **System Monitor** or **Weather**:

1. Right-click on the panel and select **Applets**.
2. Install and configure applets to suit your workflow.

---

## Step 7: Install Additional Tools

### Database Management

For database development, install tools like MySQL or PostgreSQL:

```bash
sudo apt install mysql-server postgresql
```

### Browser Tools

Install browsers like Firefox and Chrome for web development:

```bash
sudo apt install firefox
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
```

---

## Step 8: Backup and Sync Your Environment

### Timeshift

Use Timeshift to create system snapshots:

```bash
sudo apt install timeshift
```

### Syncthing

Sync your development files across devices with Syncthing:

```bash
sudo apt install syncthing
```

---

## Conclusion

Setting up a development environment on Linux Mint with the Cinnamon desktop is a straightforward process that offers a stable, customizable, and efficient workspace. By following this guide, you’ve installed essential tools, configured your IDE, and customized your desktop for productivity.

Linux Mint’s Cinnamon desktop provides a perfect balance of simplicity and power, making it an excellent choice for developers of all levels. Whether you’re building web applications, writing scripts, or developing software, your new environment is ready to support your creative endeavors.
