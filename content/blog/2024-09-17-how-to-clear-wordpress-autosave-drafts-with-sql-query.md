---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Wordpress
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
cmplz_hide_cookiebanner:
- ""
date: "2024-09-17T12:47:21Z"
guid: https://www.siberoloji.com/?p=1602
id: 1602
image: /assets/images/2024/08/Sql_data_base_with_logo.png
slim_seo:
- a:1:{s:5:"title";s:17:"wordpress cleanup";}
tags:
- how-to guides
- sql query
- wordpress
- wordpress cleanup
title: How to Clear WordPress Autosave Drafts with SQL Query?
url: /how-to-clear-wordpress-autosave-drafts-with-sql-query/
---

  WordPress automatically saves drafts of your posts and pages as you work on them, ensuring that your content is not lost in case of any mishaps. This autosave feature is incredibly useful, but over time, these drafts can accumulate and take up unnecessary space in your database. Clearing these autosave drafts can help improve your website's performance and reduce clutter in the database.</p>
 

  In this post, we’ll explain how you can clear WordPress autosave drafts using an SQL query, a quick and effective method to manage your WordPress database.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### What Are WordPress Autosave Drafts?</h3>
<!-- /wp:heading -->

  Before diving into the technical details, it’s important to understand what autosave drafts are. WordPress automatically saves a draft of your posts or pages at regular intervals (every 60 seconds by default) as you write. This draft is stored in the <strong>wp_posts</strong> table of your WordPress database.</p>
 

  Autosaves are a safeguard against potential loss of content, especially if your browser crashes or if you accidentally close the editor before manually saving your work. However, WordPress does not automatically delete these autosaved drafts after publishing or updating a post, which can lead to the accumulation of unnecessary data in your database.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Why Clear Autosave Drafts?</h3>
<!-- /wp:heading -->

  While autosaves are beneficial during the content creation process, leftover autosave drafts can have some downsides:</p>
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Database Bloat:</strong> Over time, unused autosave drafts accumulate in your database, which increases its size unnecessarily. This can impact the performance of your website, especially if you have a large volume of content.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Cluttered Database Management:</strong> For developers and administrators managing the WordPress database, too many unwanted drafts can clutter the database, making it harder to maintain.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Improved Performance:</strong> By clearing out old autosaves, you can reduce the number of rows in your <strong>wp_posts</strong> table, helping to optimize database queries and overall performance.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### How to Identify Autosave Drafts in Your Database</h3>
<!-- /wp:heading -->

  In the WordPress database, drafts (including autosaves) are stored in the <strong>wp_posts</strong> table, and they are marked with a post status of <code>auto-draft</code>. Each autosave draft also corresponds to an existing post, page, or custom post type, with WordPress creating a new record in the database for each autosave.</p>
 

  To identify the autosave drafts, you can use the following SQL query. This query fetches all records in the <strong>wp_posts</strong> table with a post status of <code>auto-draft</code>:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">SELECT * FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

  Running this query will display all the autosave drafts in your database, showing you the exact rows that are consuming unnecessary space.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### How to Clear WordPress Autosave Drafts Using an SQL Query</h3>
<!-- /wp:heading -->

  Clearing autosave drafts from your WordPress database is a straightforward process when using an SQL query. However, <strong>always remember to back up your database before running any queries</strong>, as SQL operations can’t be undone easily if something goes wrong.</p>
 

  Follow these steps to delete autosave drafts:</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Backup Your Database</h4>
<!-- /wp:heading -->

  Before performing any SQL operations, it’s crucial to back up your database. You can do this using your web hosting provider's tools (like <strong>cPanel</strong>) or plugins such as <strong>UpdraftPlus</strong> or <strong>WPvivid</strong>.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Access Your Database via phpMyAdmin</h4>
<!-- /wp:heading -->

  Once you’ve backed up your database, access your <strong>phpMyAdmin</strong> tool through your hosting provider’s control panel (e.g., cPanel, Plesk, etc.).</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Log in to your hosting control panel.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Navigate to <strong>phpMyAdmin</strong> (usually found under the "Databases" section).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select your WordPress database from the left sidebar.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Run the SQL Query to Delete Autosave Drafts</h4>
<!-- /wp:heading -->

  Once inside <strong>phpMyAdmin</strong>, locate the <strong>SQL</strong> tab, where you can run custom SQL queries. To remove all autosave drafts, enter the following SQL query:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">DELETE FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

  This query will delete all posts and pages with the <code>auto-draft</code> status, effectively clearing out all WordPress autosave drafts from your database.</p>
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Verify the Changes</h4>
<!-- /wp:heading -->

  After running the query, you can verify that the autosave drafts have been deleted by running the following query:</p>
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">SELECT * FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

  If no results are returned, it means that the autosave drafts have been successfully deleted.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Automating the Process for Regular Cleanup</h3>
<!-- /wp:heading -->

  If you find yourself needing to clean up autosave drafts regularly, you can automate the process using a plugin like <strong>WP-Optimize</strong>. This plugin offers database cleanup and optimization features, including the ability to remove autosave drafts, post revisions, and other redundant content.</p>
 

  Here’s how you can automate cleanup using <strong>WP-Optimize</strong>:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Install and activate the <strong>WP-Optimize</strong> plugin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Navigate to <strong>WP-Optimize</strong> in your WordPress dashboard.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Under the "Database" tab, you’ll see options to clean up various types of data, including autosave drafts and post revisions.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the <strong>Auto Drafts</strong> checkbox and click <strong>Run Optimization</strong>.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  You can also schedule automatic cleanups to ensure your database stays optimized over time.</p>
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Additional Tips for Database Optimization</h3>
<!-- /wp:heading -->

  Beyond clearing autosave drafts, here are some additional tips to keep your WordPress database optimized:</p>
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li><strong>Limit Post Revisions:</strong><br>WordPress saves multiple revisions of posts by default, which can also lead to database bloat. You can limit the number of revisions saved by adding the following line to your <strong>wp-config.php</strong> file:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   define( 'WP_POST_REVISIONS', 5 );</code></pre>
<!-- /wp:code -->

  This will limit the number of revisions stored for each post to 5.</p>
 

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li><strong>Delete Unused Plugins and Themes:</strong><br>Unused plugins and themes can create additional database entries, which may slow down your website. Regularly remove any plugins or themes that you no longer use.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Use a Caching Plugin:</strong><br>Plugins like <strong>W3 Total Cache</strong> or <strong>WP Super Cache</strong> can improve website performance by storing static versions of your content, reducing the load on your database.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Optimize Database Tables:</strong><br>You can run an SQL command to optimize your tables, ensuring that any gaps in data are filled in, making the database more efficient. In <strong>phpMyAdmin</strong>, simply click the <strong>Optimize</strong> option for each table or use a plugin like <strong>WP-Optimize</strong> for automatic optimization.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->

<!-- wp:heading {"level":3} -->
 ### Conclusion</h3>
<!-- /wp:heading -->

  Clearing autosave drafts is an easy way to optimize your WordPress database and improve site performance. Using an SQL query, you can quickly remove these unnecessary drafts and reduce database bloat. Remember to always back up your database before performing SQL operations and consider automating the cleanup process with plugins like WP-Optimize to keep your WordPress site running smoothly over time.</p>
 

  By following these simple steps, you can maintain a lean and efficient database, ensuring that your WordPress website remains fast and responsive!</p>
 