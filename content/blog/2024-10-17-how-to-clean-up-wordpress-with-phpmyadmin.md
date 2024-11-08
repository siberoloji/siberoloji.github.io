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

  Maintaining a healthy and optimized WordPress website can become challenging as your content grows. Over time, your WordPress database accumulates unnecessary files such as auto drafts, revisions, trashed posts, spam comments, and transient options, which can slow down your website. In this guide, we’ll discuss how to clean up WordPress by deleting unnecessary files directly from your database using phpMyAdmin.</p>
 

  Before diving into the technical process, let’s understand why cleaning up these files is important, what these files are, and then walk through a step-by-step process of using phpMyAdmin to remove them.</p>
 

<!-- wp:heading {"level":3} -->
 ### Why Clean Up Your WordPress Database?</h3>
<!-- /wp:heading -->

  Your WordPress database stores all the content and settings of your website, including posts, pages, comments, plugin settings, and other metadata. While some data is essential, unnecessary files like post revisions, auto drafts, spam comments, and old transients can cause the database to bloat. Here are some of the major reasons why you should clean up your WordPress database:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Improved Performance</strong>: A bloated database can slow down your website, making it harder for WordPress to fetch and process data. Cleaning unnecessary files improves query execution time and speeds up your website.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Efficient Backup and Restore</strong>: Backups of large databases take longer and consume more resources. A cleaner database reduces backup size and makes it easier to restore if needed.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Reduced Disk Usage</strong>: Database bloat consumes server storage space, especially on shared hosting where storage is often limited. By removing unnecessary files, you free up space for more critical files and data.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Security and Maintenance</strong>: A clean database is easier to manage, troubleshoot, and secure. Irrelevant files can create opportunities for errors and potential vulnerabilities.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  Now that you know why it’s crucial to keep your WordPress database clean, let's discuss the unnecessary files that tend to accumulate over time.</p>
 

<!-- wp:heading {"level":3} -->
 ### Types of Unnecessary Files in WordPress</h3>
<!-- /wp:heading -->

  Here are the most common types of unnecessary files in a WordPress database that you should consider removing:</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">1. <strong>Auto Drafts</strong></h4>
<!-- /wp:heading -->

  WordPress automatically saves your posts and pages as auto drafts as you edit them. This ensures that you don't lose your content in case of an accidental browser crash or connection issue. However, these auto drafts often remain in your database even after the final post or page is published. Removing auto drafts helps reduce database bloat.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">2. <strong>Revisions</strong></h4>
<!-- /wp:heading -->

  Every time you update a post or page, WordPress saves a revision. Over time, these revisions can accumulate, especially for frequently updated posts. While revisions can be helpful in recovering older versions, keeping too many of them may unnecessarily increase database size.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">3. <strong>Trashed Posts and Comments</strong></h4>
<!-- /wp:heading -->

  When you delete a post or comment, WordPress doesn’t remove it immediately. Instead, it moves the item to the trash, where it remains until permanently deleted. Old trashed items, especially if not managed properly, contribute to database bloat.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">4. <strong>Spam and Unapproved Comments</strong></h4>
<!-- /wp:heading -->

  Spam and unapproved comments take up space in your database. Removing these comments not only helps declutter the comment section but also frees up database resources.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">5. <strong>Transients</strong></h4>
<!-- /wp:heading -->

  Transients are temporary data stored in the database by WordPress and plugins. While transients can be useful, expired transients often remain in the database unnecessarily, contributing to database bloat.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">6. <strong>Orphaned Metadata</strong></h4>
<!-- /wp:heading -->

  Metadata associated with deleted posts, comments, or users can remain in the database even after the parent item is deleted. Orphaned metadata can accumulate over time, further bloating the database.</p>
 

  Now that we understand the types of files that clutter a WordPress database, let’s dive into cleaning up these files using phpMyAdmin.</p>
 

<!-- wp:heading {"level":3} -->
 ### Using phpMyAdmin to Clean Up Your WordPress Database</h3>
