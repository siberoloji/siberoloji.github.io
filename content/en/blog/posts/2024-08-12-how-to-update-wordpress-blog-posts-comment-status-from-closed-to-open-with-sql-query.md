---
draft: false
title: How to update WordPress blog posts comment status from closed to open with sql query?
date: 2024-08-12T14:58:47+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /how-to-update-wordpress-blog-posts-comment-status-from-closed-to-open-with-sql-query/
lim_seo:
    - a:1:{s:5:"title";s:18:"wordpress comments";}s
featured_image: /images/Sql_data_base_with_logo.png
categories:
    - Wordpress
tags:
    - how-to guides
    - sql
    - sql query
    - wordpress
---


To update the comment status of WordPress blog posts from "closed" to "open" using an SQL query, you’ll need to modify the WordPress database directly. Here's a step-by-step guide on how to achieve this safely:



**Backup Your Database**



Before making any changes to your database, it’s crucial to create a backup. This ensures that you can restore your site to its previous state if something goes wrong.



**Access Your Database**



You can access your WordPress database using phpMyAdmin, a MySQL client, or via the command line. For most users, phpMyAdmin is the most accessible option.



**Locate the Correct Table**



WordPress stores post settings, including comment statuses, in the `wp_posts` table. The `comment_status` field within this table determines whether comments are open or closed.



**Run the SQL Query**



To update the comment status from "closed" to "open" for all posts, use the following SQL query:


<!-- wp:code -->
<pre class="wp-block-code"><code lang="sql" class="language-sql">UPDATE wp_posts
SET comment_status = 'open'
WHERE comment_status = 'closed';
```



**Execute the Query**



In phpMyAdmin:


* Select your WordPress database.

* Click on the **SQL** tab.

* Paste the query into the SQL window.

* Click the **Go** button to execute the query.
In the command line:


* Log in to your MySQL database using:



```bash
   mysql -u username -p
```



Replace `username` with your MySQL username and enter your password when prompted.





* Select your WordPress database:



```bash
   USE your_database_name;
```





* Run the SQL query:



```bash
   UPDATE wp_posts
   SET comment_status = 'open'
   WHERE comment_status = 'closed';
```



**Verify the Changes**



After running the query, check your WordPress site to ensure that the comment status for your posts has been updated. You can do this by viewing individual posts in the WordPress admin dashboard or by checking the posts on your site.



**Additional Considerations**


* **Custom Table Prefixes**: If you’re using a custom table prefix, replace `wp_` with your actual prefix in the SQL query.

* **Selective Updates**: If you want to update the comment status for specific posts or categories, you can modify the `WHERE` clause of the query to include additional conditions.
For example, to update only posts in a specific category, you would need to join with the `wp_term_relationships` table and add a condition based on `term_id`.


* **Safety**: Directly modifying the database can be risky. Ensure you understand the query and its impact before executing it. Always have a backup ready.
By following these steps, you should be able to update the comment status of your WordPress posts from "closed" to "open" efficiently and safely.
