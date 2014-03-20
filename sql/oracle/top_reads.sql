set lines 9999
set pagesize 100
column schema format a10
column object_type format a20
column object_name format a30

SELECT *
  FROM (  SELECT T.OWNER AS SCHEMA,
                 T.OBJECT_TYPE,
                 T.OBJECT_NAME,
                 Q.TOTAL_LOGICAL_READS,
                 Q.TOTAL_PHYSICAL_READS,
                 Q.TOTAL_TABLE_SCANS
            FROM DBA_OBJECTS T
                 LEFT JOIN
                 (  SELECT B.OWNER AS SCHEMA,
                           B.OBJECT_NAME,
                           --ROUND ((((SUM (A.LOGICAL_READS_DELTA))*32)/1024)/1024) AS TOTAL_LOGICAL_READS,
                           --ROUND ((((SUM (A.PHYSICAL_READS_DELTA))*32)/1024)/1024) AS TOTAL_PHYSICAL_READS,
                           SUM (A.LOGICAL_READS_DELTA) AS TOTAL_LOGICAL_READS,
                           SUM (A.PHYSICAL_READS_DELTA) AS TOTAL_PHYSICAL_READS,
                           SUM (A.TABLE_SCANS_DELTA) AS TOTAL_TABLE_SCANS
                      FROM DBA_HIST_SEG_STAT A
                           JOIN DBA_HIST_SEG_STAT_OBJ B USING (OBJ#, DATAOBJ#)
                     WHERE     B.OWNER NOT IN ('SYS', 'SYSTEM')
                           AND B.OBJECT_TYPE IN ('TABLE', 'INDEX')
                  GROUP BY B.OWNER, B.OBJECT_NAME) Q
                    ON (T.OWNER = Q.SCHEMA AND T.OBJECT_NAME = Q.OBJECT_NAME)
        ORDER BY Q.TOTAL_PHYSICAL_READS DESC NULLS LAST)
 WHERE ROWNUM < 25;