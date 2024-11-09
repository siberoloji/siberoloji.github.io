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
date: "2024-08-12T14:58:47Z"
guid: https://www.siberoloji.com/?p=1469
id: 1469
image: /assets/images/2024/08/Sql_data_base_with_logo.png
slim_seo:
- a:1:{s:5:"title";s:18:"wordpress comments";}
tags:
- how-to guides
- sql
- sql query
- wordpress
title: How to update WordPress blog posts comment status from closed to open with
  sql query?
url: /how-to-update-wordpress-blog-posts-comment-status-from-closed-to-open-with-sql-query/
---

  To update the comment status of WordPress blog posts from "closed" to "open" using an SQL query, you’ll need to modify the WordPress database directly. Here's a step-by-step guide on how to achieve this safely: 
 


 ### ***Backup Your Database*** 
<!-- /wp:heading -->

  Before making any changes to your database, it’s crucial to create a backup. This ensures that you can restore your site to its previous state if something goes wrong. 
 


 ### ***Access Your Database*** 
<!-- /wp:heading -->

  You can access your WordPress database using phpMyAdmin, a MySQL client, or via the command line. For most users, phpMyAdmin is the most accessible option. 
 


 ### ***Locate the Correct Table*** 
<!-- /wp:heading -->

  WordPress stores post settings, including comment statuses, in the <code>wp_posts</code> table. The <code>comment_status</code> field within this table determines whether comments are open or closed. 
 


 ### ***Run the SQL Query*** 
<!-- /wp:heading -->

  To update the comment status from "closed" to "open" for all posts, use the following SQL query: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="sql" class="language-sql">UPDATE wp_posts
SET comment_status = 'open'
WHERE comment_status = 'closed';</code></pre>
<!-- /wp:code -->


 ### ***Execute the Query*** 
<!-- /wp:heading -->

  In phpMyAdmin: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Select your WordPress database. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click on the ***SQL***  tab. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Paste the query into the SQL window. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- Click the ***Go***  button to execute the query. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  In the command line: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
- Log in to your MySQL database using: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   mysql -u username -p</code></pre>
<!-- /wp:code -->

  Replace <code>username</code> with your MySQL username and enter your password when prompted. 
 

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
- Select your WordPress database: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   USE your_database_name;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
- Run the SQL query: 
<!-- /wp:list-item --> 
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   UPDATE wp_posts
   SET comment_status = 'open'
   WHERE comment_status = 'closed';</code></pre>
<!-- /wp:code -->


 ### ***Verify the Changes*** 
<!-- /wp:heading -->

  After running the query, check your WordPress site to ensure that the comment status for your posts has been updated. You can do this by viewing individual posts in the WordPress admin dashboard or by checking the posts on your site. 
 


 ### ***Additional Considerations*** 
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Custom Table Prefixes*** : If you’re using a custom table prefix, replace <code>wp_</code> with your actual prefix in the SQL query. 
<!-- /wp:list-item -->

<!-- wp:list-item -->
- ***Selective Updates*** : If you want to update the comment status for specific posts or categories, you can modify the <code>WHERE</code> clause of the query to include additional conditions. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  For example, to update only posts in a specific category, you would need to join with the <code>wp_term_relationships</code> table and add a condition based on <code>term_id</code>. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
- ***Safety*** : Directly modifying the database can be risky. Ensure you understand the query and its impact before executing it. Always have a backup ready. 
<!-- /wp:list-item --> 
<!-- /wp:list -->

  By following these steps, you should be able to update the comment status of your WordPress posts from "closed" to "open" efficiently and safely. 
 