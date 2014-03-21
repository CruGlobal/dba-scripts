--Find who is locking a db account

set linesize 999

col username format a15
col os_username format a15
col userhost format a25
col extended_timestamp format a40

SELECT *
FROM
  (SELECT USERNAME,
    OS_USERNAME,
    USERHOST,
    EXTENDED_TIMESTAMP
  FROM DBA_AUDIT_SESSION
  WHERE returncode != 0
  ORDER BY EXTENDED_TIMESTAMP DESC
  )
WHERE ROWNUM < 25;
