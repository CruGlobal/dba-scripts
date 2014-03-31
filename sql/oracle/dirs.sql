--list database directories

set linesize 999
set pagesize 999

col directory_path format a40
col directory_name format a25
col owner format a10

SELECT OWNER, DIRECTORY_NAME, DIRECTORY_PATH FROM DBA_DIRECTORIES;