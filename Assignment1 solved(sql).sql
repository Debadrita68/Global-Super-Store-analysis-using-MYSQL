select first_name as First_Name ,last_name as Last_Name from hr.employees;
select distinct department_id from employees;
select * from employees order by first_name desc;
select first_name,last_name,salary,salary*15/100 as PF from employees;
select employee_id,first_name,last_name,salary from employees order by salary;
select sum(salary) from employees;
select max(salary)as maximum_salary , min(salary)as minimum_salary from employees;
select avg(salary)as average_salary,count(*) from employees;
select count(employee_id) as no_of_employees from employees  ;
select count( distinct job_id) as no_of_jobs_available from employees;
select upper(first_name) from employees;
select substring(first_name,1,3) from employees;
select trim(first_name) from employees;
select length(concat(first_name,' ',last_name )) as length_of_employee_names from employees;
select * from employees where first_name regexp'[0-9]';
select first_name,last_name,salary from employees where salary not between 10000 and 15000;
select first_name,last_name,department_id from employees where department_id in (30,100);
select first_name,last_name,salary from employees where salary not between 10000 and 15000 and department_id in(30,100);
select first_name,last_name,hire_date from employees where hire_date like '1987%';
select first_name from employees where first_name like '%b%' and first_name like '%c%';
select last_name,job_id,salary from employees where job_id in('IT_PROG','SH_CLERK')and salary not in(4500,10000,15000);
select last_name from employees where length(last_name)=6;
select last_name from employees where last_name like '__e%';  
select job_id,group_concat(employee_id,' ')from employees group by job_id;
update employees set phone_number =replace(phone_number,'124','999') ; 
select * from employees where length(first_name)>=8;
select concat(email,'@example.com') as email from employees;
select right(phone_number,4)as phone_no from employees;
select substring_index(trim(street_address),' ',-1)as last_word_of_the_street_address from locations;
select * from locations where length(street_address)=(select min(length(street_address)) from locations);
select job_title, substr(job_title,1,instr(job_title,' ')-1) from jobs;
select length(first_name) from employees where instr(last_name,'c')>2;
select first_name as First_Name,length(first_name) as Length from employees where first_name like 'A%' or first_name like 'J%' or first_name like 'M%' order by first_name;
select first_name,lpad(salary,10,'$') as Salary from employees;
select left(first_name,8),repeat('$',salary/1000) as Salary$ from employees order by salary desc;
select employee_id,first_name,last_name ,hire_date from employees where position('07' in date_format(hire_date,'%d %m %y'))>0;


# Northwind 
use northwind;
select productName,QuantityPerUnit from products;
select ProductID,ProductName from products;
select ProductID,ProductName from Products where Discontinued=1;
select ProductName,UnitPrice from products order by UnitPrice desc;
select ProductID,ProductName,UnitPrice from products where UnitPrice<20;
Select ProductID, ProductName,UnitPrice from products where UnitPrice between 15 and 25;
select  ProductName,UnitPrice from products where UnitPrice > (select avg(UnitPrice) from products) ;
select distinct ProductName as Ten_most_expensive_products ,UnitPrice from products as a where 10>=(select count(distinct UnitPrice) from products as b where b.unitprice>=a.unitprice) order by unitprice desc;
select count(ProductName) from products group by Discontinued;
select ProductName,UnitsOnOrder,UnitsInStock from products where (((Discontinued)=false) and ((UnitsInStock)<UnitsOnOrder));