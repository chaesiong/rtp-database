declare
    type r_obj  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type,
                           STMT varchar2(4000), DONE NUMBER(1));
    type r_dep  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type,
                           REF_OWNER DBA_OBJECTS.OWNER%type, REF_OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, REF_OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_ddl  is record (STMT VARCHAR2(4000));

    type t_ddl  is table of r_ddl index by pls_integer;
    type t_obj  is table of r_obj index by varchar2(255);
    type t_dep  is table of r_dep index by pls_integer;
    
    l_proxies_ddl       t_ddl;
    l_quota_ddl         t_ddl;
    l_profiles_ddl      t_ddl;
    l_contexts_ddl      t_ddl;
    l_ext_grants_ddl    t_ddl;
    l_roles_ddl         t_ddl;
    l_sys_privs_ddl     t_ddl;
    l_role_privs_ddl    t_ddl;
    l_obj               t_obj;
    l_dep               t_dep;
    l_obj_dep           t_dep;
    l_ddl               t_ddl;
    l_query             t_ddl;
    l_idx               number;
    l_obj_id            varchar2(92);
    l_previous_schema   varchar2(30);
    l_added_cnt         number := 0;
    l_added_total       number := 0;
    l_max_loops         number := 15;
    
    cursor c_dict is
        WITH 
        OWNERS AS (
            SELECT 'DL_COMMON'                  AS OWNER FROM DUAL UNION ALL
            SELECT 'LOGGER'                     AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_DBA'                     AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_USER_MANAGEMENT'         AS OWNER FROM DUAL UNION ALL
            SELECT 'APEX_USER_MANAGEMENT'       AS OWNER FROM DUAL UNION ALL
            SELECT 'USER_MANAGEMENT'            AS OWNER FROM DUAL UNION ALL   
            SELECT 'DL_BIOSTORE_BLACKLIST'      AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BIOSTORE_MOVEMENTS'      AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL'           AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BLACKLIST'               AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_BORDERCONTROL_DATAMART'  AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS'          AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_STAGING4PIBICS_INTF'     AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_INTERFACE'               AS OWNER FROM DUAL UNION ALL
            SELECT 'PIBICSDM2_RO'               AS OWNER FROM DUAL UNION ALL
            SELECT 'PIBICSDM2'                  AS OWNER FROM DUAL UNION ALL
            SELECT 'BIO_BD'                     AS OWNER FROM DUAL UNION ALL
            SELECT 'SERVAPP'                    AS OWNER FROM DUAL UNION ALL
            SELECT 'JASPER_REPORTING'           AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_MAINTENANCE'             AS OWNER FROM DUAL UNION ALL
            SELECT 'DL_STAGING'                 AS OWNER FROM DUAL
        ),
        FOLDER_NAMES AS (
            SELECT 'DATABASE LINK'          AS OBJECT_TYPE,  'database_links'       AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'FUNCTION'               AS OBJECT_TYPE,  'functions'            AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'JOB'                    AS OBJECT_TYPE,  'jobs'                 AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'MATERIALIZED VIEW'      AS OBJECT_TYPE,  'materialized_views'   AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'PACKAGE'                AS OBJECT_TYPE,  'packages'             AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'PACKAGE BODY'           AS OBJECT_TYPE,  'package_bodies'       AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'PROCEDURE'              AS OBJECT_TYPE,  'procedures'           AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'SCHEDULE'               AS OBJECT_TYPE,  'schedules'            AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'SYNONYM'                AS OBJECT_TYPE,  'synonyms'             AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TABLE'                  AS OBJECT_TYPE,  'tables'               AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TRIGGER'                AS OBJECT_TYPE,  'triggers'             AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TYPE'                   AS OBJECT_TYPE,  'types'                AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'TYPE BODY'              AS OBJECT_TYPE,  'type_bodies'          AS FOLDER_NAME FROM DUAL UNION ALL
            SELECT 'VIEW'                   AS OBJECT_TYPE,  'views'                AS FOLDER_NAME FROM DUAL    
        ),
        FILE_ENDINGS AS (
            SELECT 'PACKAGE BODY'           AS OBJECT_TYPE,  'pkb'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'PACKAGE'                AS OBJECT_TYPE,  'pks'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'TYPE BODY'              AS OBJECT_TYPE,  'tpb'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'TYPE'                   AS OBJECT_TYPE,  'tps'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'PROCEDURE'              AS OBJECT_TYPE,  'prc'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'TRIGGER'                AS OBJECT_TYPE,  'trg'                  AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'VIEW'                   AS OBJECT_TYPE,  'vw'                   AS FILE_ENDING FROM DUAL UNION ALL
            SELECT 'FUNCTION'               AS OBJECT_TYPE,  'fnc'                  AS FILE_ENDING FROM DUAL
        ),
        PROXIES AS (
            SELECT 
                'ALTER USER ' || P.CLIENT || ' GRANT CONNECT THROUGH ' || P.PROXY || ';' STMT
            FROM 
                PROXY_USERS P
            WHERE 
                P.CLIENT IN (SELECT OWNER FROM OWNERS)
        ),        
        PROFILES AS (
            SELECT DISTINCT 
                'CREATE PROFILE ' || PROFILE || ' LIMIT ' || chr(10) || LISTAGG((RESOURCE_NAME || ' ' || LIMIT), chr(10)) 
                WITHIN GROUP (ORDER BY RESOURCE_NAME) OVER (PARTITION BY PROFILE) || ';' STMT
            FROM 
                DBA_PROFILES 
            WHERE 
                PROFILE IN (SELECT DISTINCT PROFILE FROM DBA_USERS WHERE USERNAME IN (SELECT OWNER FROM OWNERS))
                AND PROFILE != 'DEFAULT'
        ),
        QUOTAS AS (
            SELECT 
                'ALTER USER ' || Q.USERNAME || ' QUOTA ' ||
                CASE WHEN Q.MAX_BYTES = -1 THEN 'UNLIMITED' ELSE to_char(Q.MAX_BYTES)
                END || ' ON ' || Q.TABLESPACE_NAME || ';' STMT
            FROM 
                DBA_TS_QUOTAS Q
            WHERE 
                Q.USERNAME IN (SELECT OWNER FROM OWNERS)
        ),
        CONTEXTS AS (
            SELECT 
                'ALTER SESSION SET CURRENT_SCHEMA=' || C.SCHEMA || ';' || chr(10) ||
                'CREATE CONTEXT ' || NAMESPACE || ' USING ' ||
                PACKAGE || ' ' || CASE WHEN TYPE = 'ACCESSED GLOBALLY' THEN TYPE END || ';' STMT
            FROM 
                DBA_CONTEXT C
            WHERE 
                C.SCHEMA IN (SELECT OWNER FROM OWNERS)
        ),
        ROLES AS (
            SELECT 'CREATE ROLE ' || ROLE || ';' STMT FROM DBA_ROLES WHERE AUTHENTICATION_TYPE = 'NONE'
        ),
        SYS_PRIVS AS (
            SELECT 'GRANT ' || PRIVILEGE || ' TO ' || GRANTEE || 
            CASE WHEN ADMIN_OPTION = 'YES' THEN ' WITH ADMIN OPTION' END || 
            ';' STMT
            FROM 
                DBA_SYS_PRIVS P 
        ),
        ROLE_PRIVS AS (
            SELECT 'GRANT ' || GRANTED_ROLE || ' TO ' || GRANTEE || 
            CASE WHEN ADMIN_OPTION = 'YES' THEN ' WITH ADMIN OPTION' END || 
            CASE WHEN DELEGATE_OPTION = 'YES' THEN ' WITH DELEGATE OPTION' END || 
            ';' STMT
            FROM 
                DBA_ROLE_PRIVS P
            WHERE
                INHERITED = 'NO'        
        ),
        OBJECT_TYPES AS (
            SELECT 'PACKAGE'            AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'PACKAGE BODY'       AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'PROCEDURE'          AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'MATERIALIZED VIEW'  AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'SYNONYM'            AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TYPE'               AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TYPE BODY'          AS OBJECT_TYPE FROM DUAL UNION ALL            
            SELECT 'FUNCTION'           AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TRIGGER'            AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'TABLE'              AS OBJECT_TYPE FROM DUAL UNION ALL
            SELECT 'VIEW'               AS OBJECT_TYPE FROM DUAL
        ),
        OBJECTS AS (
            SELECT DISTINCT
                O.OWNER, 
                O.OBJECT_NAME,
                CASE 
                    WHEN MIN(O.OBJECT_TYPE) OVER (PARTITION BY O.OWNER, O.OBJECT_NAME) = 'MATERIALIZED VIEW'
                    THEN 'TABLE'
                    ELSE O.OBJECT_TYPE
                END OBJECT_TYPE,
                CASE 
                    WHEN MIN(O.OBJECT_TYPE) OVER (PARTITION BY O.OWNER, O.OBJECT_NAME) = 'MATERIALIZED VIEW'
                    THEN 'MATERIALIZED VIEW'
                    ELSE O.OBJECT_TYPE
                END DEPLOY_OBJECT_TYPE              
            FROM
                DBA_OBJECTS O
            WHERE
                O.OBJECT_NAME NOT LIKE 'BIN$%'
                AND O.OWNER IN (SELECT OWNER FROM OWNERS)
                AND O.OBJECT_TYPE IN (SELECT OBJECT_TYPE FROM OBJECT_TYPES)
        ),
        SYNONYMS AS (
            SELECT DISTINCT
                S.OWNER, 
                S.SYNONYM_NAME, 
                S.TABLE_OWNER, 
                S.TABLE_NAME
            FROM
                DBA_SYNONYMS S 
            WHERE        
            (S.TABLE_OWNER IN (SELECT OWNER FROM OWNERS) OR S.TABLE_OWNER = 'PUBLIC')
            AND S.DB_LINK IS NULL
        ),
        RELEVANT_PUBLIC_SYNONYMS AS (
            SELECT 
                Q.OWNER,
                Q.SYNONYM_NAME,
                Q.TABLE_OWNER,
                Q.TABLE_NAME,
                'DROP PUBLIC SYNONYM ' || Q.SYNONYM_NAME || ';' || chr(10) ||
                'CREATE PUBLIC SYNONYM ' || Q.SYNONYM_NAME || ' FOR ' || Q.TABLE_OWNER || '.' || Q.TABLE_NAME || ';' STMT
            FROM 
                (
                SELECT DISTINCT
                    S.OWNER,
                    S.SYNONYM_NAME,
                    S.TABLE_OWNER,
                    S.TABLE_NAME
                FROM
                    SYNONYMS S 
                WHERE     
                    CONNECT_BY_ROOT S.TABLE_OWNER IN (SELECT OWNER FROM OWNERS)
                    OR CONNECT_BY_ROOT S.TABLE_OWNER = 'PUBLIC'
                CONNECT BY S.TABLE_OWNER = PRIOR S.OWNER
                       AND S.TABLE_NAME = PRIOR S.SYNONYM_NAME
                )Q
            WHERE
                Q.OWNER = 'PUBLIC'
        ),
        DEPENDENCIES AS (
            SELECT 
                D.OWNER,
                D.NAME,
                D.TYPE, 
                D.REFERENCED_OWNER, 
                D.REFERENCED_NAME, 
                coalesce(O.DEPLOY_OBJECT_TYPE, D.REFERENCED_TYPE) REFERENCED_TYPE
            FROM 
                DBA_DEPENDENCIES D
                LEFT JOIN OBJECTS O ON (D.REFERENCED_OWNER = O.OWNER 
                                        AND D.REFERENCED_NAME = O.OBJECT_NAME
                                        AND (D.REFERENCED_TYPE = O.OBJECT_TYPE))
            WHERE 
                (
                 (D.REFERENCED_OWNER, D.REFERENCED_NAME, D.REFERENCED_TYPE) IN (SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM OBJECTS)
                  OR (D.REFERENCED_OWNER, D.REFERENCED_NAME, D.REFERENCED_TYPE) IN (SELECT OWNER, OBJECT_NAME, DEPLOY_OBJECT_TYPE FROM OBJECTS)
                  OR (D.REFERENCED_OWNER, D.REFERENCED_NAME, D.REFERENCED_TYPE) IN (SELECT OWNER, SYNONYM_NAME, 'SYNONYM' FROM RELEVANT_PUBLIC_SYNONYMS)
                ) 
                AND
                (
                 (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM OBJECTS)
                  OR (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, OBJECT_NAME, DEPLOY_OBJECT_TYPE FROM OBJECTS)
                  OR (D.OWNER, D.NAME, D.TYPE) IN (SELECT OWNER, SYNONYM_NAME, 'SYNONYM' FROM RELEVANT_PUBLIC_SYNONYMS)
                )
                AND NOT
                (
                 D.OWNER = D.REFERENCED_OWNER AND D.NAME = D.REFERENCED_NAME AND D.TYPE = 'MATERIALIZED VIEW'
                )
        ),
        EXT_GRANTS AS (
            SELECT 'GRANT ' || LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) OVER (PARTITION BY P.GRANTEE, P.OWNER, P.TABLE_NAME, P.GRANTOR) ||
                   ' ON ' || P.OWNER || '.' || P.TABLE_NAME || ' TO ' || GRANTEE ||
                   CASE WHEN P.GRANTABLE = 'YES' THEN ' WITH GRANT OPTION' END || ';' STMT
            FROM 
                DBA_TAB_PRIVS P
            WHERE 
                GRANTEE IN (SELECT OWNER FROM OWNERS)
                AND OWNER NOT IN (SELECT OWNER FROM OWNERS)
                AND NOT (GRANTOR IN ('SYS', 'SYSTEM') AND TABLE_NAME IN ('SYS', 'SYSTEM') AND PRIVILEGE = 'INHERIT PRIVILEGES')
        ),
        INT_GRANTS AS (
            SELECT 
                SUB.OWNER, 
                SUB.TABLE_NAME OBJECT_NAME, 
                SUB.TYPE OBJECT_TYPE,
                LISTAGG(SUB.STMT, chr(10)) WITHIN GROUP (ORDER BY NULL) STMT
            FROM
                (
                    SELECT DISTINCT P.OWNER, P.TABLE_NAME, P.TYPE, 
                           'GRANT ' || LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) OVER (PARTITION BY P.GRANTEE, P.OWNER, P.TABLE_NAME, P.GRANTOR) ||
                           ' ON ' || P.OWNER || '.' || P.TABLE_NAME || ' TO ' || GRANTEE ||
                            CASE WHEN P.GRANTABLE = 'YES' THEN ' WITH GRANT OPTION' END || ';' STMT
                    FROM DBA_TAB_PRIVS P
                    WHERE (GRANTEE IN (SELECT OWNER FROM OWNERS) OR GRANTEE = 'PUBLIC')
                    AND OWNER IN (SELECT OWNER FROM OWNERS)
                )SUB
            GROUP BY 
                SUB.OWNER, 
                SUB.TABLE_NAME, 
                SUB.TYPE
        )
        SELECT SRC, OWNER, OBJECT_NAME, OBJECT_TYPE, REF_OWNER, REF_OBJECT_NAME, REF_OBJECT_TYPE, STMT FROM
            (
            SELECT 
                'PROXIES' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT
            FROM 
                PROXIES 
            UNION ALL            
            SELECT 
                'QUOTAS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT
            FROM 
                QUOTAS 
            UNION ALL
            SELECT
                'ROLES' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                ROLES                 
            UNION ALL
            SELECT
                'CONTEXTS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                CONTEXTS                 
            UNION ALL            
            SELECT
                'SYS PRIVS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                SYS_PRIVS                 
            UNION ALL
            SELECT
                'ROLE PRIVS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                ROLE_PRIVS                
            UNION ALL
            SELECT
                'PROFILES' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT    
            FROM 
                PROFILES 
            UNION ALL
            SELECT
                'EXTERNAL GRANTS' AS SRC,
                CAST (NULL AS VARCHAR2(30)) OWNER,
                CAST (NULL AS VARCHAR2(30)) OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                STMT      
            FROM
                EXT_GRANTS
            UNION ALL    
            SELECT
                'OBJECTS' AS SRC,
                O.OWNER,
                O.OBJECT_NAME,
                O.DEPLOY_OBJECT_TYPE OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                '@./' || O.OWNER || '/' ||
                coalesce(FO.FOLDER_NAME,'unknown') || '/' ||
                replace(lower(O.OBJECT_NAME),'$','\\\$') || '.' ||
                coalesce(FI.FILE_ENDING,'sql') ||
                CASE WHEN GR.OWNER IS NOT NULL THEN chr(13) END ||
                GR.STMT STMT
            FROM 
                OBJECTS O
                LEFT JOIN FOLDER_NAMES FO ON (O.DEPLOY_OBJECT_TYPE = FO.OBJECT_TYPE)
                LEFT JOIN FILE_ENDINGS FI ON (O.DEPLOY_OBJECT_TYPE = FI.OBJECT_TYPE)
                LEFT JOIN INT_GRANTS GR ON (O.OWNER = GR.OWNER AND O.OBJECT_NAME = GR.OBJECT_NAME AND O.OBJECT_TYPE = GR.OBJECT_TYPE)
            UNION ALL
            SELECT
                'PUBLIC SYNONYMS' AS SRC,
                S.OWNER,
                S.SYNONYM_NAME OBJECT_NAME,
                'SYNONYM' OBJECT_TYPE,
                CAST (NULL AS VARCHAR2(30)) REF_OWNER,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_NAME,
                CAST (NULL AS VARCHAR2(30)) REF_OBJECT_TYPE,
                S.STMT
            FROM
                RELEVANT_PUBLIC_SYNONYMS S
            UNION ALL
            SELECT
                'DEPENDENCIES' AS SRC,
                OWNER,
                NAME OBJECT_NAME,
                TYPE OBJECT_TYPE, 
                REFERENCED_OWNER, 
                REFERENCED_NAME, 
                REFERENCED_TYPE,
                CAST (NULL AS VARCHAR2(4000))STMT      
            FROM
                DEPENDENCIES
            )
        ORDER BY SRC, OWNER, OBJECT_NAME, OBJECT_TYPE;
            
    function hasUnresolvedDependency (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type,
                                      i_OBJECT_TYPE in DBA_OBJECTS.OBJECT_TYPE%type) return boolean
    is
        l_obj_id            varchar2(92);
    begin
        for l_dep_idx in 1 .. l_dep.count
        loop
            if i_OWNER = l_dep(l_dep_idx).OWNER and i_OBJECT_NAME = l_dep(l_dep_idx).OBJECT_NAME 
               and i_OBJECT_TYPE = l_dep(l_dep_idx).OBJECT_TYPE then
                l_obj_id := l_dep(l_dep_idx).REF_OWNER || '.' || l_dep(l_dep_idx).REF_OBJECT_NAME || '.' || l_dep(l_dep_idx).REF_OBJECT_TYPE;
                if l_obj.exists(l_obj_id) then
                    if l_obj(l_obj_id).DONE = 0 then
                        return true;
                    end if;
                else
                    return true;
                end if;
            end if;            
        end loop;
        return false;
    end;            

    function unresolvedDependencies (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type,
                                     i_OBJECT_TYPE in DBA_OBJECTS.OBJECT_TYPE%type) return t_dep
    is
        l_obj_id            varchar2(92);
        l_obj_dep t_dep;
    begin
        for l_dep_idx in 1 .. l_dep.count
        loop
            if i_OWNER = l_dep(l_dep_idx).OWNER and i_OBJECT_NAME = l_dep(l_dep_idx).OBJECT_NAME 
               and i_OBJECT_TYPE = l_dep(l_dep_idx).OBJECT_TYPE then
                l_obj_id := l_dep(l_dep_idx).REF_OWNER || '.' || l_dep(l_dep_idx).REF_OBJECT_NAME || '.' || l_dep(l_dep_idx).REF_OBJECT_TYPE;
                if l_obj.exists(l_obj_id) then
                    if l_obj(l_obj_id).DONE = 0 then
                        l_obj_dep(l_obj_dep.count + 1) := l_dep(l_dep_idx);
                    end if;
                else
                    l_obj_dep(l_obj_dep.count + 1) := l_dep(l_dep_idx);
                end if;
            end if;            
        end loop;
        return l_obj_dep;
    end;     
    
