--slowest individual queries from the last 24 hours

set linesize 999
set pagesize 50

col module format a40
col Schema format a10

SELECT * FROM (
SELECT SQL_ID,
    PARSING_SCHEMA_NAME AS "Schema",
    MODULE,
    SUM(EXECUTIONS_TOTAL) AS "Total Executions",
    ROUND((SUM(ELAPSED_TIME_TOTAL)/1000000)/SUM(EXECUTIONS_TOTAL),2) AS "Time per Execution (sec)"
  FROM DBA_HIST_SQLSTAT A,
    DBA_HIST_SNAPSHOT B
  WHERE A.SNAP_ID       = B.SNAP_ID
  AND A.DBID            = B.DBID
  AND A.INSTANCE_NUMBER = B.INSTANCE_NUMBER
  AND B.BEGIN_INTERVAL_TIME BETWEEN TRUNC(SYSDATE)-1 AND TRUNC(SYSDATE)
  AND PARSING_SCHEMA_NAME NOT IN ('SYS','ORACLE_OCM','DBSNMP','MALBERT','SKOHLER','DAVIDH')
  AND EXECUTIONS_TOTAL <>0
  GROUP BY SQL_ID,
    PARSING_SCHEMA_NAME,
    MODULE
  ORDER BY 5 DESC)
  --only show queries longer than .5 seconds
  WHERE "Time per Execution (sec)" > 0.5;
