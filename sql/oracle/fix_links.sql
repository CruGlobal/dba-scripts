prompt change the database links so they do NOT point to production
select 'drop public database link "'||db_link||'";'
from dba_db_links
where owner = 'PUBLIC'
/
select 'create public database link "&new_db_link" using "&reenter_new_db_link'
from dba_db_links
where owner = 'PUBLIC'
/
