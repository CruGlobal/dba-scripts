   SELECT table_owner,
          table_name,
          index_name,
          LISTAGG(column_name, ', ') WITHIN GROUP (ORDER BY column_position) index_columns
   FROM sys.dba_ind_columns
   WHERE 1 = 1
     AND table_owner = UPPER( :in_owner)
     AND table_name = UPPER( :table_name)
   GROUP BY table_owner, table_name, index_name;
