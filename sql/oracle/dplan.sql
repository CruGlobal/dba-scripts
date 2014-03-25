--Generate explain plan for sql_id
--http://kerryosborne.oracle-guy.com/

set verify off
set feedback off
set linesize 999
set pagesize 999

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR('&SQL_ID','&CHILD_NO','TYPICAL'));
