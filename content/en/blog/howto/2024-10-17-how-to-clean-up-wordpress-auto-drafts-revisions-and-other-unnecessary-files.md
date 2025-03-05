---
draft: false

title:  'How to Clean Up WordPress: Auto Drafts, Revisions, and Other Unnecessary Files'
date: '2024-10-17T16:48:43+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /how-to-clean-up-wordpress-auto-drafts-revisions-and-other-unnecessary-files/
slim_seo:
    - 'a:1:{s:5:"title";s:18:"wordpress clean up";}'
featured_image: /images/wordpress.webp
categories:
    - Wordpress
tags:
    - 'how-to guides'
    - wordpress
---


WordPress is one of the most popular content management systems (CMS) for building websites. It's user-friendly, flexible, and can handle a wide variety of website types. However, over time, your WordPress database can accumulate clutter, such as auto drafts, post revisions, trashed items, and other unnecessary files. This bloat can slow down your website, making it less efficient and harder to manage.



In this article, we'll walk you through how to clean up your WordPress site by removing auto drafts, revisions, and other superfluous files. Keeping your site clean will help improve performance, reduce database size, and make it easier to manage. Let’s dive into the details.



## Why Cleanup Is Essential for WordPress



Before we delve into the cleanup process, it’s important to understand why cleaning up your WordPress site is crucial for its health and performance. Here's why:



1. **Improved Site Speed**



Every time a user visits your website, the server has to pull information from the WordPress database. If your database is cluttered with unnecessary data like old revisions and auto drafts, it takes longer for the server to retrieve the necessary information, which can slow down your website. Cleaning up these files helps speed up database queries and, by extension, your website.



2. **Reduced Database Size**



As you publish posts and pages, WordPress saves multiple versions and drafts of your content, which can take up space in your database. Over time, this can lead to significant bloat. By cleaning out revisions and drafts, you can significantly reduce the size of your WordPress database, making it easier to manage and backup.



3. **Enhanced Website Performance**



Website speed is a major factor in user experience and SEO rankings. A cluttered database can lead to longer load times, which may hurt your rankings on search engines like Google. Keeping your database clean ensures optimal performance.



4. **Fewer Errors and Database Corruption Risks**



A bloated database may increase the chances of database errors or corruption, which can lead to issues with your website. Regular cleanup helps to mitigate these risks, ensuring that your website runs smoothly.



## Common Types of Clutter in WordPress



Now that you understand why it's essential to clean up WordPress, let's look at the common types of clutter that accumulate over time:


* **Auto Drafts:** These are temporary drafts automatically created by WordPress to prevent data loss while you're working on a post or page. Over time, unused auto drafts can accumulate and take up space.

* **Post Revisions:** WordPress saves a new revision every time you update a post or page. While revisions can be helpful, too many revisions can clog up your database.

* **Trashed Posts and Pages:** Posts or pages that you've moved to the trash but haven’t permanently deleted remain in your database until you manually remove them.

* **Unused Media Files:** Over time, your WordPress media library can become full of images, videos, and other media files that are no longer in use.

* **Spam and Unapproved Comments:** These comments can accumulate quickly, and if left unattended, can add to the clutter in your database.
## How to Clean Up Auto Drafts and Revisions in WordPress



Here’s a step-by-step guide to cleaning up your WordPress site, starting with auto drafts and revisions.



1. **Manual Cleanup via WordPress Dashboard**



WordPress allows you to manually delete auto drafts, revisions, and trashed items from your dashboard. This method is straightforward but can be time-consuming if you have a lot of posts.


#### Steps to Manually Delete Auto Drafts and Revisions:


* **Delete Auto Drafts:**



* Navigate to the “Posts” section in your WordPress dashboard.

* Select the “Drafts” tab.

* Review the drafts and delete any that are no longer needed by moving them to the trash.



* **Delete Revisions:**



* Open a post or page in the editor.

* In the “Post” panel, find the “Revisions” section.

* Review each revision and manually delete any that are not needed by selecting an older version and clicking “Restore.”



* **Empty the Trash:**



