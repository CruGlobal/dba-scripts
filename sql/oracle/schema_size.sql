--Total size of schema in MBs

set verify off

SELECT SUM(bytes)/1024/1024 "Schema Size (MBs)" FROM dba_segments WHERE owner='&schema';
