--List all datafiles in the database
 
COL file_name FORMAT a80
SELECT tablespace_name, bytes, status, online_status, file_name 
  FROM dba_data_files 
 ORDER BY 1,5;
