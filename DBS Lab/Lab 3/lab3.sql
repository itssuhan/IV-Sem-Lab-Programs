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

select course_id from section where semester='Fall' and year=2009 and exists(select course_id from section where semester = 'Spring' and year=2010);

/*

COURSE_I
--------
CS-101
CS-347
PHY-101

*/

--Q14.  Find all students who have taken all courses offered in the Biology department.

