--
--Tablespace Usage History
--The purpose of the following is to get the historical tablespace used space using the history (AWR) tables.
--
--The following query ask for a tablespace name and give the daily history of its used GBytes with previous days’s value and the difference. 
--These numbers are the max daily values.
--


select  thedate,
 gbsize,
 prev_gbsize,
 gbsize-prev_gbsize diff
from        (
 select  thedate,
 gbsize,
 lag(gbsize,1) over (order by r) prev_gbsize
 from    (
 select  rownum r,
 thedate,
 gbsize
 from    (
 select  trunc(thedate) thedate,
 max(gbsize) gbsize
 from    (
 select  to_date(to_char(snapshot.begin_interval_time,'YYYY-MON-DD HH24:MI:SS'),'YYYY-MON-DD HH24:MI:SS') thedate,
 round((usage.tablespace_usedsize*block_size.value)/1024/1024/1024,2) gbsize
 from    dba_hist_tbspc_space_usage usage,
 v$tablespace               tablespace,
 dba_hist_snapshot          snapshot,
 v$parameter                block_size
 where   usage.snap_id       = snapshot.snap_id
 and     usage.tablespace_id = tablespace.ts#
 and     tablespace.name     = '&tablespace'
 and     block_size.name     = 'db_block_size'
 )
 group by
 trunc(thedate)
 order by
 trunc(thedate)
 )
 )
 );