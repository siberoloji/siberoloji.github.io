---
draft: false

title:  'How to Clear WordPress Autosave Drafts with SQL Query?'
date: '2024-09-17T12:47:21+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /how-to-clear-wordpress-autosave-drafts-with-sql-query/ 
slim_seo:
    - 'a:1:{s:5:"title";s:17:"wordpress cleanup";}'
featured_image: /images/Sql_data_base_with_logo.png
categories:
    - Wordpress
tags:
    - 'how-to guides'
    - 'sql query'
    - wordpress
    - 'wordpress cleanup'
---


WordPress automatically saves drafts of your posts and pages as you work on them, ensuring that your content is not lost in case of any mishaps. This autosave feature is incredibly useful, but over time, these drafts can accumulate and take up unnecessary space in your database. Clearing these autosave drafts can help improve your website's performance and reduce clutter in the database.



In this post, we’ll explain how you can clear WordPress autosave drafts using an SQL query, a quick and effective method to manage your WordPress database.


 


What Are WordPress Autosave Drafts?



Before diving into the technical details, it’s important to understand what autosave drafts are. WordPress automatically saves a draft of your posts or pages at regular intervals (every 60 seconds by default) as you write. This draft is stored in the **wp_posts** table of your WordPress database.



Autosaves are a safeguard against potential loss of content, especially if your browser crashes or if you accidentally close the editor before manually saving your work. However, WordPress does not automatically delete these autosaved drafts after publishing or updating a post, which can lead to the accumulation of unnecessary data in your database.


 


Why Clear Autosave Drafts?



While autosaves are beneficial during the content creation process, leftover autosave drafts can have some downsides:


* **Database Bloat:** Over time, unused autosave drafts accumulate in your database, which increases its size unnecessarily. This can impact the performance of your website, especially if you have a large volume of content.

* **Cluttered Database Management:** For developers and administrators managing the WordPress database, too many unwanted drafts can clutter the database, making it harder to maintain.

* **Improved Performance:** By clearing out old autosaves, you can reduce the number of rows in your **wp_posts** table, helping to optimize database queries and overall performance.



 


How to Identify Autosave Drafts in Your Database



In the WordPress database, drafts (including autosaves) are stored in the **wp_posts** table, and they are marked with a post status of `auto-draft`. Each autosave draft also corresponds to an existing post, page, or custom post type, with WordPress creating a new record in the database for each autosave.



To identify the autosave drafts, you can use the following SQL query. This query fetches all records in the **wp_posts** table with a post status of `auto-draft`:


```cpp
SELECT * FROM wp_posts WHERE post_status = 'auto-draft';
```



Running this query will display all the autosave drafts in your database, showing you the exact rows that are consuming unnecessary space.


 


How to Clear WordPress Autosave Drafts Using an SQL Query



Clearing autosave drafts from your WordPress database is a straightforward process when using an SQL query. However, **always remember to back up your database before running any queries**, as SQL operations can’t be undone easily if something goes wrong.



Follow these steps to delete autosave drafts:


#### Step 1: Backup Your Database



Before performing any SQL operations, it’s crucial to back up your database. You can do this using your web hosting provider's tools (like **cPanel**) or plugins such as **UpdraftPlus** or **WPvivid**.


#### Step 2: Access Your Database via phpMyAdmin



Once you’ve backed up your database, access your **phpMyAdmin** tool through your hosting provider’s control panel (e.g., cPanel, Plesk, etc.).


* Log in to your hosting control panel.

* Navigate to **phpMyAdmin** (usually found under the "Databases" section).

* Select your WordPress database from the left sidebar.



#### Step 3: Run the SQL Query to Delete Autosave Drafts



Once inside **phpMyAdmin**, locate the **SQL** tab, where you can run custom SQL queries. To remove all autosave drafts, enter the following SQL query:


```cpp
DELETE FROM wp_posts WHERE post_status = 'auto-draft';
```



This query will delete all posts and pages with the `auto-draft` status, effectively clearing out all WordPress autosave drafts from your database.


#### Step 4: Verify the Changes



After running the query, you can verify that the autosave drafts have been deleted by running the following query:


```cpp
SELECT * FROM wp_posts WHERE post_status = 'auto-draft';
```



If no results are returned, it means that the autosave drafts have been successfully deleted.


 


Automating the Process for Regular Cleanup



If you find yourself needing to clean up autosave drafts regularly, you can automate the process using a plugin like **WP-Optimize**. This plugin offers database cleanup and optimization features, including the ability to remove autosave drafts, post revisions, and other redundant content.



Here’s how you can automate cleanup using **WP-Optimize**:


* Install and activate the **WP-Optimize** plugin.

* Navigate to **WP-Optimize** in your WordPress dashboard.

* Under the "Database" tab, you’ll see options to clean up various types of data, including autosave drafts and post revisions.

* Select the **Auto Drafts** checkbox and click **Run Optimization**.
You can also schedule automatic cleanups to ensure your database stays optimized over time.


 


Additional Tips for Database Optimization



Beyond clearing autosave drafts, here are some additional tips to keep your WordPress database optimized:


* **Limit Post Revisions:** WordPress saves multiple revisions of posts by default, which can also lead to database bloat. You can limit the number of revisions saved by adding the following line to your **wp-config.php** file:



```cpp
   define( 'WP_POST_REVISIONS', 5 );
```



This will limit the number of revisions stored for each post to 5.





* **Delete Unused Plugins and Themes:** Unused plugins and themes can create additional database entries, which may slow down your website. Regularly remove any plugins or themes that you no longer use.

* **Use a Caching Plugin:** Plugins like **W3 Total Cache** or **WP Super Cache** can improve website performance by storing static versions of your content, reducing the load on your database.

* **Optimize Database Tables:** You can run an SQL command to optimize your tables, ensuring that any gaps in data are filled in, making the database more efficient. In **phpMyAdmin**, simply click the **Optimize** option for each table or use a plugin like **WP-Optimize** for automatic optimization.



 


Conclusion



Clearing autosave drafts is an easy way to optimize your WordPress database and improve site performance. Using an SQL query, you can quickly remove these unnecessary drafts and reduce database bloat. Remember to always back up your database before performing SQL operations and consider automating the cleanup process with plugins like WP-Optimize to keep your WordPress site running smoothly over time.



By following these simple steps, you can maintain a lean and efficient database, ensuring that your WordPress website remains fast and responsive!
