Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use unik;
Database changed
mysql> show tables;
+----------------------------------+
| Tables_in_unik                   |
+----------------------------------+
| credit of passing the discipline |
| discipline                       |
| discipline_has_specialty         |
| faculty                          |
| group                            |
| phone number                     |
| specialty                        |
| student                          |
| student_has_discipline           |
+----------------------------------+
9 rows in set (0.00 sec)

mysql> select * from `group`;
+---------+-----------+-----------------------+
| GroupID | GroupName | Specialty_SpecialtyID |
+---------+-----------+-----------------------+
|       1 | Group1    |                     1 |
|       2 | Group2    |                     2 |
|       3 | Group3    |                     3 |
|       4 | Group4    |                     4 |
|       5 | Group5    |                     5 |
+---------+-----------+-----------------------+
5 rows in set (0.00 sec)

mysql> select * from specialty;
+-------------+---------------+-------------------+
| SpecialtyID | SpecialtyName | Faculty_FacultyID |
+-------------+---------------+-------------------+
|           1 | CS            |                 1 |
|           2 | s2            |                 2 |
|           3 | s3            |                 3 |
|           4 | s4            |                 4 |
|           5 | s5            |                 5 |
+-------------+---------------+-------------------+
5 rows in set (0.00 sec)
    

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
 • Cartesian product (using different approaches);
 • декартового добутку (використовуючи різні підходи);
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
    
mysql> select * from specialty, `group`;
+-------------+---------------+-------------------+---------+-----------+-----------------------+
| SpecialtyID | SpecialtyName | Faculty_FacultyID | GroupID | GroupName | Specialty_SpecialtyID |
+-------------+---------------+-------------------+---------+-----------+-----------------------+
|           5 | s5            |                 5 |       1 | Group1    |                     1 |
|           4 | s4            |                 4 |       1 | Group1    |                     1 |
|           3 | s3            |                 3 |       1 | Group1    |                     1 |
|           2 | s2            |                 2 |       1 | Group1    |                     1 |
|           1 | CS            |                 1 |       1 | Group1    |                     1 |
|           5 | s5            |                 5 |       2 | Group2    |                     2 |
|           4 | s4            |                 4 |       2 | Group2    |                     2 |
|           3 | s3            |                 3 |       2 | Group2    |                     2 |
|           2 | s2            |                 2 |       2 | Group2    |                     2 |
|           1 | CS            |                 1 |       2 | Group2    |                     2 |
|           5 | s5            |                 5 |       3 | Group3    |                     3 |
|           4 | s4            |                 4 |       3 | Group3    |                     3 |
|           3 | s3            |                 3 |       3 | Group3    |                     3 |
|           2 | s2            |                 2 |       3 | Group3    |                     3 |
|           1 | CS            |                 1 |       3 | Group3    |                     3 |
|           5 | s5            |                 5 |       4 | Group4    |                     4 |
|           4 | s4            |                 4 |       4 | Group4    |                     4 |
|           3 | s3            |                 3 |       4 | Group4    |                     4 |
|           2 | s2            |                 2 |       4 | Group4    |                     4 |
|           1 | CS            |                 1 |       4 | Group4    |                     4 |
|           5 | s5            |                 5 |       5 | Group5    |                     5 |
|           4 | s4            |                 4 |       5 | Group5    |                     5 |
|           3 | s3            |                 3 |       5 | Group5    |                     5 |
|           2 | s2            |                 2 |       5 | Group5    |                     5 |
|           1 | CS            |                 1 |       5 | Group5    |                     5 |
+-------------+---------------+-------------------+---------+-----------+-----------------------+
25 rows in set (0.00 sec)

