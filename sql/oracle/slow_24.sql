--work in progress
--slowest sql from last 24 hours

set linesize 999
set pagesize 999

col module format a40

SELECT T.INSTANCE_NUMBER AS "Instance",
  T.SQL_ID,
  T.OPTIMIZER_COST AS "Cost",
  T.MODULE,
  T.PARSING_SCHEMA_NAME,
  T.EXECUTIONS_TOTAL,
  ROUND((T.ELAPSED_TIME_TOTAL)/1000000/T.EXECUTIONS_TOTAL) as "Time Per Execution(sec)"
FROM dba_hist_sqlstat t,
  dba_hist_snapshot s
WHERE t.snap_id       = s.snap_id
AND t.dbid            = s.dbid
AND t.instance_number = s.instance_number
AND s.begin_interval_time BETWEEN TRUNC(sysdate)-1 AND TRUNC(sysdate)
AND PARSING_SCHEMA_NAME NOT IN ('SYS','ORACLE_OCM','DBSNMP')
AND EXECUTIONS_TOTAL<>0
AND ROUND((T.ELAPSED_TIME_TOTAL)/1000000/T.EXECUTIONS_TOTAL)>1
ORDER BY ROUND((T.ELAPSED_TIME_TOTAL)/1000000/T.EXECUTIONS_TOTAL) DESC;