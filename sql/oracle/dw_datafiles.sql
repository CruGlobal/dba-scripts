--Show datafile size in /app/oracle/ioscale_a
select '/app/oracle/ioscal_a ', ROUND(SUM(bytes)/1024/1024/1024) as current_size_gb, ROUND(SUM(COALESCE(NULLIF(maxbytes,0), bytes))/1024/1024/1024) AS max_size_gb from dba_data_files where file_name like '/app/oracle/ioscale_a%';

--Show datafile size in /app/oracle/fiodata

select '/app/oracle/fiodata ', ROUND(SUM(bytes)/1024/1024/1024) as current_size_gb, ROUND(SUM(COALESCE(NULLIF(maxbytes,0), bytes))/1024/1024/1024) AS max_size_gb from dba_data_files where file_name like '/app/oracle/fiodata%';
