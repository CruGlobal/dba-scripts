--list active queries
select datname, pid, usename, client_hostname, waiting, query_start, query
from pg_stat_activity
where state='active';
