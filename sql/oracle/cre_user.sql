clear screen
accept user prompt 'Enter User Name : '

SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 VERIFY OFF

BEGIN
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
END;
/

select (case 
        when ((select count(*) from   dba_users
               where  username = UPPER('&&user')) > 0)
        then  dbms_metadata.get_ddl ('USER', UPPER('&&user')) 
        else  to_clob ('   -- Note: User not found!')
        end ) Extracted_DDL from dual
UNION ALL
select (case 
        when ((select count(*)
               from   dba_ts_quotas
               where  username = UPPER('&&user')) > 0)
        then  dbms_metadata.get_granted_ddl( 'TABLESPACE_QUOTA', UPPER('&&user')) 
        else  to_clob ('   -- Note: No TS Quotas found!')
        end ) from dual
UNION ALL
select (case 
        when ((select count(*)
               from   dba_role_privs
               where  grantee = UPPER('&&user')) > 0)
        then  dbms_metadata.get_granted_ddl ('ROLE_GRANT', UPPER('&&user')) 
        else  to_clob ('   -- Note: No granted Roles found!')
        end ) from dual
UNION ALL
select (case 
        when ((select count(*)
               from   dba_sys_privs
               where  grantee = UPPER('&&user')) > 0)
        then  dbms_metadata.get_granted_ddl ('SYSTEM_GRANT', UPPER('&&user')) 
        else  to_clob ('   -- Note: No System Privileges found!')
        end ) from dual
UNION ALL
select (case 
        when ((select count(*)
               from   dba_tab_privs
               where  grantee = UPPER('&&user')) > 0)
        then  dbms_metadata.get_granted_ddl ('OBJECT_GRANT', UPPER('&&user')) 
        else  to_clob ('   -- Note: No Object Privileges found!')
        end ) from dual
/
