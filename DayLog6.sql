MariaDB [(none)]> USE csd2204s18;
Database changed
MariaDB [csd2204s18]> SELECT * FROM Customer;
Empty set (0.05 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C01','Ashley','Ash','WDC','321200',34);
Query OK, 1 row affected (0.11 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C02','Bob Marley','Bm','Toronto',100100,23);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C03','Charlies Theron','Cher','New York', 120134,20);
Query OK, 1 row affected (0.06 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C04','Denial Jack','DJ','Brazil','341020',25);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C05','Donna Newman','New','Toronto','130120',50);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C06','Eston M.','M.','Toronto','201023',65);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C07','Bobby Chacko','Chac','New York',320300,70);
Query OK, 1 row affected (0.06 sec)

MariaDB [csd2204s18]> INSERT INTO Customer VALUES('C08','Ashko Charles','AK','USA',421044,72);
Query OK, 1 row affected (0.05 sec)

MariaDB [csd2204s18]>  INSERT INTO Customer VALUES('C09','Tony Special','Specie','GTA','418921',62);
Query OK, 1 row affected (0.06 sec)

MariaDB [csd2204s18]>  INSERT INTO Customer VALUES('C10','JAck Sp','Sparrow','New Jersey','102301',35);
Query OK, 1 row affected (0.08 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer;
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer ORDER BY custId DESC LIMIT 3;
+--------+---------------+----------+------------+------------+------+
| custId | Name          | nickname | city       | PostalCode | age  |
+--------+---------------+----------+------------+------------+------+
| C10    | JAck Sp       | Sparrow  | New Jersey | 102301     |   35 |
| C09    | Tony Special  | Specie   | GTA        | 418921     |   62 |
| C08    | Ashko Charles | AK       | USA        | 421044     |   72 |
+--------+---------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer ORDER BY custId DESC LIMIT 3 ORDER BY custid ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ORDER BY custid ASC' at line 1
MariaDB [csd2204s18]> SELECT * FROM Customer ORDER BY custId DESC ORDER BY custid ASC LIMIT 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ORDER BY custid ASC LIMIT 3' at line 1
MariaDB [csd2204s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY custId DESC LIMIT 3)t ORDER BY id ASC LIMIT 3;
ERROR 1054 (42S22): Unknown column 'id' in 'order clause'
MariaDB [csd2204s18]> SELECT * FROM (SELECT * FROM Customer ORDER BY custId DESC LIMIT 3)t ORDER BY custid ASC LIMIT 3;
+--------+---------------+----------+------------+------------+------+
| custId | Name          | nickname | city       | PostalCode | age  |
+--------+---------------+----------+------------+------------+------+
| C08    | Ashko Charles | AK       | USA        | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp       | Sparrow  | New Jersey | 102301     |   35 |
+--------+---------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer ;
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer GROUP BY CITY;
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT city FORM Customer GROUP BY City;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Customer GROUP BY City' at line 1
MariaDB [csd2204s18]> SELECT city FROM Customer GROUP BY City;
+------------+
| city       |
+------------+
| Brazil     |
| GTA        |
| New Jersey |
| New York   |
| Toronto    |
| USA        |
| WDC        |
+------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT COUNT(city) "Unique Cities" FROM Customer GROUP BY city;
+---------------+
| Unique Cities |
+---------------+
|             1 |
|             1 |
|             1 |
|             2 |
|             3 |
|             1 |
|             1 |
+---------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT COUNT(*) "total unique cities" FROM Customer GROUP BY City;
+---------------------+
| total unique cities |
+---------------------+
|                   1 |
|                   1 |
|                   1 |
|                   2 |
|                   3 |
|                   1 |
|                   1 |
+---------------------+
7 rows in set (0.01 sec)

MariaDB [csd2204s18]> SELECT city COUNT(city) "total unique cities" FROM Customer GROUP BY City;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'COUNT(city) "total unique cities" FROM Customer GROUP BY City' at line 1
MariaDB [csd2204s18]> SELECT city, COUNT(city) "total unique cities" FROM Customer GROUP BY City;
+------------+---------------------+
| city       | total unique cities |
+------------+---------------------+
| Brazil     |                   1 |
| GTA        |                   1 |
| New Jersey |                   1 |
| New York   |                   2 |
| Toronto    |                   3 |
| USA        |                   1 |
| WDC        |                   1 |
+------------+---------------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT city, COUNT(citY) "NO OF CUSTOMERS" FORM Customer GROUP BY City HAVING LIKE 'New%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FORM Customer GROUP BY City HAVING LIKE 'New%'' at line 1
MariaDB [csd2204s18]> SELECT city, COUNT(city) "NO OF CUSTOMERS" FORM Customer GROUP BY City HAVING LIKE 'New%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FORM Customer GROUP BY City HAVING LIKE 'New%'' at line 1
MariaDB [csd2204s18]> SELECT city, COUNT(city) "NO OF CUSTOMERS" FROM Customer GROUP BY City HAVING LIKE 'New%';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'LIKE 'New%'' at line 1
MariaDB [csd2204s18]> SELECT city, COUNT(city) "NO OF CUSTOMERS" FROM Customer GROUP BY City HAVING city LIKE 'New%';
+------------+-----------------+
| city       | NO OF CUSTOMERS |
+------------+-----------------+
| New Jersey |               1 |
| New York   |               2 |
+------------+-----------------+
2 rows in set (0.02 sec)

MariaDB [csd2204s18]> SELECT city, COUNT(city) "NO OF CUSTOMERS" FROM Customer GROUP BY City HAVING city LIKE 'New%' OR city='Toronto';
+------------+-----------------+
| city       | NO OF CUSTOMERS |
+------------+-----------------+
| New Jersey |               1 |
| New York   |               2 |
| Toronto    |               3 |
+------------+-----------------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT city, COUNT(city) "NO OF CUSTOMERS" FROM Customer GROUP BY City HAVING COUNT(city)>2;
+---------+-----------------+
| city    | NO OF CUSTOMERS |
+---------+-----------------+
| Toronto |               3 |
+---------+-----------------+
1 row in set (0.02 sec)

MariaDB [csd2204s18]> SELECT city, COUNT(city) "NO OF CUSTOMERS" FROM Customer GROUP BY City HAVING COUNT(city)>=2;
+----------+-----------------+
| city     | NO OF CUSTOMERS |
+----------+-----------------+
| New York |               2 |
| Toronto  |               3 |
+----------+-----------------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP '^D';
+--------+--------------+----------+---------+------------+------+
| custId | Name         | nickname | city    | PostalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna Newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.09 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP 'n$';
+--------+-----------------+----------+----------+------------+------+
| custId | Name            | nickname | city     | PostalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Charlies Theron | Cher     | New York | 120134     |   20 |
| C05    | Donna Newman    | New      | Toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP 'd$';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP 'Y$';
+--------+------------+----------+---------+------------+------+
| custId | Name       | nickname | city    | PostalCode | age  |
+--------+------------+----------+---------+------------+------+
| C01    | Ashley     | Ash      | WDC     | 321200     |   34 |
| C02    | Bob Marley | Bm       | Toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP '^..a';
+--------+-----------------+----------+----------+------------+------+
| custId | Name            | nickname | city     | PostalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| C03    | Charlies Theron | Cher     | New York | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE name REGEXP '^[0-9]';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^[0-9]';
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE postalCode REGEXP '^[A-Z]';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE nickname REGEXP '^A*';
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE nickname REGEXP '^A+';
+--------+---------------+----------+------+------------+------+
| custId | Name          | nickname | city | PostalCode | age  |
+--------+---------------+----------+------+------------+------+
| C01    | Ashley        | Ash      | WDC  | 321200     |   34 |
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
2 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE nickname REGEXP '^A?';
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE nickname REGEXP '^A$';
Empty set (0.00 sec)

MariaDB [csd2204s18]> SELECT * FROM Customer WHERE city rlike '^.{4}';
+--------+-----------------+----------+------------+------------+------+
| custId | Name            | nickname | city       | PostalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2018-05-14 |
+------------+
1 row in set (0.03 sec)

MariaDB [csd2204s18]> SELECT NOW();
+---------------------+
| NOW()               |
+---------------------+
| 2018-05-14 09:15:13 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> ALTER TABLE Customer ADD COLUMN dob DATE;
Query OK, 0 rows affected (0.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM Customer;
+--------+-----------------+----------+------------+------------+------+------+
| custId | Name            | nickname | city       | PostalCode | age  | dob  |
+--------+-----------------+----------+------------+------------+------+------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 | NULL |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 | NULL |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 | NULL |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | NULL |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 | NULL |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 | NULL |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | NULL |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | NULL |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | NULL |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 | NULL |
+--------+-----------------+----------+------------+------------+------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1994-10-12' WHERE custId='c01';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT * FROM Customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custId | Name            | nickname | city       | PostalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| C01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1994-10-12 |
| C02    | Bob Marley      | Bm       | Toronto    | 100100     |   23 | NULL       |
| C03    | Charlies Theron | Cher     | New York   | 120134     |   20 | NULL       |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | NULL       |
| C05    | Donna Newman    | New      | Toronto    | 130120     |   50 | NULL       |
| C06    | Eston M.        | M.       | Toronto    | 201023     |   65 | NULL       |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | NULL       |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | NULL       |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | NULL       |
| C10    | JAck Sp         | Sparrow  | New Jersey | 102301     |   35 | NULL       |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> UPDATE Customer SET dob='1994-12-11' WHERE custId='c02';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1995-09-11' WHERE custId='c03';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1995-10-22' WHERE custId='c04';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1995-11-03' WHERE custId='c05';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1992-12-11' WHERE custId='c06';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1996-12-22' WHERE custId='c07';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1996-12-10' WHERE custId='c08';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1996-03-15' WHERE custId='c09';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> UPDATE Customer SET dob='1995-03-18' WHERE custId='c10';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [csd2204s18]> SELECT name,dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age" FROM Customer;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| Ashley          | 1994-10-12 |   23 |
| Bob Marley      | 1994-12-11 |   23 |
| Charlies Theron | 1995-09-11 |   22 |
| Denial Jack     | 1995-10-22 |   22 |
| Donna Newman    | 1995-11-03 |   22 |
| Eston M.        | 1992-12-11 |   25 |
| Bobby Chacko    | 1996-12-22 |   21 |
| Ashko Charles   | 1996-12-10 |   21 |
| Tony Special    | 1996-03-15 |   22 |
| JAck Sp         | 1995-03-18 |   23 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT name,dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age" FROM Customer having age=22;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| Charlies Theron | 1995-09-11 |   22 |
| Denial Jack     | 1995-10-22 |   22 |
| Donna Newman    | 1995-11-03 |   22 |
| Tony Special    | 1996-03-15 |   22 |
+-----------------+------------+------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT name,dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age" FROM Customer having age=23;
+------------+------------+------+
| name       | dob        | age  |
+------------+------------+------+
| Ashley     | 1994-10-12 |   23 |
| Bob Marley | 1994-12-11 |   23 |
| JAck Sp    | 1995-03-18 |   23 |
+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [csd2204s18]> SELECT name,dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age" FROM Customer WHERE age=23;
+------------+------------+------+
| name       | dob        | age  |
+------------+------------+------+
| Bob Marley | 1994-12-11 |   23 |
+------------+------------+------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> SELECT name,dob, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age" FROM Customer WHERE 'age'=23;
Empty set, 1 warning (0.00 sec)

