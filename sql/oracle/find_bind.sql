set verify off
set linesize 999

col name format a10
col value_string format a40

prompt If SQL is older than 30 mins, use find_bind_awr.sql

SELECT SQL_ID,
  NAME,
  VALUE_STRING
FROM GV$SQL_BIND_CAPTURE
WHERE SQL_ID='&sql_id';
