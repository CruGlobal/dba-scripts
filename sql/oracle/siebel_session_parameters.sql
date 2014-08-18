-- Siebel Session Parameters
-- used to troubleshoot siebel statements in sqlplus/sql developer/toad.
alter session set optimizer_mode = first_rows_10;
alter session set "_hash_join_enabled" = false; 
alter session set "_optimizer_sortmerge_join_enabled" = false; 
alter session set "_optimizer_join_sel_sanity_check" = true;
