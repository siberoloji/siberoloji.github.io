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

  WordPress automatically saves drafts of your posts and pages as you work on them, ensuring that your content is not lost in case of any mishaps. This autosave feature is incredibly useful, but over time, these drafts can accumulate and take up unnecessary space in your database. Clearing these autosave drafts can help improve your website's performance and reduce clutter in the database.
 

  In this post, we’ll explain how you can clear WordPress autosave drafts using an SQL query, a quick and effective method to manage your WordPress database.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### What Are WordPress Autosave Drafts?
<!-- /wp:heading -->

  Before diving into the technical details, it’s important to understand what autosave drafts are. WordPress automatically saves a draft of your posts or pages at regular intervals (every 60 seconds by default) as you write. This draft is stored in the ***wp_posts***  table of your WordPress database.
 

  Autosaves are a safeguard against potential loss of content, especially if your browser crashes or if you accidentally close the editor before manually saving your work. However, WordPress does not automatically delete these autosaved drafts after publishing or updating a post, which can lead to the accumulation of unnecessary data in your database.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### Why Clear Autosave Drafts?
<!-- /wp:heading -->

  While autosaves are beneficial during the content creation process, leftover autosave drafts can have some downsides:
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Database Bloat:***  Over time, unused autosave drafts accumulate in your database, which increases its size unnecessarily. This can impact the performance of your website, especially if you have a large volume of content. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Cluttered Database Management:***  For developers and administrators managing the WordPress database, too many unwanted drafts can clutter the database, making it harder to maintain. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Improved Performance:***  By clearing out old autosaves, you can reduce the number of rows in your ***wp_posts***  table, helping to optimize database queries and overall performance. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### How to Identify Autosave Drafts in Your Database
<!-- /wp:heading -->

  In the WordPress database, drafts (including autosaves) are stored in the ***wp_posts***  table, and they are marked with a post status of <code>auto-draft</code>. Each autosave draft also corresponds to an existing post, page, or custom post type, with WordPress creating a new record in the database for each autosave.
 

  To identify the autosave drafts, you can use the following SQL query. This query fetches all records in the ***wp_posts***  table with a post status of <code>auto-draft</code>:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">SELECT * FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

  Running this query will display all the autosave drafts in your database, showing you the exact rows that are consuming unnecessary space.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### How to Clear WordPress Autosave Drafts Using an SQL Query
<!-- /wp:heading -->

  Clearing autosave drafts from your WordPress database is a straightforward process when using an SQL query. However, ***always remember to back up your database before running any queries*** , as SQL operations can’t be undone easily if something goes wrong.
 

  Follow these steps to delete autosave drafts:
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 1: Backup Your Database 
<!-- /wp:heading -->

  Before performing any SQL operations, it’s crucial to back up your database. You can do this using your web hosting provider's tools (like ***cPanel*** ) or plugins such as ***UpdraftPlus***  or ***WPvivid*** .
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 2: Access Your Database via phpMyAdmin 
<!-- /wp:heading -->

  Once you’ve backed up your database, access your ***phpMyAdmin***  tool through your hosting provider’s control panel (e.g., cPanel, Plesk, etc.).
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Log in to your hosting control panel. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Navigate to ***phpMyAdmin***  (usually found under the "Databases" section). 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select your WordPress database from the left sidebar. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 3: Run the SQL Query to Delete Autosave Drafts 
<!-- /wp:heading -->

  Once inside ***phpMyAdmin*** , locate the ***SQL***  tab, where you can run custom SQL queries. To remove all autosave drafts, enter the following SQL query:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">DELETE FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

  This query will delete all posts and pages with the <code>auto-draft</code> status, effectively clearing out all WordPress autosave drafts from your database.
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Step 4: Verify the Changes 
<!-- /wp:heading -->

  After running the query, you can verify that the autosave drafts have been deleted by running the following query:
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">SELECT * FROM wp_posts WHERE post_status = 'auto-draft';</code></pre>
<!-- /wp:code -->

  If no results are returned, it means that the autosave drafts have been successfully deleted.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### Automating the Process for Regular Cleanup
<!-- /wp:heading -->

  If you find yourself needing to clean up autosave drafts regularly, you can automate the process using a plugin like ***WP-Optimize*** . This plugin offers database cleanup and optimization features, including the ability to remove autosave drafts, post revisions, and other redundant content.
 

  Here’s how you can automate cleanup using ***WP-Optimize*** :
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Install and activate the ***WP-Optimize***  plugin. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Navigate to ***WP-Optimize***  in your WordPress dashboard. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Under the "Database" tab, you’ll see options to clean up various types of data, including autosave drafts and post revisions. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Select the ***Auto Drafts***  checkbox and click ***Run Optimization*** . 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  You can also schedule automatic cleanups to ensure your database stays optimized over time.
 

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### Additional Tips for Database Optimization
<!-- /wp:heading -->

  Beyond clearing autosave drafts, here are some additional tips to keep your WordPress database optimized:
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- ***Limit Post Revisions:*** <br>WordPress saves multiple revisions of posts by default, which can also lead to database bloat. You can limit the number of revisions saved by adding the following line to your ***wp-config.php***  file: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="cpp" class="language-cpp">   define( 'WP_POST_REVISIONS', 5 );</code></pre>
<!-- /wp:code -->

  This will limit the number of revisions stored for each post to 5.
 

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- ***Delete Unused Plugins and Themes:*** <br>Unused plugins and themes can create additional database entries, which may slow down your website. Regularly remove any plugins or themes that you no longer use. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Use a Caching Plugin:*** <br>Plugins like ***W3 Total Cache***  or ***WP Super Cache***  can improve website performance by storing static versions of your content, reducing the load on your database. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Optimize Database Tables:*** <br>You can run an SQL command to optimize your tables, ensuring that any gaps in data are filled in, making the database more efficient. In ***phpMyAdmin*** , simply click the ***Optimize***  option for each table or use a plugin like ***WP-Optimize***  for automatic optimization. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity"/>
<!-- /wp:separator -->


 ### Conclusion
<!-- /wp:heading -->

  Clearing autosave drafts is an easy way to optimize your WordPress database and improve site performance. Using an SQL query, you can quickly remove these unnecessary drafts and reduce database bloat. Remember to always back up your database before performing SQL operations and consider automating the cleanup process with plugins like WP-Optimize to keep your WordPress site running smoothly over time.
 

  By following these simple steps, you can maintain a lean and efficient database, ensuring that your WordPress website remains fast and responsive!
 