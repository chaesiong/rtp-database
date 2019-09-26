declare 
    type r_obj  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_dep  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type,
                           REF_OWNER DBA_OBJECTS.OWNER%type, REF_OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, REF_OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_ddl  is record (STR VARCHAR2(4000));

    type t_obj      is table of r_obj index by pls_integer;
    type t_dep      is table of r_dep index by pls_integer;
    type t_ddl      is table of r_ddl index by pls_integer;
    type t_ddl_obj  is table of r_ddl index by varchar2(255);
    
    l_quota_ddl         t_ddl;
    l_profile_ddl       t_ddl;
    l_ext_grants_ddl    t_ddl;
    l_synonyms_ddl      t_ddl_obj;
    l_grants_ddl        t_ddl_obj;
    l_obj               t_obj;
    l_dep               t_dep;
    l_obj_dep           t_dep;
    l_done              t_ddl_obj;
    l_ddl               t_ddl;
    l_done_idx          varchar2(255);
    l_obj_id            varchar2(255);
    l_str         varchar2(4000);
    l_added_cnt number := 0;
    l_max_loops number := 100;    
    
    cursor c_grants is
        SELECT SUB.OWNER, SUB.TABLE_NAME, SUB.TYPE,
        LISTAGG(SUB.STMT, chr(10)) WITHIN GROUP (ORDER BY NULL) STMT
        FROM
        (
            SELECT DISTINCT P.OWNER, P.TABLE_NAME, P.TYPE, 
                   'GRANT ' || LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) OVER (PARTITION BY P.GRANTEE, P.OWNER, P.TABLE_NAME, P.GRANTOR) ||
                   ' ON ' || P.OWNER || '.' || P.TABLE_NAME || ' TO ' || GRANTEE || ';' STMT
            FROM DBA_TAB_PRIVS P
            WHERE GRANTEE IN ('PUBLIC','DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
            AND OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
        )SUB
        GROUP BY SUB.OWNER, SUB.TABLE_NAME, SUB.TYPE;

    cursor c_synonyms is
        SELECT DISTINCT SUB.TABLE_OWNER, SUB.TABLE_NAME, LISTAGG(SUB.STMT, chr(10)) WITHIN GROUP (ORDER BY NULL) STMT
        FROM
        (
            SELECT TABLE_OWNER, TABLE_NAME, 
                   'CREATE PUBLIC SYNONYM ' || SYNONYM_NAME || ' FOR ' || TABLE_OWNER || '.' || TABLE_NAME || ';' STMT
            FROM DBA_SYNONYMS S
            WHERE S.TABLE_OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
            AND S.OWNER = 'PUBLIC'
        )SUB
        GROUP BY SUB.TABLE_OWNER, SUB.TABLE_NAME;

    function hasUnresolvedDependency (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type,
                                      i_OBJECT_TYPE in DBA_OBJECTS.OBJECT_TYPE%type) return boolean
    is
    begin
        for l_dep_idx in 1 .. l_dep.count
        loop
            if i_OWNER = l_dep(l_dep_idx).OWNER and i_OBJECT_NAME = l_dep(l_dep_idx).OBJECT_NAME 
               and i_OBJECT_TYPE = l_dep(l_dep_idx).OBJECT_TYPE then
                if not l_done.exists(l_dep(l_dep_idx).REF_OWNER || '.' || l_dep(l_dep_idx).REF_OBJECT_NAME || '.' || l_dep(l_dep_idx).REF_OBJECT_TYPE) then
                    return true;
                end if;
            end if;            
        end loop;
        return false;
    end;
    
    function unresolvedDependencies (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type,
                                     i_OBJECT_TYPE in DBA_OBJECTS.OBJECT_TYPE%type) return t_dep
    is
        l_obj_dep t_dep;
        l_obj_dep_idx pls_integer := 1;
    begin
        for l_dep_idx in 1 .. l_dep.count
        loop
            if i_OWNER = l_dep(l_dep_idx).OWNER and i_OBJECT_NAME = l_dep(l_dep_idx).OBJECT_NAME 
               and i_OBJECT_TYPE = l_dep(l_dep_idx).OBJECT_TYPE then
                if not l_done.exists(l_dep(l_dep_idx).REF_OWNER || '.' || l_dep(l_dep_idx).REF_OBJECT_NAME || '.' || l_dep(l_dep_idx).REF_OBJECT_TYPE) then
                    l_obj_dep(l_obj_dep_idx) := l_dep(l_dep_idx);
                    l_obj_dep_idx := l_obj_dep_idx + 1;
                end if;
            end if;            
        end loop;
        return l_obj_dep;
    end;    
    
    function folderName (i_OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type) return VARCHAR2
    is
    begin
        case i_OBJECT_TYPE
            when 'DATABASE LINK' THEN return 'database_links';
            when 'FUNCTION' THEN return 'functions';
            when 'JOB' THEN return 'jobs';
            when 'MATERIALIZED VIEW' THEN return 'materialized_views';
            when 'PACKAGE' THEN return 'packages';
            when 'PACKAGE BODY' THEN return 'package_bodies';
            when 'PROCEDURE' THEN return 'procedures';
            when 'SCHEDULE' THEN return 'schedules';
            when 'SEQUENCE' THEN return 'sequences';
            when 'SYNONYM' THEN return 'synonyms';
            when 'TABLE' THEN return 'tables';
            when 'TRIGGER' THEN return 'triggers';
            when 'TYPE' THEN return 'types';
            when 'VIEW' THEN return 'views';
            else return 'unknown';
        end case;
    end;
    
    function fileEnding (i_OBJECT_TYPE DBA_OBJECTS.OBJECT_NAME%type) return VARCHAR2
    is
    begin
        case i_OBJECT_TYPE
            when 'PACKAGE BODY' THEN return 'pkb';
            when 'PACKAGE' THEN return 'pks';
            when 'PROCEDURE' THEN return 'prc';
            when 'TRIGGER' THEN return 'trg';
            when 'VIEW' THEN return 'vw';
            when 'FUNCTION' THEN return 'fnc';
            ELSE return 'sql';
        end case;
    end;    
    
