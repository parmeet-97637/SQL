-----------------------------------------------------------------------------------------------------------
-- What is SQL?
-----------------------------------------------------------------------------------------------------------
-- SQL stands for Structured Query Language
-- SQL lets you access and manipulate databases
-- SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987

-----------------------------------------------------------------------------------------------------------
-- What Can SQL do?
-----------------------------------------------------------------------------------------------------------
-- SQL can execute queries against a database
-- SQL can retrieve data from a database
-- SQL can insert records in a database
-- SQL can update records in a database
-- SQL can delete records from a database
-- SQL can create new databases
-- SQL can create new tables in a database
-- SQL can create stored procedures in a database
-- SQL can create views in a database
-- SQL can set permissions on tables, procedures, and views

-----------------------------------------------------------------------------------------------------------
-- RDBMS
-----------------------------------------------------------------------------------------------------------
-- RDBMS stands for Relational Database Management System.
-- RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, Oracle, MySQL, and Microsoft Access.
-- The data in RDBMS is stored in database objects called tables. 
-- A table is a collection of related data entries and it consists of columns and rows. 
-- Every table is broken up into smaller entities called fields.
-- A record, also called a row, is each individual entry that exists in a table. 
-- A record is a horizontal entity in a table.
-- A column is a vertical entity in a table that contains all information associated with a specific field in a table.

-----------------------------------------------------------------------------------------------------------
-- Database Tables
-----------------------------------------------------------------------------------------------------------
-- A database most often contains one or more tables. Each table is identified by a name (e.g. "Customers" or "Orders"). 
-- Tables contain records (rows) with data.
------------------------------------------------------------------
-- | CustomerID |	CustomerName |	City |	PostalCode | Country |
------------------------------------------------------------------
-- |1			|Parmeet		 |Indore |	452001	   |  India  |
-- |2			|Trishann		 |Mumbai |	400004	   |  India  |
-- |3			|Anit		 	 |Bhopal |	462001	   |  India  |
------------------------------------------------------------------
-- The table above contains three records (one for each customer) and five columns (CustomerID, CustomerName, City, PostalCode, and Country)

-----------------------------------------------------------------------------------------------------------
-- SQL SELECT Statement
-----------------------------------------------------------------------------------------------------------
-- The SELECT statement is used to select data from a database.
-- The data returned is stored in a result table, called the result-set.

	-- SELECT Syntax :
					-- SELECT column1, column2, ...
					-- FROM table_name;			
                    
-- Here, column1, column2, ... are the field names of the table you want to select data from. 

-- If you want to select all the fields available in the table, use the following syntax:
		-- SELECT * FROM table_name;
        
--------------------------------------------------------
-- Select all the columns from the table
--------------------------------------------------------
select * from cust_dimen;

--------------------------------------------------------
-- Select specific columns from the table
--------------------------------------------------------
select Customer_Name,City from cust_dimen;


-----------------------------------------------------------------------------------------------------------
-- The SQL SELECT DISTINCT Statement
-----------------------------------------------------------------------------------------------------------
-- The SELECT DISTINCT statement is used to return only distinct (different) values.

-- Inside a table, a column often contains many duplicate values; sometimes you only want to list the different (distinct) values.

	-- SELECT DISTINCT Syntax:
						-- SELECT DISTINCT column1, column2, ...
						-- FROM table_name;
                        
--------------------------------------------------------
-- SELECT Example Without DISTINCT
--------------------------------------------------------
select City from cust_dimen;                        

--------------------------------------------------------
-- SELECT Example With DISTINCT
--------------------------------------------------------
select DISTINCT City from cust_dimen;    

--------------------------------------------------------
-- count distinct city
--------------------------------------------------------
select count(DISTINCT City) from cust_dimen;             

-----------------------------------------------------------------------------------------------------------
-- SQL WHERE Clause
-----------------------------------------------------------------------------------------------------------
 -- The WHERE clause is used to filter records.
-- It is used to extract only those records that fulfill a specified condition.      

		-- WHERE Syntax:
				-- SELECT column1, column2, ...
				-- FROM table_name
				-- WHERE condition;
                
--------------------------------------------------------
-- find customers which belongs to Mysore City
--------------------------------------------------------
select * from cust_dimen where city = 'Mysore';

--------------------------------------------------------
-- Text Fields vs. Numeric Fields
--------------------------------------------------------
-- SQL requires single quotes around text values
-- numeric fields should not be enclosed in quotes

--------------------------------------------------------
-- Equal-to Operator
--------------------------------------------------------
select * from manu where Manu_id =1 ;

--------------------------------------------------------
-- Greater than opertor
--------------------------------------------------------
select * from manu where Manu_id>2;

--------------------------------------------------------
-- Less than operator
--------------------------------------------------------
select * from manu where Manu_id<3;

--------------------------------------------------------
-- Not-equal to operator
--------------------------------------------------------
select * from manu where manu_id <> 2;
select * from manu where manu_id != 2;

--------------------------------------------------------
-- Between operator
--------------------------------------------------------
select * from manu where manu_id between 2 and 4;

--------------------------------------------------------
-- Like operator
--------------------------------------------------------
select * from cust_dimen where Customer_Name Like '%WACO%';

--------------------------------------------------------
-- IN operator
--------------------------------------------------------
select * from cust_dimen where city IN('Mysore','Kolkata');

-----------------------------------------------------------------------------------------------------------
-- The SQL AND, OR and NOT Operators
-----------------------------------------------------------------------------------------------------------
-- The WHERE clause can be combined with AND, OR, and NOT operators.
-- The AND and OR operators are used to filter records based on more than one condition:
	-- The AND operator displays a record if all the conditions separated by AND are TRUE.
	-- The OR operator displays a record if any of the conditions separated by OR is TRUE.
	-- The NOT operator displays a record if the condition(s) is NOT TRUE.

-- AND Syntax:
		-- SELECT column1, column2, ...
		-- FROM table_name
		-- WHERE condition1 AND condition2 AND condition3 ...;
        
-- OR Syntax:
		-- SELECT column1, column2, ...
		-- FROM table_name
		-- WHERE condition1 OR condition2 OR condition3 ...;
        
-- NOT Syntax:
		-- SELECT column1, column2, ...
		-- FROM table_name
		-- WHERE NOT condition;
        
