---------------------------------------------------------------------
-- Hacks on 'T-SQL Fundamentals'
---------------------------------------------------------------------

---------------------------------------------------------------------
-- Working with SQL Server Management Studio
---------------------------------------------------------------------
SELECT orderid, orderdate FROM Sales.Orders;


---------------------------------------------------------------------
-- 2 Single-table queries
---------------------------------------------------------------------
-- LISTING 2-1 Sample query
USE TSQLV6;

/** SELECT statement
FROM clause
WHERE clause
GROUP BY clause
HAVING clause
SELECT clause
ORDER BY clause
TOP, OFFSET-FETCH filters
*/
                                                                  -- logical process order
SELECT empid, YEAR(orderdate) AS orderyear, COUNT(*) AS numorders -- 5
FROM Sales.Orders                                                 -- 1
WHERE custid = 71                                                 -- 2
GROUP BY empid, YEAR(orderdate)                                   -- 3
HAVING COUNT(*) > 1                                               -- 4
ORDER BY empid, orderyear;                                        -- 6

-- FROM clause
SELECT orderid, custid, empid, orderdate, freight
FROM Sales.Orders;
-- WHERE clause
SELECT orderid, empid, orderdate, freight
FROM Sales.Orders
WHERE custid = 71;
-- GROUP BY clause: aggregate functions ignore NULL
SELECT
    empid,
    YEAR(orderdate) AS orderyear,
    SUM(freight) AS totalfreight,
    COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate);

SELECT
    empid,
    YEAR(orderdate) AS orderyear,
    COUNT(DISTINCT custid) AS numcusts -- DISTINCT
FROM Sales.Orders
GROUP BY empid, YEAR(orderdate);
-- HAVING clause
SELECT empid, YEAR(orderdate) AS orderyear --, COUNT(*)
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1;
-- SELECT clause
SELECT empid, YEAR(orderdate) AS orderyear, COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1;

-- LISTING 2-2 Query returning duplicate rows
SELECT empid, YEAR(orderdate) AS orderyear
FROM Sales.Orders
WHERE custid = 71;
-- LISTING 2-3 Query with a DISTINCT clause
SELECT DISTINCT empid, YEAR(orderdate) AS orderyear
FROM Sales.Orders
WHERE custid = 71;

-- LISTING 2-4 Query demonstrating the ORDER BY clause
SELECT empid, YEAR(orderdate) AS orderyear, COUNT(*) AS numorders
FROM Sales.Orders
WHERE custid = 71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
ORDER BY empid, orderyear;

---------------------------------------------------------------------
-- 3 Joins
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 4 Subqueries
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 5 Table expressions
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 6 Set operators
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 7 T-SQL for data analysis
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 8 Data PRdifiFatiRn
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 9 Temporal tables
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 10 Transactions and concurrency
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 11 SQL Graph
---------------------------------------------------------------------

---------------------------------------------------------------------
-- 12 Programmable objects
---------------------------------------------------------------------