---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Wordpress
date: "2024-10-17T16:48:44Z"
guid: https://www.siberoloji.com/?p=3531
id: 3531
image: /assets/images/2024/10/wordpress.webp
tags:
- how-to guides
- wordpress
title: How to Clean Up WordPress with phpMyAdmin
url: /how-to-clean-up-wordpress-with-phpmyadmin/
---

  Maintaining a healthy and optimized WordPress website can become challenging as your content grows. Over time, your WordPress database accumulates unnecessary files such as auto drafts, revisions, trashed posts, spam comments, and transient options, which can slow down your website. In this guide, we’ll discuss how to clean up WordPress by deleting unnecessary files directly from your database using phpMyAdmin.
 

  Before diving into the technical process, let’s understand why cleaning up these files is important, what these files are, and then walk through a step-by-step process of using phpMyAdmin to remove them.
 


 ### Why Clean Up Your WordPress Database?
<!-- /wp:heading -->

  Your WordPress database stores all the content and settings of your website, including posts, pages, comments, plugin settings, and other metadata. While some data is essential, unnecessary files like post revisions, auto drafts, spam comments, and old transients can cause the database to bloat. Here are some of the major reasons why you should clean up your WordPress database:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Improved Performance*** : A bloated database can slow down your website, making it harder for WordPress to fetch and process data. Cleaning unnecessary files improves query execution time and speeds up your website. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Efficient Backup and Restore*** : Backups of large databases take longer and consume more resources. A cleaner database reduces backup size and makes it easier to restore if needed. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Reduced Disk Usage*** : Database bloat consumes server storage space, especially on shared hosting where storage is often limited. By removing unnecessary files, you free up space for more critical files and data. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Security and Maintenance*** : A clean database is easier to manage, troubleshoot, and secure. Irrelevant files can create opportunities for errors and potential vulnerabilities. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  Now that you know why it’s crucial to keep your WordPress database clean, let's discuss the unnecessary files that tend to accumulate over time.
 


 ### Types of Unnecessary Files in WordPress
<!-- /wp:heading -->

  Here are the most common types of unnecessary files in a WordPress database that you should consider removing:
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. ***Auto Drafts***  
<!-- /wp:heading -->

  WordPress automatically saves your posts and pages as auto drafts as you edit them. This ensures that you don't lose your content in case of an accidental browser crash or connection issue. However, these auto drafts often remain in your database even after the final post or page is published. Removing auto drafts helps reduce database bloat.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. ***Revisions***  
<!-- /wp:heading -->

  Every time you update a post or page, WordPress saves a revision. Over time, these revisions can accumulate, especially for frequently updated posts. While revisions can be helpful in recovering older versions, keeping too many of them may unnecessarily increase database size.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. ***Trashed Posts and Comments***  
<!-- /wp:heading -->

  When you delete a post or comment, WordPress doesn’t remove it immediately. Instead, it moves the item to the trash, where it remains until permanently deleted. Old trashed items, especially if not managed properly, contribute to database bloat.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4. ***Spam and Unapproved Comments***  
<!-- /wp:heading -->

  Spam and unapproved comments take up space in your database. Removing these comments not only helps declutter the comment section but also frees up database resources.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">5. ***Transients***  
<!-- /wp:heading -->

  Transients are temporary data stored in the database by WordPress and plugins. While transients can be useful, expired transients often remain in the database unnecessarily, contributing to database bloat.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">6. ***Orphaned Metadata***  
<!-- /wp:heading -->

  Metadata associated with deleted posts, comments, or users can remain in the database even after the parent item is deleted. Orphaned metadata can accumulate over time, further bloating the database.
 

  Now that we understand the types of files that clutter a WordPress database, let’s dive into cleaning up these files using phpMyAdmin.
 


 ### Using phpMyAdmin to Clean Up Your WordPress Database