--------------------------------------------------------
-- AND operator
--------------------------------------------------------
select * from cust_dimen where City = 'Kolkata' 
			   and Customer_Segment ='CORPORATE';

--------------------------------------------------------
-- OR operator
--------------------------------------------------------
select * from cust_dimen where State = 'Maharashtra'
						or Customer_Segment = 'CORPORATE';
                        
--------------------------------------------------------
-- NOT operator
--------------------------------------------------------   
select * from cust_dimen where NOT state ='Karnataka';

--------------------------------------------------------
-- Combining AND, NOR, NOT operator
-------------------------------------------------------- 
select * from cust_dimen where State ='Maharashtra' AND 
		(Customer_Segment = 'SMALL BUSINESS' or 
         Customer_Segment = 'CONSUMER') AND 
         NOT City = 'Mumbai';
         
-----------------------------------------------------------------------------------------------------------
-- The SQL ORDER BY Keyword
-----------------------------------------------------------------------------------------------------------
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.
-- The ORDER BY keyword sorts the records in ascending order by default. 
-- To sort the records in descending order, use the DESC keyword.

-- ORDER BY Syntax:
		-- SELECT column1, column2, ...
		-- FROM table_name
		-- ORDER BY column1, column2, ... ASC|DESC;

--------------------------------------------------------
-- Ordering customer dimension by state - Deafult is ASC
-------------------------------------------------------- 
select * from cust_dimen order by State;

--------------------------------------------------------
-- Ordering customer dimension by state in DESC Order
-------------------------------------------------------- 
select * from cust_dimen order by State DESC;

--------------------------------------------------------
-- Ordering customer dimension by state, city & Segment
-------------------------------------------------------- 
select * from cust_dimen order by state,city,Customer_Segment;

--------------------------------------------------------
-- Ordering customer dimension by state, city - ASC 
--                                & Segment   - DESC
-------------------------------------------------------- 
select * from cust_dimen order by state ASC,city ASC ,Customer_Segment DESC;


-----------------------------------------------------------------------------------------------------------
-- The SQL INSERT INTO Statement
-----------------------------------------------------------------------------------------------------------
-- The INSERT INTO statement is used to insert new records in a table.

-- INSERT INTO Syntax:
	-- It is possible to write the INSERT INTO statement in two ways:
    
	-- 1. Specify both the column names and the values to be inserted:
			-- INSERT INTO table_name (column1, column2, column3, ...)
			-- VALUES (value1, value2, value3, ...);
            
	-- 2. Specify only values to be inserted:
			-- INSERT INTO table_name
			-- VALUES (value1, value2, value3, ...);

--------------------------------------------------------
-- Insert into manu table using column Name and values
-------------------------------------------------------- 
insert into manu (Manu_Id,Manu_Name,Manu_City)
values(6,"Infosys","Chennai");

select * from manu;

--------------------------------------------------------
-- Insert into manu table using values
-------------------------------------------------------- 
insert into manu
values(7,"Nagarro","Delhi");

select * from manu;

--------------------------------------------------------
-- Insert data only in specified column
-------------------------------------------------------- 
insert into manu (Manu_Id,Manu_Name)
values(8,"YASH");

select * from manu;

-----------------------------------------------------------------------------------------------------------
-- SQL NULL VALUES
-----------------------------------------------------------------------------------------------------------
-- What is a NULL Value?
-- A field with a NULL value is a field with no value.
-- If a field in a table is optional, it is possible to insert a new record or 
-- update a record without adding a value to this field. Then, the field will be saved with a NULL value.

-- How to Test for NULL Values?
-- It is not possible to test for NULL values with comparison operators, such as =, <, or <>.
-- We will have to use the IS NULL and IS NOT NULL operators instead


-- IS NULL Syntax:
		-- SELECT column_names
		-- FROM table_name
		-- WHERE column_name IS NULL;
        
-- IS NOT NULL Syntax:
		-- SELECT column_names
		-- FROM table_name
		-- WHERE column_name IS NOT NULL;

--------------------------------------------------------
-- IS NULL Operator
-------------------------------------------------------- 
select * from manu where Manu_City IS NULL;

--------------------------------------------------------
-- NOT IS NULL Operator
-------------------------------------------------------- 
select * from manu where Manu_City IS NOT NULL;

-----------------------------------------------------------------------------------------------------------
-- The SQL UPDATE Statement
-----------------------------------------------------------------------------------------------------------
-- The UPDATE statement is used to modify the existing records in a table.

-- UPDATE Syntax:
		-- UPDATE table_name
		-- SET column1 = value1, column2 = value2, ...
		-- WHERE condition;
  
--------------------------------------------------------
-- Update City with Indore where city is Bhopal
-------------------------------------------------------- 
select * from manu where manu_city ='Bhopal';
SET SQL_SAFE_UPDATES = 0;
update manu set Manu_City ='Indore' where Manu_city = 'Bhopal';

select * from manu;

-----------------------------------------------------------------------------------------------------------
-- The SQL DELETE Statement
-----------------------------------------------------------------------------------------------------------
-- The DELETE statement is used to delete existing records in a table

-- DELETE Syntax:
		-- DELETE FROM table_name WHERE condition;
	
--------------------------------------------------------
-- Delete record from manu where city is not defined
-------------------------------------------------------- 
select * from manu where Manu_City IS NULL;

delete from manu where Manu_City IS NULL;

select * from manu;


-----------------------------------------------------------------------------------------------------------
-- The SQL SELECT TOP Clause
-----------------------------------------------------------------------------------------------------------
-- The SELECT TOP clause is used to specify the number of records to return.
-- The SELECT TOP clause is useful on large tables with thousands of records. 
-- Returning a large number of records can impact performance.

-- Syntax:
		-- SELECT column_name(s)
		-- FROM table_name
		-- WHERE condition
		-- LIMIT number;

--------------------------------------------------------
-- Top 5 orders by sales
-------------------------------------------------------- 
        
select * from market_fact_full order by Sales DESC limit 5;


--------------------------------------------------------
-- Second top ordered product
-------------------------------------------------------- 
        
