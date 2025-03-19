/*
=======================================================================================
Clean the bronze tables
	- remove empty spaces from cst_firstname column
    - remove empty spaces from cst_lastname column
    - set cst_marital_status to 'single' and 'Married'
    - set cst_gndr to 'Female' and 'Male'
    - remove duplicate cst_id
    
and insert this into the silver table
=======================================================================================

*/


INSERT INTO silver.crm_cust_info(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
SELECT
cst_id,
cst_key,
TRIM(CST_FIRSTNAME) AS cst_firstname,
TRIM(CST_LASTNAME) AS cst_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'SINGLE'
	 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'MARRIED'
     ELSE 'NA'
END cst_marital_status,
CASE WHEN UPPER(TRIM(CST_GNDR)) = 'F' THEN 'FEMALE'
	 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'MALE'
     ELSE 'NA'
END CST_GNDR,
cst_create_date
FROM (
SELECT *,
row_number() over (partition by cst_id order by cst_create_date DESC) as flag_last
FROM bronze.crm_cust_info
WHERE cst_id is not null)t 
WHERE flag_last = 1;
;