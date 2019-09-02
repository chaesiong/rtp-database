declare 
    type r_obj  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type,
                           OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_syn  is record (SYNONYM_NAME DBA_SYNONYMS.SYNONYM_NAME%type, OBJECT_OWNER DBA_SYNONYMS.TABLE_OWNER%type, 
                           OBJECT_NAME DBA_SYNONYMS.TABLE_NAME%type);
    type r_dep  is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type,
                           REF_OWNER DBA_OBJECTS.OWNER%type, REF_OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type, REF_OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_done is record (OWNER DBA_OBJECTS.OWNER%type, OBJECT_NAME DBA_OBJECTS.OBJECT_NAME%type,
                           OBJECT_TYPE DBA_OBJECTS.OBJECT_TYPE%type);
    type r_exec is record (EXEC_STMT VARCHAR2(4000));

    type t_obj is table of r_obj index by pls_integer;
    type t_syn is table of r_syn index by pls_integer;
    type t_dep is table of r_dep index by pls_integer;
    type t_done is table of r_done index by varchar2(255);
    type t_exec is table of r_exec index by pls_integer;
    l_done_idx varchar2(255);
        
    l_obj t_obj;
    l_syn t_syn;
    l_syn_ddl varchar2(4000);
    l_done t_done;
    l_exec t_exec;
    l_exec_idx pls_integer := 1;
    l_exec_str varchar2(4000);
    l_dep t_dep;
    l_obj_dep t_dep;

    l_added_cnt number := 0;
    l_max_loops number := 100;

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
    
    function publicSynonymDDL (i_OWNER in DBA_OBJECTS.OWNER%type, i_OBJECT_NAME in DBA_OBJECTS.OBJECT_NAME%type) return varchar2
    is
        l_syn_ddl varchar2(4000);
    begin
        for l_syn_idx in 1 .. l_syn.count
        loop
            if i_OWNER = l_syn(l_syn_idx).OBJECT_OWNER and i_OBJECT_NAME = l_syn(l_syn_idx).OBJECT_NAME then
                l_syn_ddl := l_syn_ddl || chr(10) || 'CREATE PUBLIC SYNONYM ' || l_syn(l_syn_idx).SYNONYM_NAME || ' FOR ' || 
                l_syn(l_syn_idx).OBJECT_OWNER || '.' || l_syn(l_syn_idx).OBJECT_NAME || ';';
            end if;            
        end loop;
        return l_syn_ddl;
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
    --fetch objects
    SELECT DISTINCT OWNER, OBJECT_NAME, OBJECT_TYPE
    BULK COLLECT INTO l_obj
    FROM DBA_OBJECTS O
    WHERE 
    O.OBJECT_NAME NOT LIKE 'BIN$%'
    AND O.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','BIO_BD')
    AND O.OBJECT_TYPE in ('PACKAGE BODY','PROCEDURE','MATERIALIZED VIEW','SYNONYM','TYPE','SEQUENCE','PACKAGE','FUNCTION','TRIGGER','TABLE','VIEW')
    ORDER BY OWNER,
    CASE WHEN OBJECT_TYPE = 'PACKAGE' THEN 0 ELSE 1 END,
    OBJECT_NAME;
    dbms_output.put_line('-- Found ' || to_char(l_obj.count) || ' objects');

    --fetch public synonyms
    SELECT SYNONYM_NAME, TABLE_OWNER, TABLE_NAME
    BULK COLLECT INTO l_syn
    FROM DBA_SYNONYMS S
    WHERE S.TABLE_OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','BIO_BD')
    AND S.OWNER = 'PUBLIC';
    
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
            AND O.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','BIO_BD')
            AND O.OBJECT_TYPE in ('PACKAGE BODY','PROCEDURE','MATERIALIZED VIEW','SYNONYM','TYPE','SEQUENCE','PACKAGE','FUNCTION','TRIGGER','TABLE','VIEW')    
            )
        AND D.REFERENCED_OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','BIO_BD')
        AND D.REFERENCED_TYPE IN ('PACKAGE BODY','PROCEDURE','MATERIALIZED VIEW','SYNONYM','TYPE','SEQUENCE','PACKAGE','FUNCTION','TRIGGER','TABLE','VIEW')
        AND D.REFERENCED_NAME NOT LIKE 'BIN$%'
    UNION
        SELECT C.OWNER, C.TABLE_NAME NAME, 'TABLE' TYPE, CC.OWNER REFERENCED_OWNER, CC.TABLE_NAME REFERENCED_NAME, 'TABLE' REFERENCED_TYPE
        FROM ALL_CONSTRAINTS C, ALL_CONS_COLUMNS CC
        WHERE C.R_OWNER = CC.OWNER
        AND C.R_CONSTRAINT_NAME = CC.CONSTRAINT_NAME
        AND C.CONSTRAINT_TYPE = 'R'
        AND C.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','BIO_BD')
        AND CC.OWNER IN ('DL_COMMON','LOGGER','DL_DBA','DL_USER_MANAGEMENT','APEX_USER_MANAGEMENT','USER_MANAGEMENT','DL_BIOSTORE_BLACKLIST','DL_BIOSTORE_MOVEMENTS','DL_BORDERCONTROL','DL_BLACKLIST','DL_BORDERCONTROL_DATAMART','DL_STAGING4PIBICS','DL_STAGING4PIBICS_INTF','DL_INTERFACE','PIBICSDM2_RO','BIO_BD')
        AND NOT (C.OWNER = CC.OWNER AND C.TABLE_NAME = CC.TABLE_NAME)
        );
        
    dbms_output.put_line('-- Found ' || to_char(l_dep.count) || ' dependencies');
    
    --repeat loop over objects until all dependencies are resolved or unresolvable
    for l in 1 .. l_max_loops loop
        l_added_cnt := 0;
        for l_obj_idx in 1 .. l_obj.count
        loop
            if not l_done.exists(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE) then
                if not hasUnresolvedDependency (l_obj(l_obj_idx).OWNER, l_obj(l_obj_idx).OBJECT_NAME, l_obj(l_obj_idx).OBJECT_TYPE) then
                    l_done(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE).OWNER := l_obj(l_obj_idx).OWNER;
                    l_done(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE).OBJECT_NAME := l_obj(l_obj_idx).OBJECT_NAME;
                    l_done(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE).OBJECT_TYPE := l_obj(l_obj_idx).OBJECT_TYPE;
                    l_exec_str := '@./' || l_obj(l_obj_idx).OWNER || '/' || folderName(l_obj(l_obj_idx).OBJECT_TYPE) || '/' ||
                                  replace(lower(l_obj(l_obj_idx).OBJECT_NAME),'$','\\\$') || '.' || fileEnding(l_obj(l_obj_idx).OBJECT_TYPE);
                    --add public synonyms                                                    
                    l_syn_ddl := publicSynonymDDL (i_OWNER => l_obj(l_obj_idx).OWNER, i_OBJECT_NAME => l_obj(l_obj_idx).OBJECT_NAME);
                    if l_syn_ddl is not null then
                        l_exec_str := l_exec_str || l_syn_ddl;
                    end if;
                    l_exec(l_exec_idx).EXEC_STMT := l_exec_str;
                    l_exec_idx := l_exec_idx + 1;
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
        if not l_done.exists(l_obj(l_obj_idx).OWNER || '.' || l_obj(l_obj_idx).OBJECT_NAME || '.' || l_obj(l_obj_idx).OBJECT_TYPE) then    
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
    dbms_output.put_line('@install-user.sql');
    dbms_output.put_line('@install-db_links.sql');
    dbms_output.put_line('@install-public_db_links.sql');
    dbms_output.put_line('@preparations.sql');
    for l_exec_idx in 1 .. l_exec.count loop
        dbms_output.put_line('SELECT ''' || l_exec(l_exec_idx).EXEC_STMT || ''' AS ">" FROM DUAL;');
        dbms_output.put_line(l_exec(l_exec_idx).EXEC_STMT);
    end loop;
    dbms_output.put_line('@install-jobs.sql');
    dbms_output.put_line('@install-dbms_jobs.sql');
    dbms_output.put_line('@install-schedules.sql');
    dbms_output.put_line('quit');
end;   