alter session set nls_date_format='YYYY/MM/DD HH24:MI:SS';
alter session set nls_timestamp_format='YYYY/MM/DD HH24:MI:SS';
 
accept numDays number prompt 'How many days to analyze? '

select sql_id,
      starting_time,
      end_time,
 (EXTRACT(HOUR FROM run_time) * 3600
                    + EXTRACT(MINUTE FROM run_time) * 60
                    + EXTRACT(SECOND FROM run_time)) run_time_sec,
      READ_IO_BYTES,
      PGA_ALLOCATED PGA_ALLOCATED_BYTES,
      TEMP_ALLOCATED TEMP_ALLOCATED_BYTES
from  (
select
       sql_id,
       max(sample_time - sql_exec_start) run_time,
       max(sample_time) end_time,
       sql_exec_start starting_time,
       sum(DELTA_READ_IO_BYTES) READ_IO_BYTES,
       sum(DELTA_PGA) PGA_ALLOCATED,
       sum(DELTA_TEMP) TEMP_ALLOCATED
       from
       (
       select sql_id,
       sample_time,
       sql_exec_start,
       DELTA_READ_IO_BYTES,
       sql_exec_id,
       greatest(PGA_ALLOCATED - first_value(PGA_ALLOCATED) over (partition by sql_id,sql_exec_id order by sample_time rows 1 preceding),0) DELTA_PGA,
       greatest(TEMP_SPACE_ALLOCATED - first_value(TEMP_SPACE_ALLOCATED) over (partition by sql_id,sql_exec_id order by sample_time rows 1 preceding),0) DELTA_TEMP
       from
       dba_hist_active_sess_history
       where
       sample_time BETWEEN TRUNC(SYSDATE)-&numDays AND TRUNC(SYSDATE)
       and sql_exec_start is not null
       and IS_SQLID_CURRENT='Y'
       )
group by sql_id,SQL_EXEC_ID,sql_exec_start
order by sql_id
)
where sql_id = '&sql_id'
order by sql_id, run_time_sec desc;