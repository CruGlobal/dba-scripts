--most time consuming queries

set linesize 999
set pagesize 50
set verify off

col module format a50
col Schema format a15

accept numDays number prompt 'How many days to analyze? '
accept numQueries number prompt 'How many queries? '

SELECT * FROM (
SELECT SQL_ID,
    PARSING_SCHEMA_NAME AS "Schema",
    MODULE,
    SUM(EXECUTIONS_TOTAL) AS "Total Executions",
    ROUND((SUM(ELAPSED_TIME_TOTAL)/1000000)/SUM(EXECUTIONS_TOTAL),2) AS "Time per Execution (sec)",
    ROUND((SUM(ELAPSED_TIME_TOTAL/1000000))/60,2) AS "Total Time (mins)"
  FROM DBA_HIST_SQLSTAT A,
    DBA_HIST_SNAPSHOT B
  WHERE A.SNAP_ID       = B.SNAP_ID
  AND A.DBID            = B.DBID
  AND A.INSTANCE_NUMBER = B.INSTANCE_NUMBER
  AND B.BEGIN_INTERVAL_TIME BETWEEN TRUNC(SYSDATE)-&numDays AND TRUNC(SYSDATE)
  AND PARSING_SCHEMA_NAME NOT IN ('SYS','ORACLE_OCM','DBSNMP','MALBERT','SKOHLER','DAVIDH')
  AND EXECUTIONS_TOTAL <>0
  GROUP BY SQL_ID,
    PARSING_SCHEMA_NAME,
    MODULE
  ORDER BY 6 DESC)
  WHERE ROWNUM <= &numQueries;