mysql> select * from specialty join `group`;
+-------------+---------------+-------------------+---------+-----------+-----------------------+
| SpecialtyID | SpecialtyName | Faculty_FacultyID | GroupID | GroupName | Specialty_SpecialtyID |
+-------------+---------------+-------------------+---------+-----------+-----------------------+
|           5 | s5            |                 5 |       1 | Group1    |                     1 |
|           4 | s4            |                 4 |       1 | Group1    |                     1 |
|           3 | s3            |                 3 |       1 | Group1    |                     1 |
|           2 | s2            |                 2 |       1 | Group1    |                     1 |
|           1 | CS            |                 1 |       1 | Group1    |                     1 |
|           5 | s5            |                 5 |       2 | Group2    |                     2 |
|           4 | s4            |                 4 |       2 | Group2    |                     2 |
|           3 | s3            |                 3 |       2 | Group2    |                     2 |
|           2 | s2            |                 2 |       2 | Group2    |                     2 |
|           1 | CS            |                 1 |       2 | Group2    |                     2 |
|           5 | s5            |                 5 |       3 | Group3    |                     3 |
|           4 | s4            |                 4 |       3 | Group3    |                     3 |
|           3 | s3            |                 3 |       3 | Group3    |                     3 |
|           2 | s2            |                 2 |       3 | Group3    |                     3 |
|           1 | CS            |                 1 |       3 | Group3    |                     3 |
|           5 | s5            |                 5 |       4 | Group4    |                     4 |
|           4 | s4            |                 4 |       4 | Group4    |                     4 |
|           3 | s3            |                 3 |       4 | Group4    |                     4 |
|           2 | s2            |                 2 |       4 | Group4    |                     4 |
|           1 | CS            |                 1 |       4 | Group4    |                     4 |
|           5 | s5            |                 5 |       5 | Group5    |                     5 |
|           4 | s4            |                 4 |       5 | Group5    |                     5 |
|           3 | s3            |                 3 |       5 | Group5    |                     5 |
|           2 | s2            |                 2 |       5 | Group5    |                     5 |
|           1 | CS            |                 1 |       5 | Group5    |                     5 |
+-------------+---------------+-------------------+---------+-----------+-----------------------+
25 rows in set (0.00 sec)

mysql> select * from specialty cross join `group`;
+-------------+---------------+-------------------+---------+-----------+-----------------------+
| SpecialtyID | SpecialtyName | Faculty_FacultyID | GroupID | GroupName | Specialty_SpecialtyID |
+-------------+---------------+-------------------+---------+-----------+-----------------------+
|           5 | s5            |                 5 |       1 | Group1    |                     1 |
|           4 | s4            |                 4 |       1 | Group1    |                     1 |
|           3 | s3            |                 3 |       1 | Group1    |                     1 |
|           2 | s2            |                 2 |       1 | Group1    |                     1 |
|           1 | CS            |                 1 |       1 | Group1    |                     1 |
|           5 | s5            |                 5 |       2 | Group2    |                     2 |
|           4 | s4            |                 4 |       2 | Group2    |                     2 |
|           3 | s3            |                 3 |       2 | Group2    |                     2 |
|           2 | s2            |                 2 |       2 | Group2    |                     2 |
|           1 | CS            |                 1 |       2 | Group2    |                     2 |
|           5 | s5            |                 5 |       3 | Group3    |                     3 |
|           4 | s4            |                 4 |       3 | Group3    |                     3 |
|           3 | s3            |                 3 |       3 | Group3    |                     3 |
|           2 | s2            |                 2 |       3 | Group3    |                     3 |
|           1 | CS            |                 1 |       3 | Group3    |                     3 |
|           5 | s5            |                 5 |       4 | Group4    |                     4 |
|           4 | s4            |                 4 |       4 | Group4    |                     4 |
|           3 | s3            |                 3 |       4 | Group4    |                     4 |
|           2 | s2            |                 2 |       4 | Group4    |                     4 |
|           1 | CS            |                 1 |       4 | Group4    |                     4 |
|           5 | s5            |                 5 |       5 | Group5    |                     5 |
|           4 | s4            |                 4 |       5 | Group5    |                     5 |
|           3 | s3            |                 3 |       5 | Group5    |                     5 |
|           2 | s2            |                 2 |       5 | Group5    |                     5 |
|           1 | CS            |                 1 |       5 | Group5    |                     5 |
+-------------+---------------+-------------------+---------+-----------+-----------------------+
25 rows in set (0.00 sec)

mysql> select * from `group` limit 3;
+---------+-----------+-----------------------+
| GroupID | GroupName | Specialty_SpecialtyID |
+---------+-----------+-----------------------+
|       1 | Group1    |                     1 |
|       2 | Group2    |                     2 |
|       3 | Group3    |                     3 |
+---------+-----------+-----------------------+
3 rows in set (0.00 sec)

mysql> select * from student limit 3;
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
| StudentID | Name          | Phone number | Home adress              | Record book number | Birth date | GroupID | age  |
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
|         1 | Alice Johnson | 555-1234     | 123 Elm St, Cityville    |                101 | 2000-03-15 |       1 |   25 |
|         2 | Bob Smith     | 555-5678     | 456 Oak St, Townsville   |                102 | 1999-06-20 |       2 |   25 |
|         3 | Charlie Brown | 555-8765     | 789 Pine St, Villageburg |                103 | 2001-02-10 |       3 |   24 |
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
3 rows in set (0.00 sec)


----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
• natural join;
• натурального з’єднання;
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
    