* After moving drafts or revisions to the trash, navigate to “Posts” > “All Posts” > “Trash.”

* Click on “Empty Trash” to permanently delete all items.
This method works, but it's not efficient for larger sites. If you manage a site with hundreds or thousands of posts, using a plugin or a more automated method will save you significant time and effort.



2. **Using Plugins for Efficient Cleanup**



If your WordPress database is bloated with a lot of auto drafts, revisions, and other junk, using a cleanup plugin is the most efficient option. Here are some popular plugins you can use:


#### a. **WP-Optimize**



WP-Optimize is one of the most widely-used WordPress cleanup plugins. It can help you optimize your database, compress images, and even cache your website for faster performance.



**Steps to Clean Auto Drafts and Revisions with WP-Optimize:**


* Install and activate the **WP-Optimize** plugin.

* Go to “WP-Optimize” in your WordPress dashboard.

* Under the “Database” tab, you’ll see options for cleaning up revisions, auto drafts, trashed items, and more.

* Select the items you want to clean and click “Run Optimization.”
The plugin will automatically clean up all selected database tables, making the process quick and hassle-free.


#### b. **Advanced Database Cleaner**



Advanced Database Cleaner is another excellent plugin that focuses on cleaning your WordPress database. It not only removes auto drafts and revisions but also optimizes your database tables to improve performance.



**Steps to Use Advanced Database Cleaner:**


* Install and activate the plugin from the WordPress Plugin Repository.

* Go to “WP DB Cleaner” in the dashboard.

* You can schedule automatic cleanups or manually select items like revisions, drafts, and comments to be deleted.

* Click “Clean” to remove the selected items.
The plugin also allows you to schedule regular cleanups, so your database stays optimized over time.


#### c. **WP-Sweep**



WP-Sweep is another efficient plugin for cleaning up your WordPress database. It helps remove auto drafts, post revisions, unused terms, and even orphaned post metadata.



**Steps to Use WP-Sweep:**


* Install and activate the plugin.

* Navigate to “Tools” > “Sweep.”

* You will see various items such as revisions, drafts, trashed posts, and more.

* Click the “Sweep” button next to each category you want to clean up.
The plugin will automatically remove the selected items, keeping your database lean and optimized.



## Best Practices for Managing Auto Drafts and Revisions



While cleaning up your site is essential, there are steps you can take to prevent clutter from building up in the first place.



1. **Limit Post Revisions**



By default, WordPress stores an unlimited number of revisions for each post or page. You can limit the number of revisions WordPress keeps by adding a line of code to your `wp-config.php` file.



Here’s how to limit post revisions:


* Open your `wp-config.php` file (found in the root directory of your WordPress installation).

* Add the following line of code:



```bash
   define('WP_POST_REVISIONS', 3);
```



This will limit the number of post revisions to 3. You can adjust this number based on your preferences.



2. **Disable Auto Drafts and Revisions**



If you prefer not to have WordPress save auto drafts and revisions at all, you can disable this feature by adding code to your `wp-config.php` file:


```bash
define('AUTOSAVE_INTERVAL', 86400); // Auto-save every 24 hours (basically disables it)
define('WP_POST_REVISIONS', false); // Disables revisions
```



This method is not recommended unless you're sure you won't need revisions, as they can be useful in case you need to revert to an earlier version of a post.



3. **Schedule Regular Cleanups**



If you're using a plugin like WP-Optimize or Advanced Database Cleaner, take advantage of their scheduling features to automatically clean up your database at regular intervals (e.g., weekly or monthly). This way, your site remains optimized without manual intervention.



## Conclusion



Cleaning up auto drafts, revisions, and other unnecessary clutter in WordPress is a key aspect of website maintenance. A clean database enhances performance, improves user experience, and boosts your SEO rankings. Whether you choose to manually delete drafts and revisions or use a plugin to automate the process, regular cleanups will keep your WordPress site running smoothly.



By following the steps outlined above and adopting best practices like limiting revisions and scheduling cleanups, you can maintain a fast and efficient WordPress website.
