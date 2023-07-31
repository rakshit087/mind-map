# Case Statements

```sql
SELECT 
id, name,
CASE city
	WHEN 'Jodhpur' THEN 'Jodhpur'
	ELSE 'Other'
END AS 'City Type'
FROM employees;
```

```sql
SELECT id, name
CASE bytes
	WHEN bytes < 300000 THEN 'Small'
	WHEN bytes > 300000 THEN 'Small'
	ELSE 'Other'
END AS 'BYTE SIZE'
FROM tracks;
```