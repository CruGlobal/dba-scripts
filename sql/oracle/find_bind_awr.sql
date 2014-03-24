set verify off
set linesize 999

col name format a10
col value_string format a35

SELECT LAST_CAPTURED,
  NAME,
  POSITION,
  DATATYPE_STRING,
  VALUE_STRING
FROM DBA_HIST_SQLBIND
WHERE SQL_ID='&sql_id'
ORDER BY LAST_CAPTURED ASC;
