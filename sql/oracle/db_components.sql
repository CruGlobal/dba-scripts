--view all installed components in database

COL version FORMAT a12
COL comp_id FORMAT a8
COL schema LIKE version
COL comp_name FORMAT a35
COL status FORMAT a12
SELECT comp_id,schema,status,version,comp_name 
  FROM dba_registry 
 ORDER BY 1;