mysql> select name, groupname from student natural join `group`;
+---------------+-----------+
| name          | groupname |
+---------------+-----------+
| Alice Johnson | Group1    |
| Frank Black   | Group1    |
| Ivy Martin    | Group1    |
| Mona Harris   | Group1    |
| Quincy Adams  | Group1    |
| Bob Smith     | Group2    |
| Eve Green     | Group2    |
| Jack Miller   | Group2    |
| Nina Clark    | Group2    |
| Rita Baker    | Group2    |
| Charlie Brown | Group3    |
| Grace Lee     | Group3    |
| Kathy Wilson  | Group3    |
| Oscar Young   | Group3    |
| Tina Moore    | Group3    |
| Dana White    | Group4    |
| Hank Davis    | Group4    |
| Leo Moore     | Group4    |
| Paul Scott    | Group4    |
| Steve Allen   | Group5    |
+---------------+-----------+
20 rows in set (0.00 sec)

mysql> select groupname, specialtyname from specialty, `group` where SpecialtyID = Specialty_SpecialtyID;
+-----------+---------------+
| groupname | specialtyname |
+-----------+---------------+
| Group1    | CS            |
| Group2    | s2            |
| Group3    | s3            |
| Group4    | s4            |
| Group5    | s5            |
+-----------+---------------+
5 rows in set (0.00 sec)

mysql> select groupname, specialtyname from specialty join `group` on SpecialtyID = Specialty_SpecialtyID;
+-----------+---------------+
| groupname | specialtyname |
+-----------+---------------+
| Group1    | CS            |
| Group2    | s2            |
| Group3    | s3            |
| Group4    | s4            |
| Group5    | s5            |
+-----------+---------------+
5 rows in set (0.00 sec)

mysql> select groupname, specialtyname from specialty inner join `group` on SpecialtyID = Specialty_SpecialtyID;
+-----------+---------------+
| groupname | specialtyname |
+-----------+---------------+
| Group1    | CS            |
| Group2    | s2            |
| Group3    | s3            |
| Group4    | s4            |
| Group5    | s5            |
+-----------+---------------+
5 rows in set (0.00 sec)

    
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
• natural join with a specific condition (predicate);
• натурального з’єднання за певною умовою (предикатом);
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
    
mysql> select name, groupname, `Birth date` from student natural join `group`
    -> where `Birth date` between '1998-01-01' and '1998-12-31';
+------------+-----------+------------+
| name       | groupname | Birth date |
+------------+-----------+------------+
| Eve Green  | Group2    | 1998-11-30 |
| Leo Moore  | Group4    | 1998-02-28 |
| Paul Scott | Group4    | 1998-03-10 |
+------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> select groupname, specialtyname from specialty inner join `group` on SpecialtyID = Specialty_SpecialtyID
    -> where groupid >= 3;
+-----------+---------------+
| groupname | specialtyname |
+-----------+---------------+
| Group3    | s3            |
| Group4    | s4            |
| Group5    | s5            |
+-----------+---------------+
3 rows in set (0.00 sec)

mysql> select name, groupname from student inner join `group` on `group`.groupid = student.groupid
    -> where `Home adress` like '%Elm%';
+---------------+-----------+
| name          | groupname |
+---------------+-----------+
| Alice Johnson | Group1    |
| Kathy Wilson  | Group3    |
| Steve Allen   | Group5    |
+---------------+-----------+
3 rows in set (0.00 sec)

mysql> select * from student limit 5;
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
| StudentID | Name          | Phone number | Home adress              | Record book number | Birth date | GroupID | age  |
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
|         1 | Alice Johnson | 555-1234     | 123 Elm St, Cityville    |                101 | 2000-03-15 |       1 |   25 |
|         2 | Bob Smith     | 555-5678     | 456 Oak St, Townsville   |                102 | 1999-06-20 |       2 |   25 |
|         3 | Charlie Brown | 555-8765     | 789 Pine St, Villageburg |                103 | 2001-02-10 |       3 |   24 |
|         4 | Dana White    | 555-1122     | 321 Maple St, Suburbia   |                104 | 2000-09-05 |       4 |   24 |
|         5 | Eve Green     | 555-3344     | 654 Birch St, Uptown     |                105 | 1998-11-30 |       2 |   26 |
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
5 rows in set (0.00 sec)

mysql> select * from discipline limit 5;
+--------------+------------------+-----------------+---------------------------+-----------------------------+
| DisciplineID | Discipline name  | Number of hours | amount of seminar classes | amount of practical classes |
+--------------+------------------+-----------------+---------------------------+-----------------------------+
|            1 | Mathematics      |             120 |                        30 |                          60 |
|            2 | Physics          |             150 |                        40 |                          70 |
|            3 | Chemistry        |             100 |                        25 |                          50 |
|            4 | Biology          |             110 |                        30 |                          55 |
|            5 | Computer Science |             180 |                        50 |                          90 |
+--------------+------------------+-----------------+---------------------------+-----------------------------+
5 rows in set (0.00 sec)