select Prod_Id, sum(sales) total_sales from market_fact_full 
group by Prod_id order by Sales DESC limit 5;

        
select Prod_Id, sum(sales) total_sales from market_fact_full 
group by Prod_id order by Sales DESC limit 1,1;

-----------------------------------------------------------------------------------------------------------
-- The SQL MIN() and MAX() Functions
-----------------------------------------------------------------------------------------------------------
-- The MIN() function returns the smallest value of the selected column.
-- The MAX() function returns the largest value of the selected column.

-- MIN() Syntax:
		-- SELECT MIN(column_name)
		-- FROM table_name
		-- WHERE condition;
        
-- MAX() Syntax:
		-- SELECT MAX(column_name)
		-- FROM table_name
		-- WHERE condition;

--------------------------------------------------------
-- Select minimum sales till date
-------------------------------------------------------- 
select min(sales) from market_fact_full;



--------------------------------------------------------
-- Select maximum sales till date
-------------------------------------------------------- 
        
select max(sales) from market_fact_full;

-----------------------------------------------------------------------------------------------------------
-- The SQL COUNT(), AVG() and SUM() Functions
-----------------------------------------------------------------------------------------------------------
-- The COUNT() function returns the number of rows that matches a specified criterion.

-- COUNT() Syntax:
		-- SELECT COUNT(column_name)
		-- FROM table_name
		-- WHERE condition;
        
-- The AVG() function returns the average value of a numeric column. 

-- AVG() Syntax:
		-- SELECT AVG(column_name)
		-- FROM table_name
		-- WHERE condition;
        
-- The SUM() function returns the total sum of a numeric column. 

-- SUM() Syntax:
		-- SELECT SUM(column_name)
		-- FROM table_name
		-- WHERE condition;
        
--------------------------------------------------------
-- count the number of products
-------------------------------------------------------- 
select count(DISTINCT Prod_id) from market_fact_full;

--------------------------------------------------------
-- Average sales
-------------------------------------------------------- 
select avg(sales) from market_fact_full;

--------------------------------------------------------
-- overall sale till date
-------------------------------------------------------- 
select round(sum(sales),3) from market_fact_full;


-----------------------------------------------------------------------------------------------------------
-- The SQL LIKE Operator
-----------------------------------------------------------------------------------------------------------
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- There are two wildcards often used in conjunction with the LIKE operator:
		-- The percent sign (%) represents zero, one, or multiple characters
		-- The underscore sign (_) represents one, single character

-- LIKE Syntax:
		-- SELECT column1, column2, ...
		-- FROM table_name
		-- WHERE columnN LIKE pattern;
        
--------------------------------------------------------
-- CustomerName starting with "a"
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name LIKE 'a%';

--------------------------------------------------------
-- CustomerName that have "or" in any position
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name LIKE '%or%';

--------------------------------------------------------
-- CustomerName that have "r" in the second position
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name LIKE '_r%';

--------------------------------------------------------
--  CustomerName that starts with "a" 
--  and are at least 3 characters in length
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name LIKE 'a___%';

--------------------------------------------------------
-- CustomerName that starts with "a" and ends with "t"
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name LIKE 'a%t';

--------------------------------------------------------
-- CustomerName that does NOT start with "a"
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name NOT LIKE 'a%';

-----------------------------------------------------------------------------------------------------------
-- SQL Wildcard Characters
-----------------------------------------------------------------------------------------------------------
-- A wildcard character is used to substitute one or more characters in a string.
-- Wildcard characters are used with the LIKE operator. 
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

--------------------------------------------------------
-- customers with a State starting with any character, followed by ar%
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE State LIKE '_ar%';

--------------------------------------------------------
-- customers with a City ending with na
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE City regexp 'na$';

--------------------------------------------------------
-- customers with a Name containing c|co|com
-- Match zero or one instance of the strings preceding it(?)
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp 'com?';

--------------------------------------------------------
-- Gives all the names containing ‘be’ or ‘ae’
-- matches any of the patterns p1, p2, or p3(p1|p2|p3)
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp 'ae|be';

--------------------------------------------------------
-- Gives all the names containing ‘j’ or ‘z’
-- Matches any character listed between the square brackets([abc])
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp '[jz]';

--------------------------------------------------------
-- Retrieve all names that contain a letter in the range of ‘b’ and ‘g’, 
-- followed by any character, followed by the letter ‘a’
-- Matches any lower case letter between ‘a’ to ‘z’- ([a-z]) ([a-z] and (.))
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp '[b-g].[a]';

--------------------------------------------------------
-- Gives all the names not containing ‘j’ or ‘z’
-- Matches any character not listed between the square brackets.([^abc])
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp '[^jz]';

--------------------------------------------------------
-- Gives all the names ending with character “ack”
-- Matches the end of words[[:>:]]
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp 'ack[[:>:]]';

--------------------------------------------------------
-- Gives all the names starting with character “for”
-- Matches the end of words[[:<:]]
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp '[[:<:]]for';

--------------------------------------------------------
-- Gives all the names containing alphabetic character only
-- Matches a character class[:class:]
-------------------------------------------------------- 
SELECT * FROM Cust_dimen WHERE Customer_Name regexp '[:alpha:]';

-----------------------------------------------------------------------------------------------------------
-- SQL Aliases
-----------------------------------------------------------------------------------------------------------
-- SQL aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.
-- An alias is created with the AS keyword

	-- Alias Column Syntax:
		-- SELECT column_name AS alias_name
		-- FROM table_name;
        
	-- Alias Table Syntax:
		-- SELECT column_name(s)
		-- FROM table_name AS alias_name;
        
--------------------------------------------------------
-- Alias for columns
-------------------------------------------------------- 
SELECT cust_ID as ID, customer_Name as Name FROM Cust_dimen;

--------------------------------------------------------
-- Alias for Tables
-------------------------------------------------------- 
SELECT cust_ID as ID, customer_Name as Name,city FROM Cust_dimen as c where c.City ='Mysore';


-----------------------------------------------------------------------------------------------------------
-- SQL JOINS
----------------------------------------------------------------------------------------------------------
-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

--------------------------------------------------------
-- Inner Join
-------------------------------------------------------- 

SELECT * from shipping_dimen;
select * from orders_dimen;

SELECT * from shipping_dimen s inner join orders_dimen o
on s.order_id = o.order_Number;

