
create database dac_dbt;
use dac_dbt;

create table dept
(deptcode varchar(15), 
deptname varchar(60), 
budget integer);


create table grade
(gradecode varchar(15), 
gradelevel varchar(30), 
gradedescription varchar(60),
basic integer); 

create table desig (desigcode varchar(15), designame varchar(15)); 

create table emp
(empcode varchar(15), 
empname varchar(60), 
deptcode varchar(15) ,
birthdate date  not null,
joindate date  not null, 
sex char(1) check (sex in ('M', 'F', 'T')),
desigcode varchar(15), 
supcode varchar(15), 
gradecode varchar(15),
gradelevel varchar(30), 
basicpay integer); 

create table 
salary
(empcode varchar(15),
salmonth date not null,
basic integer,
allow integer,deduct integer); 

create table history
(empcode varchar(15),
changedate date not null, 
desigcode varchar(15), 
gradecode varchar(15), 
gradelevel varchar(30), basicpay integer);

alter table desig add primary key(desigcode);

alter table dept add primary key(deptcode);

alter table emp add primary key(empcode);

alter table grade add primary key
(gradecode,gradelevel);

alter table salary add primary key (empcode, salmonth);

alter table history add primary key 
(empcode, changedate, desigcode, gradecode, gradelevel);

alter table emp 
add foreign key(deptcode) references dept(deptcode);

alter table emp 
add foreign key(desigcode) references desig(desigcode);

alter table emp 
add foreign key(supcode) references emp(empcode);

alter table emp 
add foreign key(gradecode,gradelevel) 
references grade(gradecode,gradelevel);

alter table salary 
add foreign key (empcode) references emp(empcode);

alter table history 
add foreign key (empcode) references emp (empcode);

alter table history add foreign key (desigcode) references desig(desigcode);

alter table history add foreign key 
(gradecode, gradelevel) 
references grade(gradecode, gradelevel);

insert into dept (deptcode,deptname,budget) 
values('ACCT', 'Accounts', 19),
('PRCH', 'Purchase', 25),
('SALE', 'Sales', 39),
('STOR', 'Stores', 33),
('FACL', 'Facilities', 42),
('PERS', 'Personal', 12); 

insert into grade (gradecode,gradelevel,gradedescription,basic) values ('GC1',  'GL1', 'GC-GL-1',   25000),
('GC4',  'GL1', 'GC-4-GL-1', 21000),
('GC4',  'GL4', 'GC-4-GL-4', 15000),
('GC6',  'GL1', 'GC-6-GL-1', 13000),
('GC6',  'GL2', 'GC-6-GL-2', 11000),
('GC12', 'GL1', 'GC-12-GL-1', 9000),
('GC12', 'GL2', 'GC-12-GL-2', 8500),
('GC12', 'GL3', 'GC-12-GL-3', 8000),
('GC15', 'GL1', 'GC-15-GL-1', 7000),
('GC15', 'GL2', 'GC-15-GL-2', 6500),
('GC15', 'GL3', 'GC-15-GL-3', 6000),
('GC20', 'GL1', 'GC-20-GL-1', 3500),
('GC20', 'GL2', 'GC-20-GL-2', 3000),
('GC20', 'GL3', 'GC-20-GL-3', 2500),
('GC20', 'GL4', 'GC-20-GL-4', 2000);

insert into desig(desigcode,designame) 
values ('CLRK', 'Clerk'),
('SLMN', 'Sales Man'),
('MNGR', 'Manager'),
('SPRV', 'Supervisor'),
('PRES', 'Personal'); 

