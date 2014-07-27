-- script to kill runaway dashboard queries

SELECT 'ALTER SYSTEM KILL SESSION '''
  || SID
  || ','
  || SERIAL#
  || ',@'
  || INST_ID
  || '''IMMEDIATE;'
FROM GV$SESSION
WHERE USERNAME='DASH'
AND EVENT     ='SQL*Net break/reset to client';
