-- view workload statistics
-- must be run as sys

col pval2 format a30

set linesize 999
set pagesize 999

SELECT * FROM SYS.AUX_STATS$;
