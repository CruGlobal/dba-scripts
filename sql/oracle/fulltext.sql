--get full text for a sql_id

set long 9999
set pagesize 9999
set verify off

SELECT SQL_FULLTEXT FROM GV$SQL WHERE SQL_ID='&sql_id' AND ROWNUM < 2;