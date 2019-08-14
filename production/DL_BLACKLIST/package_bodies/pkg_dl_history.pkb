CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_DL_HISTORY" AS

    FUNCTION get_changes_history_from_table (
        i_table_name    VARCHAR2,
        i_column_list   CLOB,
        i_key_value     VARCHAR2
    ) RETURN CLOB IS

        l_sql_query        CLOB;
        l_column_list      CLOB;
        l_column_list_wo   CLOB;
        his_column_list    CLOB;
        td_column_list     CLOB;
        l_lob              CLOB;
        l_tab              dbms_utility.uncl_array;
        l_tablen           NUMBER;
    BEGIN
    -- Drop DML and CR and Spaces
        l_column_list := regexp_replace(i_column_list, '[[:space:]]|chr(13)|chr(10)', '');
        l_column_list_wo := regexp_replace(l_column_list, 'DML_AT,|DML_BY,|DML_TYPE,', '');
    -- Treat DATE_OF_BIRTH_PARTIAL as Object type
        his_column_list := replace(l_column_list, 'DATE_OF_BIRTH_PARTIAL', 'his.DATE_OF_BIRTH_PARTIAL.getFormatData() as a_date_of_birth'
        );
        td_column_list := replace(l_column_list, 'DATE_OF_BIRTH_PARTIAL', 'td.DATE_OF_BIRTH_PARTIAL.getFormatData() as a_date_of_birth'
        );
        l_sql_query := 'WITH changes_history AS (
     SELECT '
                       || his_column_list
                       || '
     FROM '
                       || i_table_name
                       || '$his his
     WHERE his.key_value='''
                       || i_key_value
                       || '''

     UNION ALL

     ';

        l_sql_query := l_sql_query
                       || 'SELECT '
                       || td_column_list
                       || '
     FROM '
                       || i_table_name
                       || ' td
     WHERE td.key_value='''
                       || i_key_value
                       || '''
     ),  ';

        l_sql_query := l_sql_query || '
        changes (column_name , new_value, previous_value, changed_at, changed_by) AS
         ('

        ;
        dbms_utility.comma_to_table(l_column_list_wo, l_tablen, l_tab);
        FOR i IN 1..l_tablen LOOP
            IF upper(trim(l_tab(i))) = 'DATE_OF_BIRTH_PARTIAL' THEN
                l_sql_query := l_sql_query || '
      SELECT
        ''DATE_OF_BIRTH_PARTIAL'' as column_name,
        TO_CHAR(a_date_of_birth) as new_value,
        TO_CHAR(lag(a_date_of_birth) over (order by DML_AT)) as previous_value,
        a.DML_AT,
        a.DML_BY
      FROM changes_history a UNION ALL '
                ;
            ELSE
                l_sql_query := l_sql_query
                               || '
      SELECT
        '''
                               || APEX_LANG.MESSAGE(l_tab(i))
                               || ''' as column_name,
        TO_CHAR(a.'
                               || l_tab(i)
                               || ') as new_value,
        TO_CHAR(lag('
                               || l_tab(i)
                               || ') over (order by DML_AT)) as previous_value,
        a.DML_AT,
        a.DML_BY
      FROM changes_history a UNION ALL '
                               ;
            END IF;
        END LOOP;

        l_sql_query := substr(l_sql_query, 1, length(l_sql_query) - 10);
        l_sql_query := l_sql_query || ')
     SELECT column_name , previous_value, new_value, changed_at, changed_by
     FROM changes
     WHERE new_value != previous_value OR (previous_value is null AND new_value is not null) OR (new_value is null AND previous_value is not null)
     ORDER BY changed_at DESC;'
        ;
 --DBMS_OUTPUT.PUT(l_sql_query);
 --DBMS_OUTPUT.NEW_LINE;
        RETURN l_sql_query;
    END;


FUNCTION GET_CHANGES_HISTORY_FROM_BLACKLIST_TABLE (i_table_name VARCHAR2, i_column_list VARCHAR2, i_key_value VARCHAR2)
RETURN CLOB IS
    l_sql_query CLOB;
BEGIN
   l_sql_query := 'WITH changes_history AS (
 SELECT ' || i_column_list || '
 FROM ' || i_table_name ||'$his his
 WHERE his.id='''|| i_key_value ||'''

 UNION ALL

 ';
   l_sql_query := l_sql_query || 'SELECT ' || i_column_list || '
 FROM ' || i_table_name ||' td
 WHERE td.id=''' || i_key_value || '''
),  ';
   l_sql_query := l_sql_query || '
changes (column_name , new_value, previous_value, changed_at, changed_by) AS
         (';

   FOR l_column_names IN (
       select TRIM(replace(regexp_substr(i_column_list,'[^,]+', 1, level),chr(13)||chr(10),'')) as COLUMN_NAME from dual
       connect by regexp_substr(i_column_list, '[^,]+', 1, level) is not null
   )
   LOOP
      IF TRIM(l_column_names.COLUMN_NAME) NOT IN ('DML_AT', 'DML_BY', 'DML_TYPE') THEN
          l_sql_query := l_sql_query ||
      '
      SELECT
        ''' || APEX_LANG.MESSAGE(l_column_names.COLUMN_NAME) ||  ''' as column_name,
        TO_CHAR(a.'|| l_column_names.COLUMN_NAME || ') as new_value,
        TO_CHAR(lag('|| l_column_names.COLUMN_NAME || ') over (order by DML_AT)) as previous_value,
        a.DML_AT,
        a.DML_BY
      FROM changes_history a UNION ALL ';
      END IF;
   END LOOP;
   l_sql_query := SUBSTR(l_sql_query, 1, LENGTH(l_sql_query)-10);
   l_sql_query := l_sql_query || ')
 SELECT column_name , previous_value, new_value, changed_at, changed_by
 FROM changes
 WHERE new_value != previous_value OR (previous_value is null AND new_value is not null) OR (new_value is null AND previous_value is not null)
 ORDER BY changed_at DESC;';

   RETURN l_sql_query;
END;


END pkg_dl_history;
/
