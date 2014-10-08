prompt synonyms using database links
set linesize 999
col owner format a15
col synonym_name format a30
col table_owner format a15
col table_name format a30
col db_link format a25
select owner, synonym_name, table_owner, table_name, db_link
 from dba_synonyms
where db_link is not null
order by db_link;
