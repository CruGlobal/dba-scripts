set verify off
set heading off
set long 9999

prompt Enter Username in CAPS (i.e. SCOTT)

SELECT DBMS_METADATA.GET_DDL('USER','&&user') FROM dual;
SELECT DBMS_METADATA.GET_GRANTED_DDL('ROLE_GRANT','&&user') from dual;
SELECT DBMS_METADATA.GET_GRANTED_DDL('OBJECT_GRANT','&&user') from dual;
SELECT DBMS_METADATA.GET_GRANTED_DDL('SYSTEM_GRANT','&&user') from dual;
