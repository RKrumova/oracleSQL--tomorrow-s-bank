create table employee_department_change(
empoyeeID number,
departamentID number,
dateDep date); 
ALTER TABLE employee ADD departmentChange NUMBER DEFAULT 1;
create or replace NONEDITIONABLE trigger department_change_trigger
after update on employee for each row
begin
    if :old.departamentID <> :new.departamentID then
--        update employee set departmentChange = departmentChange + 1 where empoyeeid = :new.empoyeeid;
        insert into employee_department_change (empoyeeid, departamentID, dateDep)
        values (:new.empoyeeID, :new.departamentID, sysdate);
    end if;
end;
-- 1
update employee set employee.departamentid = 2 where employee.empoyeeid = 8;
update employee 
set employee.departamentid = 2,
departmentChange = departmentChange + 1
where employee.empoyeeid = 4;

update employee 
set employee.departamentid = 1,
departmentChange = departmentChange + 1
where employee.empoyeeid = 7 ;

select * from employee_department_change;
--2
select empoyeeid, dateDep from employeedepartmentchange
where dateDep < add_months(sysdate, -2);
--3 
select empoyeeid, (firstName || ' ' || lastName ) as fullName from employee
where departmentChange = 1;