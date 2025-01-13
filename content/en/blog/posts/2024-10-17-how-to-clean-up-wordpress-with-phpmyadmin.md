---
draft: false

title:  'How to Clean Up WordPress with phpMyAdmin'
date: '2024-10-17T16:48:44+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /how-to-clean-up-wordpress-with-phpmyadmin/
featured_image: /images/wordpress.webp
categories:
    - Wordpress
tags:
    - 'how-to guides'
    - wordpress
---


Maintaining a healthy and optimized WordPress website can become challenging as your content grows. Over time, your WordPress database accumulates unnecessary files such as auto drafts, revisions, trashed posts, spam comments, and transient options, which can slow down your website. In this guide, we’ll discuss how to clean up WordPress by deleting unnecessary files directly from your database using phpMyAdmin.



Before diving into the technical process, let’s understand why cleaning up these files is important, what these files are, and then walk through a step-by-step process of using phpMyAdmin to remove them.



Why Clean Up Your WordPress Database?



Your WordPress database stores all the content and settings of your website, including posts, pages, comments, plugin settings, and other metadata. While some data is essential, unnecessary files like post revisions, auto drafts, spam comments, and old transients can cause the database to bloat. Here are some of the major reasons why you should clean up your WordPress database:


* **Improved Performance**: A bloated database can slow down your website, making it harder for WordPress to fetch and process data. Cleaning unnecessary files improves query execution time and speeds up your website.

* **Efficient Backup and Restore**: Backups of large databases take longer and consume more resources. A cleaner database reduces backup size and makes it easier to restore if needed.

* **Reduced Disk Usage**: Database bloat consumes server storage space, especially on shared hosting where storage is often limited. By removing unnecessary files, you free up space for more critical files and data.

* **Security and Maintenance**: A clean database is easier to manage, troubleshoot, and secure. Irrelevant files can create opportunities for errors and potential vulnerabilities.
Now that you know why it’s crucial to keep your WordPress database clean, let's discuss the unnecessary files that tend to accumulate over time.



Types of Unnecessary Files in WordPress



Here are the most common types of unnecessary files in a WordPress database that you should consider removing:


#### 1. **Auto Drafts**



WordPress automatically saves your posts and pages as auto drafts as you edit them. This ensures that you don't lose your content in case of an accidental browser crash or connection issue. However, these auto drafts often remain in your database even after the final post or page is published. Removing auto drafts helps reduce database bloat.


#### 2. **Revisions**



Every time you update a post or page, WordPress saves a revision. Over time, these revisions can accumulate, especially for frequently updated posts. While revisions can be helpful in recovering older versions, keeping too many of them may unnecessarily increase database size.


#### 3. **Trashed Posts and Comments**



When you delete a post or comment, WordPress doesn’t remove it immediately. Instead, it moves the item to the trash, where it remains until permanently deleted. Old trashed items, especially if not managed properly, contribute to database bloat.


#### 4. **Spam and Unapproved Comments**



Spam and unapproved comments take up space in your database. Removing these comments not only helps declutter the comment section but also frees up database resources.


#### 5. **Transients**



Transients are temporary data stored in the database by WordPress and plugins. While transients can be useful, expired transients often remain in the database unnecessarily, contributing to database bloat.


#### 6. **Orphaned Metadata**



Metadata associated with deleted posts, comments, or users can remain in the database even after the parent item is deleted. Orphaned metadata can accumulate over time, further bloating the database.



Now that we understand the types of files that clutter a WordPress database, let’s dive into cleaning up these files using phpMyAdmin.



Using phpMyAdmin to Clean Up Your WordPress Database



phpMyAdmin is a powerful tool for managing your WordPress database directly. Before proceeding, **make sure to back up your WordPress database**. This ensures that you can recover your data if something goes wrong during the cleanup process.


#### Step 1: Access phpMyAdmin


