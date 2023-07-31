# Advanced Queries

## Filtering

```sql
WHERE id IN (9,10,11,12);
```

```sql
WHERE name = 'Tofu' OR 'Konbu'
```

- SQL will not evaluate second condition if first condition is satisfied in OR.
- IN executes faster than OR.

```sql
WHERE name = 'Tofu' AND 'Konbu'
```

```sql
WHERE name = 'Tofu' AND NOT city ='Konbu'
```

## Using Wild Cards

- '%Pizza' : Will grab everything ending with Pizza.
- 'Pizza%' : Will grab everything starting with Pizza.
- '%pizza%': Will grab everything containing word pizza.

```sql
SELECT names FROM students WHERE email="t%.@gmail.com"
```

- Wild cards cannot be used in NULL or Numerical values.
- We also have _ as wildcards
- We can also use [] as wildcards

## Applying Math

```sql
SELECT
(
	pid,
	price,
	amount,
	price*amount AS total //We don't have any column called total in actual database.
	FROM products
)
```

- Priority

Parenthesis → Exponents → Multiplication → Division → Addition → Subtraction

## Selecting Unique Values

```sql
SELECT DISTINCT CITY FROM STATION WHERE ID%2=0;
```

## Rounding Off

**Round** does a standard rounding. If value is .5 or over then you get back 1. If it’s less than .5 you get back 0

**Ceiling** returns the integer equal to or higher than the value passed in.

```sql
SELECT ROUND(235.400,0); 

Answer= 235.000 

SELECT  CAST(ROUND(235.400,0) as int) 

Answer= 235
```

## Replacing

```sql
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;
```