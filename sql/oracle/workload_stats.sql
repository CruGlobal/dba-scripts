-- procedure to gather stubborn workload stats
-- must be run as sys

col PNAME for a20
   set pages 1000
   select pname, pval1 from aux_stats$;
   drop table testtab;
   create table testtab(c1 number);
   EXEC DBMS_STATS.GATHER_SYSTEM_STATS('START')
   begin
     for i in 1 .. 100000 loop
       insert into testtab values(1);
       commit;
     end loop;
   end;
   /
   select /*+ PARALLEL(testtab,2) */ * from testtab;
   EXEC DBMS_STATS.GATHER_SYSTEM_STATS('STOP')
   select pname, pval1 from aux_stats$;
