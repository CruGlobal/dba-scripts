-- Script to generate DDL for creating tablespaces
-- Uses autoextend size for default datafile size (does not keep current file size)
-- This will skip SYSAUX and SYSTEM tablesapces

set echo off heading off

--
-- 1st: For each tablespace, select the first datafile that was
-- created and create this again as first file for this (each) tablespace
--
select 'create tablespace ' || f1.tablespace_name || chr(10) ||
       ' size ' || ROUND(INCREMENT_BY * block_size /  1048576, 0) || ' MB ' || chr(10) ||
	   ' autoextend on next ' || ROUND(INCREMENT_BY * block_size /  1048576, 0) || ' MB ' || chr(10) ||
	   ' maxsize ' || ROUND(maxbytes /  1073741824, 0) || ' GB;'
from dba_tablespaces t1, dba_data_files f1
where f1.tablespace_name = t1.tablespace_name
and f1.tablespace_name NOT in ('SYSAUX', 'SYSTEM')
and f1.file_id = (select min(f2.file_id)
                    from dba_data_files f2
                   where f2.tablespace_name = f1.tablespace_name)
order by f1.file_id
/
--
-- 2nd: For each tablespace, create additional datafiles if any there.
--
select 'alter tablespace ' || f1.tablespace_name || chr(10) ||
       ' add datafile size ' || ROUND(INCREMENT_BY * block_size /  1048576, 0) || ' MB ' || chr(10) ||
	   ' autoextend on next ' || ROUND(INCREMENT_BY * block_size /  1048576, 0) || ' MB ' || chr(10) ||
	   ' maxsize ' || ROUND(maxbytes /  1073741824, 0) || ' GB;'
from dba_data_files f1, dba_tablespaces t1
where f1.tablespace_name = t1.tablespace_name
and f1.tablespace_name NOT in ('SYSAUX', 'SYSTEM')
and f1.file_id > (select min(f2.file_id)
                    from dba_data_files f2
where f2.tablespace_name = f1.tablespace_name)
order by f1.file_id
/