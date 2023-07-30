### Adding a Column

```sql
ALTER TABLE student ADD email VARCHAR(30);
```

### Rename Column

```sql
ALTER TABLE student RENAME COLUMN CGPA TO GPA;
```

### Dropping Columns

```sql
ALTER TABLE student DROP COLUMN email;
```

### Modifying Data Type

```sql
ALTER TABLE student MODIFY sname VARCHAR(40);
```

### Clear all Entries of Table

```sql
TRUNCATE TABLE faculty;
```

### Deleting a Table

```sql
DROP TABLE student;
```