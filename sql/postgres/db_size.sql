--size of current database
select pg_size_pretty(pg_database_size(current_database())) as Database_Size;
