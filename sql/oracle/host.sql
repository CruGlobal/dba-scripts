set linesize 999
col host_name format a25
col instance_name format a25
col status format a15
col logins format a15
select instance_name, host_name, status, logins from v$instance;
set linesize 99
