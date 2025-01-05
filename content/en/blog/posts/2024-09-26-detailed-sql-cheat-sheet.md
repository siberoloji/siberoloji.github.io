---
draft: false

title:  'Detailed SQL Cheat Sheet'
date: '2024-09-26T12:49:15+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /detailed-sql-cheat-sheet/
 
featured_image: /images/Sql_data_base_with_logo.png
categories:
    - SQL
tags:
    - Cheatsheet
    - sql
---


Here's a detailed **SQL Cheat Sheet** you can use for your blog post:



**SQL Cheat Sheet**


#### **1. Basic SQL Commands**


* **SELECT**: Retrieves data from a database.



```bash
  SELECT column1, column2 FROM table;
```


* **WHERE**: Filters records.



```bash
  SELECT * FROM table WHERE condition;
```


* **INSERT INTO**: Adds new records.



```bash
  INSERT INTO table (column1, column2) VALUES (value1, value2);
```


* **UPDATE**: Modifies existing records.



```bash
  UPDATE table SET column1 = value WHERE condition;
```


* **DELETE**: Removes records.



```bash
  DELETE FROM table WHERE condition;
```




#### **2. SQL Clauses**


* **ORDER BY**: Sorts results.



```bash
  SELECT * FROM table ORDER BY column ASC|DESC;
```


* **GROUP BY**: Groups rows that share values.



```bash
  SELECT column, COUNT(*) FROM table GROUP BY column;
```


* **HAVING**: Filters groups (used with `GROUP BY`).



```bash
  SELECT column, COUNT(*) FROM table GROUP BY column HAVING COUNT(*) &gt; 1;
```


* **LIMIT**: Limits the number of results.



```bash
  SELECT * FROM table LIMIT 10;
```




#### **3. Joins**


* **INNER JOIN**: Returns matching records from both tables.



```bash
  SELECT * FROM table1
  INNER JOIN table2 ON table1.column = table2.column;
```


* **LEFT JOIN**: Returns all records from the left table and matching records from the right.



```bash
  SELECT * FROM table1
  LEFT JOIN table2 ON table1.column = table2.column;
```


* **RIGHT JOIN**: Returns all records from the right table and matching records from the left.



```bash
  SELECT * FROM table1
  RIGHT JOIN table2 ON table1.column = table2.column;
```


* **FULL JOIN**: Returns all records when there's a match in either table.



```bash
  SELECT * FROM table1
  FULL OUTER JOIN table2 ON table1.column = table2.column;
```




#### **4. Aggregate Functions**


* **COUNT()**: Returns the number of rows.



```bash
  SELECT COUNT(*) FROM table;
```


* **SUM()**: Returns the total sum of a numeric column.



```bash
  SELECT SUM(column) FROM table;
```


* **AVG()**: Returns the average value.



```bash
  SELECT AVG(column) FROM table;
```


* **MAX() / MIN()**: Returns the highest/lowest value.



```bash
  SELECT MAX(column), MIN(column) FROM table;
```




#### **5. Subqueries**


* **Subquery in WHERE clause**:



```bash
  SELECT * FROM table1 WHERE column IN (SELECT column FROM table2);
```




#### **6. Table Management**


* **CREATE TABLE**: Creates a new table.



```bash
  CREATE TABLE table_name (
    column1 datatype,
    column2 datatype
  );
```


* **ALTER TABLE**: Modifies an existing table.



```bash
  ALTER TABLE table_name ADD column datatype;
```


* **DROP TABLE**: Deletes a table.



```bash
  DROP TABLE table_name;
```




#### **7. Indexes**


* **CREATE INDEX**: Adds an index to a table.



```bash
  CREATE INDEX index_name ON table_name (column);
```


* **DROP INDEX**: Removes an index.



```bash
  DROP INDEX index_name;
```




#### **8. Data Types (Commonly Used)**


* **INT**: Integer numbers.

* **VARCHAR(size)**: Variable-length string.

* **DATE**: Date in 'YYYY-MM-DD' format.

* **DECIMAL(size, d)**: Decimal numbers, specifying precision.






This cheat sheet covers essential SQL commands and functions for working with databases. Whether you're querying data, joining tables, or managing databases, these commands will help streamline your tasks!