mysql> select * from student_has_discipline limit 5;
+-------------------+--------------------------+
| Student_StudentID | Discipline_Discipline ID |
+-------------------+--------------------------+
|                 1 |                        1 |
|                 2 |                        1 |
|                 7 |                        1 |
|                14 |                        1 |
|                 1 |                        2 |
+-------------------+--------------------------+
5 rows in set (0.00 sec)

----------------------------------------------------------------
з'єднання трьох таблиць                                        '
----------------------------------------------------------------
    
mysql> select student.name, discipline.`Discipline name`
    -> from student, student_has_discipline, discipline
    -> where student.studentid = `student_has_discipline`.Student_StudentID and
    -> `student_has_discipline`.`Discipline_Discipline ID` = discipline.DisciplineID;
+---------------+-------------------------+
| name          | Discipline name         |
+---------------+-------------------------+
| Alice Johnson | Mathematics             |
| Bob Smith     | Mathematics             |
| Grace Lee     | Mathematics             |
| Nina Clark    | Mathematics             |
| Alice Johnson | Physics                 |
| Dana White    | Physics                 |
| Quincy Adams  | Physics                 |
| Bob Smith     | Chemistry               |
| Hank Davis    | Chemistry               |
| Oscar Young   | Chemistry               |
| Charlie Brown | Biology                 |
| Ivy Martin    | Biology                 |
| Paul Scott    | Biology                 |
| Charlie Brown | Computer Science        |
| Hank Davis    | Computer Science        |
| Mona Harris   | Computer Science        |
| Steve Allen   | Computer Science        |
| Dana White    | English Literature      |
| Jack Miller   | English Literature      |
| Eve Green     | History                 |
| Kathy Wilson  | History                 |
| Eve Green     | Philosophy              |
| Leo Moore     | Philosophy              |
| Frank Black   | Economics               |
| Mona Harris   | Economics               |
| Frank Black   | Psychology              |
| Tina Moore    | Psychology              |
| Grace Lee     | Sociology               |
| Rita Baker    | Sociology               |
| Ivy Martin    | Geography               |
| Jack Miller   | Political Science       |
| Tina Moore    | Political Science       |
| Kathy Wilson  | Engineering Mechanics   |
| Leo Moore     | Statistics              |
| Nina Clark    | Environmental Science   |
| Paul Scott    | Business Administration |
| Oscar Young   | Law                     |
| Quincy Adams  | Medicine                |
| Rita Baker    | Art History             |
| Steve Allen   | Art History             |
+---------------+-------------------------+
40 rows in set (0.00 sec)

mysql> select student.name, discipline.`Discipline name`
    -> from student inner join student_has_discipline on student.studentid = `student_has_discipline`.Student_StudentID
    -> inner join discipline on `student_has_discipline`.`Discipline_Discipline ID` = discipline.DisciplineID;
+---------------+-------------------------+
| name          | Discipline name         |
+---------------+-------------------------+
| Alice Johnson | Mathematics             |
| Bob Smith     | Mathematics             |
| Grace Lee     | Mathematics             |
| Nina Clark    | Mathematics             |
| Alice Johnson | Physics                 |
| Dana White    | Physics                 |
| Quincy Adams  | Physics                 |
| Bob Smith     | Chemistry               |
| Hank Davis    | Chemistry               |
| Oscar Young   | Chemistry               |
| Charlie Brown | Biology                 |
| Ivy Martin    | Biology                 |
| Paul Scott    | Biology                 |
| Charlie Brown | Computer Science        |
| Hank Davis    | Computer Science        |
| Mona Harris   | Computer Science        |
| Steve Allen   | Computer Science        |
| Dana White    | English Literature      |
| Jack Miller   | English Literature      |
| Eve Green     | History                 |
| Kathy Wilson  | History                 |
| Eve Green     | Philosophy              |
| Leo Moore     | Philosophy              |
| Frank Black   | Economics               |
| Mona Harris   | Economics               |
| Frank Black   | Psychology              |
| Tina Moore    | Psychology              |
| Grace Lee     | Sociology               |
| Rita Baker    | Sociology               |
| Ivy Martin    | Geography               |
| Jack Miller   | Political Science       |
| Tina Moore    | Political Science       |
| Kathy Wilson  | Engineering Mechanics   |
| Leo Moore     | Statistics              |
| Nina Clark    | Environmental Science   |
| Paul Scott    | Business Administration |
| Oscar Young   | Law                     |
| Quincy Adams  | Medicine                |
| Rita Baker    | Art History             |
| Steve Allen   | Art History             |
+---------------+-------------------------+
40 rows in set (0.00 sec)


