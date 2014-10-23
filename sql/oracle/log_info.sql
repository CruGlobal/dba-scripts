set pagesize 50
set feedback off

SELECT GROUP#, THREAD#, MEMBERS, BYTES/1024/1024 AS "MegaBytes"
FROM V$LOG;
