---

authors:
  - name: İbrahim Korucuoğlu
    link: https://github.com/siberoloji
    image: https://github.com/siberoloji.png


categories:
- SQL
classicmag_header_overlay:
- global-layout
classicmag_post_layout:
- layout-1
classicmag_post_sidebar_option:
- right-sidebar
date: "2024-09-26T12:49:15Z"
guid: https://www.siberoloji.com/?p=1825
id: 1825
image: /assets/images/2024/08/Sql_data_base_with_logo.png
tags:
- Cheatsheet
- sql
title: Detailed SQL Cheat Sheet
url: /detailed-sql-cheat-sheet/
---

  Here's a detailed <strong>SQL Cheat Sheet</strong> you can use for your blog post: 
 

<!-- wp:heading {"level":3} -->
 ### <strong>SQL Cheat Sheet</strong></h3>
<!-- /wp:heading -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>1. Basic SQL Commands</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>SELECT</strong>: Retrieves data from a database.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT column1, column2 FROM table;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>WHERE</strong>: Filters records.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table WHERE condition;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>INSERT INTO</strong>: Adds new records.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  INSERT INTO table (column1, column2) VALUES (value1, value2);</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>UPDATE</strong>: Modifies existing records.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  UPDATE table SET column1 = value WHERE condition;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>DELETE</strong>: Removes records.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  DELETE FROM table WHERE condition;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>2. SQL Clauses</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>ORDER BY</strong>: Sorts results.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table ORDER BY column ASC|DESC;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>GROUP BY</strong>: Groups rows that share values.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT column, COUNT(*) FROM table GROUP BY column;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>HAVING</strong>: Filters groups (used with <code>GROUP BY</code>).</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT column, COUNT(*) FROM table GROUP BY column HAVING COUNT(*) &gt; 1;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>LIMIT</strong>: Limits the number of results.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table LIMIT 10;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>3. Joins</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>INNER JOIN</strong>: Returns matching records from both tables.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table1
  INNER JOIN table2 ON table1.column = table2.column;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>LEFT JOIN</strong>: Returns all records from the left table and matching records from the right.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table1
  LEFT JOIN table2 ON table1.column = table2.column;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>RIGHT JOIN</strong>: Returns all records from the right table and matching records from the left.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table1
  RIGHT JOIN table2 ON table1.column = table2.column;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>FULL JOIN</strong>: Returns all records when there's a match in either table.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table1
  FULL OUTER JOIN table2 ON table1.column = table2.column;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>4. Aggregate Functions</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>COUNT()</strong>: Returns the number of rows.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT COUNT(*) FROM table;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>SUM()</strong>: Returns the total sum of a numeric column.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT SUM(column) FROM table;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>AVG()</strong>: Returns the average value.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT AVG(column) FROM table;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>MAX() / MIN()</strong>: Returns the highest/lowest value.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT MAX(column), MIN(column) FROM table;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>5. Subqueries</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Subquery in WHERE clause</strong>:</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  SELECT * FROM table1 WHERE column IN (SELECT column FROM table2);</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>6. Table Management</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>CREATE TABLE</strong>: Creates a new table.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  CREATE TABLE table_name (
    column1 datatype,
    column2 datatype
  );</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>ALTER TABLE</strong>: Modifies an existing table.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  ALTER TABLE table_name ADD column datatype;</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>DROP TABLE</strong>: Deletes a table.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  DROP TABLE table_name;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>7. Indexes</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>CREATE INDEX</strong>: Adds an index to a table.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  CREATE INDEX index_name ON table_name (column);</code></pre>
<!-- /wp:code -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>DROP INDEX</strong>: Removes an index.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:code -->
<pre class="wp-block-code"><code lang="bash" class="language-bash">  DROP INDEX index_name;</code></pre>
<!-- /wp:code -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

<!-- wp:heading {"level":4} -->
<h4 class="wp-block-heading"><strong>8. Data Types (Commonly Used)</strong></h4>
<!-- /wp:heading -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>INT</strong>: Integer numbers.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>VARCHAR(size)</strong>: Variable-length string.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DATE</strong>: Date in 'YYYY-MM-DD' format.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DECIMAL(size, d)</strong>: Decimal numbers, specifying precision.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:separator -->
<hr class="wp-block-separator has-alpha-channel-opacity" />
<!-- /wp:separator -->

  This cheat sheet covers essential SQL commands and functions for working with databases. Whether you're querying data, joining tables, or managing databases, these commands will help streamline your tasks! 
 