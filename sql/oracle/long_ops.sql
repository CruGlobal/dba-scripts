-- script to monitor long running queries
-- based on http://gavinsoorma.com/2009/06/monitor-long-running-operations-using-vsession_longops/

set linesize 200
set feedback off
col username format a20
col opname format a40

SELECT SID,
  SERIAL#,
  username,
  sql_id,
  sql_exec_start,
  opname,
  SOFAR,
  TOTALWORK,
  ROUND(SOFAR/TOTALWORK*100,2) "% COMPLETE"
FROM GV$SESSION_LONGOPS
WHERE TOTALWORK != 0
AND SOFAR       != TOTALWORK
ORDER BY 1;
