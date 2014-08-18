-- list top 25 largest objects
set linesize 200
set pagesize 100
col object format a45

SELECT *
FROM
  (SELECT OWNER
    ||'.'
    ||SEGMENT_NAME "Object",
    SEGMENT_TYPE "Object Type",
    ROUND(BYTES/1024/1024/1024,0) "Size (GB)"
  FROM DBA_SEGMENTS
  ORDER BY BYTES/1024/1024 DESC
  )
WHERE ROWNUM <= 25;
