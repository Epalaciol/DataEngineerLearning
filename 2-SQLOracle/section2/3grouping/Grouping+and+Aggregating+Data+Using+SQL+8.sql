/*
Working with the GROUPING Function
The GROUPING function:
� Is used with the CUBE or ROLLUP operator
� Is used to find the groups forming the subtotal in a row
� Is used to differentiate stored NULL values from NULL values created by ROLLUP or CUBE
� Returns 0 or 1
*/

--the null make the result not clear
select department_id , sum(salary) sum_sal 
FROM
employees
group by rollup( department_id  )
order by department_id ;

--this also will not help
select nvl( to_char( department_id ) ,'no dept' ) , sum(salary) sum_sal 
FROM
employees
group by rollup( department_id  )
order by department_id ;

--the solution is to use : GROUPING
select department_id , sum(salary) sum_sal ,
GROUPING (department_id) grand
FROM
employees
group by rollup( department_id  )
order by department_id ;
/*
The GROUPING function uses a single column as its argument.
The expr in the GROUPING function must match one of the expressions in the GROUP BY clause.
A value of 0 returned by the GROUPING function based on an expression indicates one of the
following:
� The expression has been used to calculate the aggregate value.
� The NULL value in the expression column is a stored NULL value.
A value of 1 returned by the GROUPING function based on an expression indicates one of the
following:
� The expression has not been used to calculate the aggregate value.
� The NULL value in the expression column is created by ROLLUP or CUBE as a result of
grouping.
*/

select  decode ( GROUPING (department_id), 1,'Grand total' ,
                                           0,nvl(to_char(department_id ), 'no dept')  
               ) dept_id  , 
sum(salary) sum_sal 
FROM
employees
group by rollup( department_id  )
order by department_id 


select  decode ( GROUPING (department_id), 1,'Grand total' ,
                                           0,nvl(to_char(department_id ), 'no dept')  
               ) dept_id  , 
count(employee_id) emp_count
FROM
employees
group by rollup( department_id  )
order by department_id 
-------------------------

--now this will make things not clear 
select department_id ,job_id, sum(salary) sum_sal 
FROM
employees
group by ROLLUP (department_id ,job_id) 
order by 1



select department_id ,job_id, sum(salary) sum_sal ,
GROUPING (department_id) group1,
GROUPING (job_id) group2
FROM
employees
group by ROLLUP (department_id ,job_id) 
order by 1

--0 0 Represents a row containing regular subtotal we would expect from a GROUP BY operation.
--0 1 Represents a row containing a subtotal for a distinct value of the Group1 column, as generated by ROLLUP and CUBE operations.
--1 1 Represents a row containing a grand total for the query, as generated by ROLLUP and CUBE operations.

select department_id ,job_id, sum(salary) sum_sal ,
GROUPING (department_id) group1,
GROUPING (job_id) group2
FROM
employees
group by cube (department_id ,job_id) 
order by 1
--0 0  Represents a row containing regular subtotal we would expect from a GROUP BY operation.
--0 1 Represents a row containing a subtotal for a distinct value of the Group1 column, as generated by ROLLUP and CUBE operations.
--1 1  Represents a row containing a grand total for the query, as generated by ROLLUP and CUBE operations.
--1,0 : Represents a row containing a subtotal for a distinct value of the group 2 column, which we would only see in a CUBE operation.
select region, country,city, sum(amount) ,
GROUPING (region) g1,
GROUPING (country) g2,
GROUPING (city) g3
from info_sales
group by  rollup (region, country,city )


select region, country,city, sum(amount) ,
GROUPING (region) g1,
GROUPING (country) g2,
GROUPING (city) g3
from info_sales
group by  cube (region, country,city )






