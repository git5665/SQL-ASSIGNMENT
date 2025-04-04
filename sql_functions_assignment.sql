/*Q1. Calculate Total Salary per Department*/

drop function if exists calsalary
delimiter $$
create function calSalary()
returns decimal(10,2)
deterministic
begin
	declare totsal decimal(10,2) default 0;
    select sum(sal) into totsal from emp 
    join dept on emp.deptno = dept.deptno 
    where dept.dname = 'sales';
    return totsal;
end $$
delimiter ;

select calSalary() as total_sal;
    
/*Q2. Develop a function that accepts a department ID and returns the total salary of employees in that department.*/

drop function if exists totalsaldept
delimiter //
create function totalsaldept(did int)
returns decimal(10,2)
deterministic
begin
declare totsal decimal(10,2) default 0;
select sum(sal) into totsal from emp
join dept on emp.deptno = dept.deptno
where dept.deptno = did
group by dept.dname;
return  totsal;
end //
delimiter ;

select totalsaldept(10) as total_sal;

/*Q3. Find Employee Experience in Years.*/

drop function if exists findexp
delimiter //
create function findexp()
returns int
deterministic
begin
declare experience int default 0;
select timestampdiff(year,hiredate,curdate()) into experience from emp
where empno = 7844; 
return experience;
end//
delimiter ;

select findexp() as experience;

/*Q4. Create a function that takes an employee ID as input and calculates the number of years the employee has worked in the company based on their hire date.*/

drop function if exists findexperience
delimiter //
create function findexperience(empid int)
returns int
deterministic
begin
declare experience int default 0;
select timestampdiff(year,hiredate,curdate()) into experience from emp
where empno = empid; 
return experience;
end//
delimiter ;

select findexperience(7844) as working_year;

/*Q5. Retrieve Department Name Using Employee ID*/

drop function if exists retrievedeptname
delimiter //
create function retrievedeptname()
returns varchar(50)
deterministic
begin
declare deptname varchar(50) default null;
select dept.dname into deptname from emp
join dept on emp.deptno = dept.deptno
where emp.empno = 7844;
return deptname;
end//
delimiter ;

select retrievedeptname() as dept_name;

/*Q6. Write a function that takes an employee ID and returns the name of the department the employee belongs to.*/

drop function if exists departname
delimiter //
create function departname(empid int)
returns varchar(50)
deterministic
begin
declare deptname varchar(50) default null;
select dept.dname into deptname from emp
join dept on emp.deptno = dept.deptno
where emp.empno = empid;
return deptname;
end//
delimiter ;

select departname(7844) as belong_to_dept;

/*Q7. Identify the Highest-Paid Employee in a Department.*/

drop function if exists highestsalemp
delimiter //
create function highestsalemp()
returns varchar(50)
deterministic
begin
declare empname varchar(20) default null;
select emp.ename into empname from emp 
where sal in (
select max(sal) from emp 
join dept on emp.deptno = dept.deptno
where dept.dname = 'sales');
return empname;
end //
delimiter ;

select highestsalemp() as highest_paid;

/*Q8. Create a function that accepts a department ID and returns the name of the highest-paid employee in that department.*/

drop function if exists highestsalaryemp
delimiter //
create function highestsalaryemp(departname varchar(30))
returns varchar(50)
deterministic
begin
declare empname varchar(20) default null;
select emp.ename into empname from emp 
where sal in (
select max(sal) from emp 
join dept on emp.deptno = dept.deptno
where dept.dname = departname);
return empname;
end //
delimiter ;

select highestsalaryemp('sales') as highest_paid_emp;

/*Q9. Count Employees in a Department.*/

drop function if exists countemployee
delimiter //
create function countemployee()
returns int
deterministic
begin
declare no_of_employee int default 0;
select count(emp.empno) into no_of_employee from emp
join dept on emp.deptno = dept.deptno
where dept.dname = 'accounting'
group by dept.dname;
return no_of_employee;
end//
delimiter ;

select countemployee() as no_of_emp;

/*Q10. Develop a function that takes a department ID as input and returns the total number of employees working in that department.*/

drop function if exists totalemployee
delimiter //
create function totalemployee(department varchar(20))
returns int
deterministic
begin
declare no_of_employee int default 0;
select count(emp.empno) into no_of_employee from emp
join dept on emp.deptno = dept.deptno
where dept.dname = department
group by dept.dname;
return no_of_employee;
end//

delimiter ;

select totalemployee('accounting') as no_of_employee;

