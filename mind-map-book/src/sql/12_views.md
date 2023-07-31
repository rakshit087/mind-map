# Views

- A stored query
- Removed after database's connection ends.
- After adding my view we can use it like a table

```sql
CREATE VIEW myview
AS
SELECT cusid, cusname 
FROM customer
```

- Now we can use myview as a table

```sql
SELECT * FROM myview
```