set echo off
set line 999
column sid format 99999;
column blocker_module format a50;
column blockee_module format a50;
alter session set optimizer_mode=rule;

select b.ctime "duration (sec)",
a.type,
 a.inst_id,
(select username from gv$session s where s.inst_id=a.inst_id and s.sid=a.sid) blocker,
a.sid,
(select module from gv$session s where s.inst_id=a.inst_id and s.sid=a.sid) blocker_module ,
' is blocking ' "IS BLOCKING",
b.inst_id,
(select username from gv$session s where s.inst_id=b.inst_id and s.sid=b.sid) blockee,
b.sid ,
(select module from gv$session s where s.inst_id=b.inst_id and s.sid=b.sid) blockee_module
from gv$lock a, gv$lock b
where
--Modified to take care of issue where sid blocked on difft instances are not showing
-- Original Script
/* a.block = 1
and b.request > 0
and a.id1 = b.id1
and a.inst_id = b.inst_id
and a.id2 = b.id2
*/
-- Modified script
a.block <>0 and
b.request > 0
and a.id1 = b.id1
and a.id2 = b.id2
and a.sid <> b.sid
order by 1, 2
/
