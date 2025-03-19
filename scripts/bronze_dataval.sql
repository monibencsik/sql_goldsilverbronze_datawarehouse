/*
=============================================================
Check for duplicates in Primary Key
Expectation: none
=============================================================
*/

USE bronze;
SELECT cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(cst_id) > 1;