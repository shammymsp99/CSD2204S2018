MariaDB [(none)]> CREATE TABLE Persons(
    -> ID integer(3),
    -> LastName varchar(25) NOT NULL,
    -> Firstname varchar(25) NOT NULL,
    -> Age integer(3),
    -> CONSTRAINT PK_Person PRIMARY KEY(ID,LastName)
    -> );
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> use CSD2204S18
Database changed
MariaDB [CSD2204S18]> CREATE TABLE Persons(
    -> ID integer(3),
    -> LastName varchar(25) NOT NULL,
    -> Firstname varchar(25) NOT NULL,
    -> Age integer(3),
    -> CONSTRAINT PK_Person PRIMARY KEY(ID,LastName)
    -> );
Query OK, 0 rows affected (0.39 sec)

MariaDB [CSD2204S18]> CREATE TABLE Orders (
    -> OrderID integer(3) NOT NULL,
    -> OrderNumber integer(3) NOT NULL
    -> PersonId integer(3),
    -> PRIMARY KEY(OrderId),
    -> CONSTRAINT FK_PersonOrder FOREIGn KEY(PersonId)
    -> REFERENCES Persons(PersonID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'integer(3),
PRIMARY KEY(OrderId),
CONSTRAINT FK_PersonOrder FOREIGn KEY(PersonId' at line 4
MariaDB [CSD2204S18]> CREATE TABLE Orders (
    -> OrderID integer(3) NOT NULL,
    -> OrderNumber integer(3) NOT NULL,
    -> ID integer(3),
    -> PRIMARY KEY(OrderID),
    -> CONSTRAINT FK_PersonOrder FOREIGN KEY(ID)
    -> REFERENCES Persons(ID)
    -> );
Query OK, 0 rows affected (0.36 sec)

MariaDB [CSD2204S18]> show INDEX from Persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> show index from Orders;
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| orders |          0 | PRIMARY        |            1 | OrderID     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| orders |          1 | FK_PersonOrder |            1 | ID          | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> desc Persons;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| ID        | int(3)      | NO   | PRI | NULL    |       |
| LastName  | varchar(25) | NO   | PRI | NULL    |       |
| Firstname | varchar(25) | NO   |     | NULL    |       |
| Age       | int(3)      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> desc Orders;
+-------------+--------+------+-----+---------+-------+
| Field       | Type   | Null | Key | Default | Extra |
+-------------+--------+------+-----+---------+-------+
| OrderID     | int(3) | NO   | PRI | NULL    |       |
| OrderNumber | int(3) | NO   |     | NULL    |       |
| ID          | int(3) | YES  | MUL | NULL    |       |
+-------------+--------+------+-----+---------+-------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> show CREATE TABLE Orders;
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                    |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Orders | CREATE TABLE `orders` (
  `OrderID` int(3) NOT NULL,
  `OrderNumber` int(3) NOT NULL,
  `ID` int(3) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_PersonOrder` (`ID`),
  CONSTRAINT `FK_PersonOrder` FOREIGN KEY (`ID`) REFERENCES `persons` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE c1 AS SELECt * FROM Customer;
Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| customer             |
| orders               |
| persons              |
+----------------------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE c1 AS SELECt * FROM customer;
ERROR 1050 (42S01): Table 'c1' already exists
MariaDB [CSD2204S18]> CREATE TABLE C1 AS SELECt * FROM customer;
ERROR 1050 (42S01): Table 'c1' already exists
MariaDB [CSD2204S18]> CREATE TABLE C11 AS SELECt * FROM customer;
Query OK, 0 rows affected (0.23 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc c11;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> desc c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

MariaDB [CSD2204S18]> desc customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c11                  |
| customer             |
| orders               |
| persons              |
+----------------------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> create table c2 as select name,postalcode from customer where city="Toronto";
Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c11                  |
| c2                   |
| customer             |
| orders               |
| persons              |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> desc c2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | YES  |     | NULL    |       |
| postalcode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> create table c23 like customer;
Query OK, 0 rows affected (0.20 sec)

MariaDB [CSD2204S18]> desc c3;
ERROR 1146 (42S02): Table 'csd2204s18.c3' doesn't exist
MariaDB [CSD2204S18]> desc c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

MariaDB [CSD2204S18]> insert into c3 select * from customer ;
ERROR 1146 (42S02): Table 'csd2204s18.c3' doesn't exist
MariaDB [CSD2204S18]> insert into c23 select * from customer ;
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> select * from c23;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> desc c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table c23 add column country varchar(10);
Query OK, 0 rows affected (0.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table c23 modify column country varchar(40);
Query OK, 0 rows affected (0.53 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c23 MODIFY COLUMN Country varchar(40);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table c23 modify column Bountry varchar(40);
ERROR 1054 (42S22): Unknown column 'Bountry' in 'c23'
MariaDB [CSD2204S18]> alter table c23 CHANGE column Country Bounty varchar(40);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Bounty     | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c23 CHANGE COLUMN custId CustomerId VARCHAR(5);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Bounty     | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c23 DROp COLUMN nickname;
Query OK, 0 rows affected (0.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Bounty     | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c23 MODIFY name VARCHAR(30) NOT NULL;
Query OK, 0 rows affected (0.80 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c23;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerId | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(30) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Bounty     | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c1 MODIFY custId VARCHAR(5) PRIMARY KEY;
Query OK, 0 rows affected (0.30 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   | PRI | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c2 DROP PRIMARY KEY(custId);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custId)' at line 1
MariaDB [CSD2204S18]> ALTER TABLE c1 DROP PRIMARY KEY(custId);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custId)' at line 1
MariaDB [CSD2204S18]> ALTER TABLE c1 DROP PRIMARY KEY;\
Query OK, 0 rows affected (2.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custId     | varchar(5)  | NO   |     | NULL    |       |
| Name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DROP TABLE c11;
Query OK, 0 rows affected (0.13 sec)

MariaDB [CSD2204S18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c2                   |
| c23                  |
| customer             |
| orders               |
| persons              |
+----------------------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> create table test_data (
    -> emp_id INT,
    -> first_name VARCHAR(50),
    -> last_name VARCHAR(50),
    -> email VARCHAR(50),
    -> gender VARCHAR(50),
    -> Mobile VARCHAR(50),
    -> age  INT
    -> );
Query OK, 0 rows affected (0.27 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (1, 'Randolf', 'Heugle', 'rheugle0@tinyurl.com', 'Male', '+7 780 781 3825', 76);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (2, 'Bathsheba', 'Blundan', 'bblundan1@tripod.com', 'Female', '+7 553 694 5915', 89);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (3, 'Leonard', 'Brandon', 'lbrandon2@wiley.com', 'Male', '+63 188 756 8688', 99);
Query OK, 1 row affected (0.06 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (4, 'Carolyne', 'Thurlow', 'cthurlow3@ezinearticles.com', 'Female', '+7 569 952 8546', 33);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (5, 'Donalt', 'Gearing', 'dgearing4@webnode.com', 'Male', '+33 592 263 1074', 82);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (6, 'Hope', 'Bunclark', 'hbunclark5@newyorker.com', 'Female', '+86 419 131 5604', 85);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (7, 'Nikki', 'Killgus', 'nkillgus6@g.co', 'Female', '+63 396 793 1393', 49);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (8, 'Rebecca', 'Flockhart', 'rflockhart7@clickbank.net', 'Female', '+63 924 268 5158', 10);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (9, 'Stafani', 'Arnke', 'sarnke8@parallels.com', 'Female', '+86 679 571 7692', 66);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (10, 'Dorena', 'Luther', 'dluther9@nbcnews.com', 'Female', '+86 623 891 4304', 66);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (11, 'Lenard', 'Dabnot', 'ldabnota@apache.org', 'Male', '+81 687 805 0912', 25);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (12, 'Andeee', 'Gregori', 'agregorib@discuz.net', 'Female', '+994 206 860 2834', 27);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (13, 'Cynthie', 'Bastin', 'cbastinc@icq.com', 'Female', '+48 578 364 9060', 20);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (14, 'Darius', 'Burchill', 'dburchilld@zimbio.com', 'Male', '+31 738 268 9391', 38);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (15, 'Leyla', 'Ulyat', 'lulyate@hostgator.com', 'Female', '+86 753 357 5289', 35);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (16, 'Carmon', 'Rideout', 'crideoutf@weather.com', 'Female', '+31 880 192 6317', 29);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (17, 'Corrinne', 'Nusche', 'cnuscheg@amazonaws.com', 'Female', '+86 935 507 6038', 20);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (18, 'Stormi', 'Dobson', 'sdobsonh@amazon.de', 'Female', '+86 643 351 5343', 40);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (19, 'Leisha', 'Goathrop', 'lgoathropi@cyberchimps.com', 'Female', '+420 481 849 8947', 78);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (20, 'Temp', 'O''Neal', 'tonealj@unesco.org', 'Male', '+385 179 778 4255', 98);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (21, 'Amery', 'Capoun', 'acapounk@delicious.com', 'Male', '+86 364 320 2895', 68);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (22, 'Gerrilee', 'Bank', 'gbankl@senate.gov', 'Female', '+27 831 149 0914', 66);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (23, 'Luis', 'Gerault', 'lgeraultm@netvibes.com', 'Male', '+62 714 520 4481', 92);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (24, 'Daveen', 'Robeson', 'drobesonn@umich.edu', 'Female', '+63 282 931 4401', 96);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (25, 'Alastair', 'Capps', 'acappso@reddit.com', 'Male', '+51 114 492 8808', 91);
Query OK, 1 row affected (0.06 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (26, 'Malissa', 'Nower', 'mnowerp@symantec.com', 'Female', '+1 419 330 8537', 76);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (27, 'Manon', 'Corbould', 'mcorbouldq@baidu.com', 'Female', '+63 492 918 0026', 53);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (28, 'Mauricio', 'Franck', 'mfranckr@myspace.com', 'Male', '+53 109 321 7342', 100);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (29, 'Barbette', 'Colbourn', 'bcolbourns@ucsd.edu', 'Female', '+963 980 187 3633', 41);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (30, 'Trueman', 'Birdwistle', 'tbirdwistlet@msn.com', 'Male', '+509 334 460 9957', 18);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (31, 'Carl', 'Habbin', 'chabbinu@wikia.com', 'Male', '+51 132 791 3891', 68);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (32, 'Raynell', 'McRill', 'rmcrillv@boston.com', 'Female', '+86 369 971 7434', 96);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (33, 'Gardener', 'Greenshiels', 'ggreenshielsw@cmu.edu', 'Male', '+359 236 509 9474', 92);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (34, 'Cord', 'Osgerby', 'cosgerbyx@nature.com', 'Male', '+81 795 684 8422', 17);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (35, 'Tilda', 'Whate', 'twhatey@domainmarket.com', 'Female', '+95 153 481 4887', 36);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (36, 'Kit', 'Clynman', 'kclynmanz@ustream.tv', 'Female', '+381 537 326 0803', 55);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (37, 'Trey', 'McRonald', 'tmcronald10@washington.edu', 'Male', '+351 309 877 0171', 92);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (38, 'Isobel', 'Hultberg', 'ihultberg11@1und1.de', 'Female', '+33 733 296 8366', 81);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (39, 'Addi', 'Swindley', 'aswindley12@ameblo.jp', 'Female', '+62 353 848 6280', 83);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (40, 'Nicolas', 'Lagen', 'nlagen13@webnode.com', 'Male', '+86 897 541 6272', 56);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (41, 'Wilton', 'Klee', 'wklee14@diigo.com', 'Male', '+62 808 261 3070', 14);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (42, 'Bren', 'Heindle', 'bheindle15@uol.com.br', 'Female', '+1 650 511 2946', 84);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (43, 'Daryle', 'Hampton', 'dhampton16@google.cn', 'Male', '+86 500 101 6382', 31);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (44, 'Dale', 'Stollenberg', 'dstollenberg17@elegantthemes.com', 'Male', '+7 352 354 6278', 46);
Query OK, 1 row affected (0.06 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (45, 'Gilburt', 'Greatreax', 'ggreatreax18@upenn.edu', 'Male', '+62 551 590 0601', 21);
Query OK, 1 row affected (0.08 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (46, 'Fleur', 'Greedyer', 'fgreedyer19@list-manage.com', 'Female', '+86 653 203 5606', 62);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (47, 'Ramsay', 'Edwin', 'redwin1a@ebay.co.uk', 'Male', '+86 385 452 5635', 94);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (48, 'Petr', 'Baudain', 'pbaudain1b@pagesperso-orange.fr', 'Male', '+380 830 658 4161', 51);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (49, 'Andrew', 'Squelch', 'asquelch1c@ed.gov', 'Male', '+62 173 998 5575', 61);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> insert into test_data (emp_id, first_name, last_name, email, gender, Mobile, age ) values (50, 'Mildred', 'Secker', 'msecker1d@whitehouse.gov', 'Female', '+54 336 842 4330', 60);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> select * from test_data;
+--------+------------+-------------+----------------------------------+--------+-------------------+------+
| emp_id | first_name | last_name   | email                            | gender | Mobile            | age  |
+--------+------------+-------------+----------------------------------+--------+-------------------+------+
|      1 | Randolf    | Heugle      | rheugle0@tinyurl.com             | Male   | +7 780 781 3825   |   76 |
|      2 | Bathsheba  | Blundan     | bblundan1@tripod.com             | Female | +7 553 694 5915   |   89 |
|      3 | Leonard    | Brandon     | lbrandon2@wiley.com              | Male   | +63 188 756 8688  |   99 |
|      4 | Carolyne   | Thurlow     | cthurlow3@ezinearticles.com      | Female | +7 569 952 8546   |   33 |
|      5 | Donalt     | Gearing     | dgearing4@webnode.com            | Male   | +33 592 263 1074  |   82 |
|      6 | Hope       | Bunclark    | hbunclark5@newyorker.com         | Female | +86 419 131 5604  |   85 |
|      7 | Nikki      | Killgus     | nkillgus6@g.co                   | Female | +63 396 793 1393  |   49 |
|      8 | Rebecca    | Flockhart   | rflockhart7@clickbank.net        | Female | +63 924 268 5158  |   10 |
|      9 | Stafani    | Arnke       | sarnke8@parallels.com            | Female | +86 679 571 7692  |   66 |
|     10 | Dorena     | Luther      | dluther9@nbcnews.com             | Female | +86 623 891 4304  |   66 |
|     11 | Lenard     | Dabnot      | ldabnota@apache.org              | Male   | +81 687 805 0912  |   25 |
|     12 | Andeee     | Gregori     | agregorib@discuz.net             | Female | +994 206 860 2834 |   27 |
|     13 | Cynthie    | Bastin      | cbastinc@icq.com                 | Female | +48 578 364 9060  |   20 |
|     14 | Darius     | Burchill    | dburchilld@zimbio.com            | Male   | +31 738 268 9391  |   38 |
|     15 | Leyla      | Ulyat       | lulyate@hostgator.com            | Female | +86 753 357 5289  |   35 |
|     16 | Carmon     | Rideout     | crideoutf@weather.com            | Female | +31 880 192 6317  |   29 |
|     17 | Corrinne   | Nusche      | cnuscheg@amazonaws.com           | Female | +86 935 507 6038  |   20 |
|     18 | Stormi     | Dobson      | sdobsonh@amazon.de               | Female | +86 643 351 5343  |   40 |
|     19 | Leisha     | Goathrop    | lgoathropi@cyberchimps.com       | Female | +420 481 849 8947 |   78 |
|     20 | Temp       | O'Neal      | tonealj@unesco.org               | Male   | +385 179 778 4255 |   98 |
|     21 | Amery      | Capoun      | acapounk@delicious.com           | Male   | +86 364 320 2895  |   68 |
|     22 | Gerrilee   | Bank        | gbankl@senate.gov                | Female | +27 831 149 0914  |   66 |
|     23 | Luis       | Gerault     | lgeraultm@netvibes.com           | Male   | +62 714 520 4481  |   92 |
|     24 | Daveen     | Robeson     | drobesonn@umich.edu              | Female | +63 282 931 4401  |   96 |
|     25 | Alastair   | Capps       | acappso@reddit.com               | Male   | +51 114 492 8808  |   91 |
|     26 | Malissa    | Nower       | mnowerp@symantec.com             | Female | +1 419 330 8537   |   76 |
|     27 | Manon      | Corbould    | mcorbouldq@baidu.com             | Female | +63 492 918 0026  |   53 |
|     28 | Mauricio   | Franck      | mfranckr@myspace.com             | Male   | +53 109 321 7342  |  100 |
|     29 | Barbette   | Colbourn    | bcolbourns@ucsd.edu              | Female | +963 980 187 3633 |   41 |
|     30 | Trueman    | Birdwistle  | tbirdwistlet@msn.com             | Male   | +509 334 460 9957 |   18 |
|     31 | Carl       | Habbin      | chabbinu@wikia.com               | Male   | +51 132 791 3891  |   68 |
|     32 | Raynell    | McRill      | rmcrillv@boston.com              | Female | +86 369 971 7434  |   96 |
|     33 | Gardener   | Greenshiels | ggreenshielsw@cmu.edu            | Male   | +359 236 509 9474 |   92 |
|     34 | Cord       | Osgerby     | cosgerbyx@nature.com             | Male   | +81 795 684 8422  |   17 |
|     35 | Tilda      | Whate       | twhatey@domainmarket.com         | Female | +95 153 481 4887  |   36 |
|     36 | Kit        | Clynman     | kclynmanz@ustream.tv             | Female | +381 537 326 0803 |   55 |
|     37 | Trey       | McRonald    | tmcronald10@washington.edu       | Male   | +351 309 877 0171 |   92 |
|     38 | Isobel     | Hultberg    | ihultberg11@1und1.de             | Female | +33 733 296 8366  |   81 |
|     39 | Addi       | Swindley    | aswindley12@ameblo.jp            | Female | +62 353 848 6280  |   83 |
|     40 | Nicolas    | Lagen       | nlagen13@webnode.com             | Male   | +86 897 541 6272  |   56 |
|     41 | Wilton     | Klee        | wklee14@diigo.com                | Male   | +62 808 261 3070  |   14 |
|     42 | Bren       | Heindle     | bheindle15@uol.com.br            | Female | +1 650 511 2946   |   84 |
|     43 | Daryle     | Hampton     | dhampton16@google.cn             | Male   | +86 500 101 6382  |   31 |
|     44 | Dale       | Stollenberg | dstollenberg17@elegantthemes.com | Male   | +7 352 354 6278   |   46 |
|     45 | Gilburt    | Greatreax   | ggreatreax18@upenn.edu           | Male   | +62 551 590 0601  |   21 |
|     46 | Fleur      | Greedyer    | fgreedyer19@list-manage.com      | Female | +86 653 203 5606  |   62 |
|     47 | Ramsay     | Edwin       | redwin1a@ebay.co.uk              | Male   | +86 385 452 5635  |   94 |
|     48 | Petr       | Baudain     | pbaudain1b@pagesperso-orange.fr  | Male   | +380 830 658 4161 |   51 |
|     49 | Andrew     | Squelch     | asquelch1c@ed.gov                | Male   | +62 173 998 5575  |   61 |
|     50 | Mildred    | Secker      | msecker1d@whitehouse.gov         | Female | +54 336 842 4330  |   60 |
+--------+------------+-------------+----------------------------------+--------+-------------------+------+
50 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table test_data add primary key(emp_id);
Query OK, 50 rows affected (0.55 sec)
Records: 50  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc test_data;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| emp_id     | int(11)     | NO   | PRI | NULL    |       |
| first_name | varchar(50) | YES  |     | NULL    |       |
| last_name  | varchar(50) | YES  |     | NULL    |       |
| email      | varchar(50) | YES  |     | NULL    |       |
| gender     | varchar(50) | YES  |     | NULL    |       |
| Mobile     | varchar(50) | YES  |     | NULL    |       |
| age        | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

