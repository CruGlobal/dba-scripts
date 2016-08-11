--show current number of connections for each database
select datname, count(*) as connections
from pg_stat_activity
group by datname;
