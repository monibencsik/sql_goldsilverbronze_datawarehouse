/*
=============================================================
Check for duplicates in Primary Key
Expectation: none
=============================================================
*/


select
cst_id,
count(*)
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null; 


/*
=============================================================
Remove trailing space in column values
Expectation: none
=============================================================
*/

select 
cst_lastname 
from silver.crm_cust_info
where cst_lastname != TRIM(cst_lastname);

/*
=============================================================
Normalize values in marriage status and gender columns
Expectation: none
=============================================================
*/

select distinct
cst_marital_status
from silver.crm_cust_info;