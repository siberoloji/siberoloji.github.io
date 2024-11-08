---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- Wordpress
date: "2024-10-17T16:48:43Z"
guid: https://www.siberoloji.com/?p=3526
id: 3526
image: /assets/images/2024/10/wordpress.webp
slim_seo:
- a:1:{s:5:"title";s:18:"wordpress clean up";}
tags:
- how-to guides
- wordpress
title: 'How to Clean Up WordPress: Auto Drafts, Revisions, and Other Unnecessary Files'
url: /how-to-clean-up-wordpress-auto-drafts-revisions-and-other-unnecessary-files/
---

  WordPress is one of the most popular content management systems (CMS) for building websites. It's user-friendly, flexible, and can handle a wide variety of website types. However, over time, your WordPress database can accumulate clutter, such as auto drafts, post revisions, trashed items, and other unnecessary files. This bloat can slow down your website, making it less efficient and harder to manage. 
 

  In this blog post, we'll walk you through how to clean up your WordPress site by removing auto drafts, revisions, and other superfluous files. Keeping your site clean will help improve performance, reduce database size, and make it easier to manage. Let’s dive into the details. 
 

 
 ## Why Cleanup Is Essential for WordPress</h2>
<!-- /wp:heading -->

  Before we delve into the cleanup process, it’s important to understand why cleaning up your WordPress site is crucial for its health and performance. Here's why: 
 

<!-- wp:heading {"level":3} -->
 ### 1. <strong>Improved Site Speed</strong></h3>
<!-- /wp:heading -->

  Every time a user visits your website, the server has to pull information from the WordPress database. If your database is cluttered with unnecessary data like old revisions and auto drafts, it takes longer for the server to retrieve the necessary information, which can slow down your website. Cleaning up these files helps speed up database queries and, by extension, your website. 
 

<!-- wp:heading {"level":3} -->
 ### 2. <strong>Reduced Database Size</strong></h3>
<!-- /wp:heading -->

  As you publish posts and pages, WordPress saves multiple versions and drafts of your content, which can take up space in your database. Over time, this can lead to significant bloat. By cleaning out revisions and drafts, you can significantly reduce the size of your WordPress database, making it easier to manage and backup. 
 

<!-- wp:heading {"level":3} -->
 ### 3. <strong>Enhanced Website Performance</strong></h3>
<!-- /wp:heading -->

  Website speed is a major factor in user experience and SEO rankings. A cluttered database can lead to longer load times, which may hurt your rankings on search engines like Google. Keeping your database clean ensures optimal performance. 
 

<!-- wp:heading {"level":3} -->
 ### 4. <strong>Fewer Errors and Database Corruption Risks</strong></h3>
<!-- /wp:heading -->

  A bloated database may increase the chances of database errors or corruption, which can lead to issues with your website. Regular cleanup helps to mitigate these risks, ensuring that your website runs smoothly. 
 

 
 ## Common Types of Clutter in WordPress</h2>
<!-- /wp:heading -->

  Now that you understand why it's essential to clean up WordPress, let's look at the common types of clutter that accumulate over time: 
 

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Auto Drafts:</strong> These are temporary drafts automatically created by WordPress to prevent data loss while you're working on a post or page. Over time, unused auto drafts can accumulate and take up space.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Post Revisions:</strong> WordPress saves a new revision every time you update a post or page. While revisions can be helpful, too many revisions can clog up your database.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Trashed Posts and Pages:</strong> Posts or pages that you've moved to the trash but haven’t permanently deleted remain in your database until you manually remove them.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Unused Media Files:</strong> Over time, your WordPress media library can become full of images, videos, and other media files that are no longer in use.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Spam and Unapproved Comments:</strong> These comments can accumulate quickly, and if left unattended, can add to the clutter in your database.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

 
 ## How to Clean Up Auto Drafts and Revisions in WordPress</h2>
<!-- /wp:heading -->

  Here’s a step-by-step guide to cleaning up your WordPress site, starting with auto drafts and revisions. 
 

<!-- wp:heading {"level":3} -->
 ### 1. <strong>Manual Cleanup via WordPress Dashboard</strong></h3>
<!-- /wp:heading -->

  WordPress allows you to manually delete auto drafts, revisions, and trashed items from your dashboard. This method is straightforward but can be time-consuming if you have a lot of posts. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">Steps to Manually Delete Auto Drafts and Revisions:</h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Delete Auto Drafts:</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Navigate to the “Posts” section in your WordPress dashboard.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the “Drafts” tab.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Review the drafts and delete any that are no longer needed by moving them to the trash.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Delete Revisions:</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open a post or page in the editor.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>In the “Post” panel, find the “Revisions” section.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Review each revision and manually delete any that are not needed by selecting an older version and clicking “Restore.”</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Empty the Trash:</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>After moving drafts or revisions to the trash, navigate to “Posts” &gt; “All Posts” &gt; “Trash.”</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click on “Empty Trash” to permanently delete all items.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  This method works, but it's not efficient for larger sites. If you manage a site with hundreds or thousands of posts, using a plugin or a more automated method will save you significant time and effort. 
 

