prompt This was used when Charles asked us to gather stats on SYSADM after some updates
begin dbms_stats.gather_schema_stats(ownname=> '"SYSADM"',options=> 'GATHER AUTO'); end;
/
