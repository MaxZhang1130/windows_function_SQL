# project 3

-- Question 1 [windows functions]
-- Imagine you have a table – Claim_REC including 3 columns:
-- • Customer_ID
-- • Claim_date
-- • Claim_amount
-- Write a query to ONLY return the last claim record for each Customer (one customer may 
-- claim multiple times, so only select the latest claim record)

select * from (select customer_id, claim_date, claim_amount, ROW_NUMBER() over(partition by customer_id,
order by claim_date DESC) as row_num from Claim_REC) as rec
where rec.row_num = 1;

-- Task [all the tables are on the pdf file]: 
-- Based on all the tables below, I want to list the names of supervisors for the crew on the 
-- flight to Copenhagen (destination= CPH) on March 4, 2013

select distinct e.firstname, e.lastname
from 
payrollmaster as a,
flightschedule as b,
staffmaster as c,
supervisors as d,
staffmaster as e
where 
b.destination = 'CPH' and b.date=’2013-03-04’
and a.empid=b.empid
and b.empid=c.empid
and d.state=c.state
and d.jobcategory=a.substring(jobcode,1,2)
and d.empid=e.empid;

# This is the easier way comparing with the join query, join with multiple tables