<!-- wp:heading {"level":3} -->
 ### 2. <strong>Using Plugins for Efficient Cleanup</strong></h3>
<!-- /wp:heading -->

  If your WordPress database is bloated with a lot of auto drafts, revisions, and other junk, using a cleanup plugin is the most efficient option. Here are some popular plugins you can use: 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">a. <strong>WP-Optimize</strong></h4>
<!-- /wp:heading -->

  WP-Optimize is one of the most widely-used WordPress cleanup plugins. It can help you optimize your database, compress images, and even cache your website for faster performance. 
 

  <strong>Steps to Clean Auto Drafts and Revisions with WP-Optimize:</strong> 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Install and activate the <strong>WP-Optimize</strong> plugin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Go to “WP-Optimize” in your WordPress dashboard.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Under the “Database” tab, you’ll see options for cleaning up revisions, auto drafts, trashed items, and more.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Select the items you want to clean and click “Run Optimization.”</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  The plugin will automatically clean up all selected database tables, making the process quick and hassle-free. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">b. <strong>Advanced Database Cleaner</strong></h4>
<!-- /wp:heading -->

  Advanced Database Cleaner is another excellent plugin that focuses on cleaning your WordPress database. It not only removes auto drafts and revisions but also optimizes your database tables to improve performance. 
 

  <strong>Steps to Use Advanced Database Cleaner:</strong> 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Install and activate the plugin from the WordPress Plugin Repository.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Go to “WP DB Cleaner” in the dashboard.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>You can schedule automatic cleanups or manually select items like revisions, drafts, and comments to be deleted.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click “Clean” to remove the selected items.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  The plugin also allows you to schedule regular cleanups, so your database stays optimized over time. 
 

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading">c. <strong>WP-Sweep</strong></h4>
<!-- /wp:heading -->

  WP-Sweep is another efficient plugin for cleaning up your WordPress database. It helps remove auto drafts, post revisions, unused terms, and even orphaned post metadata. 
 

  <strong>Steps to Use WP-Sweep:</strong> 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Install and activate the plugin.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Navigate to “Tools” &gt; “Sweep.”</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>You will see various items such as revisions, drafts, trashed posts, and more.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Click the “Sweep” button next to each category you want to clean up.</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

  The plugin will automatically remove the selected items, keeping your database lean and optimized. 
 

 
 ## Best Practices for Managing Auto Drafts and Revisions</h2>
<!-- /wp:heading -->

  While cleaning up your site is essential, there are steps you can take to prevent clutter from building up in the first place. 
 

<!-- wp:heading {"level":3} -->
 ### 1. <strong>Limit Post Revisions</strong></h3>
<!-- /wp:heading -->

  By default, WordPress stores an unlimited number of revisions for each post or page. You can limit the number of revisions WordPress keeps by adding a line of code to your <code>wp-config.php</code> file. 
 

  Here’s how to limit post revisions: 
 

<!-- wp:list {"ordered":true} -->
<ol class="wp-block-list"><!-- wp:list-item -->
<li>Open your <code>wp-config.php</code> file (found in the root directory of your WordPress installation).</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>Add the following line of code:</li>
<!-- /wp:list-item --></ol>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">   define('WP_POST_REVISIONS', 3);</code></pre>
<!-- /wp:code -->

  This will limit the number of post revisions to 3. You can adjust this number based on your preferences. 
 

<!-- wp:heading {"level":3} -->
 ### 2. <strong>Disable Auto Drafts and Revisions</strong></h3>
<!-- /wp:heading -->

  If you prefer not to have WordPress save auto drafts and revisions at all, you can disable this feature by adding code to your <code>wp-config.php</code> file: 
 

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">define('AUTOSAVE_INTERVAL', 86400); // Auto-save every 24 hours (basically disables it)
define('WP_POST_REVISIONS', false); // Disables revisions</code></pre>
<!-- /wp:code -->

  This method is not recommended unless you're sure you won't need revisions, as they can be useful in case you need to revert to an earlier version of a post. 
 

<!-- wp:heading {"level":3} -->
 ### 3. <strong>Schedule Regular Cleanups</strong></h3>
<!-- /wp:heading -->

  If you're using a plugin like WP-Optimize or Advanced Database Cleaner, take advantage of their scheduling features to automatically clean up your database at regular intervals (e.g., weekly or monthly). This way, your site remains optimized without manual intervention. 
 

 
 ## Conclusion</h2>
<!-- /wp:heading -->

  Cleaning up auto drafts, revisions, and other unnecessary clutter in WordPress is a key aspect of website maintenance. A clean database enhances performance, improves user experience, and boosts your SEO rankings. Whether you choose to manually delete drafts and revisions or use a plugin to automate the process, regular cleanups will keep your WordPress site running smoothly. 
 

  By following the steps outlined above and adopting best practices like limiting revisions and scheduling cleanups, you can maintain a fast and efficient WordPress website. 
 