insert into emp(empcode,empname,deptcode,birthdate,joindate,sex,desigcode,supcode,gradecode,gradelevel,basicpay) values ('7839', 'Reddy',  'ACCT', '1959-12-12', '1981-07-17', 'M', 'PRES',  null,  'GC1', 'GL1', 32000),
('7566', 'Jain',   'PRCH', '1955-01-24', '1981-04-02', 'F', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7698', 'Murthy', 'SALE', '1960-09-16', '1981-05-01', 'F', 'MNGR', '7839', 'GC6', 'GL1', 14700),
('7782', 'Menon',  'ACCT', '1967-08-30', '1981-06-09','M', 'MNGR', '7839', 'GC6', 'GL2', 12400),
('7902', 'Naik',   'PRCH', '1958-02-20', '1981-12-03', 'M', 'MNGR', '7839', 'GC6', 'GL2', 11800),
('7654', 'Gupta', 'SALE', '1957-01-22', '1981-09-28', 'M', 'SLMN', '7698', 'GC6', 'GL2', 12600),
('7521', 'Wilson', 'STOR', '1956-03-18', '1981-02-22', 'M', 'MNGR', '7698', 'GC6', 'GL2', 12200),
('7844', 'Singh',  'SALE', '1956-09-09', '1981-09-08', 'F', 'SLMN', '7698', 'GC6', 'GL1', 14300),
('7900', 'Shroff', 'SALE', '1956-06-28', '1981-12-03', 'M', 'CLRK', '7698', 'GC6', 'GL2', 12000),
('7788', 'Khan', 'PRCH', '1957-02-03', '1982-12-09', 'M', 'SPRV', '7566', 'GC6', 'GL2', 11900),
('7499', 'Roy', 'SALE', '1957-09-27', '1981-02-20', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7934', 'Kaul',   'ACCT', '1957-05-02', '1982-01-23', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11950),
('7369', 'Shah',   'PRCH', '1960-05-25','1983-12-17', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12200),
('7876', 'Patil',  'PRCH', '1965-09-02', '1990-12-17', 'M', 'CLRK', '7788', 'GC6', 'GL2', 12300),
('7999', 'Sinha',  'SALE', '1970-04-11', '1992-02-20', 'M', 'SLMN', '7782', 'GC6', 'GL1', 14600),
('7939', 'Rai',    'PRCH', '1988-08-10', '2012-12-06', 'M', 'CLRK', '7782', 'GC6', 'GL2', 11800),
('7192', 'John',   'ACCT', '1968-11-05', '1994-12-03', 'M', 'CLRK', '7902', 'GC6', 'GL2', 12300),
('9902', 'Ahmad',  'SALE', '1970-02-16', '1992-04-17', 'M', 'SLMN', '7698', 'GC6', 'GL1', 14200),
('7802', 'Sanghvi','STOR', '1980-05-06', '1993-01-01', 'M', 'MNGR', '7566', 'GC6', 'GL2', 12400),
('6569', 'Tiwari', 'STOR', '1989-08-19', '2010-08-21', 'M', 'MNGR', '7782', 'GC6', 'GL2', 12400); 

insert into salary(empcode,salmonth,basic,allow,deduct) values('7839', '2011-12-01', 30000, 3000, 1200),
('7839', '2012-01-01', 32000, 3200, 1250),
('7839', '2012-02-01', 32000, 3200, 1250),
('7566', '2011-12-01', 12000, 600,   400),
('7566', '2012-01-01', 12400, 1240,  550),
('7566', '2012-02-01', 12400, 1240,  550),
('7698', '2011-12-01', 13900, 800,   500),
('7698', '2012-01-01', 14700, 1470,  650),
('7698', '2012-02-01', 14700, 1470,  650),
('7782', '2011-12-01', 11800, 600,   500),
('7782', '2012-01-01', 12400, 1240,  550),
('7782', '2012-02-01', 12400, 1240,  550),
('7902', '2011-12-01', 11200, 600,   450),
('7902', '2012-01-01', 11800, 1180,  550),
('7902', '2012-02-01', 11800, 1180,  550),
('7654', '2011-12-01', 11900, 700,   500),
('7654', '2012-01-01', 12600, 1260,  550),
('7654', '2012-02-01', 12600, 1260,  550),
('7521', '2011-12-01', 11400,  800,  500),
('7521', '2012-01-01', 12200, 1220,  550),
('7521', '2012-02-01', 12200, 1220,  550),
('7844', '2011-12-01', 13400,  900,  600),
('7844', '2012-01-01', 14300, 1430,  650),
('7844', '2012-02-01', 14300, 1430,  650),
('7900', '2011-12-01', 11500,  500,  300),
('7900', '2012-01-01', 12000, 1200,  550),
('7900', '2012-02-01', 12000, 1200,  550),
('7788', '2011-12-01', 11300,  600,  450),
('7788', '2012-01-01', 11900, 1190,  550),
('7788', '2012-02-01', 11900, 1190,  550),
('7499', '2011-12-01', 13400,  800,  550),
('7499', '2012-01-01', 14200, 1420,  650),
('7499', '2012-02-01', 14200, 1420,  650),
('7934', '2011-12-01', 11450,  500,  250),
('7934', '2012-01-01', 11950, 1195,  550),
('7934', '2012-02-01', 11950, 1195,  550),
('7369', '2011-12-01', 11600,  600,  450),
('7369', '2012-01-01', 12200, 1220,  550),
('7369', '2012-02-01', 12200, 1220,  550),
('7876', '2011-12-01', 11700,  600,  500),
('7876', '2012-01-01', 12300, 1230,  550),
('7876', '2012-02-01', 12300, 1230,  550),
('7999', '2011-12-01', 13950,  650,  600),
('7999', '2012-01-01', 14600, 1460,  650),
('7999', '2012-02-01', 14600, 1460,  650),
('7939', '2011-12-01', 11100,  700,  400),
('7939', '2012-01-01', 11800, 1180,  550),
('7939', '2012-02-01', 11800, 1180,  550),
('7192', '2011-12-01', 11700,  600,  500),
('7192', '2012-01-01', 12300, 1230,  550),
('7192', '2012-02-01', 12300, 1230,  550),
('9902', '2011-12-01', 13400,  800,  500),
('9902', '2012-01-01', 14200, 1420,  650),
('9902', '2012-02-01', 14200, 1420,  650),
('7802', '2011-12-01',  11900,  500,  300),
('7802', '2012-01-01',  12400, 1240,  550),
('7802', '2012-02-01',  12400, 1240,  550),
('6569', '2011-12-01', 11800,  600,  400),
('6569', '2012-01-01', 12400, 1240,  550),
('6569', '2012-02-01', 12400, 1240,  550); 

insert into history (empcode,changedate,desigcode,gradecode,gradelevel,basicpay) values ( '7839', '1981-09-17',  'CLRK', 'GC15','GL1',  7000),
( '7839', '1985-12-31',  'SLMN', 'GC12','GL3',  8000),
( '7839', '1988-12-31',  'SPRV', 'GC12','GL2',  8500),
( '7839', '1990-12-31',  'MNGR', 'GC12','GL1',  9000),
( '7839', '1994-12-31',  'CLRK', 'GC6', 'GL2', 11000),
( '7839', '1998-12-31',  'SLMN', 'GC6', 'GL1', 13000),
( '7839', '2001-12-31',  'SPRV', 'GC4', 'GL4', 15000),
( '7839', '2006-12-31',  'MNGR', 'GC4', 'GL1', 21000),
( '7839', '2011-12-31',  'PRES', 'GC1', 'GL1', 25000),
( '7566', '1981-04-02',  'CLRK', 'GC12','GL3',  8000),
( '7566', '1991-12-31',  'SLMN', 'GC12','GL2',  8500),
( '7566', '2001-12-31',  'SPRV', 'GC12','GL1',  9000),
( '7566', '2011-12-31',  'MNGR', 'GC6', 'GL2', 11000),
( '7698', '1981-05-01',  'CLRK', 'GC12','GL3',  8000),
( '7698', '1991-05-01',  'SLMN', 'GC12','GL2',  8500),
( '7698', '2001-05-01',  'MNGR', 'GC12','GL1',  9000),
( '7698', '2006-05-01',  'SPRV', 'GC6', 'GL2', 11000),
( '7698', '2011-05-01',  'MNGR', 'GC6', 'GL1', 13000),
( '7782', '1981-06-09',  'CLRK', 'GC12','GL3',  8000),
( '7782', '1991-06-09',  'SLMN', 'GC12','GL2',  8500),
( '7782', '2001-06-09',  'SPRV', 'GC12','GL1',  9000),
( '7782', '2011-06-09',  'MNGR', 'GC6', 'GL2', 11000),
( '7902', '1981-12-03',  'CLRK', 'GC12','GL3',  8000),
( '7902', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),
( '7902', '2001-12-03',  'SPRV', 'GC12','GL1',  9000),
( '7902', '2011-12-03',  'MNGR', 'GC6', 'GL2', 11000),
( '7654', '1981-09-28',  'SLMN', 'GC12','GL3',  8000),
( '7654', '1991-09-28',  'SLMN', 'GC12','GL2',  8500),
( '7654', '2001-09-28',  'SLMN', 'GC12','GL1',  9000),
( '7654', '2011-09-28',  'SLMN', 'GC6', 'GL2', 11000),
( '7521', '1981-02-22',  'CLRK', 'GC12','GL3',  8000),
( '7521', '1991-02-22',  'SLMN', 'GC12','GL2',  8500),
( '7521', '2001-02-22',  'SPRV', 'GC12','GL1',  9000),
( '7521', '2011-02-22',  'MNGR', 'GC6', 'GL2', 11000),
( '7844', '1981-09-08',  'SLMN', 'GC12','GL3',  8000),
( '7844', '1991-09-08',  'SLMN', 'GC12','GL2',  8500),
( '7844', '2001-09-08',  'SLMN', 'GC12','GL1',  9000),
( '7844', '2006-09-08',  'SLMN', 'GC6', 'GL2', 11000),
( '7844', '2011-09-08',  'SLMN', 'GC6', 'GL1', 13000),
( '7900', '1981-12-03',  'SLMN', 'GC12','GL3',  8000),
( '7900', '1991-12-03',  'SLMN', 'GC12','GL2',  8500),
( '7900', '2001-12-03',  'CLRK', 'GC12','GL1',  9000),
( '7900', '2011-12-03',  'CLRK', 'GC6', 'GL2', 11000),
( '7788', '1982-12-09',  'SLMN', 'GC12','GL3',  8000),
( '7788', '1992-12-09',  'CLRK', 'GC12','GL2',  8500),
( '7788', '2002-12-09',  'MNGR', 'GC12','GL1',  9000),
( '7788', '2012-12-09',  'SPRV', 'GC6', 'GL2', 11000),
( '7499', '1981-02-20',  'SLMN', 'GC12','GL3',  8000),
( '7499', '1991-02-20',  'SLMN', 'GC12','GL2',  8500),
( '7499', '2001-02-20',  'SLMN', 'GC12','GL1',  9000),
( '7499', '2006-02-20',  'SLMN', 'GC6', 'GL2', 11000),
( '7499', '2011-02-20',  'SLMN', 'GC6', 'GL1', 13000),
( '7934', '1982-01-23',  'SLMN', 'GC12','GL3',  8000),
( '7934', '1992-01-23',  'SLMN', 'GC12','GL2',  8500),
( '7934', '2002-01-23',  'CLRK', 'GC12','GL1',  9000),
( '7934', '2012-01-23',  'CLRK', 'GC6', 'GL2', 11000),
( '7369', '1983-12-17',  'SLMN', 'GC12','GL3',  8000),
( '7369', '1993-12-17',  'SLMN', 'GC12','GL2',  8500),
( '7369', '2003-12-17',  'CLRK', 'GC12','GL1',  9000),
( '7369', '2006-12-17',  'CLRK', 'GC6', 'GL2', 11000);

/*Query 1 */

SELECT empname, empcode, desigcode
FROM emp;

/*Query 2 */
SELECT deptname, budget
FROM dept;

/*Query 3 */
SELECT e.empname, d.deptname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode;

/*Query 4 */
SELECT empname
FROM emp
WHERE supcode IS NULL;

/*Query 5 */
SELECT e.empname
FROM emp e
JOIN emp s ON e.supcode = s.empcode
WHERE s.supcode IS NULL;

/*Query 6 */
SELECT empname
FROM emp
WHERE joindate = (SELECT MIN(joindate) FROM emp);

/*Query 7 */
SELECT empname, birthdate, DATE_ADD(birthdate, INTERVAL 60 YEAR) AS retirement_date
FROM emp
WHERE DATE_ADD(birthdate, INTERVAL 60 YEAR) = (
    SELECT MIN(DATE_ADD(birthdate, INTERVAL 60 YEAR))
    FROM emp
    WHERE DATE_ADD(birthdate, INTERVAL 60 YEAR) > CURDATE()
);

/*Query 8 */
SELECT d.deptname, e.empname AS manager_name
FROM dept d
JOIN emp e ON d.deptcode = e.deptcode
WHERE e.desigcode = 'MNGR';

/*Query 9 */
SELECT d.deptname, COUNT(e.empcode) AS employee_count
FROM dept d
LEFT JOIN emp e ON d.deptcode = e.deptcode
WHERE d.deptname IN ('accounts', 'personal', 'purchase')
GROUP BY d.deptname;

/*Query 10 */
SELECT e.empname, d.deptname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE d.deptname IN ('accounts', 'personal');

/*Query 11 */
SELECT e.empcode, e.empname
FROM emp e
JOIN dept d1 ON e.deptcode = d1.deptcode AND d1.deptname = 'accounts'
JOIN dept d2 ON e.deptcode = d2.deptcode AND d2.deptname = 'personal';

/*Query 12 */
SELECT e.empname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE d.deptname = 'accounts'
AND e.empcode NOT IN (
    SELECT e2.empcode
    FROM emp e2
    JOIN dept d2 ON e2.deptcode = d2.deptcode
    WHERE d2.deptname = 'personal'
);

/*Query 13 */
SELECT empname, birthdate
FROM emp
WHERE birthdate = (SELECT MAX(birthdate) FROM emp);

/*Query 14 */
SELECT empname, basicpay
FROM emp
WHERE basicpay <> 12400;

/*Query 15 */
SELECT empname, basicpay
FROM emp
WHERE basicpay BETWEEN 11000 AND 12000;

/*Query 16 */
SELECT empname, basicpay
FROM emp
WHERE basicpay NOT BETWEEN 11000 AND 12000;

/*Query 17 */
SELECT e.empname, s.allow, s.salmonth
FROM emp e
JOIN salary s ON e.empcode = s.empcode
WHERE s.allow BETWEEN 1000 AND 1500
AND s.salmonth = '2012-01-01';

/*Query 18 */
SELECT empname
FROM emp
WHERE empname LIKE '%i'
   OR empname LIKE '%y';
   
 /*Query 19 */  
SELECT empname, joindate, TIMESTAMPDIFF(YEAR, joindate, CURDATE()) AS experience_years
FROM emp
WHERE TIMESTAMPDIFF(YEAR, joindate, CURDATE()) >= 25   

/*Query 20 */
Select e.empname, e.joindate, TIMESTAMPDIFF(YEAR, e.joindate, CURDATE()) AS experience_years
FROM emp e
JOIN desig d ON e.desigcode = d.desigcode
WHERE d.designame = 'Salesman'
AND TIMESTAMPDIFF(YEAR, e.joindate, CURDATE()) BETWEEN 20 AND 30;
   
/*Query 21 */
 SELECT empname, basicpay, basicpay / 2 AS half_basicpay
FROM emp;  
   
/*Query 22 */
SELECT e.empname, s.basic + s.allow - s.deduct AS take_home_pay
FROM emp e
JOIN salary s ON e.empcode = s.empcode
WHERE s.salmonth = (
    SELECT MAX(salmonth)
    FROM salary
    WHERE empcode = e.empcode
);   
   
/*Query 23 */
SELECT e.empname, d.deptname, s.basic + s.allow - s.deduct AS take_home_pay
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
JOIN salary s ON e.empcode = s.empcode
WHERE d.deptname = 'Accounts'
AND s.salmonth = (
    SELECT MAX(salmonth)
    FROM salary
    WHERE empcode = e.empcode
);

/*Query 24 */
SELECT empname, birthdate, TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age
FROM emp;

/*Query 25 */
SELECT e.empname, TIMESTAMPDIFF(YEAR, e.birthdate, CURDATE()) AS age
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE d.deptname = 'Accounts'
ORDER BY age, e.empname;

/*Query 26 */
SELECT COUNT(*)
FROM emp
WHERE supcode = (
    SELECT empcode
    FROM emp
    WHERE empname = 'Reddy'
);

/*Query 27 */
SELECT e.empname, COUNT(s.empcode) AS num_subordinates
FROM emp e
JOIN emp s ON e.empcode = s.supcode
GROUP BY e.empname
ORDER BY num_subordinates DESC;

/*Query 28 */
SELECT e.empname, COUNT(s.empcode) AS subordinate_count
FROM emp e
JOIN emp s ON e.empcode = s.supcode
GROUP BY e.empname
HAVING COUNT(s.empcode) >= 3;

/*Query 29 */
SELECT gradecode, MIN(basicpay) AS min_salary, MAX(basicpay) AS max_salary
FROM emp
GROUP BY gradecode;

/*Query 30 */
SELECT e.empname AS employee_name, s.empname AS supervisor_name
FROM emp e
LEFT JOIN emp s ON e.supcode = s.empcode;
   
/*Query 31 */  
 SELECT s.empname AS supervisor_name, COUNT(e.empcode) AS subordinate_count
FROM emp e
JOIN emp s ON e.supcode = s.empcode
GROUP BY s.empname
HAVING COUNT(e.empcode) > 3;  

/*Query 32 */   
SELECT e.empname
FROM emp e
LEFT JOIN history h ON e.empcode = h.empcode
WHERE h.empcode IS NULL;

/*Query  33 */
SELECT e.empname, COUNT(h.changedate) AS promotion_count
FROM emp e
JOIN history h ON e.empcode = h.empcode
GROUP BY e.empname
ORDER BY promotion_count DESC
LIMIT 1;

/*Query 34 */
SELECT e.empname, h.changedate
FROM emp e
JOIN history h ON e.empcode = h.empcode
WHERE YEAR(h.changedate) = 1991;

/*Query 35 */
SELECT d.deptname, d.budget, SUM(e.basicpay) AS total_salary
FROM dept d
JOIN emp e ON d.deptcode = e.deptcode
GROUP BY d.deptname, d.budget;

/*Query 36 */
SELECT UPPER(empname) AS employee_name_uppercase
FROM emp;

/*Query 37 */
SELECT e.empname, e.basicpay
FROM emp e
WHERE e.basicpay > (
    SELECT basicpay
    FROM emp
    WHERE empname = 'Jain'
);

/*Query 38 */
SELECT e.empname, e.basicpay
FROM emp e
WHERE e.basicpay > ALL (
    SELECT basicpay
    FROM emp
    WHERE basicpay BETWEEN 11000 AND 12000
);

/*Query 39 */
SELECT empname, basicpay
FROM emp
WHERE basicpay > (SELECT AVG(basicpay) FROM emp)
ORDER BY basicpay ASC;

/*Query 40 */
SELECT empname, basicpay
FROM emp
WHERE basicpay = (SELECT MAX(basicpay) FROM emp);

/*Query 41 */
SELECT empname, basicpay
FROM emp
WHERE basicpay < (SELECT MAX(basicpay) FROM emp);

/*Query 42 */
SELECT e.empname, e.basicpay, e.deptcode
FROM emp e
WHERE e.basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE deptcode = e.deptcode
);

/*Query 43 */
SELECT empname, basicpay
FROM emp
WHERE basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE basicpay < (SELECT MAX(basicpay) FROM emp)
);

