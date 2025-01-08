---
title: How to Install Python 3.9 on AlmaLinux
linkTitle: Install Python 3.9
description: This guide will walk you through the process of installing Python 3.9 on AlmaLinux,
date: 2025-01-08T11:15:15.964Z
weight: 1830
url: install-python-3-9-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
  - python 3.9
featured_image: /images/almalinux.webp
---
Python is one of the most popular programming languages in the world, valued for its simplicity, versatility, and extensive library support. Whether you’re a developer working on web applications, data analysis, or automation, Python 3.9 offers several new features and optimizations to enhance your productivity. This guide will walk you through the process of installing Python 3.9 on AlmaLinux, a community-driven enterprise operating system derived from RHEL.

---

### **Why Python 3.9?**

Python 3.9 introduces several enhancements, including:

- **New Syntax Features**:
  - Dictionary merge and update operators (`|` and `|=`).
  - New string methods like `str.removeprefix()` and `str.removesuffix()`.
- **Performance Improvements**: Faster execution for some operations.
- **Improved Typing**: Type hints are more powerful and versatile.
- **Module Enhancements**: Updates to modules like `zoneinfo` for timezone handling.

Using Python 3.9 ensures compatibility with the latest libraries and frameworks while enabling you to take advantage of its new features.

---

### **Prerequisites**

Before proceeding, ensure the following:

1. **AlmaLinux system**: A fresh installation of AlmaLinux with root or sudo privileges.
2. **Terminal access**: Familiarity with Linux command-line tools.
3. **Basic knowledge of Python**: Understanding of Python basics will help in testing the installation.

---

### **Step 1: Update Your System**

Begin by updating your AlmaLinux system to ensure all packages are up-to-date:

```bash
sudo dnf update -y
```

This ensures that you have the latest security patches and package versions.

---

### **Step 2: Check the Default Python Version**

AlmaLinux comes with a default version of Python, which is used for system utilities. Check the currently installed version:

```bash
python3 --version
```

The default version might not be Python 3.9. To avoid interfering with system utilities, we’ll install Python 3.9 separately.

---

### **Step 3: Enable the Required Repositories**

To install Python 3.9 on AlmaLinux, you need to enable the **EPEL (Extra Packages for Enterprise Linux)** and **PowerTools** repositories.

#### Enable EPEL Repository

Install the EPEL repository by running:

```bash
sudo dnf install -y epel-release
```

#### Enable PowerTools Repository

Enable the PowerTools repository (renamed to `crb` in AlmaLinux 9):

```bash
sudo dnf config-manager --set-enabled crb
```

These repositories provide additional packages and dependencies required for Python 3.9.

---

### **Step 4: Install Python 3.9**

With the repositories enabled, install Python 3.9:

```bash
sudo dnf install -y python39
```

#### Verify the Installation

Once the installation is complete, check the Python version:

```bash
python3.9 --version
```

You should see an output like:

```
Python 3.9.x
```

---

### **Step 5: Set Python 3.9 as Default (Optional)**

If you want to use Python 3.9 as the default version of Python 3, you can update the alternatives system. This is optional but helpful if you plan to primarily use Python 3.9.

#### Configure Alternatives

Run the following commands to configure `alternatives` for Python:

```bash
sudo alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
sudo alternatives --config python3
```

You’ll be prompted to select the version of Python you want to use as the default. Choose the option corresponding to Python 3.9.

#### Verify the Default Version

Check the default version of Python 3:

```bash
python3 --version
```

---

### **Step 6: Install pip for Python 3.9**

`pip` is the package manager for Python and is essential for managing libraries and dependencies.

#### Install pip

Install `pip` for Python 3.9 with the following command:

```bash
sudo dnf install -y python39-pip
```

#### Verify pip Installation

Check the installed version of pip:

```bash
pip3.9 --version
```

Now, you can use `pip3.9` to install Python packages.

---

### **Step 7: Create a Virtual Environment**

To manage dependencies effectively, it’s recommended to use virtual environments. Virtual environments isolate your projects, ensuring they don’t interfere with each other or the system Python installation.

#### Create a Virtual Environment

Run the following commands to create and activate a virtual environment:

```bash
python3.9 -m venv myenv
source myenv/bin/activate
```

You’ll notice your terminal prompt changes to indicate the virtual environment is active.

#### Install Packages in the Virtual Environment

While the virtual environment is active, you can use `pip` to install packages. For example:

```bash
pip install numpy
```

#### Deactivate the Virtual Environment

When you’re done, deactivate the virtual environment by running:

```bash
deactivate
```

---

### **Step 8: Test the Installation**

Let’s create a simple Python script to verify that everything is working correctly.

#### Create a Test Script

Create a new file named `test.py`:

```bash
nano test.py
```

Add the following code:

```python
print("Hello, Python 3.9 on AlmaLinux!")
```

Save the file and exit the editor.

#### Run the Script

Execute the script using Python 3.9:

```bash
python3.9 test.py
```

You should see the output:

```
Hello, Python 3.9 on AlmaLinux!
```

---

### **Step 9: Troubleshooting**

Here are some common issues you might encounter during installation and their solutions:

1. **`python3.9: command not found`**:
   - Ensure Python 3.9 is installed correctly using `sudo dnf install python39`.
   - Verify the installation path: `/usr/bin/python3.9`.

2. **`pip3.9: command not found`**:
   - Reinstall pip using `sudo dnf install python39-pip`.

3. **Conflicts with Default Python**:
   - Avoid replacing the system’s default Python version, as it might break system utilities. Use virtual environments instead.

---

### **Step 10: Keeping Python 3.9 Updated**

To keep Python 3.9 updated, use `dnf` to check for updates periodically:

```bash
sudo dnf upgrade python39
```

Alternatively, consider using `pyenv` for managing multiple Python versions if you frequently work with different versions.

---

### **Conclusion**

Installing Python 3.9 on AlmaLinux equips you with a powerful tool for developing modern applications. By following this guide, you’ve successfully installed Python 3.9, set up pip, created a virtual environment, and verified the installation. AlmaLinux provides a stable and secure foundation, making it an excellent choice for running Python applications in production.

Whether you’re building web applications, automating tasks, or diving into data science, Python 3.9 offers the features and stability to support your projects. Happy coding!
