# Grouping Data

```sql
COUNT(cusid) AS Total_Customer FROM customers GROUP BY region;
```

- Nulls are grouped together.
- Will give multiple columns.