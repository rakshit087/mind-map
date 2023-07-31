# Joins

## Cartesian Joins

```sql
Table 1     Table 2         
1           4     
2           5                 CARTISIAN JOIN -> 14,15,16,24,25,26,34,35,36
3           6
```

```sql
SELECT product_name,unit_price
FROM suppliers CROSS JOIN product
```

## Inner Joins

Will join those rows that have matching values in both tables.

```sql
SELECT suppliers.CompanyName, ProductName, UnitPrice 
FROM suppliers INNER JOIN products
ON suppliers.ID = products.ID 
```

```sql
//We are using Alias here
SELECT o.orderID, c.CompanyName, e.LastName
FROM (
	(orders o INNER JOIN customers c ON o.CusID = c.CusID)
	INNER JOIN
	employee e ON o.EmpID = e.EmpID
)
```

## Self Joins

```sql
SELECT a.CusName AS CusName1,
			 b.CusName AS CusName2,
			 a.City
FROM customers a, customers b
WHERE a.CusID = b.CusID AND a.City = b.City 
```

## Left Joins

Returns the complete left table and the matching records from the right table.

If there is no matching record on right table, it returns null on right side

```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```

Eg: Few customers didn't placed any order but we still want that info.

## Right Joins

Returns the complete right table and the matching records from the left table.

If there is no matching record on left table, it returns null on right side

```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```

## Outer Join

Combination of Right and Left Join.

## Union

- Union is used to combine result set of two or more SELECT statement..
- Must have same columns and data type

```sql
SELECT city,country FROM customers
UNION
SELECT city,country FROM suppliers
```