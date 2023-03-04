-- Q1. Find courses that ran in Fall 2009 or in Spring 2010 --

select course_id from section where semester = 'Fall' and year = 2009
union select course_id from section where semester = 'Spring' and year = 2010;

/* 

COURSE_I
--------
CS-101
CS-315
CS-319
CS-347
FIN-201
HIS-351
MU-199
PHY-101

*/

-- Q2. Find courses that ran in Fall 2009 and in spring 2010 -- 

select course_id from section where semester = 'Fall' and year = '2009'
intersect select course_id from section where semester = 'Spring' and year = '2010';

/* 

COURSE_I
--------
CS-101

*/

-- Q3. Find courses that ran in Fall 2009 but not in Spring 2010 --

select course_id from section where semester = 'Fall' and year = '2009'
minus select course_id from section where semester = 'Spring' and year = '2010';

/*

COURSE_I
--------
CS-347
PHY-101

*/

-- Q4.  Find the name of the course for which none of the students registered. --

select title from course where course_id NOT IN ( select course_id from takes);

/* 

TITLE
--------------------------------------------------
Computational Biology

*/

-- Q5.  Find courses offered in Fall 2009 and in Spring 2010 --

select course_id from section where semester='Fall' and year = 2009 and course_id IN 
(select course_id from section where semester='Spring' and year = 2010);

/*

COURSE_I
--------
CS-101

*/

-- Q6.  Find the total number of students who have taken course taught by the instructor with ID 10101 --

select count(ID) from takes where course_id in (select course_id from teaches where ID=10101);

/*


 COUNT(ID)
----------
    11

*/

-- Q7. Find courses offered in Fall 2009 but not in Spring 2010.

select course_id from section where semester='Fall' and year=2009 and course_id
not in (select course_id from section where semester='Spring' and year=2010);

/*

COURSE_I
--------
CS-347
CS-101
PHY-101

*/

--Q8. Find the names of all students whose name is same as the instructor’s name.

 select name from student where name in (select name from instructor);

/* 

 NAME
--------------------
Brandt

*/

-- Q9. Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.

select name from instructor where salary > some (select salary from instructor where dept_name='Biology');

/*

NAME
--------------------
Einstein
Brandt
Wu
Gold
Kim
Singh
Katz

*/

--Q10. Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.

select name from instructor where salary > all (select salary from instructor where dept_name='Biology');

/* 

NAME
--------------------
Katz
Singh
Kim
Gold
Wu
Brandt
Einstein

*/

--Q11. Find the departments that have the highest average salary.

select dept_name from instructor group by dept_name having avg(salary) >= all (select avg(salary) from instructor group by dept_name);

/* 

DEPT_NAME
--------------------
Physics

*/

--Q12. Find the names of those departments whose budget is lesser than the average salary of all instructors.

select dept_name from department where budget<=(select avg(salary) from instructor);

/*

DEPT_NAME
--------------------
Elec. Eng.
Physics
Comp. Sci.
Finance

*/

--Q13. Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester.

select c.course_id,c.title from course c,section s where c.course_id=s.course_id and s.semester='Fall' and s.year=2009 and exists
(select * from section s where c.course_id=s.course_id and s.semester='Spring' and s.year=2010);

/*

COURSE_I
--------
CS-101
CS-347
PHY-101

*/

--Q14.  Find all students who have taken all courses offered in the Biology department.

select s.name from student s where exists(select * from takes t where s.id=t.id and s.dept_name='Biology');

/*

NAME
--------------------
Tanaka

*/

-- 15. Find all courses that were offered at most once in 2009. --

select unique course_id from course c where 1>=(select count(course_id) from section s where c.course_id=s.course_id and s.year=2009 group by course_id);

/*

COURSE_I
--------
BIO-101
CS-101
CS-347
EE-181
PHY-101

*/

-- 16. Find all the students who have opted at least two courses offered by CSE department --

select name,dept_name from student s where 2<=(select count(id) from takes t where s.id=t.id and s.dept_name='Comp. Sci.' group by id);

/*

ID    NAME                 DEPT_NAME              TOT_CRED
----- -------------------- -------------------- ----------
00128 Zhang                Comp. Sci.                  102
12345 Shankar              Comp. Sci.                   32
54321 Williams             Comp. Sci.                   54
76543 Brown                Comp. Sci.                   58

*/

-- 17. Find the average instructors salary of those departments where the average salary is greater than 42000 --

select dept_name,AVG_SAL from (select dept_name,avg(salary) as AVG_SAL from instructor group by dept_name having avg(salary)>42000);

/*

DEPT_NAME               AVG_SAL
-------------------- ----------
Elec. Eng.                80000
Physics                   91000
Comp. Sci.           77333.3333
Finance                   85000
Biology                   72000
History                   61000

*/

-- 18. Create a view all_courses consisting of course sections offered by Physics department in the Fall 2009, with the building and room number of each section.

create view Phy_Dept as select building,room_number from section natural join course where dept_name='Physics' and semester='Fall' and year=2009;
select * from Phy_Dept;

/*
 
BUILDING        ROOM_NU
--------------- -------
Watson          100
 
 */

--20. Create a view department_total_salary consisting of department name and total salary of that department

create view dept_tot_sal as select dept_name,sum(salary) tot_salary from instructor group by dept_name;
select * from dept_tot_sal;

 /*
 
DEPT_NAME            TOT_SALARY
-------------------- ----------
Elec. Eng.                80000
Physics                  182000
Comp. Sci.               232000
Finance                  170000
Biology                   72000
Music                     40000
History                  122000
 
 */

 