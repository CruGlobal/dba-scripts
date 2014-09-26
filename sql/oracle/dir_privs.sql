set linesize 999
col grantor format a20
col table_name format a30
col grantee format a20
col privelege format a10
select grantor,table_name directory,grantee,PRIVILEGE from all_tab_privs where table_name = UPPER('&directory_name')
/
