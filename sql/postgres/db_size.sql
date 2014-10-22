--size of all databases

select datname AS Database, pg_size_pretty(pg_database_size(datname)) as Size
from pg_database
order by pg_database_size(datname) desc;
