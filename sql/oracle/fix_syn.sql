prompt this script fixes synonyms for a schema owner and new database links 
prompt please give the old database link and the one you want it changed to (new_dblink) : 
prompt here are the database links in the database : 
select owner,db_link
from dba_synonyms
where db_link is not null
order by owner,db_link
/
select 'create or replace synonym '||synonym_name||' for '||table_owner||'.'||table_name||'@&new_dblink;'
from dba_synonyms
where db_link = '&old_dblink'
and owner = '&syn_owner'
order by db_link
/