/*Query 44 */
SELECT empname, basicpay
FROM (
    SELECT empname, basicpay, DENSE_RANK() OVER (ORDER BY basicpay DESC) AS salary_rank
    FROM emp
) AS ranked_salaries
WHERE salary_rank = 5;

/*Query 45 */
SELECT d.deptname
FROM emp e
JOIN dept d ON e.deptcode = d.deptcode
WHERE e.sex = 'F' AND e.basicpay = (
    SELECT MAX(basicpay)
    FROM emp
    WHERE sex = 'F'
);

/*Query 46 */
SELECT DISTINCT e.empname, e.basicpay
FROM emp e
WHERE e.sex = 'M' AND e.basicpay > (
    SELECT MIN(basicpay)
    FROM emp
    WHERE sex = 'F'
);

/*Query 47*/
SELECT d.deptname
FROM dept d
JOIN emp e ON d.deptcode = e.deptcode
GROUP BY d.deptname
HAVING AVG(e.basicpay) > (SELECT AVG(basicpay) FROM emp);

/*Query 48 */
SELECT empname, basicpay
FROM emp
WHERE basicpay < (
    SELECT AVG(basicpay)
    FROM emp
    WHERE deptcode = (SELECT deptcode FROM dept WHERE deptname = 'accounts')
);
