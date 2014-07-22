-- current tablespace size and free space

set pagesize 50
set feedback off

SELECT tablespace_name               AS "Tablespace",
  ROUND(used_space     *8192/1024/1024/1024,0) AS "Used(GB)",
  ROUND(tablespace_size*8192/1024/1024/1024,0) AS "Size(GB)",
  TRUNC(used_percent,2)                   AS "Used(%)"
FROM dba_tablespace_usage_metrics
ORDER BY used_percent DESC;
