/*
---------------------------------------------------------------------
Raw data from 
bronze.erp_loc_a101
was cleaned, derived columns were prepared, and the transformed dataset was loaded into 
silver.erp_loc_a101
---------------------------------------------------------------------
*/

TRUNCATE TABLE silver.erp_loc_a101;
INSERT INTO silver.erp_loc_a101 (
    cid,
    cntry
)
SELECT
	replace(cid, '-', '') as cid,
    CASE
		WHEN TRIM(REPLACE(cntry, '\r', '')) = 'DE' THEN 'Germany'
        WHEN TRIM(REPLACE(cntry, '\r', '')) IN ('US', 'USA', 'United States') THEN 'United States'
        WHEN TRIM(REPLACE(cntry, '\r', '')) = '' OR cntry IS NULL THEN 'n/a'
        ELSE TRIM(cntry)
	END AS cntry
FROM
	bronze.erp_loc_a101;
    
