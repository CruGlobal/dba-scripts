-- script to find who is using temp tablespace

set linesize 999
set pagesize 999
set feedback off

col tablespace format a15
col client_identifier format a30
col username format a10
col osuser format a15
col sql_exec_start format a20

SELECT b.tablespace,
  b.segfile#,
  b.segblk#,
  b.blocks,
  b.blocks*8192/1024/1024 as Temp_Used_MB,
  a.sid,
  a.serial#,
  a.username,
  a.client_identifier,
  a.osuser,
  a.status,
  a.sql_id,
  a.sql_exec_start
FROM v$session a,
  v$sort_usage b
WHERE a.saddr = b.session_addr
ORDER BY b.blocks desc,
  b.tablespace,
  b.segfile#,
  b.segblk#;
