--Find sql based on sql_id or sql_text
--http://kerryosborne.oracle-guy.com/

set verify off
set pagesize 999
col username format a13
col prog format a22
col sql_text format a41
col sid format 999
col child_number format 99999 heading CHILD
col ocategory format a10
col avg_etime format 9,999,999.99
col etime format 9,999,999.99

SELECT sql_id,
  child_number,
  plan_hash_value plan_hash,
  executions execs,
  elapsed_time /1000000 etime,
  (elapsed_time/1000000)/DECODE(NVL(executions,0),0,1,executions) avg_etime,
  u.username,
  sql_text
FROM gv$sql s,
  dba_users u
WHERE upper(sql_text) LIKE upper(NVL('&sql_text',sql_text))
AND sql_text NOT LIKE '%from v$sql where sql_text like nvl(%'
AND sql_id LIKE NVL('&sql_id',sql_id)
AND u.user_id = s.parsing_user_id
/
