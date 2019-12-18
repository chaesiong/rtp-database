CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_WARRANT_UTIL" IS
  
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------*
* MSCS      13.11.2019  Added for wanted polis warrant search
*******************************************************************************/
    
    ---------------------
    -- version --
    ---------------------
    c_object_version            CONSTANT VARCHAR2(19) := '1.0.0000';
    c_object_copyright          CONSTANT VARCHAR2(255 CHAR) := 'Copyright: MSC Sittipol Co. Ltd., 2013-' || TO_CHAR(SYSDATE, 'YYYY');
    
    ---------------------
    -- scope --
    ---------------------
    g_log_scope_prefix          CONSTANT VARCHAR2(62 CHAR) := LOWER($$plsql_unit_owner) || '.' || LOWER($$plsql_unit) || '.';
    
    ---------------------
    -- global vars --
    ---------------------
    
    ---------------------
    -- Internals START --
    ---------------------
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      13.11.2019  Added
    *******************************************************************************/
    FUNCTION add_log_warrant_search (p_log_rec IN log_warrant_search%ROWTYPE)
    RETURN log_warrant_search.key_value%TYPE
    IS
        l_scope     logger_logs.scope%type := g_log_scope_prefix || 'add_log_warrant_search';
        l_params    logger.tab_param;
        --
        l_result log_warrant_search.key_value%TYPE;
    BEGIN
    
        logger.log('ADD LOG WARRANT SEARCH: start', l_scope, null, l_params);
    
        INSERT INTO log_warrant_search 
        VALUES p_log_rec
        RETURNING key_value INTO l_result;
    
        logger.log('ADD LOG WARRANT SEARCH: done', l_scope, null, l_params);
        
        RETURN l_result;
    
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('ADD LOG WARRANT SEARCH: unhandled exeption', l_scope, null, l_params);
            RAISE;
    END add_log_warrant_search;
    
    ---------------------
    -- Internals END --
    ---------------------
    
    /*******************************************************************************
    * Author    Date        Description                                            *
    * --------  ----------  -------------------------------------------------------*
    * MSCS      13.11.2019  Added search_warrant 
    *******************************************************************************/
    FUNCTION search_warrant
    (
         p_system           IN VARCHAR2
        ,p_object           IN VARCHAR2
        ,p_object_id        IN VARCHAR2
        ,p_user             IN VARCHAR2 DEFAULT NULL
        ,p_id_no            IN VARCHAR2 DEFAULT NULL
        ,p_first_name_en    IN VARCHAR2 DEFAULT NULL
        ,p_middle_name_en   IN VARCHAR2 DEFAULT NULL
        ,p_last_name_en     IN VARCHAR2 DEFAULT NULL
        ,p_first_name_th    IN VARCHAR2 DEFAULT NULL
        ,p_last_name_th     IN VARCHAR2 DEFAULT NULL
        ,p_sex              IN NUMBER   DEFAULT NULL
        ,p_dob              IN VARCHAR2 DEFAULT NULL
    ) 
    --RETURN CLOB
    --<TEMPORARILY ONLY>
    RETURN log_warrant_search%ROWTYPE
    IS
        -- Logger
        l_scope             logger_logs.scope%TYPE := g_log_scope_prefix || 'search_warrant';
        l_params            logger.tab_param;
        --
        l_time_start        DATE;
        l_time_end          DATE;
        --
        l_log_warrant_rec   dl_bordercontrol.log_warrant_search%ROWTYPE;
        --l_response_code     NUMBER;
        --
        l_json_result       JSON_OBJECT_T;
        l_json_element      JSON_ELEMENT_T;
        --
        l_number_of_hits    NUMBER := 0;
        l_dob_date          DATE;
        l_dob_th            VARCHAR2(8) := NULL;
        l_result            CLOB;
        --
    BEGIN

        logger.append_param(l_params, 'p_id_no', p_id_no);
        logger.append_param(l_params, 'p_first_name_en', p_first_name_en);
        logger.append_param(l_params, 'p_middle_name_en', p_middle_name_en);
        logger.append_param(l_params, 'p_last_name_en', p_last_name_en);
        logger.append_param(l_params, 'p_first_name_th', p_first_name_th);
        logger.append_param(l_params, 'p_last_name_th', p_last_name_th);
        logger.append_param(l_params, 'p_sex', p_sex);
        logger.append_param(l_params, 'p_dob', p_dob);
        logger.log('SEARCH WARRANT: START', l_scope, NULL, l_params);
        
        -- param check
        IF p_id_no = '0000000000000' THEN
            RETURN l_log_warrant_rec;
        END IF;
        
        --
        l_time_start := SYSDATE;
        --
        DBMS_LOB.createtemporary(l_result, true);
        DBMS_LOB.append(l_result, '[');
        --

        ----------------------
        -- by ID START --
        ----------------------
        IF p_id_no IS NOT NULL THEN
            -- 1: issue with characterset while using agg
            /*
            SELECT 
                JSON_ARRAYAGG ( 
                    JSON_OBJECT ( 
                         KEY 'id_no'            VALUE x.id_no
                        ,KEY 'warrantno'        VALUE x.warrantno
                        ,KEY 'warrant_date'     VALUE x.warrant_date
                        ,KEY 'warrant_due_date' VALUE x.warrant_due_date
                        ,KEY 'first_name'       VALUE x.first_name
                        ,KEY 'last_name'        VALUE x.last_name
                        ,KEY 'eng_first_name'   VALUE x.eng_first_name
                        ,KEY 'eng_middle_name'  VALUE x.eng_middle_name
                        ,KEY 'eng_last_name'    VALUE x.eng_last_name
                        ,KEY 'sex'              VALUE x.sex
                        ,KEY 'nation_code'      VALUE x.nation_code
                        ,KEY 'birth_date'       VALUE x.birth_date
                        ,KEY 'release_flag'     VALUE x.release_flag
                    ) 
                    RETURNING CLOB
                )
            INTO l_result
            FROM
            (
                SELECT 
                    id_no, warrantno, warrant_date, warrant_due_date, first_name, last_name
                    , eng_first_name, eng_middle_name, eng_last_name, sex, nation_code, birth_date
                    , MAX(release_flag) RELEASE_FLAG
                FROM dl_bordercontrol.v_wanted_polis
                WHERE id_no = p_id_no
                GROUP BY 
                    id_no, warrantno, warrant_date, warrant_due_date, first_name, last_name
                    , eng_first_name, eng_middle_name, eng_last_name, sex, nation_code, birth_date
            ) x
            ;
            */
            
            -- 2: loop
            FOR x IN 
            (
                SELECT 
                    ROWNUM AS ROW_NUM
                    , json_object
                    (
                         KEY 'id_no'            VALUE t.id_no
                        ,KEY 'warrantno'        VALUE t.warrantno
                        ,KEY 'warrant_date'     VALUE t.warrant_date
                        ,KEY 'warrant_due_date' VALUE t.warrant_due_date
                        ,KEY 'first_name'       VALUE t.first_name
                        ,KEY 'last_name'        VALUE t.last_name
                        ,KEY 'eng_first_name'   VALUE t.eng_first_name
                        ,KEY 'eng_middle_name'  VALUE t.eng_middle_name
                        ,KEY 'eng_last_name'    VALUE t.eng_last_name
                        ,KEY 'sex'              VALUE t.sex
                        ,KEY 'nation_code'      VALUE t.nation_code
                        ,KEY 'birth_date'       VALUE t.birth_date
                        ,KEY 'release_flag'     VALUE t.release_flag
                        ,KEY 'polis_name'       VALUE t.polis_name
                        ,KEY 'mobileno'         VALUE t.mobileno
                    ) AS JSON_OBJ
                FROM
                (
                    SELECT DISTINCT 
                        wp.id_no, wp.warrantno
                        , NVL2(wp2.warrant_date_formatted, TO_CHAR(wp2.warrant_date_formatted, 'DD/MM/YYYY'), wp2.warrant_date) AS WARRANT_DATE
                        , NVL2(wp2.warrant_due_date_formatted, TO_CHAR(wp2.warrant_due_date_formatted, 'DD/MM/YYYY'), wp2.warrant_due_date) AS WARRANT_DUE_DATE
                        , wp2.first_name, wp2.last_name
                        , wp2.eng_first_name, wp2.eng_middle_name, wp2.eng_last_name, wp2.sex, wp2.nation_code
                        , NVL2(wp2.birth_date_formatted, TO_CHAR(wp2.birth_date_formatted, 'DD/MM/YYYY'), wp2.birth_date) AS BIRTH_DATE
                        , wp.release_flag, wp2.polis_name, wp2.mobileno 
                    FROM 
                    (
                        SELECT warrantno, id_no, MAX(release_flag) AS RELEASE_FLAG
                        FROM dl_bordercontrol.v_wanted_polis
                        WHERE id_no = p_id_no 
                        AND warrantno IS NOT NULL
                        AND NVL(release_flag, '~') != 'D'
                        GROUP BY warrantno, id_no
                    ) wp
                    LEFT JOIN dl_bordercontrol.v_wanted_polis wp2 ON wp.id_no = wp2.id_no AND wp.warrantno = wp2.warrantno 
                    WHERE wp.release_flag = 'N'
                    AND NVL(wp2.warrant_due_date_formatted, TRUNC(SYSDATE)) >= TRUNC(SYSDATE)
                ) t
            )
            LOOP
                IF x.json_obj IS NOT NULL THEN
                    IF x.row_num > 1 THEN
                        DBMS_LOB.APPEND(l_result, ',');
                    END IF;
                    DBMS_LOB.APPEND(l_result, x.json_obj);
                    l_number_of_hits := l_number_of_hits + 1;
                END IF;
            END LOOP;
            --
        END IF;
        ----------------------
        -- by ID END --
        ----------------------
        
        ----------------------
        -- by OTHERS START --
        ----------------------
        IF l_number_of_hits = 0 THEN
        
            IF p_dob IS NOT NULL THEN
                BEGIN
                    l_dob_date := TO_DATE(p_dob, 'DD/MM/YYYY');
                    l_dob_th := TO_CHAR(TO_NUMBER(TO_CHAR(l_dob_date, 'YYYY')) + 543) || TO_CHAR(l_dob_date, 'MM') || TO_CHAR(l_dob_date, 'DD');
                EXCEPTION
                    WHEN OTHERS THEN
                        l_dob_th := NULL;
                END;
            END IF;
            
            IF 
                l_dob_th IS NOT NULL 
                AND p_sex IS NOT NULL 
                AND 
                (
                    TRIM(p_first_name_en || p_middle_name_en || p_last_name_en) IS NOT NULL
                    OR 
                    TRIM(p_first_name_th || p_last_name_th) IS NOT NULL
                )
            THEN
                --
                FOR x IN 
                (
                    SELECT 
                        ROWNUM AS ROW_NUM
                        , json_object
                        (
                             KEY 'id_no'            VALUE t.id_no
                            ,KEY 'warrantno'        VALUE t.warrantno
                            ,KEY 'warrant_date'     VALUE t.warrant_date
                            ,KEY 'warrant_due_date' VALUE t.warrant_due_date
                            ,KEY 'first_name'       VALUE t.first_name
                            ,KEY 'last_name'        VALUE t.last_name
                            ,KEY 'eng_first_name'   VALUE t.eng_first_name
                            ,KEY 'eng_middle_name'  VALUE t.eng_middle_name
                            ,KEY 'eng_last_name'    VALUE t.eng_last_name
                            ,KEY 'sex'              VALUE t.sex
                            ,KEY 'nation_code'      VALUE t.nation_code
                            ,KEY 'birth_date'       VALUE t.birth_date
                            ,KEY 'release_flag'     VALUE t.release_flag
                            ,KEY 'polis_name'       VALUE t.polis_name
                            ,KEY 'mobileno'         VALUE t.mobileno
                        ) AS JSON_OBJ
                    FROM
                    (
                        SELECT DISTINCT 
                            wp.id_no, wp.warrantno
                            , NVL2(wp2.warrant_date_formatted, TO_CHAR(wp2.warrant_date_formatted, 'DD/MM/YYYY'), wp2.warrant_date) AS WARRANT_DATE
                            , NVL2(wp2.warrant_due_date_formatted, TO_CHAR(wp2.warrant_due_date_formatted, 'DD/MM/YYYY'), wp2.warrant_due_date) AS WARRANT_DUE_DATE
                            , wp2.first_name, wp2.last_name
                            , wp2.eng_first_name, wp2.eng_middle_name, wp2.eng_last_name, wp2.sex, wp2.nation_code
                            , NVL2(wp2.birth_date_formatted, TO_CHAR(wp2.birth_date_formatted, 'DD/MM/YYYY'), wp2.birth_date) AS BIRTH_DATE
                            , wp.release_flag, wp2.polis_name, wp2.mobileno 
                        FROM 
                        (
                            SELECT warrantno, id_no, MAX(release_flag) AS RELEASE_FLAG
                            FROM dl_bordercontrol.v_wanted_polis
                            WHERE sex = DECODE(p_sex, 1, 'M', 2, 'F', sex)
                            AND birth_date = l_dob_th --(l_dob_th IS NULL OR birth_date = l_dob_th)
                            AND (p_last_name_en IS NULL OR UPPER(TRIM(eng_last_name)) = p_last_name_en)
                            AND ((p_first_name_en || p_middle_name_en) IS NULL OR (UPPER(TRIM(eng_first_name)) || UPPER(TRIM(eng_middle_name))) = (p_first_name_en || p_middle_name_en))
                            AND (p_last_name_th IS NULL OR TRIM(last_name) = p_last_name_th)
                            AND (p_first_name_th IS NULL OR TRIM(first_name) = p_first_name_th) 
                            AND warrantno IS NOT NULL
                            AND NVL(release_flag, '~') != 'D'
                            GROUP BY warrantno, id_no
                        ) wp
                        LEFT JOIN dl_bordercontrol.v_wanted_polis wp2 ON wp.id_no = wp2.id_no AND wp.warrantno = wp2.warrantno 
                        WHERE wp.release_flag = 'N'
                        AND NVL(wp2.warrant_due_date_formatted, TRUNC(SYSDATE)) >= TRUNC(SYSDATE)
                    ) t
                )
                LOOP
                    --
                    IF x.json_obj IS NOT NULL THEN
                        IF x.row_num > 1 THEN
                            DBMS_LOB.APPEND(l_result, ',');
                        END IF;
                        DBMS_LOB.APPEND(l_result, x.json_obj);
                        l_number_of_hits := l_number_of_hits + 1;
                    END IF;
                    --
                END LOOP;
                --
            END IF;
        
        END IF;
        ----------------------
        -- by OTHERS END --
        ----------------------
        
        --
        DBMS_LOB.APPEND(l_result, ']');
        --
        l_time_end := SYSDATE;
        --
        -- logging only when hits
        IF l_number_of_hits > 0 THEN
            SELECT 
                json_object
                (
                     KEY 'system'         VALUE p_system
                    ,KEY 'object'         VALUE p_object
                    ,KEY 'object_id'      VALUE p_object_id
                    ,KEY 'user'           VALUE p_user
                    ,KEY 'id_no'          VALUE p_id_no
                    ,KEY 'first_name_en'  VALUE p_first_name_en
                    ,KEY 'middle_name_en' VALUE p_middle_name_en
                    ,KEY 'last_name_en'   VALUE p_last_name_en
                    ,KEY 'first_name_th'  VALUE p_first_name_th
                    ,KEY 'last_name_th'   VALUE p_last_name_th
                    ,KEY 'sex'            VALUE p_sex
                    ,KEY 'dob'            VALUE p_dob
                )
            INTO l_log_warrant_rec.request
            FROM DUAL;
            --
            l_log_warrant_rec.sender_system        := p_system;
            l_log_warrant_rec.sender_user          := p_user;
            l_log_warrant_rec.sender_object        := p_object;
            l_log_warrant_rec.sender_object_id     := p_object_id;
            l_log_warrant_rec.response             := l_result; 
            l_log_warrant_rec.elapsed_time_seconds := (l_time_end - l_time_start) * 24 * 60 * 60;
            l_log_warrant_rec.number_of_hits       := l_number_of_hits;
            --
            l_log_warrant_rec.key_value            := add_log_warrant_search(l_log_warrant_rec);
        ELSE
            dl_common.pkg_util.FreeTempLOB(l_result);
        END IF;
        --
        logger.log('SEARCH WARRANT: DONE', l_scope, NULL, l_params);
        --
        
        --RETURN l_result;
        RETURN l_log_warrant_rec;
        
    EXCEPTION
        WHEN OTHERS THEN
            dl_common.pkg_util.FreeTempLOB(l_result);
            logger.log_error('SEARCH WARRANT: ERROR', l_scope, NULL, l_params);
            RAISE;
    END search_warrant;
    
    --
    --
    -- *** Standard functions ***************************************************************************
    --
    FUNCTION Get_OBJECT_NAME RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN $$plsql_unit_owner || '.' || $$plsql_unit;
    END;
    --
    FUNCTION Get_OBJECT_COPYRIGHT RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN c_object_copyright;
    END;
    --
    FUNCTION Get_OBJECT_VERSION$VC RETURN VARCHAR2 DETERMINISTIC IS
    BEGIN
    RETURN c_object_version;
    END;
    --
    
end PKG_WARRANT_UTIL;
/
