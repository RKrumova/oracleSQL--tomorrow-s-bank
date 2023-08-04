ALTER  table employee add status varchar(105) default 'active'; 
update employee set dateStarted = to_date('25/01/2021','dd/mm/yyyy') where empoyeeID > 4;
select*from employee;

INSERT INTO employee(empoyeeID, egn, firstName, lastName, additionalName, address, phone, email, job_desc, departamentID, managerid, salary, datestarted, status)
VALUES (10, '9305012345', 'Maria', 'Ivanova', 'Petrova', 'Bulgaria', '0888123456', 'maria.i@gmail.com', 'Manager', 2, 1, 5000, TO_DATE('01/03/2021','dd/mm/yyyy'), 'maternity');
INSERT INTO employee(empoyeeID, egn, firstName, lastName, additionalName, address, phone, email, job_desc, departamentID, managerid, salary, datestarted, status)
VALUES (11, '9912315678', 'Georgi', 'Stoyanov', '', 'Bulgaria', '0899123456', 'georgi.s@gmail.com', 'Operator', 1, 1, 2500, TO_DATE('01/02/2021','dd/mm/yyyy'), 'fired');
INSERT INTO employee(empoyeeID, egn, firstName, lastName, additionalName, address, phone, email, job_desc, departamentID, managerid, salary, datestarted, status)
VALUES (12, '9012313456', 'Ivaylo', 'Kolev', '', 'Bulgaria', '0899123456', 'ivaylo.k@gmail.com', 'Manager', 3, 2, 6000, TO_DATE('01/01/2021','dd/mm/yyyy'), 'fired');
INSERT INTO employee(empoyeeID, egn, firstName, lastName, additionalName, address, phone, email, job_desc, departamentID, managerid, salary, datestarted, status)
VALUES (9, '9601012345', 'Nikolay', 'Dimitrov', '', 'Bulgaria', '0899123457', 'nikolay.d@gmail.com', 'Operator', 1, 1, 3000, TO_DATE('01/05/2021','dd/mm/yyyy'), 'sick');
update employee set managerid = 1 where departamentid = 4;
update employee set managerid = 1 where departamentid = 1;
update employee set salary = 800 where departamentid = 2 and salary is null;
update employee set salary = 5050 where empoyeeID = 1;
update employee set salary = 800 where salary is null;
update employee set salary = 0 where status = 'fired';
update employee set salary =5050,
dateStarted = to_date('01/01/2018','dd/mm/yyyy')
where empoyeeID = 2;

--1
select empoyeeID, (firstName || ' ' || lastName ) as fullName, status from employee 
where status like 'fired';
--2
select empoyeeID, (firstName || ' ' || lastName ) as fullName, status from employee 
where status like 'maternity';
--3
select empoyeeID, (firstName || ' ' || lastName ) as fullName, status from employee 
where status like 'sick' or status like 'vacation' ;
-- 4
select empoyeeID, (firstName || ' ' || lastName ) as fullName, departamentid from employee 
where managerid is null;
--5 
select departamentid,(firstName || ' ' || lastName ) as fullName, salary
from (
  select departamentid, firstName, lastName, salary,
    ROW_NUMBER() over (partition by departamentid order by salary desc) as row_num
  from employee
)
where row_num <= 5
order by departamentid, salary desc ;
--6
select department.departmantname, employee.departamentid, sum(employee.salary) as total_salary
from employee
inner join departamentid on employee.departamentid = department.departamentid
group by departamentid
having sum(employee.salary) = (select min(total_salary) 
from (select sum(salary) as total_salary
from employee group by departamentid) subquery);