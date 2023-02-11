
Q1.
create table Employee(
  EmpNo Numeric(20),
  EmpName varchar(20) NOT NULL,
  Gender varchar(10) NOT NULL,
  Salary numeric(20) NOT NULL,
  Address varchar(50) NOT NULL,
  DNo numeric(50),
  primary key(EmpNo),
  check (Gender in ('M','F')));
  
desc employee

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(20)
 EMPNAME                                   NOT NULL VARCHAR2(20)
 GENDER                                    NOT NULL VARCHAR2(10)
 SALARY                                    NOT NULL NUMBER(20)
 ADDRESS                                   NOT NULL VARCHAR2(50)
 DNO                                                NUMBER(10)
 
Q2.
create table Department(
  DeptNo Numeric(20) primary key,
  DeptName varchar(20) unique,
  Location varchar(10));
 
Q3.
alter table employee add constraint FK_deptno foreign key (DNo) references department (deptno);


Q4.
insert into department values (100, 'CSE','B05');
insert into department values (200, 'ECE','B01');

insert into employee values(100, 'Jason', 'M', 90000, 'Manipal', 100);
insert into employee values(101, 'Siri', 'F', 80000, 'Manipal', 100);
insert into employee values(102, 'Mavesh', 'M', 100000, 'Manipal', 200);

select * from employee;

     EMPNO EMPNAME              GENDER         SALARY
---------- -------------------- ---------- ----------
ADDRESS                                                   DNO
-------------------------------------------------- ----------
       100 Jason                M               90000
Manipal                                                   100

       101 Siri                 F               80000
Manipal                                                   100

       102 Mavesh               M              100000
Manipal                                                   200


select * from department;

    DEPTNO DEPTNAME             LOCATION
---------- -------------------- ----------
       100 CSE                  B05
       200 ECE                  B01
	   
	   
Q6.
delete from department where(deptno=100);
delete from department where(deptno=100)
*
ERROR at line 1:
ORA-02292: integrity constraint (G03.FK_DEPTNO) violated - child record found

Q7.
alter table employee  drop constraint FK_deptno;

alter table employee add constraint FK_deptno foreign key (DNo) references department (deptno) on delete cascade;

select * from department;

    DEPTNO DEPTNAME             LOCATION
---------- -------------------- ----------
       200 ECE                  B01

select * from employee;

     EMPNO EMPNAME              GENDER         SALARY
---------- -------------------- ---------- ----------
ADDRESS                                                   DNO
-------------------------------------------------- ----------
       102 Mavesh               M              100000
Manipal                                                   200

Q9.
select name,dept_name from student;

NAME                 DEPT_NAME
-------------------- --------------------
Zhang                Comp. Sci.
Shankar              Comp. Sci.
Brandt               History
Chavez               Finance
Peltier              Physics
Levy                 Physics
Williams             Comp. Sci.
Sanchez              Music
Snow                 Physics
Brown                Comp. Sci.
Aoi                  Elec. Eng.

NAME                 DEPT_NAME
-------------------- --------------------
Bourikas             Elec. Eng.
Tanaka               Biology

13 rows selected.

Q10. List all instructors in CSE department.
select name from Instructor where dept_name='Comp. Sci.';

NAME
--------------------
Srinivasan
Katz
Brandt

Q11. Find the names of courses in CSE department which have 3 credits
select title from course where dept_name='Comp. Sci.' and credits=3;

TITLE
--------------------------------------------------
Robotics
Image Processing
Database System Concepts

Q12. For the student with ID 12345 (or any other value), show all course-id and title of all 
courses registered for by the student

select course_id, title from takes natural join course where id = 12345;

COURSE_I TITLE
-------- --------------------------------------------------
CS-101   Intro. to Computer Science
CS-190   Game Design
CS-315   Robotics
CS-347   Database System Concepts

Q13. List all the instructors whose salary is in between 40000 and 90000.

select name from instructor where salary>40000 and salary<90000;

NAME
--------------------
Srinivasan
El Said
Gold
Katz
Califieri
Singh
Crick
Kim

Q14. Display the IDs of all instructors who have never taught a course

SELECT ID FROM instructor WHERE ID NOT IN (SELECT ID FROM teaches);

ID
-----
76543
58583
33456

Q15. Find the student names, course names, and the year, for all students those who have 
attended classes in room-number 303

select name,title,year from section natural join course natural join student where room_number = 514;

NAME                 TITLE
-------------------- --------------------------------------------------
      YEAR
----------
Brandt               World History
      2010

Tanaka               Intro. to Biology
      2009

Tanaka               Genetics
      2010