SELECT s.ship_id,s.ship_Mode,o.order_Number,o.Order_Priority
from shipping_dimen s inner join orders_dimen o
on s.order_id = o.order_Number;

--------------------------------------------------------
-- Left Join
-------------------------------------------------------- 

SELECT * from shipping_dimen;
select * from orders_dimen;
select * from manu;

SELECT * from manu m inner join orders_dimen o
on m.manu_id = o.order_Number;

SELECT * from manu m left join orders_dimen o
on m.manu_id = o.order_Number;

SELECT * from orders_dimen o left join manu m
on m.manu_id = o.order_Number;

--------------------------------------------------------
-- RIGHT Join
-------------------------------------------------------- 

SELECT * from shipping_dimen;
select * from orders_dimen;
select * from manu;

SELECT * from manu m inner join orders_dimen o
on m.manu_id = o.order_Number;

SELECT * from manu m right join orders_dimen o
on m.manu_id = o.order_Number;

SELECT * from orders_dimen o right join manu m
on m.manu_id = o.order_Number;

--------------------------------------------------------
-- CROSS Join
-------------------------------------------------------- 

SELECT * from manu m CROSS join orders_dimen o;


--------------------------------------------------------
-- SELF Join
-------------------------------------------------------- 

-- A self join is a regular join, but the table is joined with itself.

	-- Self Join Syntax
		-- SELECT column_name(s)
		-- FROM table1 T1, table1 T2
		-- WHERE condition;

--------------------------------------------------------
-- matches customers that are from the same city & Same Business
-------------------------------------------------------- 

SELECT A.Customer_Name AS CustomerName1, B.Customer_Name AS CustomerName2, A.City,A.Customer_Segment
FROM cust_dimen A, cust_dimen B
WHERE A.Cust_ID <> B.Cust_ID
AND A.City = B.City
AND A.Customer_Segment = B.Customer_Segment
ORDER BY A.City;

select * from cust_dimen where Customer_Name IN('LINDSAY CASTELL','KEN DANA');

-----------------------------------------------------------------------------------------------------------
-- SQL UNION OPERATOR
----------------------------------------------------------------------------------------------------------
-- The UNION operator is used to combine the result-set of two or more SELECT statements.
	-- Every SELECT statement within UNION must have the same number of columns
	-- The columns must also have similar data types
	-- The columns in every SELECT statement must also be in the same order

	-- UNION Syntax:
		-- SELECT column_name(s) FROM table1
		-- UNION
		-- SELECT column_name(s) FROM table2;
        
-- The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL

	-- UNION ALL Syntax:
		-- SELECT column_name(s) FROM table1
		-- UNION ALL
		-- SELECT column_name(s) FROM table2;

