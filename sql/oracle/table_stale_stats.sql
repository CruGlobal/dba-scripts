-- list tables with stale stats

set linesize 200
set pagesize 100

col owner format a15
col stale_stats format a15

SELECT OWNER, TABLE_NAME, NUM_ROWS, SAMPLE_SIZE, LAST_ANALYZED, STALE_STATS
FROM DBA_TAB_STATISTICS
WHERE STALE_STATS='YES' AND OWNER NOT IN ('SYS','SYSTEM','XDB','DBSNMP')
ORDER BY OWNER ASC;
