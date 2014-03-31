--View characterset for database

COL value FORMAT a15
SELECT * FROM nls_database_parameters 
 WHERE  parameter LIKE '%SET' 
 ORDER  BY 1;