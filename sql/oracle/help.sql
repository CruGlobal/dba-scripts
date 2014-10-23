prompt ************************************
prompt 		Available scripts
prompt ************************************
prompt
prompt a			- Show active sessions in database
prompt all_index_columns 	- List the indexes for a table with the columns in a single cell, ordered by position
prompt active 			- List active sessions in the database
prompt awr_snap 		- Take AWR snapshot
prompt balance			- Show RAC balance
prompt blocking3.sql		- Shows who is blocking who
prompt cre_idx			- Generate creation script for an index
prompt cre_table 		- Generate creation script for a table
prompt cre_tablespace 		- Generate creation script for a tablespace
prompt cre_user  		- Generate creation script for a user. Includes object and system grants
prompt cre_view   		- Generate creation script for a view
prompt datafiles 		- List datafiles and their status
prompt db_characterset		- Database characterset value
prompt db_components 		- List installed components and their current status
prompt db_links     		- List database links
prompt dgPerf 			- ASM diskgroup performance
prompt dirs			- List database directories
prompt dir_privs		- given a directory name returns users and their privs
prompt dplan 			- Show explain plan for a sql_id
prompt dplan_awr 		- Show explain plan for a sql_id from AWR
prompt find_bind 		- Find bind variables for a sql_id
prompt find_bind_awr 		- Find bind variables from AWR for a sql_id
prompt find_library_cache_pin 	- Which objects has library cache pin contention
prompt find_sql     		- Find sql based on sql_id or sql text
prompt find_sql_awr 		- Find sql in AWR based on sql_id or sql text
prompt fulltext      		- Get full sql text for a given sql_id
prompt host			- tells what host, instance, db status and login status
prompt io_calibrate 		- Disk calibration for an ASM diskgroup
prompt kill_dash 		- Kill hung dashing queries
prompt large_obj 		- List top 25 largest objects
prompt log_interval		- Redo log switches for the past 48 hours
prompt long_ops     		- Monitor long running queries
prompt maxshrink 		- Shrink datafiles to reclaim disk space
prompt my_sid			- What's my SID
prompt rman_stat 		- Status of an RMAN job including % complete
prompt sbl_alter_sessions 	- Alter session statements for tuning Siebel queries
prompt schema_size 		- Total size for a database schema
prompt slow 			- Slowest running sql statements from the past X days
prompt slow_total 		- Most time consuming sql from the past X days
prompt stale_stats 		- List tables and indexes with stale stats
prompt status 			- Current instance status
prompt syn_links		- lists synonyms using database links
prompt table_size 		- Show table size
prompt tablespace_size   	- Tablespace current size and free space
prompt tbsp_usage_history 	- Historical tablespace usage
prompt temp_usage 		- Amount of temporary tablespace used by active sessions.
prompt topWaits  		- Top wait events
prompt topWaitsRac 		- Top wait events for a RAC database
prompt top_reads 		- List objects with the most reads
prompt unstable_plans 		- Find sql with changing plans
prompt user_lock 		- Find who is locking a user with failed login attempts
prompt workload_stats 		- Gather workload statistics