----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
• left (or right) outer join;
• лівого (або правого) зовнішнього з’єднання;
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
    
mysql> select name, groupname from student left join `group` on student.groupid=`group`.groupid;
+---------------+-----------+
| name          | groupname |
+---------------+-----------+
| Alice Johnson | Group1    |
| Bob Smith     | Group2    |
| Charlie Brown | Group3    |
| Dana White    | Group4    |
| Eve Green     | Group2    |
| Frank Black   | Group1    |
| Grace Lee     | Group3    |
| Hank Davis    | Group4    |
| Ivy Martin    | Group1    |
| Jack Miller   | Group2    |
| Kathy Wilson  | Group3    |
| Leo Moore     | Group4    |
| Mona Harris   | Group1    |
| Nina Clark    | Group2    |
| Oscar Young   | Group3    |
| Paul Scott    | Group4    |
| Quincy Adams  | Group1    |
| Rita Baker    | Group2    |
| Steve Allen   | Group5    |
| Tina Moore    | Group3    |
+---------------+-----------+
20 rows in set (0.00 sec)

mysql> select * from student limit 5;
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
| StudentID | Name          | Phone number | Home adress              | Record book number | Birth date | GroupID | age  |
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
|         1 | Alice Johnson | 555-1234     | 123 Elm St, Cityville    |                101 | 2000-03-15 |       1 |   25 |
|         2 | Bob Smith     | 555-5678     | 456 Oak St, Townsville   |                102 | 1999-06-20 |       2 |   25 |
|         3 | Charlie Brown | 555-8765     | 789 Pine St, Villageburg |                103 | 2001-02-10 |       3 |   24 |
|         4 | Dana White    | 555-1122     | 321 Maple St, Suburbia   |                104 | 2000-09-05 |       4 |   24 |
|         5 | Eve Green     | 555-3344     | 654 Birch St, Uptown     |                105 | 1998-11-30 |       2 |   26 |
+-----------+---------------+--------------+--------------------------+--------------------+------------+---------+------+
5 rows in set (0.00 sec)

mysql> select * from `phone number` limit 5;
+---------+--------------+-------------------+
| PhoneID | phone number | Student_StudentID |
+---------+--------------+-------------------+
|       1 | 555-1234     |                 1 |
|       2 | 555-5678     |                11 |
|       3 | 555-5678     |                 2 |
|       4 | 555-8765     |                13 |
|       5 | 555-1122     |                 4 |
+---------+--------------+-------------------+
5 rows in set (0.00 sec)

mysql> select student.name, student.`phone number`, `phone number`.`phone number` as second_phone
    -> from student left join `phone number` on studentid = Student_StudentID;
+---------------+--------------+--------------+
| name          | phone number | second_phone |
+---------------+--------------+--------------+
| Alice Johnson | 555-1234     | 555-1234     |
| Bob Smith     | 555-5678     | 555-5678     |
| Charlie Brown | 555-8765     | NULL         |
| Dana White    | 555-1122     | 555-1122     |
| Eve Green     | 555-3344     | 555-3344     |
| Frank Black   | 555-5566     | 555-5566     |
| Grace Lee     | 555-7788     | NULL         |
| Hank Davis    | 555-9900     | 555-9900     |
| Ivy Martin    | 555-2233     | NULL         |
| Jack Miller   | 555-4455     | 555-2233     |
| Kathy Wilson  | 555-6677     | 555-5678     |
| Leo Moore     | 555-8899     | NULL         |
| Mona Harris   | 555-1010     | 555-8765     |
| Nina Clark    | 555-2323     | 555-8881     |
| Oscar Young   | 555-4545     | NULL         |
| Paul Scott    | 555-6767     | NULL         |
| Quincy Adams  | 555-8989     | 555-7788     |
| Rita Baker    | 555-1011     | NULL         |
| Steve Allen   | 555-3232     | NULL         |
| Tina Moore    | 555-5454     | NULL         |
+---------------+--------------+--------------+
20 rows in set (0.00 sec)

mysql> select student.name, student.`phone number`, `phone number`.`phone number` as second_phone
    -> from `phone number` right join student on studentid = Student_StudentID;
