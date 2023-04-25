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

    
