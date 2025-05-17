/*
---------------------------------------------------------------------
Raw data from 
bronze.crm_sales_details
was cleaned, derived columns were prepared, and the transformed dataset was loaded into 
silver.crm_sales_details
---------------------------------------------------------------------
*/

TRUNCATE TABLE silver.crm_sales_details;
INSERT INTO silver.crm_sales_details (
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)

select
sls_ord_num, 
sls_prd_key, 
sls_cust_id, 
CASE WHEN sls_order_dt =0 OR length(sls_order_dt)!=8 THEN NULL
	 ELSE CAST(CAST(sls_order_dt AS NCHAR) AS DATE)
END AS sls_order_dt,
CASE WHEN sls_ship_dt =0 OR length(sls_ship_dt)!=8 THEN NULL
	 ELSE CAST(CAST(sls_ship_dt AS NCHAR) AS DATE)
END AS sls_ship_dt,
CASE WHEN sls_due_dt =0 OR length(sls_due_dt)!=8 THEN NULL
	 ELSE CAST(CAST(sls_due_dt AS NCHAR) AS DATE)
END AS sls_due_dt, 
CASE WHEN sls_sales IS NULL OR sls_sales <=0 OR sls_sales != sls_quantity * ABS(sls_price) THEN sls_quantity * ABS(sls_price)
	ELSE sls_sales
END as sls_sales, 
sls_quantity,
CASE WHEN sls_price IS NULL OR sls_price <=0 THEN ROUND(sls_sales / nullif(sls_quantity, 0),0)
	ELSE ROUND(sls_price,0)
END as sls_price 
from bronze.crm_sales_details;