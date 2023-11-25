# SQL Reference

## Order of queries:

SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY > LIMIT/OFFEST

## Table of Contents
- [1. SELECT](#select)
- [2. SELECT DISTINCT](#select-distinct)
- [3. WHERE](#where)
  - [3.1. Operators used with WHERE](#operators-used-with-where)
- [4. ORDER BY](#order-by)
  - [4.1. AND operator](#and-operator)
  - [4.2. OR operator](#or-operator)
  - [4.3. NOT operator](#not-operator)
- [5. INSERT INTO](#insert-into)
  - [5.1. Insert multiple rows](#insert-multiple-rows)
- [6. NULL values](#null-values)
  - [6.1. Test IS NULL](#test-is-null)
  - [6.2. Test IS NOT NULL](#test-is-not-null)
- [7. UPDATE](#update)
  - [7.1. UPDATE multiple records](#update-multiple-records)
- [8. DELETE](#delete)
  - [8.1. DELETE all rows](#delete-all-rows)
  - [8.2. DELETE the table](#delete-the-table)
- [9. SELECT TOP](#select-top)
  - [9.1. SELECT TOP with WHERE](#select-top-with-where)
  - [9.2. SELECT TOP with ORDER BY](#select-top-with-order-by)
- [10. MIN and MAX](#min-and-max)
- [11. COUNT](#count)
  - [11.1. Ignore Duplicates](#ignore-duplicates)
  - [11.2. Use an Alias](#use-an-alias)
- [12. SUM](#sum)
  - [12.1. WHERE and Alias](#where-and-alias)
  - [12.2. SUM with an Expression](#sum-with-an-expression)
- [13. AVG](#avg)
  - [13.1. WHERE and Alias](#where-and-alias)
  - [13.2. Higher Than Average](#higher-than-average)
- [14. LIKE](#like)
  - [14.1. Combine AND and OR](#combine-and-and-or)
- [15. Wildcard Characters](#wildcard-characters)
- [16. IN](#in)
  - [16.1. IN and NOT IN](#in-and-not-in)
  - [16.2. NOT IN](#not-in)


## 1. SELECT 
[Back to Table of Contents](#table-of-contents)

```sql
-- Select all columns
SELECT * FROM tableName;
SELECT colum1,colum2 FROM tableName;
```



## 2. SELECT DISTINCT
[Back to Table of Contents](#table-of-contents)

```sql
-- Removes duplicates
SELECT DISTINCT colum1,colum2 FROM tableName;

-- Count distinct values
SELECT COUNT(DISTINCT col1,...) FROM tableName; -- not supported in MS Server
SELECT Count(*) AS DistinctCountries FROM (SELECT DISTINCT colum1,.. FROM tableName); -- supported in MS server
SELECT colum1 AS newName1, colum2 AS newName2 FROM tableName;`
```

## 3. WHERE
[Back to Table of Contents](#table-of-contents)

```sql
-- filter records/rows
SELECT colum1,.. FROM tableName WHERE condition1;
SELECT colum1,.. FROM tableName WHERE colum1='dataToCompare';
SELECT colum1,.. FROM tableName WHERE colum1=1;  
```

#### 3.1. operators used with WHERE

`<, >, >=, <=, BETWEEN, LIKE, IN`

```sql
-- BETWEEN, LIKE, IN
SELECT colum1,.. FROM tableName WHERE colum1 BETWEEN 2 AND 4;
SELECT colum1,.. FROM tableName WHERE colum1 > 5;
SELECT colum1,.. FROM tableName WHERE colum1 LIKE '%c%';
SELECT * FROM tableName WHERE column1 IN ('dataName');
```

## 4. ORDER BY 
[Back to Table of Contents](#table-of-contents)

```sql
-- Ascending order by default
SELECT * FROM tableName ORDER BY column; -- for string values will order in asc order

-- Order by multiple columns
SELECT * FROM tableName ORDER BY column1 ASC, column2 DESC;
SELECT * FROM tableName ORDER BY column1, column2; -- will order by col1 but if col1 has the same values then col2 will be triggered
SELECT * FROM TableName ORDER BY 1; -- 1 is the column number
```

#### 4.1. AND operator

```sql
-- flitering more than one condition. Both opernads need to be true
SELECT * FROM tableName WHERE column1='data' AND (column1 LIKE '%c%' OR column2 BETWEEN 2 AND 5); -- without () the filtering the sec argument OR will not take into account column1
SELECT * FROM tableName WHERE column1='data' AND column > number;
```

#### 4.2. OR operator

```sql
-- If any condition is true
SELECT * FROM tableName WHERE column1 = 'data' OR column1 = 'data';
SELECT * FROM tableName WHERE column1 = 'data' OR column2 LIKE 'G%' OR column3 = 'data'; -- at least one condition must be true
```

#### 4.3. NOT operator 

```sql
-- Combine with other operators like `AND`, `OR` , `=`, `LIKE` etc. and gives oposite result
SELECT * FROM tableName NOT column1='data';
SELECT * FROM tableName column1='data' AND NOT column2='data';
SELECT * FROM tableName WHERE column NOT LIKE 'A%';
SELECT * FROM tableName WHERE column NOT BETWEEN 10 AND 60;
SELECT * FROM tableName WHERE column NOT IN ('Paris', 'London');
SELECT * FROM tableName WHERE NOT column > 50;` same as -> `SELECT * FROM tableName WHERE column !> 50;
SELECT * FROM tableName WHERE NOT column < 50;` same as -> `SELECT * FROM tableName WHERE column !< 50;
```

## 5. INSERT INTO
[Back to Table of Contents](#table-of-contents)

```sql
-- Insert new  record/row into table
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

#### 5.1. Insert multiple rows 

```sql
ISERT INTO tableName (column1, column2, column3)
VALUES 
('val1', 'val2', 'val3'),
('val4', 'val5', 'val6'),
('val7', 'val8', 'val9');
```

## 6. NULL values
[Back to Table of Contents](#table-of-contents)

`NULL` is a field with no value. If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a `NULL` value. A field with a `NULL` value is one that has been left blank during record creation.

#### 6.1. Test IS NULL
  
```sql  
SELECT column
FROM tableName
WHERE column IS NULL;
```

#### 6.2. Test IS NOT NULL

```sql
SELECT column
FROM tableName
WHERE column IS NOT NULL;
```

## 7. UPDATE 
[Back to Table of Contents](#table-of-contents)

```sql
-- Modify the existing records in a table
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

**Note:**
*Be careful when updating records in a table! The `WHERE` clause in the UPDATE statement. The `WHERE` clause specifies which record(s) that should be updated. If you omit the `WHERE` clause, all records in the table will be updated.*

```sql
UPDATE tableName
SET column = 'Marcin Tatarski', City= 'London'
WHERE userID = 1;
```

#### 7.1 UPDATE multiple records

```sql
-- Without WHERE clause that determines how many records will be updated
UPDATE tableName SET name = 'Marcin Tatarski';
```

## 8. DELETE 
[Back to Table of Contents](#table-of-contents)

```sql
-- Delete existing records in a table
DELETE FROM tableName WHERE condition;
```

**Note:**
*Be careful when deleting records in a table! The `WHERE` clause in the `DELETE` statement. 
The `WHERE` clause specifies which record(s) should be deleted. If you omit the `WHERE` clause, 
all records in the table will be deleted.*

#### 8.1. DELETE all rows

```sql
-- Delete all rows in a table without deleting the table
DELETE FROM tableName;
```

#### 8.2. DELETE the table

```sql
DROP TABLE tableName;
```

## 9. SELECT TOP 
[Back to Table of Contents](#table-of-contents)

`SELECT TOP` used to specify the number of records to return. The `SELECT TOP` clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.

- SQL Server / MS Access Syntax

```sql
SELECT TOP number|percent column(s)
FROM tableName
WHERE condition;
```
  
```sql
SELECT TOP number * FROM tableName;
SELECT TOP 50 PERCENT * FROM tableName;
```

- MySQL Syntax

```sql
SELECT column(s)
FROM tableName
WHERE condition
LIMIT number;
```
  
```sql
SELECT * FROM tableName LIMIT number;
```

#### 9.1. SELECT TOP with WHERE

- SQL Server/MS Access

```sql
SELECT TOP 3 * FROM tableName WHERE column='text';
```

- MySQL

```sql
SELECT * FROM tableName WHERE column='text' LIMIT 3;
```

#### 9.2. SELECT TOP with ORDER BY

- SQL Server/MS Access

```sql
SELECT TOP * 3 FROM tableName ORDER BY column DESC;
```

- MySQL

```sql
SELECT * FROM tableName ORDER BY column DESC LIMIT 3;
```

## 10. MIN and MAX
[Back to Table of Contents](#table-of-contents)

- The MIN() function returns the smallest value of the selected column.
  
```sql
SELECT MIN(column)
FROM tableName
WHERE condition;
```

- The MAX() function returns the largest value of the selected column.
  
```sql
SELECT MAX(column)
FROM tableName
WHERE condition;
```

## 11. COUNT
[Back to Table of Contents](#table-of-contents)

```sql
--  COUNT() Function, number of rows that matches a specified criterion
SELECT COUNT(column)
FROM tableName
WHERE condition;
```
  
#### 11.1. Ignore Duplicates
  
```sql
SELECT COUNT(DISTINCT column) FROM tableName;
```

#### 11.2. Use an Alias

```sql
SELECT COUNT(*) AS [long text] FROM tableName;
```

## 12. SUM
[Back to Table of Contents](#table-of-contents)

```sql
-- SUM() Function, total sum of a numeric column
SELECT SUM(column)
FROM tableName
WHERE condition;
``` 

#### 12.1. WHERE and Alias

```sql
SELECT SUM(column) AS text FROM tableName WHERE column = condition;
```

#### 12.2. SUM with an Expression

```sql
SELECT SUM(Quantity * 10) FROM tableName;
```

## 13. AVG()
[Back to Table of Contents](#table-of-contents)

```sql
-- AVG() Function, average value of a numeric column
SELECT AVG(column)
FROM tableName
WHERE condition;
```

**Note:**
*`NULL` values are ignored*

#### 13.1. WHERE and Alias

```sql
SELECT AVG(column) AS text FROM tableName WHERE column = condition;
```

#### 13.2. Higher Than Average

```sql
-- We can use the `AVG()` function in a subquery
SELECT * FROM tableName WHERE column > (SELECT AVG(column) FROM tableName);
```

## 14. LIKE()
[Back to Table of Contents](#table-of-contents)

```sql
-- LLIKE() operator, is used in a WHERE clause to search for a specified pattern in a column
SELECT column1, column2, ...
FROM tableName
WHERE column1 LIKE pattern;
```

**Note:**
*There are two wildcards often used in conjunction with the LIKE operator:*
- *The percent sign % represents zero, one, or multiple characters*
- *The underscore sign _ represents one, single character*

#### 14.1. Combine AND and OR

```sql
SELECT * FROM tableName WHERE colName1 LIKE 'a%' OR colName2 LIKE 'b%';
```

## 15. Wildcard Characters
[Back to Table of Contents](#table-of-contents)

```sql
-- Wildcard char used to substitute one or more characters in a string
SELECT * FROM tableName WHERE colName LIKE '[aer]%';
SELECT * FROM tableName WHERE colName LIKE '[a-f]%';
```

- `%`  Represents zero or more characters						 	
- `_`  Represents a single character
- `[]` Represents any single character within the brackets *				
- `^`  Represents any character not in the brackets *
- `-`  Represents any single character within the specified range *
- `{}` Represents any escaped character **

`*` Not supported in PostgreSQL and MySQL databases.
`**` Supported only in Oracle databases.

**Note:**
*Wildcard characters are used with the LIKE operator. 
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.*

## 16. IN 
[Back to Table of Contents](#table-of-contents)

```sql
-- IN operator. Allows you to specify multiple values in a WHERE clause
SELECT column(s)
FROM tableName
WHERE column IN (value1, value2, ...);
```

**Note:**
*The `IN` operator is a shorthand for multiple OR conditions.*

#### 16.1 IN and NOT IN


```sql
-- IN (SELECT) & `NOT IN` (SELECT), you can also use IN with a subquery in the WHERE 
SELECT * FROM tableName WHERE column IN (SELECT column FROM tableName);
```

#### 16.2. NOT IN 

```sql
-- NOT IN return all records that are NOT any of the values in the list
SELECT * FROM tableName WHERE column NOT IN (conditions, ...);
```