* **Login to Your Hosting Control Panel (cPanel)**: Most web hosting providers offer access to phpMyAdmin through cPanel. Once logged in, look for the phpMyAdmin option under the “Databases” section.

* **Select Your WordPress Database**: In phpMyAdmin, you’ll see a list of databases. Click on your WordPress database to view the tables associated with your website.



#### Step 2: Deleting Auto Drafts



Auto drafts are saved in the `wp_posts` table of your WordPress database. To delete auto drafts:


* In the phpMyAdmin interface, click on the **SQL** tab.

* Run the following query to delete auto drafts:



```bash
   DELETE FROM wp_posts WHERE post_status = 'auto-draft';
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Click **Go** to execute the query.
This will remove all auto-draft posts from your database.


#### Step 3: Deleting Post Revisions



Revisions are also stored in the `wp_posts` table. To remove post revisions:


* Go to the **SQL** tab.

* Run the following query to delete post revisions:



```bash
   DELETE FROM wp_posts WHERE post_type = 'revision';
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Click **Go**.
This will delete all post revisions from your database.


#### Step 4: Emptying Trash for Posts and Comments



To remove trashed posts:


* In the **SQL** tab, run the following query:



```bash
   DELETE FROM wp_posts WHERE post_status = 'trash';
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Click **Go**.
To remove trashed comments:


* Run the following query:



```bash
   DELETE FROM wp_comments WHERE comment_approved = 'trash';
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Click **Go**.



#### Step 5: Deleting Spam and Unapproved Comments



To remove spam and unapproved comments from your database:


* In the **SQL** tab, run the following query:



```bash
   DELETE FROM wp_comments WHERE comment_approved = 'spam';
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* To delete unapproved comments, use this query:



```bash
   DELETE FROM wp_comments WHERE comment_approved = '0';
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Click **Go** for each query.



#### Step 6: Removing Expired Transients



Transients are stored in the `wp_options` table. To remove expired transients:


* In the **SQL** tab, run the following query:



```bash
   DELETE FROM wp_options WHERE option_name LIKE '_transient_%' AND option_value < NOW();
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* Click **Go**.
This will remove expired transients from your database.


#### Step 7: Deleting Orphaned Metadata



Orphaned metadata can accumulate over time. To clean up orphaned metadata:


* For orphaned post metadata, run this query:



```bash
   DELETE pm FROM wp_postmeta pm LEFT JOIN wp_posts wp ON wp.ID = pm.post_id WHERE wp.ID IS NULL;
```


<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list">* For orphaned comment metadata, run this query:



```bash
   DELETE FROM wp_commentmeta WHERE comment_id NOT IN (SELECT comment_ID FROM wp_comments);
```


<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list">* Click **Go** for each query.
Best Practices for Database Maintenance


* **Regular Backups**: Always back up your database before making any changes. It’s also a good habit to schedule regular backups.

* **Database Optimization Plugins**: Consider using plugins like WP-Optimize or Advanced Database Cleaner to automate the cleanup process. These plugins offer user-friendly ways to delete revisions, spam, transients, and other unnecessary data.

* **Limit Post Revisions**: You can limit the number of post revisions WordPress saves by adding the following line to your `wp-config.php` file:



```bash
   define( 'WP_POST_REVISIONS', 3 );
```



This limits the number of revisions saved per post to three.


<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list">* **Regular Cleanup**: Clean your WordPress database periodically to prevent it from becoming cluttered. Running regular cleanups ensures better performance and more efficient database management.
Conclusion



Cleaning up your WordPress database can significantly improve your website’s performance, reduce storage usage, and make backups more manageable. While there are plugins available to help with database maintenance, using phpMyAdmin offers more control and allows you to execute custom SQL queries to target specific files. Whether you’re removing auto drafts, revisions, or transients, phpMyAdmin provides a powerful way to keep your database lean and optimized.



Always remember to back up your database before performing any cleanup actions, and consider regular maintenance routines to keep your WordPress website running smoothly over time.
