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
 

<!-- wp:heading {"level":3} -->
 ### <strong>Backup Your Database</strong></h3>
<!-- /wp:heading -->

  Before making any changes to your database, it’s crucial to create a backup. This ensures that you can restore your site to its previous state if something goes wrong. 
 

<!-- wp:heading {"level":3} -->
 ### <strong>Access Your Database</strong></h3>
<!-- /wp:heading -->

  You can access your WordPress database using phpMyAdmin, a MySQL client, or via the command line. For most users, phpMyAdmin is the most accessible option. 
 

<!-- wp:heading {"level":3} -->
 ### <strong>Locate the Correct Table</strong></h3>
<!-- /wp:heading -->

  WordPress stores post settings, including comment statuses, in the <code>wp_posts</code> table. The <code>comment_status</code> field within this table determines whether comments are open or closed. 
 

<!-- wp:heading {"level":3} -->
 ### <strong>Run the SQL Query</strong></h3>
<!-- /wp:heading -->

  To update the comment status from "closed" to "open" for all posts, use the following SQL query: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="sql" class="language-sql">UPDATE wp_posts
SET comment_status = 'open'
WHERE comment_status = 'closed';</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### <strong>Execute the Query</strong></h3>
<!-- /wp:heading -->

  In phpMyAdmin: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Select your WordPress database.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click on the <strong>SQL</strong> tab.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Paste the query into the SQL window.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click the <strong>Go</strong> button to execute the query.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  In the command line: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Log in to your MySQL database using:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   mysql -u username -p</code></pre>
<!-- /wp:code -->

  Replace <code>username</code> with your MySQL username and enter your password when prompted. 
 

<!-- wp:list {"ordered":true,"start":2} -->
<ol start="2" class="wp-block-list"><!-- wp:list-item -->
<li>Select your WordPress database:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   USE your_database_name;</code></pre>
<!-- /wp:code -->

<!-- wp:list {"ordered":true,"start":3} -->
<ol start="3" class="wp-block-list"><!-- wp:list-item -->
<li>Run the SQL query:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   UPDATE wp_posts
   SET comment_status = 'open'
   WHERE comment_status = 'closed';</code></pre>
<!-- /wp:code -->

<!-- wp:heading {"level":3} -->
 ### <strong>Verify the Changes</strong></h3>
<!-- /wp:heading -->

  After running the query, check your WordPress site to ensure that the comment status for your posts has been updated. You can do this by viewing individual posts in the WordPress admin dashboard or by checking the posts on your site. 
 

<!-- wp:heading {"level":3} -->
 ### <strong>Additional Considerations</strong></h3>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Custom Table Prefixes</strong>: If you’re using a custom table prefix, replace <code>wp_</code> with your actual prefix in the SQL query.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Selective Updates</strong>: If you want to update the comment status for specific posts or categories, you can modify the <code>WHERE</code> clause of the query to include additional conditions.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  For example, to update only posts in a specific category, you would need to join with the <code>wp_term_relationships</code> table and add a condition based on <code>term_id</code>. 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Safety</strong>: Directly modifying the database can be risky. Ensure you understand the query and its impact before executing it. Always have a backup ready.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

  By following these steps, you should be able to update the comment status of your WordPress posts from "closed" to "open" efficiently and safely. 
 