+---------------+--------------+--------------+
| name          | phone number | second_phone |
+---------------+--------------+--------------+
| Alice Johnson | 555-1234     | 555-1234     |
| Bob Smith     | 555-5678     | 555-5678     |
| Charlie Brown | 555-8765     | NULL         |
| Dana White    | 555-1122     | 555-1122     |
| Eve Green     | 555-3344     | 555-3344     |
| Frank Black   | 555-5566     | 555-5566     |
| Grace Lee     | 555-7788     | NULL         |
| Hank Davis    | 555-9900     | 555-9900     |
| Ivy Martin    | 555-2233     | NULL         |
| Jack Miller   | 555-4455     | 555-2233     |
| Kathy Wilson  | 555-6677     | 555-5678     |
| Leo Moore     | 555-8899     | NULL         |
| Mona Harris   | 555-1010     | 555-8765     |
| Nina Clark    | 555-2323     | 555-8881     |
| Oscar Young   | 555-4545     | NULL         |
| Paul Scott    | 555-6767     | NULL         |
| Quincy Adams  | 555-8989     | 555-7788     |
| Rita Baker    | 555-1011     | NULL         |
| Steve Allen   | 555-3232     | NULL         |
| Tina Moore    | 555-5454     | NULL         |
+---------------+--------------+--------------+
20 rows in set (0.00 sec)



----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
• full outer join.
• повного зовнішнього з’єднання.
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

    
mysql> select student.name, student.`phone number`, `phone number`.`phone number` as second_phone
    -> from student left join `phone number` on studentid = Student_StudentID
    -> union
    -> select student.name, student.`phone number`, `phone number`.`phone number` as second_phone
    -> from student right join `phone number` on studentid = Student_StudentID;
+---------------+--------------+--------------+
| name          | phone number | second_phone |
+---------------+--------------+--------------+
| Alice Johnson | 555-1234     | 555-1234     |
| Bob Smith     | 555-5678     | 555-5678     |
| Charlie Brown | 555-8765     | NULL         |
| Dana White    | 555-1122     | 555-1122     |
| Eve Green     | 555-3344     | 555-3344     |
| Frank Black   | 555-5566     | 555-5566     |
| Grace Lee     | 555-7788     | NULL         |
| Hank Davis    | 555-9900     | 555-9900     |
| Ivy Martin    | 555-2233     | NULL         |
| Jack Miller   | 555-4455     | 555-2233     |
| Kathy Wilson  | 555-6677     | 555-5678     |
| Leo Moore     | 555-8899     | NULL         |
| Mona Harris   | 555-1010     | 555-8765     |
| Nina Clark    | 555-2323     | 555-8881     |
| Oscar Young   | 555-4545     | NULL         |
| Paul Scott    | 555-6767     | NULL         |
| Quincy Adams  | 555-8989     | 555-7788     |
| Rita Baker    | 555-1011     | NULL         |
| Steve Allen   | 555-3232     | NULL         |
| Tina Moore    | 555-5454     | NULL         |
+---------------+--------------+--------------+
20 rows in set (0.00 sec)


----------------------------------------------------------------
• оскільки в моїй базі даних складно знайти підходящі таблиці
• щоб побачить результат повного зовнішнього з'єднання,        '
• я створив тимчасові окремі таблиці для цього
----------------------------------------------------------------


mysql> create table tmp_students(
    -> studentid int primary key,
    -> name varchar(20));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into tmp_students values
    -> (1, 'Oleksii'), (2, 'Yurii'), (3, 'Illia'), (4, 'Danylo');
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> create table tmp_courses(
    -> courseid int primary key,
    -> studentid int,
    -> courseName varchar (20));
Query OK, 0 rows affected (0.01 sec)

mysql> insert into tmp_courses values
    -> (121, 1, 'Math'), (122, 2, 'Physics'), (123, 5, 'Philosophy');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from tmp_students;
+-----------+---------+
| studentid | name    |
+-----------+---------+
|         1 | Oleksii |
|         2 | Yurii   |
|         3 | Illia   |
|         4 | Danylo  |
+-----------+---------+
4 rows in set (0.00 sec)

mysql> select * from tmp_courses;
+----------+-----------+------------+
| courseid | studentid | courseName |
+----------+-----------+------------+
|      121 |         1 | Math       |
|      122 |         2 | Physics    |
|      123 |         5 | Philosophy |
+----------+-----------+------------+
3 rows in set (0.00 sec)

mysql> select studentid, name, courseid, coursename
    -> from tmp_students left join tmp_courses on tmp_students.studentid=tmp_courses.studentid
    -> ;
ERROR 1052 (23000): Column 'studentid' in field list is ambiguous
mysql> select tmp_students.studentid, name, courseid, coursename
    -> from tmp_students left join tmp_courses on tmp_students.studentid=tmp_courses.studentid;