<!-- /wp:heading -->

  phpMyAdmin is a powerful tool for managing your WordPress database directly. Before proceeding, <strong>make sure to back up your WordPress database</strong>. This ensures that you can recover your data if something goes wrong during the cleanup process.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Access phpMyAdmin</h4>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Login to Your Hosting Control Panel (cPanel)</strong>: Most web hosting providers offer access to phpMyAdmin through cPanel. Once logged in, look for the phpMyAdmin option under the “Databases” section.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Select Your WordPress Database</strong>: In phpMyAdmin, you’ll see a list of databases. Click on your WordPress database to view the tables associated with your website.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Deleting Auto Drafts</h4>
<!-- /wp:heading -->

  Auto drafts are saved in the <code>wp_posts</code> table of your WordPress database. To delete auto drafts:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>In the phpMyAdmin interface, click on the <strong>SQL</strong> tab.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Run the following query to delete auto drafts:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong> to execute the query.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  This will remove all auto-draft posts from your database.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Deleting Post Revisions</h4>
<!-- /wp:heading -->

  Revisions are also stored in the <code>wp_posts</code> table. To remove post revisions:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Go to the <strong>SQL</strong> tab.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Run the following query to delete post revisions:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_type = 'revision';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  This will delete all post revisions from your database.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Emptying Trash for Posts and Comments</h4>
<!-- /wp:heading -->

  To remove trashed posts:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>In the <strong>SQL</strong> tab, run the following query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_posts WHERE post_status = 'trash';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  To remove trashed comments:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Run the following query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = 'trash';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 5: Deleting Spam and Unapproved Comments</h4>
<!-- /wp:heading -->

  To remove spam and unapproved comments from your database:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>In the <strong>SQL</strong> tab, run the following query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = 'spam';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>To delete unapproved comments, use this query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_comments WHERE comment_approved = '0';</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong> for each query.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 6: Removing Expired Transients</h4>
<!-- /wp:heading -->

  Transients are stored in the <code>wp_options</code> table. To remove expired transients:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>In the <strong>SQL</strong> tab, run the following query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_options WHERE option_name LIKE '_transient_%' AND option_value &lt; NOW();</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  This will remove expired transients from your database.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 7: Deleting Orphaned Metadata</h4>
<!-- /wp:heading -->

  Orphaned metadata can accumulate over time. To clean up orphaned metadata:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>For orphaned post metadata, run this query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE pm FROM wp_postmeta pm LEFT JOIN wp_posts wp ON wp.ID = pm.post_id WHERE wp.ID IS NULL;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>For orphaned comment metadata, run this query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   DELETE FROM wp_commentmeta WHERE comment_id NOT IN (SELECT comment_ID FROM wp_comments);</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Click <strong>Go</strong> for each query.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Best Practices for Database Maintenance</h3>
<!-- /wp:heading -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Regular Backups</strong>: Always back up your database before making any changes. It’s also a good habit to schedule regular backups.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Database Optimization Plugins</strong>: Consider using plugins like WP-Optimize or Advanced Database Cleaner to automate the cleanup process. These plugins offer user-friendly ways to delete revisions, spam, transients, and other unnecessary data.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Limit Post Revisions</strong>: You can limit the number of post revisions WordPress saves by adding the following line to your <code>wp-config.php</code> file:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   define( 'WP_POST_REVISIONS', 3 );</code></pre>
<!-- /wp:code -->

  This limits the number of revisions saved per post to three.</p>
 

<!-- wp:list {"ordered":true,"start":4} -->
<ol start="4" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Regular Cleanup</strong>: Clean your WordPress database periodically to prevent it from becoming cluttered. Running regular cleanups ensures better performance and more efficient database management.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

  Cleaning up your WordPress database can significantly improve your website’s performance, reduce storage usage, and make backups more manageable. While there are plugins available to help with database maintenance, using phpMyAdmin offers more control and allows you to execute custom SQL queries to target specific files. Whether you’re removing auto drafts, revisions, or transients, phpMyAdmin provides a powerful way to keep your database lean and optimized.</p>
 

  Always remember to back up your database before performing any cleanup actions, and consider regular maintenance routines to keep your WordPress website running smoothly over time.</p>
 