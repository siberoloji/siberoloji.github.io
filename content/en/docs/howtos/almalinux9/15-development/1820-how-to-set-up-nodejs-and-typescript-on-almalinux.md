---
title: How to Set Up Node.js and TypeScript on AlmaLinux
linkTitle: Set Up Node.js and TypeScript
description: If you’re using AlmaLinux, a robust, community-driven Linux distribution derived from RHEL, this guide will walk you through the steps to set up Node.js with TypeScript.
date: 2025-01-08T11:13:48.532Z
weight: 1820
url: set-node-js-typescript-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
keywords:
  - AlmaLinux
  - node.js
  - typescript
featured_image: /images/almalinux.webp
---
Node.js is a powerful runtime for building scalable, server-side applications, and TypeScript adds a layer of type safety to JavaScript, enabling developers to catch errors early in the development cycle. Combining these two tools creates a strong foundation for developing modern web applications. If you’re using AlmaLinux, a robust, community-driven Linux distribution derived from RHEL, this guide will walk you through the steps to set up Node.js with TypeScript.

---

### **Why Choose Node.js with TypeScript?**

Node.js is popular for its non-blocking, event-driven architecture, which makes it ideal for building real-time applications. However, JavaScript’s dynamic typing can sometimes lead to runtime errors that are hard to debug. TypeScript mitigates these issues by introducing static typing and powerful development tools, including better editor support, auto-completion, and refactoring capabilities.

AlmaLinux, as an enterprise-grade Linux distribution, provides a stable and secure environment for deploying applications. Setting up Node.js and TypeScript on AlmaLinux ensures you’re working on a reliable platform optimized for performance.

---

### **Prerequisites**

Before starting, ensure you have the following:

1. **A fresh AlmaLinux installation**: This guide assumes you have administrative access.
2. **Root or sudo privileges**: Most commands will require superuser permissions.
3. **Basic knowledge of the terminal**: Familiarity with Linux commands will help you navigate through this guide.

---

### **Step 1: Update the System**

Start by ensuring your system is up-to-date:

```bash
sudo dnf update -y
```

This command updates all installed packages and ensures you have the latest security patches and features.

---

### **Step 2: Install Node.js**

There are multiple ways to install Node.js on AlmaLinux, but the recommended method is using the NodeSource repository to get the latest version.

#### Add the NodeSource Repository
NodeSource provides RPM packages for Node.js. Use the following commands to add the repository and install Node.js:

```bash
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
```

Replace `18.x` with the version you want to install. This script sets up the Node.js repository.

#### Install Node.js
After adding the repository, install Node.js with:

```bash
sudo dnf install -y nodejs
```

#### Verify the Installation
Check if Node.js and npm (Node Package Manager) were installed successfully:

```bash
node -v
npm -v
```

These commands should output the installed versions of Node.js and npm.

---

### **Step 3: Install TypeScript**

TypeScript can be installed globally using npm. Run the following command to install it:

```bash
sudo npm install -g typescript
```

After installation, verify the TypeScript version:

```bash
tsc -v
```

The `tsc` command is the TypeScript compiler, and its version number confirms a successful installation.

---

### **Step 4: Set Up a TypeScript Project**

Once Node.js and TypeScript are installed, you can create a new TypeScript project.

#### Create a Project Directory
Navigate to your workspace and create a new directory for your project:

```bash
mkdir my-typescript-app
cd my-typescript-app
```

#### Initialize a Node.js Project
Run the following command to generate a `package.json` file, which manages your project’s dependencies:

```bash
npm init -y
```

This creates a default `package.json` file with basic settings.

#### Install TypeScript Locally
While TypeScript is installed globally, it’s good practice to also include it as a local dependency for the project:

```bash
npm install typescript --save-dev
```

#### Generate a TypeScript Configuration File
The `tsconfig.json` file configures the TypeScript compiler. Generate it with:

```bash
npx tsc --init
```

A basic `tsconfig.json` file will look like this:

```json
{
  "compilerOptions": {
    "target": "ES6",
    "module": "commonjs",
    "outDir": "./dist",
    "strict": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
```

- `target`: Specifies the ECMAScript version for the compiled JavaScript.
- `module`: Defines the module system (e.g., `commonjs` for Node.js).
- `outDir`: Specifies the output directory for compiled files.
- `strict`: Enables strict type checking.
- `include` and `exclude`: Define which files should be included or excluded from compilation.

#### Create the Project Structure
Organize your project files by creating a `src` directory for TypeScript files:

```bash
mkdir src
```

Create a sample TypeScript file:

```bash
nano src/index.ts
```

Add the following code to `index.ts`:

```typescript
const message: string = "Hello, TypeScript on AlmaLinux!";
console.log(message);
```

---

### **Step 5: Compile and Run the TypeScript Code**

To compile the TypeScript code into JavaScript, run:

```bash
npx tsc
```

This command compiles all `.ts` files in the `src` directory into `.js` files in the `dist` directory (as configured in `tsconfig.json`).

Navigate to the `dist` directory and run the compiled JavaScript file:

```bash
node dist/index.js
```

You should see the following output:

```
Hello, TypeScript on AlmaLinux!
```

---

### **Step 6: Add Type Definitions**

Type definitions provide type information for JavaScript libraries and are essential when working with TypeScript. Install type definitions for Node.js:

```bash
npm install --save-dev @types/node
```

If you use other libraries, you can search and install their type definitions using:

```bash
npm install --save-dev @types/<library-name>
```

---

### **Step 7: Automate with npm Scripts**

To streamline your workflow, add scripts to your `package.json` file:

```json
"scripts": {
  "build": "tsc",
  "start": "node dist/index.js",
  "dev": "tsc && node dist/index.js"
}
```

- `build`: Compiles the TypeScript code.
- `start`: Runs the compiled JavaScript.
- `dev`: Compiles and runs the code in a single step.

Run these scripts using:

```bash
npm run build
npm run start
```

---

### **Step 8: Debugging TypeScript**

TypeScript integrates well with modern editors like Visual Studio Code, which provides debugging tools, IntelliSense, and error checking. Use the `tsconfig.json` file to fine-tune debugging settings, such as enabling source maps.

Add the following to `tsconfig.json` for better debugging:

```json
"compilerOptions": {
  "sourceMap": true
}
```

This generates `.map` files, linking the compiled JavaScript back to the original TypeScript code for easier debugging.

---

### **Step 9: Deployment Considerations**

When deploying Node.js applications on AlmaLinux, consider these additional steps:

1. **Process Management**: Use a process manager like [PM2](https://pm2.keymetrics.io/) to keep your application running:
   ```bash
   sudo npm install -g pm2
   pm2 start dist/index.js
   ```

2. **Firewall Configuration**: Open necessary ports for your application using `firewalld`:
   ```bash
   sudo firewall-cmd --permanent --add-port=3000/tcp
   sudo firewall-cmd --reload
   ```

3. **Reverse Proxy**: Use Nginx or Apache as a reverse proxy for production environments.

---

### **Conclusion**

Setting up Node.js with TypeScript on AlmaLinux provides a powerful stack for developing and deploying scalable applications. By following this guide, you’ve configured your system, set up a TypeScript project, and prepared it for development and production.

Embrace the benefits of static typing, better tooling, and AlmaLinux’s robust environment for your next application. With TypeScript and Node.js, you’re equipped to build reliable, maintainable, and modern software solutions.