+-----------+---------+----------+------------+
| studentid | name    | courseid | coursename |
+-----------+---------+----------+------------+
|         1 | Oleksii |      121 | Math       |
|         2 | Yurii   |      122 | Physics    |
|         3 | Illia   |     NULL | NULL       |
|         4 | Danylo  |     NULL | NULL       |
+-----------+---------+----------+------------+
4 rows in set (0.00 sec)

mysql> select tmp_students.studentid, name, courseid, coursename
    -> from tmp_students right join tmp_courses on tmp_students.studentid=tmp_courses.studentid;
+-----------+---------+----------+------------+
| studentid | name    | courseid | coursename |
+-----------+---------+----------+------------+
|         1 | Oleksii |      121 | Math       |
|         2 | Yurii   |      122 | Physics    |
|      NULL | NULL    |      123 | Philosophy |
+-----------+---------+----------+------------+
3 rows in set (0.00 sec)

mysql> select tmp_students.studentid, name, courseid, coursename
    -> from tmp_students left join tmp_courses on tmp_students.studentid=tmp_courses.studentid;
+-----------+---------+----------+------------+
| studentid | name    | courseid | coursename |
+-----------+---------+----------+------------+
|         1 | Oleksii |      121 | Math       |
|         2 | Yurii   |      122 | Physics    |
|         3 | Illia   |     NULL | NULL       |
|         4 | Danylo  |     NULL | NULL       |
+-----------+---------+----------+------------+
4 rows in set (0.00 sec)

mysql> select tmp_students.studentid, name, courseid, coursename
    -> from tmp_students left join tmp_courses on tmp_students.studentid=tmp_courses.studentid
    -> union
    -> select tmp_students.studentid, name, courseid, coursename
    -> from tmp_students right join tmp_courses on tmp_students.studentid=tmp_courses.studentid;
+-----------+---------+----------+------------+
| studentid | name    | courseid | coursename |
+-----------+---------+----------+------------+
|         1 | Oleksii |      121 | Math       |
|         2 | Yurii   |      122 | Physics    |
|         3 | Illia   |     NULL | NULL       |
|         4 | Danylo  |     NULL | NULL       |
|      NULL | NULL    |      123 | Philosophy |
+-----------+---------+----------+------------+
5 rows in set (0.00 sec)



----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------
2. Create queries using set-theoretic operations UNION, UNION ALL.
2. Побудувати запити, в яких реалізуються теоретико-множинні операції
UNION, UNION ALL.
----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------    
    
mysql> select studentId from student where age > 25
    -> union
    -> select Student_has_Discipline_Student_StudentID from `credit of passing the discipline` where mark > 90;
+-----------+
| studentId |
+-----------+
|         5 |
|        12 |
|        16 |
|         4 |
|         9 |
|        11 |
|        13 |
|        15 |
|        18 |
|        19 |
|        20 |
+-----------+
11 rows in set (0.00 sec)

mysql> select mark, Student_has_Discipline_Student_StudentID as studentID, `Student_has_Discipline_Discipline_Discipline ID` as disciplineID
    -> from `credit of passing the discipline` where semester = 1
    -> union all
    -> select mark, Student_has_Discipline_Student_StudentID as studentID, `Student_has_Discipline_Discipline_Discipline ID` as disciplineID
    -> from `credit of passing the discipline` where semester = 3;
+------+-----------+--------------+
| mark | studentID | disciplineID |
+------+-----------+--------------+
| NULL |         1 |            1 |
| NULL |         1 |            2 |
| NULL |         2 |            1 |
|   83 |         2 |            3 |
|   70 |         3 |            4 |
|   88 |         3 |            5 |
| NULL |         4 |            2 |
|   94 |         4 |            6 |
|   85 |         5 |            7 |
|   75 |         5 |            8 |
|   80 |         6 |            9 |
|   67 |         6 |           10 |
| NULL |         7 |            1 |
|   77 |         7 |           11 |
|   88 |        15 |            3 |
|   91 |        15 |           18 |
|   75 |        16 |            4 |
|   85 |        16 |           17 |
|   89 |        17 |            2 |
|   90 |        17 |           19 |
|   79 |        18 |           11 |
|   91 |        18 |           20 |
|   92 |        19 |            5 |
|   84 |        19 |           20 |
|   78 |        20 |           10 |
|   91 |        20 |           13 |
+------+-----------+--------------+
26 rows in set (0.00 sec)

