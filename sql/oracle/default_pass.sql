--------------------------------------------------------------------------------
--
-- File name:   default_pass.sql
--
prompt Purpose:     Returns list of users that still have the default password 
--
-- Usage:      @default_pass.sql 
--
-- Other:       
--
--------------------------------------------------------------------------------
select username, account_status from dba_users where username in (SELECT * FROM dba_users_with_defpwd);
