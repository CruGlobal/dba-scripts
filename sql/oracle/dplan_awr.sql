--Extract explain plan from awr for sql_id

set verify off
set feedback off
set linesize 999
set pagesize 999

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_AWR('&SQL_ID','&CHILD_NO'));