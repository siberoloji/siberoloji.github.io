---
title: How to Add FreeIPA User Accounts on AlmaLinux
linkTitle: Add FreeIPA User Accounts
description: Learn how to add and manage FreeIPA user accounts on AlmaLinux. This detailed guide covers user creation, group management, access policies, and best practices.
date: 2024-12-12
weight: 690
url: add-freeipa-user-accounts-almalinux
draft: false
tags:
  - AlmaLinux
categories:
  - Linux
  - Linux How-to
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
translationKey: how-to-add-freeipa-user-accounts-on-almalinux
keywords:
  - AlmaLinux
featured_image: /images/almalinux.webp
---
User account management is a cornerstone of any secure IT infrastructure. With FreeIPA, an open-source identity and authentication solution, managing user accounts becomes a streamlined process. FreeIPA integrates components like LDAP, Kerberos, DNS, and Certificate Authority to centralize identity management. AlmaLinux, a robust and enterprise-ready Linux distribution, is an excellent platform for deploying and using FreeIPA.

This guide will walk you through the process of adding and managing user accounts in FreeIPA on AlmaLinux. Whether you're a system administrator or a newcomer to identity management, this comprehensive tutorial will help you get started.

---

## **What is FreeIPA?**

FreeIPA (Free Identity, Policy, and Audit) is an all-in-one identity management solution. It simplifies authentication and user management across a domain. Key features include:

- **Centralized User Management:** Handles user accounts, groups, and permissions.
- **Secure Authentication:** Uses Kerberos for single sign-on (SSO) and LDAP for directory services.
- **Integrated Policy Management:** Offers host-based access control and password policies.
- **Certificate Management:** Issues and manages SSL/TLS certificates.

By centralizing these capabilities, FreeIPA reduces administrative overhead while improving security.

---

## **Prerequisites**

Before proceeding, ensure the following:

1. **AlmaLinux installed and updated.**
2. FreeIPA Server configured and running. If not, refer to a setup guide.
3. Administrative (root) access to the server.
4. FreeIPA admin credentials.

---

## **Step 1: Access the FreeIPA Web Interface**

FreeIPA provides a web interface that simplifies user account management.

1. Open a browser and navigate to the FreeIPA web interface:

   ```html
   https://<freeipa-server-domain>
   ```

   Replace `<freeipa-server-domain>` with your FreeIPA server's domain (e.g., `ipa.example.com`).

2. Log in using the admin credentials.

3. Navigate to the **Identity** → **Users** section to begin managing user accounts.

---

## **Step 2: Add a User Account via Web Interface**

Adding users through the web interface is straightforward:

1. Click **Add** in the **Users** section.

2. Fill in the required fields:
   - **User Login (UID):** The unique username (e.g., `johndoe`).
   - **First Name:** The user’s first name.
   - **Last Name:** The user’s last name.
   - **Full Name:** Automatically populated from first and last names.
   - **Email:** The user’s email address.

3. Optional fields include:
   - **Home Directory:** Defaults to `/home/<username>`.
   - **Shell:** Defaults to `/bin/bash`.

4. Set an initial password for the user by checking **Set Initial Password** and entering a secure password.

5. Click **Add and Edit** to add the user and configure additional settings like group memberships and access policies.

---

## **Step 3: Add a User Account via CLI**

For administrators who prefer the command line, the `ipa` command simplifies user management.

### **Add a New User**

Use the `ipa user-add` command:

```bash
ipa user-add johndoe --first=John --last=Doe --email=johndoe@example.com
```

#### **Explanation of Options:**

- **`johndoe`**: The username (UID) for the user.
- **`--first=John`**: The user’s first name.
- **`--last=Doe`**: The user’s last name.
- **`--email=johndoe@example.com`**: The user’s email address.

### **Set User Password**

Set an initial password for the user:

```bash
ipa passwd johndoe
```

The system may prompt the user to change their password upon first login, depending on the policy.