<!-- /wp:heading -->

  phpMyAdmin is a powerful tool for managing your WordPress database directly. Before proceeding, ***make sure to back up your WordPress database*** . This ensures that you can recover your data if something goes wrong during the cleanup process.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Access phpMyAdmin 
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Login to Your Hosting Control Panel (cPanel)*** : Most web hosting providers offer access to phpMyAdmin through cPanel. Once logged in, look for the phpMyAdmin option under the “Databases” section. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Select Your WordPress Database*** : In phpMyAdmin, you’ll see a list of databases. Click on your WordPress database to view the tables associated with your website. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Deleting Auto Drafts 
<!-- /wp:heading -->

  Auto drafts are saved in the <code>wp_posts</code> table of your WordPress database. To delete auto drafts:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- In the phpMyAdmin interface, click on the ***SQL***  tab. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Run the following query to delete auto drafts: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go***  to execute the query. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  This will remove all auto-draft posts from your database.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Deleting Post Revisions 
<!-- /wp:heading -->

  Revisions are also stored in the <code>wp_posts</code> table. To remove post revisions:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Go to the ***SQL***  tab. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Run the following query to delete post revisions: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_type = 'revision';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  This will delete all post revisions from your database.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Emptying Trash for Posts and Comments 
<!-- /wp:heading -->

  To remove trashed posts:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- In the ***SQL***  tab, run the following query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_status = 'trash';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  To remove trashed comments:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Run the following query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = 'trash';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 5: Deleting Spam and Unapproved Comments 
<!-- /wp:heading -->

  To remove spam and unapproved comments from your database:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- In the ***SQL***  tab, run the following query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = 'spam';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- To delete unapproved comments, use this query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = '0';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go***  for each query. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 6: Removing Expired Transients 
<!-- /wp:heading -->

  Transients are stored in the <code>wp_options</code> table. To remove expired transients:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- In the ***SQL***  tab, run the following query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_options WHERE option_name LIKE '_transient_%' AND option_value &lt; NOW();</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  This will remove expired transients from your database.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 7: Deleting Orphaned Metadata 
<!-- /wp:heading -->

  Orphaned metadata can accumulate over time. To clean up orphaned metadata:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- For orphaned post metadata, run this query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE pm FROM wp_postmeta pm LEFT JOIN wp_posts wp ON wp.ID = pm.post_id WHERE wp.ID IS NULL;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- For orphaned comment metadata, run this query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_commentmeta WHERE comment_id NOT IN (SELECT comment_ID FROM wp_comments);</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Click ***Go***  for each query. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Best Practices for Database Maintenance
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Regular Backups*** : Always back up your database before making any changes. It’s also a good habit to schedule regular backups. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Database Optimization Plugins*** : Consider using plugins like WP-Optimize or Advanced Database Cleaner to automate the cleanup process. These plugins offer user-friendly ways to delete revisions, spam, transients, and other unnecessary data. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Limit Post Revisions*** : You can limit the number of post revisions WordPress saves by adding the following line to your <code>wp-config.php</code> file: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   define( 'WP_POST_REVISIONS', 3 );</code></pre>
<!-- /wp:code -->

  This limits the number of revisions saved per post to three.
 

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
- ***Regular Cleanup*** : Clean your WordPress database periodically to prevent it from becoming cluttered. Running regular cleanups ensures better performance and more efficient database management. 
<!-- /wp:list-item --> 
<!-- /wp:list -->


 ### Conclusion
<!-- /wp:heading -->

  Cleaning up your WordPress database can significantly improve your website’s performance, reduce storage usage, and make backups more manageable. While there are plugins available to help with database maintenance, using phpMyAdmin offers more control and allows you to execute custom SQL queries to target specific files. Whether you’re removing auto drafts, revisions, or transients, phpMyAdmin provides a powerful way to keep your database lean and optimized.
 

  Always remember to back up your database before performing any cleanup actions, and consider regular maintenance routines to keep your WordPress website running smoothly over time.
 