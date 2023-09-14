/*The GROUPING_ID function provides an alternate and more 
compact way to identify subtotal rows. Passing the dimension columns as arguments, 
it returns a number indicating the GROUP BY level.
so each subtotal type will have a specific ID Number 
*/

--this when using GROUPING
select department_id ,job_id, sum(salary) sum_sal ,
GROUPING (department_id) group_1,
GROUPING (job_id) group_2
FROM
employees
group by rollup (department_id ,job_id) 
order by 1

--it is better to use GROUPING_id 
select department_id ,job_id, sum(salary) sum_sal ,
GROUPING_id (department_id,job_id) group_id
FROM
employees
group by rollup (department_id ,job_id) 
order by 1



select region, country,city, sum(amount) ,
GROUPING_id (region, country,city ) 
from info_sales
group by  rollup (region, country,city )


select region, country,city, sum(amount) ,
GROUPING_id (region, country,city ) 
from info_sales
group by  cube (region, country,city )

