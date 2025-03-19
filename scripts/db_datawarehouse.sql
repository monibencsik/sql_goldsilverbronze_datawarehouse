/*
=================================================
Create database and schemas
=================================================
Purpose: 
	This script creates a new database named DataWarehouse. Additionally, this script sets up 
    schemas, bronze, silver and gold
*/

-- create the new database and use it 

CREATE DATABASE if not exists DataWarehouse;

USE DataWarehouse;

-- create new schemas
CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;
