/*
---------------------------------------------------------------------
Raw data from 
bronze.crm_prd_info 
was cleaned, derived columns were prepared, and the transformed dataset was loaded into 
silver.crm_prd_info
---------------------------------------------------------------------
*/

TRUNCATE TABLE silver.crm_prd_info;
INSERT INTO silver.crm_prd_info (
	prd_id,
	cat_id,
	prd_key,
	prd_nm,
	prd_cost,
	prd_line,
	prd_start_dt,
	prd_end_dt
)
SELECT
	prd_id,
	replace(left(prd_key,5), '-', '_') as cat_id,
	mid(prd_key, 7, LENgth(prd_key)) as prd_key,
	prd_nm,
	ifnull(prd_cost, 0) as prd_cost,
	CASE prd_line
		WHEN 'M' THEN 'Mountain'
		WHEN 'R' THEN 'Road'
		WHEN 'S' THEN 'Other Sales'
		WHEN 'T' THEN 'Touring'
		ELSE 'n/a'
	END AS prd_line,
	CAST(prd_start_dt AS DATE) AS prd_start_dt,
    CAST(DATE_SUB(LEAD(prd_start_dt) OVER (PARTITION BY prd_nm order by prd_start_dt), INTERVAL 1 DAY) AS DATE) as prd_end_dt
FROM bronze.crm_prd_info;
