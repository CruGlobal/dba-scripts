-- Capture all object grants for a table
-- Useful when developers drop/recreate tables

set verify off
set long 99999
set pagesize 9999

select 'grant '||privilege||' on '||owner||'.'||table_name ||' to '||grantee||';'
from dba_tab_privs
where owner like UPPER('&owner') and table_name like UPPER('&table');
