--get ddl for view object

set verify off
set long 99999
set pagesize 9999

EXEC DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM,'SQLTERMINATOR',TRUE);

SELECT dbms_metadata.get_ddl('VIEW',UPPER('&viewname'),UPPER('&schema')) FROM DUAL;