mysql> select mark, Student_has_Discipline_Student_StudentID as studentID, `Student_has_Discipline_Discipline_Discipline ID` as disciplineID
    -> from `credit of passing the discipline` where semester = 1
    -> union
    -> select mark, Student_has_Discipline_Student_StudentID as studentID, `Student_has_Discipline_Discipline_Discipline ID` as disciplineID
    -> from `credit of passing the discipline` where semester = 3;
+------+-----------+--------------+
| mark | studentID | disciplineID |
+------+-----------+--------------+
| NULL |         1 |            1 |
| NULL |         1 |            2 |
| NULL |         2 |            1 |
|   83 |         2 |            3 |
|   70 |         3 |            4 |
|   88 |         3 |            5 |
| NULL |         4 |            2 |
|   94 |         4 |            6 |
|   85 |         5 |            7 |
|   75 |         5 |            8 |
|   80 |         6 |            9 |
|   67 |         6 |           10 |
| NULL |         7 |            1 |
|   77 |         7 |           11 |
|   88 |        15 |            3 |
|   91 |        15 |           18 |
|   75 |        16 |            4 |
|   85 |        16 |           17 |
|   89 |        17 |            2 |
|   90 |        17 |           19 |
|   79 |        18 |           11 |
|   91 |        18 |           20 |
|   92 |        19 |            5 |
|   84 |        19 |           20 |
|   78 |        20 |           10 |
|   91 |        20 |           13 |
+------+-----------+--------------+
26 rows in set (0.00 sec)

mysql> select mark from `credit of passing the discipline` where semester = 1
    -> union all
    -> select mark from `credit of passing the discipline` where semester = 2;
+------+
| mark |
+------+
| NULL |
| NULL |
| NULL |
|   83 |
|   70 |
|   88 |
| NULL |
|   94 |
|   85 |
|   75 |
|   80 |
|   67 |
| NULL |
|   77 |
|   82 |
|   79 |
|   66 |
|   95 |
|   89 |
|   90 |
|   92 |
|   84 |
|   80 |
|   78 |
|   92 |
|   86 |
|   72 |
|   80 |
+------+
28 rows in set (0.00 sec)

mysql> select mark from `credit of passing the discipline` where semester = 1
    -> union
    -> select mark from `credit of passing the discipline` where semester = 2;
+------+
| mark |
+------+
| NULL |
|   83 |
|   70 |
|   88 |
|   94 |
|   85 |
|   75 |
|   80 |
|   67 |
|   77 |
|   82 |
|   79 |
|   66 |
|   95 |
|   89 |
|   90 |
|   92 |
|   84 |
|   78 |
|   86 |
|   72 |
+------+
21 rows in set (0.00 sec)

mysql> select name from student where age > 24
    -> intersect
    -> select name from student where `Home adress` like '%Oak St%';
+-----------+
| name      |
+-----------+
| Bob Smith |
| Leo Moore |
+-----------+
2 rows in set (0.00 sec)

mysql> select name from student where age > 24
    -> except
    -> select name from student where `Home adress` like '%Redwood St%';
+---------------+
| name          |
+---------------+
| Alice Johnson |
| Bob Smith     |
| Eve Green     |
| Grace Lee     |
| Jack Miller   |
| Kathy Wilson  |
| Leo Moore     |
| Nina Clark    |
| Oscar Young   |
| Paul Scott    |
| Steve Allen   |
+---------------+
11 rows in set (0.00 sec)

mysql> select name from student where age > 24
    -> union
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> select name from student where age > 24
    -> intersect
    -> select name from student where `Home adress` like '%Redwood St%';
Empty set (0.00 sec)



----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
3. Formulate and develop a query that performs a self-join of the table.
3. Сформулювати і розробити запит, у якому здійснюється самоз’єднання таблиці.
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

    
mysql>
mysql>
    -- одногрупники Alice Johnson
mysql> select t2.name from student as t1 join student as t2
    -> on t1.groupid = t2.groupid
    -> where t1.name = 'Alice Johnson' and t2.name != 'Alice Johnson';
+--------------+
| name         |
+--------------+
| Frank Black  |
| Ivy Martin   |
| Mona Harris  |
| Quincy Adams |
+--------------+
4 rows in set (0.00 sec)
-- колега який читає той же предмет
mysql> select t2.`teacher's name` from `credit of passing the discipline` as t1
    -> inner join `credit of passing the discipline` as t2
    -> on t1.`Student_has_Discipline_Discipline_Discipline ID`=t2.`Student_has_Discipline_Discipline_Discipline ID`
    -> where t1.`teacher's name` = 'Prof. Williams'
    -> and t2.`teacher's name` != 'Prof. Williams';
+----------------+
| teacher's name |
+----------------+
| Dr. Green      |
+----------------+
1 row in set (0.00 sec)

mysql>
