# Strings, Date and Time

## Concatenation

```sql
SELECT
firstname + " " + lastname,
FROM Customers;
```

## Trim

Used to clear spaces.

```sql
SELECT TRIM("        Rakshit         ") AS Trimmed;
```

## Substring

```sql
SELECT name, substr(name,2,5) FROM students;
```

Alexender lex

Lulu ulu

## Uppercase and Lowercase

To convert results to Upper / Lowercase.

```sql
SELECT upper(name) FROM Cus;
SELECT lower(name) FROM Cus;
```

### Length of String

```sql
select city, length(city) from station
order by length(city),city asc
limit 1;
```

# Date and Time

```sql
SELECT 
birthday, 
strftime('%y',birthday) AS y,
strftime('%m',birthday) AS m,
strftime('%d',birthday) AS d,
FROM 
emp;
```

```sql
//Current Date
SELECT Date(now);
//Format
SELECT strftime('%y %m %d','now') as today;
//We can also subtract dates
SELECT Date(('now')-Birthday) as Age;
```