# Writing Queries

where clause is used to filter the rows returned by the query.

```sql
SELECT * FROM student WHERE GPA>8; 
SELECT * FROM course WHERE credits=2;
SELECT * FROM faculty WHERE salary>10000 and salary<100000; 
```

### Viewing specific Columns

```sql
SELECT name FROM student WHERE(GPA>8 or GPA<3);
SELECT name FROM subject WHERE(credits!=10);
SELECT name,GPA FROM students WHERE(email != NULL);
```

### Ordering/Sorting Table

```sql
SELECT * FROM students ORDER BY GPA DESC;
SELECT * FROM stocks ORDER BY price ASC;
```

If we want to sort further (for example sorting those with equal GPA)

```sql
SELECT * FROM students ORDER BY GPA,rollno DESC;
```