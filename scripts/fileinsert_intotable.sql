/*
=========================================================================
insert local csv files into the correct tables
=========================================================================

*/

USE bronze;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = true; 

TRUNCATE TABLE bronze.crm_cust_info; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/datawithbaraa_yt/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' 
INTO TABLE bronze.crm_cust_info 
FIELDS TERMINATED BY ',' 
IGNORE 1 rows;

TRUNCATE TABLE bronze.crm_prd_info; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/datawithbaraa_yt/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' 
INTO TABLE bronze.crm_prd_info 
FIELDS TERMINATED BY ',' 
IGNORE 1 rows;

TRUNCATE TABLE bronze.crm_sales_details; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/datawithbaraa_yt/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' 
INTO TABLE bronze.crm_sales_details 
FIELDS TERMINATED BY ',' 
IGNORE 1 rows;

TRUNCATE TABLE bronze.erp_cust_az12; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/datawithbaraa_yt/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv' 
INTO TABLE bronze.erp_cust_az12 
FIELDS TERMINATED BY ',' 
IGNORE 1 rows;

TRUNCATE TABLE bronze.erp_loc_a101; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/datawithbaraa_yt/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv' 
INTO TABLE bronze.erp_loc_a101 
FIELDS TERMINATED BY ',' 
IGNORE 1 rows;

TRUNCATE TABLE bronze.erp_px_cat_g1v2; 
LOAD DATA LOCAL INFILE '/Users/mbencsik/Documents/sql/datawithbaraa_yt/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv' 
INTO TABLE bronze.erp_px_cat_g1v2 
FIELDS TERMINATED BY ',' 
IGNORE 1 rows;