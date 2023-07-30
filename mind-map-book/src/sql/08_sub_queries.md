# Sub Queries

```sql
SELECT
(
	cusid,company,region,
	FROM Customers
	WHERE cusid IN (
		SELECT cusid FROM Orders WHERE prince>10000
	)
);
```

Subquery Select can choose only one column.

```sql
SELECT cusname,cusstate, (
	SELECT COUNT(*) as Orders WHERE Customer.cusid = Orders.cusid;
) AS Orders FROM Customers;
```