CREATE TABLE `cust_dimen1` (
  `Cust_id` varchar(12) NOT NULL,
  `Customer_Name` varchar(25) DEFAULT NULL,
  `City` varchar(12) DEFAULT NULL,
  `State` varchar(12) DEFAULT NULL,
  `Customer_Segment` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Cust_id`)
);


insert into cust_dimen1 
SELECT * FROM Cust_dimen limit 100;

--------------------------------------------------------
-- Union
-------------------------------------------------------- 

Select city from cust_dimen
UNION
SELECT City FROM cust_dimen1
ORDER BY City;

--------------------------------------------------------
-- Union ALL
-------------------------------------------------------- 

Select city from cust_dimen
UNION ALL
SELECT City FROM cust_dimen1
ORDER BY City;

-----------------------------------------------------------------------------------------------------------
-- The SQL GROUP BY Statement
----------------------------------------------------------------------------------------------------------
-- The GROUP BY statement groups rows that have the same values into summary rows, 
-- like "find the number of customers in each country".

-- The GROUP BY statement is often used with aggregate functions 
-- (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.


	-- GROUP BY Syntax
		-- SELECT column_name(s)
		-- FROM table_name
		-- WHERE condition
		-- GROUP BY column_name(s)
		-- ORDER BY column_name(s);

--------------------------------------------------------
-- Lists the number of customers in each State
-------------------------------------------------------- 
        
SELECT COUNT(Cust_ID), State
FROM cust_dimen
GROUP BY State;

--------------------------------------------------------
-- Lists the number of customers in each State, sorted high to low
-------------------------------------------------------- 
SELECT COUNT(Cust_ID), State
FROM cust_dimen
GROUP BY State
order by COUNT(Cust_ID) DESC;

--------------------------------------------------------
-- lists the number of orders sent by each shipper
-------------------------------------------------------- 
SELECT s.ship_id, COUNT(o.Ord_id) AS NumberOfOrders FROM Orders_dimen o
LEFT JOIN shipping_dimen s ON o.order_Number = s.order_id
GROUP BY ord_id;

-----------------------------------------------------------------------------------------------------------
-- The SQL HAVING Clause
----------------------------------------------------------------------------------------------------------
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

	-- HAVING Syntax:
		-- SELECT column_name(s)
		-- FROM table_name
		-- WHERE condition
		-- GROUP BY column_name(s)
		-- HAVING condition
		-- ORDER BY column_name(s);

--------------------------------------------------------
-- lists the number of customers in each city. 
-- Only include city with more than 50 customers
-------------------------------------------------------- 
SELECT COUNT(Cust_ID), City
FROM Cust_dimen
GROUP BY City
HAVING COUNT(Cust_ID) > 50;

--------------------------------------------------------
-- lists the number of customers in each city. 
-- Only include city with more than 50 customers
-- sorted high to low
-------------------------------------------------------- 
SELECT COUNT(Cust_ID), City
FROM Cust_dimen
GROUP BY City
HAVING COUNT(Cust_ID) > 50
ORDER BY COUNT(Cust_ID) DESC;

--------------------------------------------------------
-- lists the number of orders reater than 3 sent by each shipper
-------------------------------------------------------- 

SELECT s.ship_id, COUNT(o.Ord_id) AS NumberOfOrders FROM Orders_dimen o
LEFT JOIN shipping_dimen s ON o.order_Number = s.order_id
GROUP BY ord_id
Having count(o.ord_id)>3;

-----------------------------------------------------------------------------------------------------------
-- The SQL EXISTS Operator
----------------------------------------------------------------------------------------------------------
-- The EXISTS operator is used to test for the existence of any record in a subquery.
-- The EXISTS operator returns TRUE if the subquery returns one or more records.

	-- EXISTS Syntax
		-- SELECT column_name(s)
		-- FROM table_name
		-- WHERE EXISTS
		-- (SELECT column_name FROM table_name WHERE condition);
        
--------------------------------------------------------
-- lists of orders where shipping date is les than 31st Jan'2010
-------------------------------------------------------- 
SELECT Order_Number,Order_Date,Order_Priority
FROM orders_dimen o
WHERE EXISTS (SELECT ship_Mode FROM shipping_dimen s WHERE s.Order_ID = o.Order_Number AND ship_Date < '2010-01-31');

select * from shipping_dimen where order_ID =49283;

-----------------------------------------------------------------------------------------------------------
-- The SQL ANY and ALL Operators
----------------------------------------------------------------------------------------------------------
-- The SQL ANY Operator
	-- The ANY operator:
			-- returns a boolean value as a result
			-- returns TRUE if ANY of the subquery values meet the condition
			-- ANY means that the condition will be true if the operation is true 
			-- for any of the values in the range.

	-- ANY Syntax:
		-- SELECT column_name(s)
		-- FROM table_name
		-- WHERE column_name operator ANY
		-- (SELECT column_name
		-- FROM table_name
		-- WHERE condition);
        
-- The SQL ALL Operator
	-- The ALL operator:
		-- returns a boolean value as a result
		-- returns TRUE if ALL of the subquery values meet the condition
		-- is used with SELECT, WHERE and HAVING statements
		-- ALL means that the condition will be true only if the operation is true 
        -- for all values in the range. 
        
	-- ALL Syntax With SELECT:
		-- SELECT ALL column_name(s)
		-- FROM table_name
		-- WHERE condition;
        
    -- ALL Syntax With WHERE or HAVING
		-- SELECT column_name(s)
		-- FROM table_name
		-- WHERE column_name operator ALL
		-- (SELECT column_name
		-- FROM table_name
		-- WHERE condition);    
        
--------------------------------------------------------
-- lists the ProductName if it finds ANY records in the 
-- market_fact_full table has Order Quantity equal to 10 
-------------------------------------------------------- 

SELECT Product_Category,product_sub_category
FROM Prod_dimen
WHERE Prod_ID = ANY
  (SELECT Prod_id
  FROM market_fact_full
  WHERE Order_Quantity = 10);
  
--------------------------------------------------------
-- lists the ProductName if it finds ANY records in the 
-- market_fact_full table has Order Quantity greater than 50 
-------------------------------------------------------- 
  
SELECT Product_Category,product_sub_category
FROM Prod_dimen
WHERE Prod_ID = ANY
  (SELECT Prod_id
  FROM market_fact_full
  WHERE Order_Quantity >=50);
  
--------------------------------------------------------
-- lists the ProductName if it finds ALL records in the 
-- market_fact_full table has Order Quantity equal to 10 
-------------------------------------------------------- 

SELECT Product_Category,product_sub_category
FROM Prod_dimen
WHERE Prod_ID = ALL
  (SELECT Prod_id
  FROM market_fact_full
  WHERE Order_Quantity = 10);

-----------------------------------------------------------------------------------------------------------
-- The SQL SELECT INTO STATEMENT
----------------------------------------------------------------------------------------------------------
-- The SELECT INTO statement copies data from one table into a new table.

	-- SELECT INTO Syntax: Copy all columns into a new table:
		-- SELECT *
		-- INTO newtable [IN externaldb]
		-- FROM oldtable
		-- WHERE condition;
        
	-- SELECT INTO Syntax : Copy only some columns into a new table:
		-- SELECT column1, column2, column3, ...
		-- INTO newtable [IN externaldb]
		-- FROM oldtable
		-- WHERE condition;
        
CREATE TABLE cust_dimen2 
select * FROM cust_dimen;

select * from cust_dimen2;

-----------------------------------------------------------------------------------------------------------
-- The SQL CASE STATEMENT
----------------------------------------------------------------------------------------------------------
-- The CASE statement goes through conditions and returns a value when the first condition is met 
-- (like an if-then-else statement). 
-- So, once a condition is true, it will stop reading and return the result. 
-- If no conditions are true, it returns the value in the ELSE clause.

-- If there is no ELSE part and no conditions are true, it returns NULL.

	-- CASE Syntax
		-- CASE
		-- 	WHEN condition1 THEN result1
		-- 	WHEN condition2 THEN result2
		-- 	WHEN conditionN THEN resultN
		-- 	ELSE result
		-- 	END;

SELECT Ord_ID, Order_Quantity,
CASE
    WHEN Order_Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Order_Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM market_fact_full;

-----------------------------------------------------------------------------------------------------------
-- MY SQL Functions
----------------------------------------------------------------------------------------------------------

--------------------------------------------------------
-- MySQL COALESCE() Function
-- Return the first non-null value in a list:
--------------------------------------------------------
SELECT COALESCE(NULL, NULL, NULL, 'Python.com', NULL, 'Example.com');

--------------------------------------------------------
-- MySQL CHAR_LENGTH() Function
-- Return the length of the string:
--------------------------------------------------------
SELECT CHAR_LENGTH("SQL Tutorial") AS LengthOfString;

--------------------------------------------------------
-- MySQL CHARACTER_LENGTH() Function
-- Return the length of the string:
--------------------------------------------------------
SELECT CHARACTER_LENGTH("SQL Tutorial") AS LengthOfString;


--------------------------------------------------------
-- MySQL CONCAT() Function
-- Add several strings together:
--------------------------------------------------------
SELECT CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;

--------------------------------------------------------
-- MySQL CONCAT_WS() Function
-- Add several expressions together, and add a "-" separator between them:
--------------------------------------------------------
SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;

--------------------------------------------------------
-- MySQL FIELD() Function
-- Return the index position of  "q" in the string list:
--------------------------------------------------------
-- Synatx:
	-- FIELD(value, val1, val2, val3, ...)
    
SELECT FIELD("q", "s", "q", "l");

--------------------------------------------------------
-- MySQL FIND_IN_SET() Function
-- Search for "q" within the list of strings:
--------------------------------------------------------
-- Syntax:
	-- FIND_IN_SET(string, string_list)

SELECT FIND_IN_SET("q", "s,q,l");
    
--------------------------------------------------------
-- MySQL FORMAT() Function
-- Format the number as "#,###,###.##" (and round with two decimal places)
--------------------------------------------------------
SELECT FORMAT(250500.5634, 2);

--------------------------------------------------------
-- MySQL INSERT() Function
-- Insert the string "Example" into the string "SqlTutorial.com". Replace the first 11 characters:
--------------------------------------------------------
SELECT INSERT("SqlTutorial.com", 1, 11, "Example");

--------------------------------------------------------
-- MySQL INSTR() Function
-- Search for "T" in string "sqlTutorial.com", and return position:
--------------------------------------------------------
SELECT INSTR("sqlTutorial.com", "T") AS MatchPosition;

--------------------------------------------------------
-- MySQL LCASE() Function
-- Convert the text to lower-case:
--------------------------------------------------------
SELECT LCASE("SQL Tutorial is FUN!");

--------------------------------------------------------
-- MySQL LEFT() Function
-- Extract 3 characters from a string (starting from left):
--------------------------------------------------------
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

--------------------------------------------------------
-- MySQL LENGTH() Function
-- Return the length of the string, in bytes:
--------------------------------------------------------
SELECT LENGTH("SQL Tutorial") AS LengthOfString;

--------------------------------------------------------
-- MySQL LOCATE() Function
-- Search for "T" in string "sqlTutorial.com", and return position:
--------------------------------------------------------
SELECT LOCATE("T", "SqlTutorial.com") AS MatchPosition;

--------------------------------------------------------
-- MySQL LOWER() Function
-- Convert the text to lower-case:
--------------------------------------------------------
SELECT LOWER("SQL Tutorial is FUN!");

--------------------------------------------------------
-- MySQL LPAD() Function
-- Left-pad the string with "ABC", to a total length of 20:
--------------------------------------------------------
SELECT LPAD("SQL Tutorial", 20, "ABC");

--------------------------------------------------------
-- MySQL LTRIM() Function
-- Remove leading spaces from a string:
--------------------------------------------------------
SELECT LTRIM("     SQL Tutorial") AS LeftTrimmedString;

--------------------------------------------------------
-- MySQL MID() Function
-- Extract a substring from a string (start at position 5, extract 3 characters):
--------------------------------------------------------
SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;

--------------------------------------------------------
-- MySQL POSITION() Function
-- Search for "T" in string "sqlTutorial.com", and return position:
--------------------------------------------------------
SELECT POSITION("T" IN "sqlTutorial.com") AS MatchPosition;

--------------------------------------------------------
-- MySQL REVERSE() Function
-- Reverse a string:
--------------------------------------------------------
SELECT REVERSE("SQL Tutorial");

--------------------------------------------------------
-- MySQL RIGHT() Function
-- Extract 4 characters from a string (starting from right):
--------------------------------------------------------
SELECT RIGHT("SQL Tutorial is cool", 4) AS ExtractString;

--------------------------------------------------------
-- MySQL RPAD() Function
-- Right-pad the string with "ABC", to a total length of 20:
--------------------------------------------------------
SELECT RPAD("SQL Tutorial", 20, "ABC");

--------------------------------------------------------
-- MySQL RTRIM() Function
-- Remove trailing spaces from a string:
--------------------------------------------------------
SELECT RTRIM("SQL Tutorial     ") AS RightTrimmedString;

--------------------------------------------------------
-- MySQL SPACE() Function
-- Return a string with 10 space characters:
--------------------------------------------------------
SELECT SPACE(10);

--------------------------------------------------------
-- MySQL STRCMP() Function
-- Compare two strings:
--------------------------------------------------------
SELECT STRCMP("SQL Tutorial", "SQL Tutorial");

--------------------------------------------------------
-- MySQL SUBSTR() Function
-- Extract a substring from a string (start at position 5, extract 3 characters):
--------------------------------------------------------
SELECT SUBSTR("SQL Tutorial", 5, 3) AS ExtractString;

--------------------------------------------------------
-- MySQL SUBSTRING() Function
-- Extract a substring from a string (start at position 5, extract 3 characters):
--------------------------------------------------------
SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString;

--------------------------------------------------------
-- MySQL SUBSTRING_INDEX() Function
-- Return a substring of a string before a specified number of delimiter occurs:
--------------------------------------------------------
SELECT SUBSTRING_INDEX("www.sqlTutorial.com", ".", 1);

--------------------------------------------------------
-- MySQL TRIM() Function
-- Remove leading and trailing spaces from a string:
--------------------------------------------------------
SELECT TRIM('    SQL Tutorial    ') AS TrimmedString;

--------------------------------------------------------
-- MySQL UCASE() Function
-- Convert the text to upper-case:
--------------------------------------------------------
SELECT UCASE("SQL Tutorial is FUN!");

--------------------------------------------------------
-- MySQL UPPER() Function
-- Convert the text to upper-case:
--------------------------------------------------------
SELECT UPPER("SQL Tutorial is FUN!");

-----------------------------------------------------------------------------------------------------------
-- MY SQL Numeric Functions
----------------------------------------------------------------------------------------------------------

--------------------------------------------------------
-- MySQL ABS() Function
-- Return the absolute value of a number:
--------------------------------------------------------
SELECT ABS(-243.5);

--------------------------------------------------------
-- MySQL ACOS() Function
-- Return the arc cosine of a number:
--------------------------------------------------------
SELECT ACOS(0.25);

--------------------------------------------------------
-- MySQL ASIN() Function
-- Return the arc sine of a number:
--------------------------------------------------------
SELECT ASIN(0.25);

--------------------------------------------------------
-- MySQL ATAN() Function
-- Return the arc tangent of a number:
--------------------------------------------------------
SELECT ATAN(0.25);

--------------------------------------------------------
-- MySQL ATAN2() Function
-- Return the arc tangent of two values:
--------------------------------------------------------
SELECT ATAN2(0.5,1);

--------------------------------------------------------
-- MySQL AVG() Function
-- Return the average values:
--------------------------------------------------------
SELECT AVG(sales) from market_fact_full;

--------------------------------------------------------
-- MySQL CEIL() Function
-- Return the ceil values:
--------------------------------------------------------
SELECT CEIL(25.75);

--------------------------------------------------------
-- MySQL CEILING() Function
-- Return the ceil values:
--------------------------------------------------------
SELECT CEILING(25.75);

--------------------------------------------------------
-- MySQL COS() Function
-- Return the cosine of a number:
--------------------------------------------------------
SELECT COS(2);

--------------------------------------------------------
-- MySQL COT() Function
-- Return the contangent of a number:
--------------------------------------------------------
SELECT COT(6);

--------------------------------------------------------
-- MySQL COUNT() Function
-- Return the count of a values:
--------------------------------------------------------
SELECT Count(prod_id) from prod_dimen;

--------------------------------------------------------
-- MySQL DEGREES() Function
-- Convert the radian value into degrees:
--------------------------------------------------------
SELECT DEGREES(1.5);

--------------------------------------------------------
-- MySQL DIV() Function
-- RETURNS the Integer division
--------------------------------------------------------
SELECT 10 DIV 5;

--------------------------------------------------------
-- MySQL EXP() Function
-- Return e raised to the power of some value
--------------------------------------------------------
SELECT EXP(1);

--------------------------------------------------------
-- MySQL FLOOR() Function
-- Return the floor value
--------------------------------------------------------
SELECT FLOOR(25.75);

--------------------------------------------------------
-- MySQL GREATEST() Function
-- Return the greatest value of the list of arguments
--------------------------------------------------------
SELECT GREATEST(3, 12, 34, 8, 25);

--------------------------------------------------------
-- MySQL LEAST() Function
-- Return the smallest value of the list of arguments:
--------------------------------------------------------
SELECT LEAST(3, 12, 34, 8, 25);

--------------------------------------------------------
-- MySQL LN() Function
-- Return the natural logarithm
--------------------------------------------------------
SELECT LN(2);

--------------------------------------------------------
-- MySQL LOG() Function
-- Return the natural logarithm
--------------------------------------------------------
SELECT LOG(2);

--------------------------------------------------------
-- MySQL LOG10() Function
-- Return the base-10 logarithm
--------------------------------------------------------
SELECT LOG10(2);

--------------------------------------------------------
-- MySQL LOG2() Function
-- Return the base-2 logarithm
--------------------------------------------------------
SELECT LOG2(2);

--------------------------------------------------------
-- MySQL MAX() Function
-- Return the maximum value
--------------------------------------------------------
SELECT max(sales) from market_fact_full;

--------------------------------------------------------
-- MySQL MIN() Function
-- Return the minimum value
--------------------------------------------------------
SELECT min(sales) from market_fact_full;

--------------------------------------------------------
-- MySQL MOD() Function
-- Return the remainder
--------------------------------------------------------
SELECT MOD(18,4);

--------------------------------------------------------
-- MySQL PI() Function
-- Return the value of PI
--------------------------------------------------------
SELECT PI();

--------------------------------------------------------
-- MySQL POW() Function
-- Return the power
--------------------------------------------------------
SELECT POW(4,2);

--------------------------------------------------------
-- MySQL POWER() Function
-- Return the power
--------------------------------------------------------
SELECT POWER(4,2);

--------------------------------------------------------
-- MySQL RADIANS() Function
-- Convert a degree value into radians:
--------------------------------------------------------
SELECT RADIANS(100);

--------------------------------------------------------
-- MySQL RAND() Function
-- Return a random decimal number
--------------------------------------------------------
SELECT RAND();

--------------------------------------------------------
-- MySQL ROUND() Function
-- Round the number to specified decimal places:
--------------------------------------------------------
SELECT ROUND(135.375, 2);

--------------------------------------------------------
-- MySQL SIGN() Function
-- Return the sign of a number
--------------------------------------------------------
SELECT SIGN(255.5);
SELECT SIGN(-155.5);

--------------------------------------------------------
-- MySQL SIN() Function
-- Return the sine of a number
--------------------------------------------------------
SELECT SIN(2);

--------------------------------------------------------
-- MySQL SQRT() Function
-- Return the square root of a number
--------------------------------------------------------
SELECT SQRT(16);

--------------------------------------------------------
-- MySQL SUM() Function
-- Return the sum of a number
--------------------------------------------------------
SELECT sum(sales) from market_fact_full;

--------------------------------------------------------
-- MySQL TAN() Function
-- Return the tangent of a number
--------------------------------------------------------
SELECT TAN(2);

--------------------------------------------------------
-- MySQL TRUNCATE() Function
-- Return a number truncated to specified decimal places
--------------------------------------------------------
SELECT TRUNCATE(135.375, 2);

-----------------------------------------------------------------------------------------------------------
-- MY SQL Date Functions
----------------------------------------------------------------------------------------------------------

--------------------------------------------------------
-- MySQL ADDDATE() Function
-- Add specified days to a date and return the date
--------------------------------------------------------
SELECT ADDDATE("2021-01-01", INTERVAL 10 DAY);

--------------------------------------------------------
-- MySQL ADDTIME() Function
-- Add specified seconds to a time and return the datetime:
--------------------------------------------------------
SELECT ADDTIME("2021-01-01 09:00:00", "2");

--------------------------------------------------------
-- MySQL CURDATE() Function
-- Return the current date:
--------------------------------------------------------
SELECT CURDATE();

--------------------------------------------------------
-- MySQL CURRENT_DATE() Function
-- Return the current date:
--------------------------------------------------------
SELECT CURRENT_DATE();

--------------------------------------------------------
-- MySQL CURRENT_TIME() Function
-- Return the current time:
--------------------------------------------------------
SELECT CURRENT_TIME();

--------------------------------------------------------
-- MySQL CURRENT_TIMESTAMP() Function
-- Return the current date and time:
--------------------------------------------------------
SELECT CURRENT_TIMESTAMP();

--------------------------------------------------------
-- MySQL CURTIME() Function
-- Return the current time:
--------------------------------------------------------
SELECT CURTIME();

--------------------------------------------------------
-- MySQL DATE() Function
-- Extract the date part
--------------------------------------------------------
SELECT DATE("2021-01-01 09:00:00");

--------------------------------------------------------
-- MySQL DATEDIFF() Function
-- Return the number of days between two date values:
--------------------------------------------------------
SELECT DATEDIFF("2017-06-25", "2017-06-15");

--------------------------------------------------------
-- MySQL DATEADD() Function
-- Add specified days to a date and return the date:
--------------------------------------------------------
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);

--------------------------------------------------------
-- MySQL DATE_FORMAT() Function
-- Format a date:
--------------------------------------------------------
SELECT DATE_FORMAT("2017-06-15", "%Y");

--------------------------------------------------------
-- MySQL DATE_SUB() Function
-- Subtract specified days from a date and return the date:
--------------------------------------------------------
SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);

--------------------------------------------------------
-- MySQL DAY() Function
-- Return the day of the month for a date:
--------------------------------------------------------
SELECT DAY("2017-06-15");

--------------------------------------------------------
-- MySQL DAYNAME() Function
-- eturn the weekday name for a date:
--------------------------------------------------------
SELECT DAYNAME("2017-06-15");

--------------------------------------------------------
-- MySQL DAYOFMONTH() Function
-- Return the day of the month for a date:
--------------------------------------------------------
SELECT DAYOFMONTH("2017-06-15");

--------------------------------------------------------
-- MySQL DAYOFWEEK() Function
-- Return the weekday index for a date:
--------------------------------------------------------
SELECT DAYOFWEEK("2017-06-15");

--------------------------------------------------------
-- MySQL DAYOFYEAR() Function
-- Return the day of the year for a date:
--------------------------------------------------------
SELECT DAYOFYEAR("2017-06-15");

--------------------------------------------------------
-- MySQL EXTRACT() Function
-- Extract the month from a date:
--------------------------------------------------------
SELECT EXTRACT(MONTH FROM "2017-06-15");

--------------------------------------------------------
-- MySQL FROM_DAYS() Function
-- Return a date from a numeric representation of the day:
--------------------------------------------------------
SELECT FROM_DAYS(685467);

--------------------------------------------------------
-- MySQL HOUR() Function
-- Return the hour part of a datetime:
--------------------------------------------------------
SELECT HOUR("2017-06-20 09:34:00");

--------------------------------------------------------
-- MySQL LAST_DAY() Function
-- Extract the last day of the month for the given date:
--------------------------------------------------------
SELECT LAST_DAY("2017-06-20");

--------------------------------------------------------
-- MySQL LOCALTIME() Function
-- Return current date and time:
--------------------------------------------------------
SELECT LOCALTIME();

--------------------------------------------------------
-- MySQL MAKEDATE() Function
-- Create and return a date based on  a year and a number of days value:
--------------------------------------------------------
SELECT MAKEDATE(2017, 3);
SELECT MAKEDATE(2017, 43);

--------------------------------------------------------
-- MySQL MAKETIME() Function
-- Create and return a time value based on an hour, minute, and second value:
--------------------------------------------------------
SELECT MAKETIME(11,35,4);

--------------------------------------------------------
-- MySQL MICROSECOND() Function
-- Return the microsecond part of a datetime:
--------------------------------------------------------
SELECT MICROSECOND("2017-06-20 09:34:00.000023");

--------------------------------------------------------
-- MySQL MINUTE() Function
-- Return the minute part of a datetime value:
--------------------------------------------------------
SELECT MINUTE("2017-06-20 09:34:00.000023");

--------------------------------------------------------
-- MySQL MONTH() Function
-- Return the month part of a date:
--------------------------------------------------------
SELECT MONTH("2017-06-20 09:34:00.000023");

--------------------------------------------------------
-- MySQL MONTHNAME() Function
-- Return the name of the month for a date:
--------------------------------------------------------
SELECT MONTHNAME("2017-06-20 09:34:00.000023");

--------------------------------------------------------
-- MySQL NOW() Function
-- Return the current date and time
--------------------------------------------------------
SELECT NOW();

--------------------------------------------------------
-- MySQL PERIOD_ADD() Function
-- Add a specified number of months to a period:
--------------------------------------------------------
SELECT PERIOD_ADD(201703, 5);

--------------------------------------------------------
-- MySQL PERIOD_DIFF() Function
-- Return the difference between two periods:
--------------------------------------------------------
SELECT PERIOD_DIFF(201710, 201703);

--------------------------------------------------------
-- MySQL QUARTER() Function
-- Return the quarter of the year for the date:
--------------------------------------------------------
SELECT QUARTER("2017-06-15");

--------------------------------------------------------
-- MySQL SECOND() Function
-- Return the seconds part of a datetime value:
--------------------------------------------------------
SELECT SECOND("2017-06-20 09:34:00.000023");

--------------------------------------------------------
-- MySQL SEC_TO_TIME() Function
-- Return a time value based on a specified seconds value:
--------------------------------------------------------
SELECT SEC_TO_TIME(1);

--------------------------------------------------------
-- MySQL STR_TO_DATE() Function
-- Return a date based on a string and a format:
--------------------------------------------------------
SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");

--------------------------------------------------------
-- MySQL SUBDATE() Function
-- Subtract specified days from a date and return the date:
--------------------------------------------------------
SELECT SUBDATE("2017-06-15", INTERVAL 10 DAY);

--------------------------------------------------------
-- MySQL SUBTIME() Function
-- Subtract specified seconds and return the datetime:
--------------------------------------------------------
SELECT SUBTIME("2017-06-15 10:24:21.000004", "5.000001");

--------------------------------------------------------
-- MySQL SYSDATE() Function
-- Return the current date and time:
--------------------------------------------------------
SELECT SYSDATE();

--------------------------------------------------------
-- MySQL TIME() Function
-- Extract the time part from a time expression:
--------------------------------------------------------
SELECT TIME("19:30:10");

--------------------------------------------------------
-- MySQL TIME_FORMAT() Function
-- Format a time:
--------------------------------------------------------
SELECT TIME_FORMAT("19:30:10", "%H %i %s");

--------------------------------------------------------
-- MySQL TIME_TO_SEC() Function
-- Convert a time value into seconds:
--------------------------------------------------------
SELECT TIME_TO_SEC("19:30:10");

--------------------------------------------------------
-- MySQL TIMEDIFF() Function
-- Return the difference between two time expressions:
--------------------------------------------------------
SELECT TIMEDIFF("13:10:11", "13:10:10");







