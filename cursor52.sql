/*Objective:To study the concept of cursor
Cursor:-Store result set of select query
Cursor is used to fetch multiple values
Syantax:-declare cursor_name cursor
open cursor
fetch data
close cursor
In the example given below we have fetch data inserted into student table to stud_copy
*/
delimiter //
create procedure pcopy()
begin
	declare fin int default 0;
	declare i int;
	declare sname varchar(20);
	declare dept varchar(20);
	declare marks int;	
declare cursor52 cursor for select * from student;
declare continue handler for not found set fin=1;
truncate table stud_copy;
open cursor52;
getdata:loop
     fetch  cursor52 into i,sname,dept,marks;
     if fin=1 then
     leave getdata;
     end if;
    
    insert into stud_copy values(i,sname,dept,marks);
    end loop getdata;
    close cursor52;
    end;
    //
    delimiter ;

/*
 mysql> select * from student;
+------+--------+----------+-------+
| id   | name   | dept     | marks |
+------+--------+----------+-------+
|   52 | Rutu   | Computer |  85.5 |
|   20 | Seeta  | IT       |    90 |
|   26 | Rachu  | ECE      |    70 |
|   21 | Sakshi | Civil    |  75.5 |
+------+--------+----------+-------+
4 rows in set (0.00 sec)
mysql> select * from stud_copy;
+------+------+----------+-------+
| id   | name | dept     | marks |
+------+------+----------+-------+
|   52 | Rutu | Computer |    86 |
+------+------+----------+-------+
1 row in set (0.00 sec)
mysql> call pcopy();
Query OK, 0 rows affected (0.37 sec)
mysql> select * from stud_copy;
+------+--------+----------+-------+
| id   | name   | dept     | marks |
+------+--------+----------+-------+
|   52 | Rutu   | Computer |    86 |
|   52 | Rutu   | Computer |    86 |
|   20 | Seeta  | IT       |    90 |
|   26 | Rachu  | ECE      |    70 |
|   21 | Sakshi | Civil    |    76 |
+------+--------+----------+-------+
5 rows in set (0.00 sec)
*/
/*
Here use have use truncate so values are not repeated
mysql> select * from student;
+------+--------+----------+-------+------------+------+
| id   | name   | dept     | marks | date_birth | age  |
+------+--------+----------+-------+------------+------+
|   52 | Rutu   | Computer |  85.5 | 1998-10-20 | NULL |
|   20 | Seeta  | IT       |    90 | 2003-08-26 | NULL |
|   26 | Rachu  | ECE      |    70 | 2008-09-15 | NULL |
|   21 | Sakshi | Civil    |  75.5 | 2010-07-25 | NULL |
|   20 | shreya | comp     |    10 | 2023-12-28 | NULL |
+------+--------+----------+-------+------------+------+
5 rows in set (0.00 sec)

mysql> alter table stud_copy add  age int(10);
Query OK, 0 rows affected, 1 warning (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> alter table stud_copy drop  age int(10);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int(10)' at line 1
mysql> alter table stud_copy drop  age;
Query OK, 0 rows affected (0.41 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table stud_copy add date_birth;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table stud_copy add date_birth date;
Query OK, 0 rows affected (0.23 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table stud_copy add  age int(10);
Query OK, 0 rows affected, 1 warning (0.30 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> select * from stud_copy;
+------+--------+----------+-------+------------+------+
| id   | name   | dept     | marks | date_birth | age  |
+------+--------+----------+-------+------------+------+
|   52 | Rutu   | Computer |    86 | NULL       | NULL |
|   20 | Seeta  | IT       |    90 | NULL       | NULL |
|   26 | Rachu  | ECE      |    70 | NULL       | NULL |
|   21 | Sakshi | Civil    |    76 | NULL       | NULL |
+------+--------+----------+-------+------------+------+
4 rows in set (0.00 sec)
*/

    