begin
    --fetch information from data dictionary
    for l_rec in c_dict loop
        case     
            when l_rec.SRC = 'PROXIES' then
                l_idx := l_proxies_ddl.count + 1;
                l_proxies_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'QUOTAS' then
                l_idx := l_quota_ddl.count + 1;
                l_quota_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'ROLES' then 
                l_idx := l_roles_ddl.count + 1;
            when l_rec.SRC = 'CONTEXTS' then 
                l_idx := l_contexts_ddl.count + 1;                
                l_contexts_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'SYS PRIVS' then 
                l_idx := l_sys_privs_ddl.count + 1;
                l_sys_privs_ddl(l_idx).STMT := l_rec.STMT;                
            when l_rec.SRC = 'ROLE PRIVS' then 
                l_idx := l_role_privs_ddl.count + 1;
                l_role_privs_ddl(l_idx).STMT := l_rec.STMT;                    
            when l_rec.SRC = 'PROFILES' then 
                l_idx := l_profiles_ddl.count + 1;
                l_profiles_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC = 'EXTERNAL GRANTS' then
                l_idx := l_ext_grants_ddl.count + 1;
                l_ext_grants_ddl(l_idx).STMT := l_rec.STMT;
            when l_rec.SRC IN ('OBJECTS', 'PUBLIC SYNONYMS') then
                l_obj_id := l_rec.OWNER || '.' || l_rec.OBJECT_NAME || '.' || l_rec.OBJECT_TYPE;
                l_obj(l_obj_id).OWNER := l_rec.OWNER;
                l_obj(l_obj_id).OBJECT_NAME := l_rec.OBJECT_NAME;
                l_obj(l_obj_id).OBJECT_TYPE := l_rec.OBJECT_TYPE;
                l_obj(l_obj_id).STMT := l_rec.STMT;
                l_obj(l_obj_id).DONE := 0;
            when l_rec.SRC = 'DEPENDENCIES' then
                l_idx := l_dep.count + 1;
                l_dep(l_idx).OWNER := l_rec.OWNER;
                l_dep(l_idx).OBJECT_NAME := l_rec.OBJECT_NAME;
                l_dep(l_idx).OBJECT_TYPE := l_rec.OBJECT_TYPE;
                l_dep(l_idx).REF_OWNER := l_rec.REF_OWNER;
                l_dep(l_idx).REF_OBJECT_NAME := l_rec.REF_OBJECT_NAME;
                l_dep(l_idx).REF_OBJECT_TYPE := l_rec.REF_OBJECT_TYPE;
        end case;
    end loop;
    
    --repeat loop over objects until all dependencies are resolved or unresolvable
    l_previous_schema := 'SYS';
    for l in 1 .. l_max_loops loop
        l_added_cnt := 0;
        l_obj_id := l_obj.first;
        while l_obj_id is not null loop
            if l_obj(l_obj_id).DONE = 0 then
                if not hasUnresolvedDependency (l_obj(l_obj_id).OWNER, l_obj(l_obj_id).OBJECT_NAME, l_obj(l_obj_id).OBJECT_TYPE) then
                    if l_obj(l_obj_id).OWNER != l_previous_schema then
                        l_ddl(l_ddl.count + 1).STMT := 'ALTER SESSION SET CURRENT_SCHEMA=' || l_obj(l_obj_id).OWNER || ';';
                        l_previous_schema := l_obj(l_obj_id).OWNER;
                    end if;
                    l_ddl(l_ddl.count + 1).STMT := l_obj(l_obj_id).STMT;
                    l_added_cnt := l_added_cnt + 1;
                    l_obj(l_obj_id).DONE := 1;
                end if;
            end if;
            l_obj_id := l_obj.next(l_obj_id);
        end loop;
        dbms_output.put_line('-- ' || to_char(l) || ': Add ' || to_char(l_added_cnt) || ' objects');
        l_added_total := l_added_total + l_added_cnt;
        if l_added_cnt = 0 then
            exit;
        end if;
    end loop;
    dbms_output.put_line('-- Resolved dependencies for ' || to_char(l_added_total) || ' / ' || to_char(l_obj.count) || ' objects');

    --list unresolved dependencies
    l_obj_id := l_obj.first;
    while l_obj_id is not null loop
        if l_obj(l_obj_id).DONE = 0 then    
            dbms_output.put_line('-- Could not resolve all dependencies for object ' || l_obj(l_obj_id).OWNER ||
                                 '.' || l_obj(l_obj_id).OBJECT_NAME || ' (' || l_obj(l_obj_id).OBJECT_TYPE || ')');
            l_obj_dep := unresolvedDependencies (i_OWNER => l_obj(l_obj_id).OWNER, i_OBJECT_NAME => l_obj(l_obj_id).OBJECT_NAME,
                                                 i_OBJECT_TYPE => l_obj(l_obj_id).OBJECT_TYPE);
            for l_idx in 1 .. l_obj_dep.count loop
                dbms_output.put_line('--     ' || l_obj_dep(l_idx).REF_OWNER || '.' || l_obj_dep(l_idx).REF_OBJECT_NAME ||
                                     ' (' || l_obj_dep(l_idx).REF_OBJECT_TYPE || ')');
            end loop;
        end if;
        l_obj_id := l_obj.next(l_obj_id);
    end loop;    
    
    dbms_output.put_line('SET DEFINE OFF;'); 
    dbms_output.put_line('SET HEADING OFF;');
    dbms_output.put_line('SET LINESIZE 32767;');
    dbms_output.put_line('SET PAGESIZE 0;');
    dbms_output.put_line('SET TRIMOUT ON;');
    dbms_output.put_line('SET TERMOUT OFF;');
    dbms_output.put_line('SPOOL install_by_dependencies.log;');

    --create profiles
    for l_profiles_ddl_idx in 1 .. l_profiles_ddl.count loop
        dbms_output.put_line(l_profiles_ddl(l_profiles_ddl_idx).STMT);
    end loop;        

    --create users
    dbms_output.put_line('@install-user.sql');

    --grant proxy connect
    for l_proxies_ddl_idx in 1 .. l_proxies_ddl.count loop
        dbms_output.put_line(l_proxies_ddl(l_proxies_ddl_idx).STMT);
    end loop;        
    
    --set quota
    for l_quota_ddl_idx in 1 .. l_quota_ddl.count loop
        dbms_output.put_line(l_quota_ddl(l_quota_ddl_idx).STMT);
    end loop;  
    
    --create roles
    for l_roles_ddl_idx in 1 .. l_roles_ddl.count loop
        dbms_output.put_line(l_roles_ddl(l_roles_ddl_idx).STMT);
    end loop;
    
    --create contexts
    for l_contexts_ddl_idx in 1 .. l_contexts_ddl.count loop
        dbms_output.put_line(l_contexts_ddl(l_contexts_ddl_idx).STMT);
    end loop;    
    dbms_output.put_line('ALTER SESSION SET CURRENT_SCHEMA=SYS;');
    
    --grant system privileges
    for l_sys_privs_ddl_idx in 1 .. l_sys_privs_ddl.count loop
        dbms_output.put_line(l_sys_privs_ddl(l_sys_privs_ddl_idx).STMT);
    end loop;       
    
    --grant role privileges
    for l_role_privs_ddl_idx in 1 .. l_role_privs_ddl.count loop
        dbms_output.put_line(l_role_privs_ddl(l_role_privs_ddl_idx).STMT);
    end loop;       
    
    --install sequences
    dbms_output.put_line('@install-sequences.sql');    

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
    dbms_output.put_line('@PIBICS/tables/immigrationhist.sql');
    dbms_output.put_line('@PIBICS/tables/tminout.sql');
    dbms_output.put_line('@PIBICS/tables/tminout_ma.sql');
    dbms_output.put_line('@PIBICS/tables/tmmain.sql');
    dbms_output.put_line('@PIBICS/tables/tm2.sql');
    
    --set grants from other schemas    
    for l_grn_ext_idx in 1 .. l_ext_grants_ddl.count loop
        dbms_output.put_line(l_ext_grants_ddl(l_grn_ext_idx).STMT);
    end loop;
    
    --deploy objects
    for l_ddl_idx in 1 .. l_ddl.count loop
        dbms_output.put_line('SELECT ' || l_ddl_idx || ' DDL# FROM DUAL;');
        dbms_output.put_line(l_ddl(l_ddl_idx).STMT);
    end loop;    
    
    --repeat table ddl to make sure all ref constraints will be installed
    dbms_output.put_line('@install-tables.sql');
    
    --install jobs and schedules
    dbms_output.put_line('@install-jobs.sql');
    dbms_output.put_line('@install-dbms_jobs.sql');
    dbms_output.put_line('@install-schedules.sql'); 
    
    dbms_output.put_line('SPOOL OFF;');
    dbms_output.put_line('quit'); 
   
end;

