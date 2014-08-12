   SELECT table_owner,
          table_name,
          index_name,
          LISTAGG(column_name, ', ') WITHIN GROUP (ORDER BY column_position) index_columns
   FROM sys.dba_ind_columns
   WHERE owner = :in_owner
    AND  table_name = :in_table_name
   GROUP BY table_owner, table_name, index_name;