begin
    --fetch quota
    SELECT 'ALTER USER ' || Q.USERNAME || ' QUOTA ' ||
    CASE WHEN Q.MAX_BYTES = -1 THEN 'UNLIMITED' ELSE to_char(Q.MAX_BYTES)
    END || ' ON ' || Q.TABLESPACE_NAME || ';' STMT
    BULK COLLECT INTO l_quota_ddl
    FROM DBA_TS_QUOTAS Q
    WHERE Q.USERNAME IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING');
    
    --fetch profiles
    SELECT DISTINCT 'CREATE PROFILE ' || PROFILE || ' LIMIT ' || chr(10) || LISTAGG((RESOURCE_NAME || ' ' || LIMIT), chr(10)) 
                    WITHIN GROUP (ORDER BY RESOURCE_NAME) OVER (PARTITION BY PROFILE) || ';' STMT
    BULK COLLECT INTO l_profile_ddl                        
    FROM DBA_PROFILES WHERE PROFILE IN 
            (SELECT DISTINCT PROFILE FROM DBA_USERS WHERE USERNAME IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING'))
            AND PROFILE != 'DEFAULT';
    
    --fetch grants from other schemas
    SELECT 'GRANT ' || LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) OVER (PARTITION BY P.GRANTEE, P.OWNER, P.TABLE_NAME, P.GRANTOR) ||
           ' ON ' || P.OWNER || '.' || P.TABLE_NAME || ' TO ' || GRANTEE || ';' STMT
    BULK COLLECT INTO l_ext_grants_ddl
    FROM DBA_TAB_PRIVS P
    WHERE GRANTEE IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
    AND OWNER NOT IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
    AND NOT (GRANTOR IN ('SYS', 'SYSTEM') AND TABLE_NAME IN ('SYS', 'SYSTEM') AND PRIVILEGE = 'INHERIT PRIVILEGES');
    
    --fetch grants
    for l_grant in c_grants loop
        l_grants_ddl(l_grant.owner || '.' || l_grant.table_name || '.' || l_grant.type).STR := l_grant.stmt;
    end loop;
    
    --fetch public synonyms
    for l_synonym in c_synonyms loop
        l_synonyms_ddl(l_synonym.table_name || '.' || l_synonym.table_name).STR := l_synonym.stmt;
    end loop;    

    --fetch objects
    SELECT DISTINCT OWNER, OBJECT_NAME, OBJECT_TYPE
    BULK COLLECT INTO l_obj
    FROM DBA_OBJECTS O
    WHERE 
    O.OBJECT_NAME NOT LIKE 'BIN$%'
    AND O.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
    AND O.OBJECT_TYPE in ('PACKAGE BODY','PROCEDURE','MATERIALIZED VIEW','SYNONYM','TYPE','SEQUENCE','PACKAGE','FUNCTION','TRIGGER','TABLE','VIEW')
    ORDER BY OWNER,
    CASE WHEN OBJECT_TYPE = 'PACKAGE' THEN 0 ELSE 1 END,
    OBJECT_NAME;
    dbms_output.put_line('-- Found ' || to_char(l_obj.count) || ' objects');
    
    --fetch dependencies
    SELECT OWNER, NAME, TYPE, REFERENCED_OWNER, REFERENCED_NAME, REFERENCED_TYPE
    BULK COLLECT INTO l_dep
    FROM
        (
        SELECT OWNER, NAME, TYPE, REFERENCED_OWNER, REFERENCED_NAME, REFERENCED_TYPE
        FROM DBA_DEPENDENCIES D
        WHERE (OWNER, NAME, TYPE) IN (
            SELECT OWNER, OBJECT_NAME, OBJECT_TYPE
            FROM DBA_OBJECTS O
            WHERE 
            O.OBJECT_NAME NOT LIKE 'BIN$%'
            AND O.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
            AND O.OBJECT_TYPE in ('PACKAGE BODY','PROCEDURE','MATERIALIZED VIEW','SYNONYM','TYPE','SEQUENCE','PACKAGE','FUNCTION','TRIGGER','TABLE','VIEW')    
            )
        AND D.REFERENCED_OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
        AND D.REFERENCED_TYPE IN ('PACKAGE BODY','PROCEDURE','MATERIALIZED VIEW','SYNONYM','TYPE','SEQUENCE','PACKAGE','FUNCTION','TRIGGER','TABLE','VIEW')
        AND D.REFERENCED_NAME NOT LIKE 'BIN$%'
    /*UNION
        SELECT C.OWNER, C.TABLE_NAME NAME, 'TABLE' TYPE, CC.OWNER REFERENCED_OWNER, CC.TABLE_NAME REFERENCED_NAME, 'TABLE' REFERENCED_TYPE
        FROM ALL_CONSTRAINTS C, ALL_CONS_COLUMNS CC
        WHERE C.R_OWNER = CC.OWNER
        AND C.R_CONSTRAINT_NAME = CC.CONSTRAINT_NAME
        AND C.CONSTRAINT_TYPE = 'R'
        AND C.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
        AND CC.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','PIBICSDM2','BIO_BD','SERVAPP','JASPER_REPORTING','DL_STAGING')
        AND NOT (C.OWNER = CC.OWNER AND C.TABLE_NAME = CC.TABLE_NAME)*/
        );
        
    dbms_output.put_line('-- Found ' || to_char(l_dep.count) || ' dependencies');
    
    --repeat loop over objects until all dependencies are resolved or unresolvable
    for l in 1 .. l_max_loops loop
        l_added_cnt := 0;
        for l_obj_idx in 1 .. l_obj.count
        loop
            l_obj_id := l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE;
            if not l_done.exists(l_obj_id) then
                if not hasUnresolvedDependency (l_obj(l_obj_idx).OWNER, l_obj(l_obj_idx).OBJECT_NAME, l_obj(l_obj_idx).OBJECT_TYPE) then
                    l_str := '@./' || l_obj(l_obj_idx).OWNER || '/' || folderName(l_obj(l_obj_idx).OBJECT_TYPE) || '/' ||
                                   replace(lower(l_obj(l_obj_idx).OBJECT_NAME),'$','\\\$') || '.' || fileEnding(l_obj(l_obj_idx).OBJECT_TYPE);
                    --add grants
                    if l_grants_ddl.exists(l_obj_id) then
                        l_str := l_str || chr(10) || l_grants_ddl(l_obj_id).STR;
                    end if;
                    
                    --add public synonyms                                                    
                    if l_synonyms_ddl.exists(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME) then
                        l_str := l_str || chr(10) || l_synonyms_ddl(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME).STR;
                    end if;

                    l_done(l_obj_id).STR := l_obj_id;
                    l_ddl(l_ddl.count + 1).STR := l_str;
                    l_added_cnt := l_added_cnt + 1;
                end if;
            end if;
        end loop;
        dbms_output.put_line('-- ' || to_char(l) || ': Add ' || to_char(l_added_cnt) || ' objects');
        if l_added_cnt = 0 then
            exit;
        end if;
    end loop;
    
    --build the script
    dbms_output.put_line('-- Resolved dependencies for ' || to_char(l_done.count) || ' / ' || to_char(l_obj.count) || ' objects');
    
    --list unresolved dependencies
    for l_obj_idx in 1 .. l_obj.count
    loop
        l_obj_id := l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE;
        if not l_done.exists(l_obj_id) then    
            dbms_output.put_line('-- Could not resolve all dependencies for object ' || l_obj(l_obj_idx).OWNER ||
                                 '.' || l_obj(l_obj_idx).OBJECT_NAME || ' (' || l_obj(l_obj_idx).OBJECT_TYPE || ')');
            
            l_obj_dep := unresolvedDependencies (i_OWNER => l_obj(l_obj_idx).OWNER, i_OBJECT_NAME => l_obj(l_obj_idx).OBJECT_NAME,
                                                 i_OBJECT_TYPE => l_obj(l_obj_idx).OBJECT_TYPE);
            for l_obj_dep_idx in 1 .. l_obj_dep.count loop
                dbms_output.put_line('--     ' || l_obj_dep(l_obj_dep_idx).REF_OWNER || '.' || l_obj_dep(l_obj_dep_idx).REF_OBJECT_NAME ||
                                     ' (' || l_obj_dep(l_obj_dep_idx).REF_OBJECT_TYPE || ')');
            end loop;
        end if;
    end loop;
    dbms_output.put_line('SET DEFINE OFF;');
    
    --create profiles
    for l_profile_ddl_idx in 1 .. l_profile_ddl.count loop
        dbms_output.put_line('SELECT ''' || l_profile_ddl(l_profile_ddl_idx).STR || ''' AS ">" FROM DUAL;');
        dbms_output.put_line(l_profile_ddl(l_profile_ddl_idx).STR);
    end loop;        
    
    --create users
    dbms_output.put_line('@install-user.sql');
    
    --set quota
    for l_quota_ddl_idx in 1 .. l_quota_ddl.count loop
        dbms_output.put_line('SELECT ''' || l_quota_ddl(l_quota_ddl_idx).STR || ''' AS ">" FROM DUAL;');
        dbms_output.put_line(l_quota_ddl(l_quota_ddl_idx).STR);
    end loop;  
    
    --install db-links
    dbms_output.put_line('@install-db_links.sql');
    dbms_output.put_line('@install-public_db_links.sql');
    
    --create db-link to simulate PIBICS database_links
    dbms_output.put_line(
        'DECLARE ' ||
        '    v_exec VARCHAR2(4000); ' ||
        'BEGIN ' ||
            'SELECT ''CREATE PUBLIC DATABASE LINK PIBICS_PROD CONNECT TO PIBICS IDENTIFIED BY PIBICS USING ' ||
                    '''''(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=''||HOST_NAME||'')(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=''||INSTANCE_NAME||'')))'''''' ' ||
            'INTO v_exec '||
            'FROM v$instance; ' ||
            'EXECUTE IMMEDIATE v_exec; ' ||
        'END;' || chr(10) || '/'
        );
    
    --create PIBICS tables
    dbms_output.put_line('@PIBICS/tables/immigration.sql');
    dbms_output.put_line('@PIBICS/tables/tminout.sql');
    dbms_output.put_line('@PIBICS/tables/tminout_ma.sql');
    dbms_output.put_line('@PIBICS/tables/tmmain.sql');
  
    --set grants from other schemas    
    for l_grn_ext_idx in 1 .. l_ext_grants_ddl.count loop
        dbms_output.put_line('SELECT ''' || l_ext_grants_ddl(l_grn_ext_idx).STR || ''' AS ">" FROM DUAL;');
        dbms_output.put_line(l_ext_grants_ddl(l_grn_ext_idx).STR);
    end loop;        
    
    --deploy objects
    for l_ddl_idx in 1 .. l_ddl.count loop
        --dbms_output.put_line('SELECT ''' || l_done(l_done_idx).STR || ''' AS ">" FROM DUAL;');
        dbms_output.put_line(l_ddl(l_ddl_idx).STR);
    end loop;    
    
    --repeat table ddl to make sure all ref constraints will be installed
    dbms_output.put_line('@install-tables.sql');
    
    --install jobs and schedules
    dbms_output.put_line('@install-jobs.sql');
    dbms_output.put_line('@install-dbms_jobs.sql');
    dbms_output.put_line('@install-schedules.sql');
    
    dbms_output.put_line('quit');
end;   