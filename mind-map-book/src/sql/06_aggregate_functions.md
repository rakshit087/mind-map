# Aggregate Functions

### Avg Function

```sql
SELECT Avg(unitPrice) AS AveragePrice FROM products;
```

In Avg, NULL values are ignored.

### Count Function

```sql
SELECT COUNT(*) as Total FROM products; //Here NULL are not ignored
SELECT COUNT(id) as Total FROM products; //Here NULL are IGNORED
```

### Min / Max Function

```sql
SELECT MAX(price) as MaximumPrice FROM Stocks;
```

### Sum Function

```sql
SELECT Sum (unitprice*amount) AS total FROM Students;
```