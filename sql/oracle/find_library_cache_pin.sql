-- object with library cache pin contention

set linesize 999
col owner format a20
col object format a30
SELECT kglnaown "Owner",
  kglnaobj "Object"
FROM x$kglob
WHERE kglhdadr=
  (SELECT DISTINCT P1RAW
  FROM V$SESSION_WAIT
  WHERE EVENT='library cache pin'
  AND state  ='WAITING'
  );