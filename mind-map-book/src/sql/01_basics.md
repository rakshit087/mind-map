# Basics of MySql

# Creating a New User

```sql
CREATE USER 'rakshit'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'rakshit'@'localhost';
```

List of available permissions- https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html

# Login Into My SQL and starting My SQL

```sql
mysql -u db_user -p
```

# Creating New Databases

```jsx
CREATE DATABASE my_db;
use my_db; //Using the Database
```

# Creating a New Table

```sql
CREATE TABLE vocab(id int(2),word varchar(20),meaning varchar(100));
```

# Inserting Row Into Table

```sql
INSERT INTO `links` (`id`, `title`, `link`) VALUES ('1', 'Search Anything you Want', 'https://www.google.com/');
```

# Setting a primary key / ID

```sql
CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);
```

# Summary of Table