---

## **Step 4: Manage User Attributes**

FreeIPA allows administrators to manage user attributes to customize access and permissions.

### **Modify User Details**

Update user information using the `ipa user-mod` command:

```bash
ipa user-mod johndoe --phone=123-456-7890 --title="Developer"
```

#### **Options:**

- **`--phone=123-456-7890`**: Sets the user’s phone number.
- **`--title="Developer"`**: Sets the user’s job title.

### **Add a User to Groups**

Groups simplify permission management by grouping users with similar access levels.

1. Create a group if it doesn’t exist:

   ```bash
   ipa group-add developers --desc="Development Team"
   ```

2. Add the user to the group:

   ```bash
   ipa group-add-member developers --users=johndoe
   ```

3. Verify the user’s group membership:

   ```bash
   ipa user-show johndoe
   ```

---

## **Step 5: Apply Access Policies to Users**

FreeIPA allows administrators to enforce access control using Host-Based Access Control (HBAC) rules.

### **Add an HBAC Rule**

Create an HBAC rule to define user access:

```bash
ipa hbacrule-add "Allow Developers" --desc="Allow Developers Access to Servers"
```

Add the user’s group to the rule:

```bash
ipa hbacrule-add-user "Allow Developers" --groups=developers
```

Add target hosts to the rule:

```bash
ipa hbacrule-add-host "Allow Developers" --hosts=webserver.example.com
```

---

## **Step 6: Enforce Password Policies**

Password policies ensure secure user authentication.

### **View Current Password Policies**

List current password policies:

```bash
ipa pwpolicy-show
```

### **Modify Password Policies**

Update the default password policy:

```bash
ipa pwpolicy-mod --maxlife=90 --minlength=8 --history=5
```

#### **Explanation:**

- **`--maxlife=90`**: Password expires after 90 days.
- **`--minlength=8`**: Requires passwords to be at least 8 characters.
- **`--history=5`**: Prevents reuse of the last 5 passwords.

---

## **Step 7: Test User Authentication**

To ensure the new user account is functioning, log in with the credentials or use Kerberos for authentication.

### **Kerberos Login**

Authenticate the user using Kerberos:

```bash
kinit johndoe
```

Verify the Kerberos ticket:

```bash
klist
```

### **SSH Login**

If the user has access to a specific host, test SSH login:

```bash
ssh johndoe@webserver.example.com
```

---

## **Step 8: Troubleshooting Common Issues**

### **User Cannot Log In**

1. Ensure the user account is active:

   ```bash
   ipa user-show johndoe
   ```

2. Verify group membership and HBAC rules:

   ```bash
   ipa group-show developers
   ipa hbacrule-show "Allow Developers"
   ```

3. Check Kerberos tickets:

   ```bash
   klist
   ```

### **Password Issues**

- If the user forgets their password, reset it:

  ```bash
  ipa passwd johndoe
  ```

- Ensure the password meets policy requirements.

---

## **Step 9: Best Practices for User Management**

1. **Use Groups for Permissions:** Assign permissions through groups instead of individual users.
2. **Enforce Password Expiry:** Regularly rotate passwords to enhance security.
3. **Audit Accounts:** Periodically review and deactivate inactive accounts:

   ```bash
   ipa user-disable johndoe
   ```

4. **Enable Two-Factor Authentication (2FA):** Add an extra layer of security for privileged accounts.
5. **Backup FreeIPA Configuration:** Use `ipa-backup` to safeguard data regularly.

---

## **Conclusion**

Adding and managing user accounts with FreeIPA on AlmaLinux is a seamless process that enhances security and simplifies identity management. By using the intuitive web interface or the powerful CLI, administrators can efficiently handle user accounts, groups, and access policies. Whether you're setting up a single user or managing a large organization, FreeIPA provides the tools needed for effective identity management.

Start adding users to your FreeIPA environment today and unlock the full potential of centralized identity and authentication on AlmaLinux.
