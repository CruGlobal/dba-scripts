set linesize 999
set pagesize 999

col username format a15
col machine format a20
col event format a30
col sql_exec_start format a20

SELECT INST_ID,
  SID,
  USERNAME,
  PROGRAM,
  SQL_ID,
  EVENT,
  SQL_EXEC_START
FROM GV$SESSION
WHERE WAIT_CLASS <> 'Idle'
AND USERNAME <> ' '
ORDER BY SQL_EXEC_START ASC;
