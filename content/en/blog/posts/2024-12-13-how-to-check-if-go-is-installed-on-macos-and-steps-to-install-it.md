---
title: How to Check if Go is Installed on macOS and Steps to Install It
description: If you’re working on a macOS system and want to start using Go, the first step is to determine whether it’s already installed and, if not, to install it. This guide will walk you through these processes step by step.
linkTitle: Check if Go is Installed
date: 2024-12-13
type: blog
draft: false
toc: true
tags: []
categories: []
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))

featured_image: ""


url: check-installed-macos-steps-install-go-lang
---
The Go programming language, often referred to as Golang, is a versatile and efficient language developed by Google. Its simplicity, strong concurrency support, and efficient performance make it a popular choice for developing web applications, distributed systems, and cloud-native software. If you’re working on a macOS system and want to start using Go, the first step is to determine whether it’s already installed and, if not, to install it. This guide will walk you through these processes step by step.

---

### **How to Check if Go is Installed on macOS**

Before installing Go, it’s a good idea to check if it’s already installed on your system. Here are the steps to do so:

#### **1. Open the Terminal**

The Terminal is a command-line interface on macOS that allows you to interact with your system directly. To open it:

- Use the keyboard shortcut `Command + Space` to open Spotlight Search.
- Type "Terminal" and press `Enter`.

#### **2. Check for Go Installation**

Type the following command in the Terminal and press `Enter`:

```bash
go version
```

- If Go is installed, you will see output similar to:
  
  ```zsh
  go version go1.21.1 darwin/amd64
  ```

  This output indicates that Go version 1.21.1 is installed on your macOS system.

- If Go is not installed, you will see an error message like:

  ```zsh
  zsh: command not found: go
  ```

#### **3. Check Environment Variables (Optional)**

To ensure Go is properly configured, check the `GOPATH` and `GOROOT` environment variables. These can be viewed with the following commands:

```bash
echo $GOPATH
echo $GOROOT
```

If these variables return empty results, Go might not be properly set up even if it is installed.

---

### **How to Install Go on macOS**

If Go is not installed, you can easily set it up. Here are the steps to install Go on macOS.

#### **1. Download Go**

The official Go programming language binaries can be downloaded from the [Go Downloads page](https://go.dev/dl/).

- Open your web browser and navigate to the Go Downloads page.
- Select the macOS installer package (`.pkg`) that corresponds to your system architecture (typically `amd64` or `arm64` for newer Apple Silicon Macs).

#### **2. Install Go Using the macOS Installer**

Once the `.pkg` file has been downloaded, follow these steps:

1. Locate the downloaded file in your `Downloads` folder or wherever you saved it.
2. Double-click the `.pkg` file to launch the installer.
3. Follow the on-screen instructions to complete the installation. You may need to provide your administrator password.
4. The installer will place the Go binaries in `/usr/local/go` by default and configure the necessary environment variables.

#### **3. Verify the Installation**

After installation, verify that Go is installed and configured correctly:

1. Open the Terminal.
2. Type the following command:

   ```bash
   go version
   ```

   You should see output indicating the installed version of Go.

#### **4. Set Up Environment Variables**

To ensure Go is properly integrated with your macOS system, you may need to set up environment variables in your shell configuration file.

##### For zsh (Default Shell in macOS Catalina and Later)

1. Open the `.zshrc` file in a text editor:

   ```bash
   nano ~/.zshrc
   ```

2. Add the following lines to configure Go paths:

   ```bash
   export PATH=$PATH:/usr/local/go/bin
   export GOPATH=$HOME/go
   export GOROOT=/usr/local/go
   ```

3. Save the file by pressing `Control + O`, then press `Enter`.
4. Exit the editor with `Control + X`.
5. Reload the shell configuration:

   ```bash
   source ~/.zshrc
   ```

##### For bash (If You Use It Instead of zsh)

1. Open the `.bash_profile` file:

   ```bash
   nano ~/.bash_profile
   ```

2. Add the same environment variable configurations as shown above.
3. Save and reload the configuration using the steps provided for zsh.

#### **5. Test Your Go Installation**

To confirm everything is set up correctly, create a simple Go program and run it.

1. Create a directory for your Go projects:

   ```bash
   mkdir -p $GOPATH/src/hello
   cd $GOPATH/src/hello
   ```

2. Create a new Go file:

   ```bash
   nano main.go
   ```

3. Add the following code to `main.go`:

   ```go
   package main

   import "fmt"

   func main() {
       fmt.Println("Hello, Go on macOS!")
   }
   ```

4. Save the file and exit the editor.

5. Run the program:

   ```bash
   go run main.go
   ```

   You should see the following output:

   ```bash
   Hello, Go on macOS!
   ```

---

### **Installing Go Using Homebrew (Alternative Method)**

Another convenient way to install Go on macOS is by using Homebrew, a popular package manager for macOS.

#### **1. Install Homebrew (If Not Already Installed)**

If you don’t have Homebrew installed, install it by running the following command in the Terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions to complete the installation.

#### **2. Install Go Using Homebrew**

1. Once Homebrew is installed, use the following command to install Go:

   ```bash
   brew install go
   ```

2. Verify the installation by checking the version:

   ```bash
   go version
   ```

   Homebrew automatically sets up the necessary environment paths for Go, but you can manually configure them as described earlier if needed.

#### **3. Keep Go Updated**

With Homebrew, updating Go is simple. Run:

```bash
brew upgrade go
```

---

### **Conclusion**

Installing and configuring the Go programming language on macOS is a straightforward process. Whether you choose the official installer or opt for the convenience of Homebrew, the steps outlined in this guide will ensure that you can get started with Go quickly and efficiently. Once installed, you’ll be ready to build robust and efficient software, taking advantage of Go’s unique features and capabilities.
