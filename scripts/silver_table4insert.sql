/*
---------------------------------------------------------------------
Raw data from 
bronze.erp_cust_az12
was cleaned, derived columns were prepared, and the transformed dataset was loaded into 
silver.erp_cust_az12
---------------------------------------------------------------------
*/

TRUNCATE TABLE silver.erp_cust_az12;
INSERT INTO silver.erp_cust_az12 (
    cid,
    bdate,
    gen
)

SELECT 
    CASE WHEN cid LIKE 'NAS%' THEN mid(cid,4, LENgth(cid))
		ELSE cid
    END as cid,
    CASE WHEN bdate > curdate() THEN NULL
		ELSE bdate
	END as bdate,
    CASE 
		WHEN UPPER(TRIM(REPLACE(gen, '\r', ''))) IN ('M', 'MALE') THEN 'Male'
		WHEN UPPER(TRIM(REPLACE(gen, '\r', ''))) IN ('F', 'FEMALE') THEN 'Female'
		WHEN gen IS NULL OR TRIM(REPLACE(gen, '\r', '')) = '' THEN 'n/a'
		ELSE 'n/a'
	END AS gen
FROM
	bronze.erp_cust_az12
;

