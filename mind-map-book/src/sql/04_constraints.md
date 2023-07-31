# Constraints

There are some constraints in SQL that can change how data is stored in a SQL Table

- NOT NULL : Cannot store null values in that column
- PRIMARY KEY
- FOREIGN KEY
- CHECK
- DEFAULT

```sql
CREATE TABLE student (ID int NOT NULL, name VARCHAR(10) NOT NULL);
```

### Primary Key

```sql
CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);
```

### Foreign Key

Connects data of one table to another table.

```sql
CREATE TABLE orders
(
	oid INT NOT NULL UNIQUE,
	cid INT,
	PRIMARY KEY (oid),
	FOREIGN KEY (cid) REFERENCES Customers(cid); //HERE Customers is the Table name
																							 //Which has cid as primary key
);
```

### Check

```sql
CREATE TABLE student
(
	id INT NOT NULL,
	name VARCHAR(30),
	age int CHECK(AGE>=18)
);
```

### Default

```sql
CREATE TABLE student
(
	id INT NOT NULL,
	name VARCHAR(30),
	age int DEFAULT 18
);
```