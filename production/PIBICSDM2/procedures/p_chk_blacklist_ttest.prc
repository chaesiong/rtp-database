CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHK_BLACKLIST_TTEST" 
(
    P_MOVEMENTID        IN  VARCHAR2,
    P_NATIONCD          IN  VARCHAR2,
    P_PASSNO            IN  VARCHAR2,
    P_IDCard            IN  VARCHAR2,
    P_BIRTHDTE          IN  VARCHAR2,
    P_SEX               IN  VARCHAR2,
    P_EFIRSTNM          IN  VARCHAR2,
    P_EMIDDLENMN        IN  VARCHAR2,
    P_EFAMILYNM         IN  VARCHAR2,
    P_TFIRSTNM          IN  VARCHAR2 DEFAULT NULL,
    P_TMIDDLENMN        IN  VARCHAR2 DEFAULT NULL,
    P_TFAMILYNM         IN  VARCHAR2 DEFAULT NULL,
    P_PIBICSPRDCONN     IN  NUMBER   DEFAULT 0,
    P_WLCD              OUT VARCHAR2
) AS

    -- added for direct sql usage
    PRAGMA AUTONOMOUS_TRANSACTION;
    --
    V_Results           VARCHAR2(4000) := null;
    --
    WLFULLNMTWO         VARCHAR2(1000) := NULL;
    WLFULLNMTHREE       VARCHAR2(1000) := NULL;
    WLFULLNMTWO_SP      VARCHAR2(1000) := NULL;
    WLFULLNMTHREE_SP    VARCHAR2(1000) := NULL;
    --
    -- thai
    WLFULLNMTWO_T       VARCHAR2(1000) := NULL;
    WLFULLNMTHREE_T     VARCHAR2(1000) := NULL;
    --
    -- 
    l_query             VARCHAR2(32000) := NULL;
    l_sex               VARCHAR2(1) := NULL;
    l_sex_full               VARCHAR2(10) := NULL;
    --
    l_bl_demo_search_source NUMBER := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter('BL_DEMO_SEARCH_SRC'), 0));
    l_bl_demo_search_type   NUMBER := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter('BL_DEMO_SEARCH_TYPE'), 0));
    l_search_type_operator  VARCHAR2(1) := '%';
    l_search_type_string    VARCHAR2(4) := 'LIKE';
    --
    L_NATIONCD           VARCHAR2(3) := NULL;
    -- internal procs
    /*
    procedure append_coll as
    begin
        --dbms_output.put_line('before P_WLCD :' || P_WLCD.COUNT);
        --dbms_output.put_line('before V_Results :' || V_Results.COUNT);
        --P_WLCD := P_WLCD MULTISET UNION DISTINCT V_Results;
        --V_Results.DELETE;
        --dbms_output.put_line('after P_WLCD :' || P_WLCD.COUNT);
        dbms_output.put_line('after V_Results :' || V_Results.COUNT);
    end append_coll;
    --
*/
BEGIN

    -- add condtions here to return if required params are null
    
    
       begin
        SELECT key_value
            INTO L_NATIONCD
            FROM  DL_STAGING4PIBICS_INTF.trcd_country t
            WHERE to_char(t.seqno) = P_NATIONCD;
        EXCEPTION
            WHEN no_data_found THEN
                BEGIN
                    SELECT key_value
                    INTO L_NATIONCD
                    FROM DL_STAGING4PIBICS_INTF.trcd_country t
                    WHERE t.code = P_NATIONCD;
                END;
        end;
                
    -- init
    P_WLCD := null;
    l_bl_demo_search_source := l_bl_demo_search_source * CASE P_PIBICSPRDCONN WHEN 1 THEN 1 ELSE 0 END;
    --
    l_search_type_operator := CASE l_bl_demo_search_type WHEN 0 THEN '%' ELSE NULL END;
    l_search_type_string   := CASE l_bl_demo_search_type WHEN 0 THEN 'LIKE' ELSE '=' END;
    --

    IF P_SEX IN ('1', 'M') THEN
        l_sex := 'M';
        l_sex_full := 'MALE';
    ELSIF P_SEX IN ('2', 'F') THEN
        l_sex := 'F';
        l_sex_full := 'FEMALE';
    END IF;

    WLFULLNMTWO   := REPLACE(P_EFIRSTNM || P_EFAMILYNM, ' ', '') || l_search_type_operator;
    WLFULLNMTHREE := REPLACE(P_EFIRSTNM || P_EFAMILYNM || P_EMIDDLENMN, ' ', '') || l_search_type_operator;

    WLFULLNMTWO_SP   := REPLACE(P_EFAMILYNM || P_EFIRSTNM, ' ', '') || l_search_type_operator;
    WLFULLNMTHREE_SP := REPLACE(P_EFAMILYNM || P_EFIRSTNM || P_EMIDDLENMN, ' ', '') || l_search_type_operator;

    -- thai
    WLFULLNMTWO_T   := REPLACE(P_TFIRSTNM || P_TFAMILYNM, ' ', '') ;
    WLFULLNMTHREE_T := REPLACE(P_TFIRSTNM || P_TFAMILYNM || P_TMIDDLENMN, ' ', '') ;
    -- WLFULLNMTWO_T   := REPLACE(P_TFIRSTNM || '%' || P_TFAMILYNM, ' ', '') || l_search_type_operator;
    -- WLFULLNMTHREE_T := REPLACE(P_TFIRSTNM || '%' || P_TFAMILYNM || P_TMIDDLENMN, ' ', '') || l_search_type_operator;    

    IF P_NATIONCD = 'V03' THEN
        WLFULLNMTWO    := NULL;
        WLFULLNMTWO_SP := NULL;
    END IF;

    IF 
        REPLACE(WLFULLNMTWO, l_search_type_operator) IS NOT NULL 
        OR REPLACE(WLFULLNMTHREE, l_search_type_operator) IS NOT NULL 
    THEN
        -- 1: _START
        BEGIN  
         
           -- 1.1 where name,lastname,middelname like
           IF  l_search_type_string = 'LIKE' THEN
            
                    SELECT 
                        CAST(COLLECT(DISTINCT W.case_number) as varchar2(2000) )   INTO V_Results
                     FROM DL_BLACKLIST.blacklist_cases W 
                            inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                            on W.ID = BCI.BLACKLIST_CASE
                            INNER join  DL_BLACKLIST.identities WN
                            on BCI.IDENTITY = WN.KEY_VALUE   
                    WHERE  WN.nationality = L_NATIONCD
                    AND W.IS_ACTIVE = 'Y'
                    AND 
                    ( 
                           to_char(wn.date_of_birth,'DD/MM/YYYY') = P_BIRTHDTE  
                        OR 
                        WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -4, 4) 
                        OR 
                         WN.date_of_birth_partial.getMonth()||'/'||
                            WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -7, 7) 
                        OR 
                        '/'|| WN.date_of_birth_partial.getMonth()||'/'||
                        WN.date_of_birth_partial.getYear()||'/' = SUBSTR(P_BIRTHDTE , -8, 8)
                    )
                    AND 
                    (
                        (
                            REPLACE(WLFULLNMTWO, '%') IS NOT NULL
                            AND 
                            (
                                (REPLACE(surname || middle_name || given_name, ' ', '%') LIKE WLFULLNMTWO ) OR
                                (REPLACE(surname || given_name || middle_name, ' ', '%') LIKE WLFULLNMTWO ) OR
                                (REPLACE(middle_name || surname || given_name, ' ', '%') LIKE WLFULLNMTWO ) OR
                                (REPLACE(middle_name || given_name || surname, ' ', '%') LIKE WLFULLNMTWO ) OR
                                (REPLACE(given_name || surname || middle_name, ' ', '%') LIKE WLFULLNMTWO ) OR
                                (REPLACE(given_name || middle_name || surname, ' ', '%') LIKE WLFULLNMTWO )  
                            )
                        )
                        OR
                        (
                            REPLACE(WLFULLNMTHREE, '%') IS NOT NULL
                            AND
                            (
                                (REPLACE(surname || middle_name || given_name, ' ', '%') LIKE WLFULLNMTHREE ) OR
                                (REPLACE(surname || given_name || middle_name, ' ', '%') LIKE WLFULLNMTHREE ) OR
                                (REPLACE(middle_name || surname || given_name, ' ', '%') LIKE WLFULLNMTHREE ) OR
                                (REPLACE(middle_name || given_name || surname, ' ', '%') LIKE WLFULLNMTHREE ) OR
                                (REPLACE(given_name || surname || middle_name, ' ', '%') LIKE WLFULLNMTHREE ) OR
                                (REPLACE(given_name || middle_name || surname, ' ', '%') LIKE WLFULLNMTHREE )
                            )
                        )
                    )
                     AND ( WN.sex = l_sex or  WN.sex = l_sex_full ) ;
                     
                ELSE 
                -- 1.2 where name,lastname,middelname =
                    
                                 SELECT 
                                CAST(COLLECT(DISTINCT W.case_number) AS VARCHAR2(2000))   INTO V_Results
                             FROM DL_BLACKLIST.blacklist_cases W 
                                    inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                                    on W.ID = BCI.BLACKLIST_CASE
                                    INNER join  DL_BLACKLIST.identities WN
                                    on BCI.IDENTITY = WN.KEY_VALUE   
                            WHERE  WN.nationality = L_NATIONCD
                            AND W.IS_ACTIVE = 'Y'
                             AND 
                                ( 
                                       to_char(wn.date_of_birth,'DD/MM/YYYY') = P_BIRTHDTE  
                                    OR 
                                    WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -4, 4) 
                                    OR 
                                     WN.date_of_birth_partial.getMonth()||'/'||
                                        WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -7, 7) 
                                    OR 
                                    '/'|| WN.date_of_birth_partial.getMonth()||'/'||
                                    WN.date_of_birth_partial.getYear()||'/' = SUBSTR(P_BIRTHDTE , -8, 8)
                                )
                            AND 
                            (
                                (
                                    REPLACE(WLFULLNMTWO, '') IS NOT NULL
                                    AND 
                                    (
                                        (REPLACE(surname || middle_name || given_name, ' ', '') = WLFULLNMTWO ) OR
                                        (REPLACE(surname || given_name || middle_name, ' ', '') = WLFULLNMTWO ) OR
                                        (REPLACE(middle_name || surname || given_name, ' ', '') = WLFULLNMTWO ) OR
                                        (REPLACE(middle_name || given_name || surname, ' ', '') = WLFULLNMTWO ) OR
                                        (REPLACE(given_name || surname || middle_name, ' ', '') = WLFULLNMTWO ) OR
                                        (REPLACE(given_name || middle_name || surname, ' ', '') = WLFULLNMTWO )  
                                    )
                                )
                                OR
                                (
                                    REPLACE(WLFULLNMTHREE, '') IS NOT NULL
                                    AND
                                    (
                                        (REPLACE(surname || middle_name || given_name, ' ', '') = WLFULLNMTHREE ) OR
                                        (REPLACE(surname || given_name || middle_name, ' ', '') = WLFULLNMTHREE ) OR
                                        (REPLACE(middle_name || surname || given_name, ' ', '') = WLFULLNMTHREE ) OR
                                        (REPLACE(middle_name || given_name || surname, ' ', '') = WLFULLNMTHREE ) OR
                                        (REPLACE(given_name || surname || middle_name, ' ', '') = WLFULLNMTHREE ) OR
                                        (REPLACE(given_name || middle_name || surname, ' ', '') = WLFULLNMTHREE )
                                    )
                                )
                            )
                             AND ( WN.sex = l_sex OR  WN.sex = l_sex_full ) ;
                    
                    END IF;

            --dbms_output.put_line('Step1 query :' || l_query);
           -- dbms_output.put_line('Step1 :' || V_Results.COUNT);

        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        -- 1: _END
    END IF;

    -- append and init
  --  IF V_Results.COUNT > 0 THEN
   --     append_coll;
   -- END IF;

    IF 
        REPLACE(WLFULLNMTWO_SP, l_search_type_operator) IS NOT NULL 
        OR REPLACE(WLFULLNMTHREE_SP, l_search_type_operator) IS NOT NULL 
    THEN
        -- 2: _START
        BEGIN
                    
           -- 2.1 where name,lastname,middelname like
           IF  l_search_type_string = 'LIKE' THEN
                        
                                 SELECT 
                                        CAST(COLLECT(DISTINCT w.case_number) AS VARCHAR2(2000))  INTO V_Results
                                     FROM DL_BLACKLIST.blacklist_cases W 
                                        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                                        on W.ID = BCI.BLACKLIST_CASE
                                        INNER join  DL_BLACKLIST.identities WN
                                        on BCI.IDENTITY = WN.KEY_VALUE   
                                    WHERE WN.nationality = L_NATIONCD
                                    AND W.IS_ACTIVE = 'Y'
                                    AND 
                                                        ( 
                                                               to_char(wn.date_of_birth,'DD/MM/YYYY') = P_BIRTHDTE  
                                                            OR 
                                                            WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -4, 4) 
                                                            OR 
                                                             WN.date_of_birth_partial.getMonth()||'/'||
                                                                WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -7, 7) 
                                                            OR 
                                                            '/'|| WN.date_of_birth_partial.getMonth()||'/'||
                                                            WN.date_of_birth_partial.getYear()||'/' = SUBSTR(P_BIRTHDTE , -8, 8)
                                                        )
                                    AND 
                                    (
                                        (
                                            REPLACE(WLFULLNMTWO_SP, '%') IS NOT NULL
                                            AND 
                                            (
                                                (REPLACE(surname || middle_name || given_name, ' ', '%') LIKE WLFULLNMTWO_SP ) OR
                                                (REPLACE(surname || given_name || middle_name, ' ', '%') LIKE WLFULLNMTWO_SP ) OR
                                                (REPLACE(middle_name || surname || given_name, ' ', '%') LIKE WLFULLNMTWO_SP ) OR
                                                (REPLACE(middle_name || given_name || surname, ' ', '%') LIKE WLFULLNMTWO_SP ) OR
                                                (REPLACE(given_name || surname || middle_name, ' ', '%') LIKE WLFULLNMTWO_SP ) OR
                                                (REPLACE(given_name || middle_name || surname, ' ', '%') LIKE WLFULLNMTWO_SP ) 
                                            )
                                        )
                                        OR
                                        (
                                            REPLACE(WLFULLNMTHREE_SP , '%') IS NOT NULL
                                            AND
                                            (
                                                (REPLACE(surname || middle_name || given_name, ' ', '%') LIKE WLFULLNMTHREE_SP ) OR
                                                (REPLACE(surname || given_name || middle_name, ' ', '%') LIKE WLFULLNMTHREE_SP ) OR
                                                (REPLACE(middle_name || surname || given_name, ' ', '%') LIKE WLFULLNMTHREE_SP ) OR
                                                (REPLACE(middle_name || given_name || surname, ' ', '%') LIKE WLFULLNMTHREE_SP ) OR
                                                (REPLACE(given_name || surname || middle_name, ' ', '%') LIKE WLFULLNMTHREE_SP ) OR
                                                (REPLACE(given_name || middle_name || surname, ' ', '%') LIKE WLFULLNMTHREE_SP )
                                            )
                                        )
                                    )
                                       AND ( WN.sex = l_sex OR  WN.sex = l_sex_full ) ;
           ELSE
             -- 2.1 where name,lastname,middelname =
             SELECT 
                                        CAST(COLLECT(DISTINCT w.case_number) AS VARCHAR2(2000))  INTO V_Results
                                     FROM DL_BLACKLIST.blacklist_cases W 
                                        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                                        on W.ID = BCI.BLACKLIST_CASE
                                        INNER join  DL_BLACKLIST.identities WN
                                        on BCI.IDENTITY = WN.KEY_VALUE   
                                    WHERE WN.nationality = L_NATIONCD
                                    AND W.IS_ACTIVE = 'Y'
                                    AND 
                                                        ( 
                                                               to_char(wn.date_of_birth,'DD/MM/YYYY') = P_BIRTHDTE  
                                                            OR 
                                                            WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -4, 4) 
                                                            OR 
                                                             WN.date_of_birth_partial.getMonth()||'/'||
                                                                WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -7, 7) 
                                                            OR 
                                                            '/'|| WN.date_of_birth_partial.getMonth()||'/'||
                                                            WN.date_of_birth_partial.getYear()||'/' = SUBSTR(P_BIRTHDTE , -8, 8)
                                                        )
                                    AND 
                                    (
                                        (
                                            REPLACE(WLFULLNMTWO_SP, '') IS NOT NULL
                                            AND 
                                            (
                                                (REPLACE(surname || middle_name || given_name, ' ', '') = WLFULLNMTWO_SP ) OR
                                                (REPLACE(surname || given_name || middle_name, ' ', '') = WLFULLNMTWO_SP ) OR
                                                (REPLACE(middle_name || surname || given_name, ' ', '') = WLFULLNMTWO_SP ) OR
                                                (REPLACE(middle_name || given_name || surname, ' ', '') = WLFULLNMTWO_SP ) OR
                                                (REPLACE(given_name || surname || middle_name, ' ', '') = WLFULLNMTWO_SP ) OR
                                                (REPLACE(given_name || middle_name || surname, ' ', '') = WLFULLNMTWO_SP ) 
                                            )
                                        )
                                        OR
                                        (
                                            REPLACE(WLFULLNMTHREE_SP , '') IS NOT NULL
                                            AND
                                            (
                                                (REPLACE(surname || middle_name || given_name, ' ', '') = WLFULLNMTHREE_SP ) OR
                                                (REPLACE(surname || given_name || middle_name, ' ', '') = WLFULLNMTHREE_SP ) OR
                                                (REPLACE(middle_name || surname || given_name, ' ', '') = WLFULLNMTHREE_SP ) OR
                                                (REPLACE(middle_name || given_name || surname, ' ', '') = WLFULLNMTHREE_SP ) OR
                                                (REPLACE(given_name || surname || middle_name, ' ', '') = WLFULLNMTHREE_SP ) OR
                                                (REPLACE(given_name || middle_name || surname, ' ', '') = WLFULLNMTHREE_SP )
                                            )
                                        )
                                    )
                                       AND ( WN.sex = l_sex OR  WN.sex = l_sex_full ) ;
           
           END IF;
            --dbms_output.put_line('Step2 query :' || l_query);
            --dbms_output.put_line('Step2 :' || V_Results.COUNT);

        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        -- 2: _END
    END IF;



    IF 
        TRIM(P_PASSNO) IS NOT NULL
        OR TRIM(P_IDCard) IS NOT NULL 
    THEN
        -- 3: _START
        BEGIN
        
         SELECT 
                CAST(COLLECT(DISTINCT (w.case_number)) AS VARCHAR2(2000))    INTO V_Results
              FROM DL_BLACKLIST.blacklist_cases W 
                    inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                    on W.ID = BCI.BLACKLIST_CASE
                    INNER join  DL_BLACKLIST.identities WN
                    on BCI.IDENTITY = WN.KEY_VALUE
                    LEFT join  DL_BLACKLIST.travel_docs WC
                     on  WN.key_value = WC.identity   
            WHERE  WN.nationality = L_NATIONCD
            AND W.IS_ACTIVE = 'Y'
            AND 
            (
                REPLACE(WC.doc_number, '-', '') = REPLACE( P_PASSNO , '-', '') 
                OR
                REPLACE(WC.doc_number, '-', '') = REPLACE(P_IDCard , '-', '')
            ) ; 

            --dbms_output.put_line('Step3 query :' || l_query);
            --dbms_output.put_line('Step3 :' || V_Results.COUNT);

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
        END;
        -- 3: _END
    END IF;



    IF 
        REPLACE(WLFULLNMTWO_T, l_search_type_operator) IS NOT NULL 
        OR REPLACE(WLFULLNMTHREE_T, l_search_type_operator) IS NOT NULL 
    THEN
        -- 4: _START
        BEGIN
           -- 4.1 where name,lastname,middelname like
           IF  l_search_type_string = 'LIKE' THEN
           
                                    SELECT 
                                            CAST(COLLECT(DISTINCT W.case_number) AS VARCHAR2(2000))    INTO V_Results
                                         FROM  DL_BLACKLIST.blacklist_cases W 
                                        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                                        on W.ID = BCI.BLACKLIST_CASE
                                        INNER join  DL_BLACKLIST.identities WN
                                        on BCI.IDENTITY = WN.KEY_VALUE   
                                        WHERE  WN.nationality = L_NATIONCD
                                        AND W.IS_ACTIVE = 'Y'
                                       AND 
                                                        ( 
                                                               to_char(wn.date_of_birth,'DD/MM/YYYY') = P_BIRTHDTE  
                                                            OR 
                                                            WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -4, 4) 
                                                            OR 
                                                             WN.date_of_birth_partial.getMonth()||'/'||
                                                                WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -7, 7) 
                                                            OR 
                                                            '/'|| WN.date_of_birth_partial.getMonth()||'/'||
                                                            WN.date_of_birth_partial.getYear()||'/' = SUBSTR(P_BIRTHDTE , -8, 8)
                                                        )
                                    AND 
                                    (
                                                    (
                                                        REPLACE(WLFULLNMTWO_T , '%') IS NOT NULL
                                                        AND 
                                                        (
                                                            (REPLACE(givenname_thai || middlename_thai || surname_thai, ' ', '%') LIKE WLFULLNMTWO_T ) OR
                                                            (REPLACE(givenname_thai || surname_thai || middlename_thai, ' ', '%') LIKE WLFULLNMTWO_T )
                                                        )
                                                    )
                                                    OR
                                                    (
                                                        REPLACE(WLFULLNMTHREE_T , '%') IS NOT NULL
                                                        AND
                                                        (
                                                            (REPLACE(givenname_thai || middlename_thai || surname_thai, ' ', '%') LIKE WLFULLNMTHREE_T ) OR
                                                            (REPLACE(givenname_thai || surname_thai || middlename_thai, ' ', '%') LIKE WLFULLNMTHREE_T )
                                                        )
                                                    )
                                                ) 
                                            
                                                AND ( WN.sex = l_sex OR  WN.sex = l_sex_full ) ;
                    ELSE 
                             SELECT 
                                            CAST(COLLECT(DISTINCT W.case_number) AS VARCHAR2(2000))    INTO V_Results
                                         FROM  DL_BLACKLIST.blacklist_cases W 
                                        inner join DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES BCI 
                                        on W.ID = BCI.BLACKLIST_CASE
                                        INNER join  DL_BLACKLIST.identities WN
                                        on BCI.IDENTITY = WN.KEY_VALUE   
                                        WHERE  WN.nationality = L_NATIONCD
                                        AND W.IS_ACTIVE = 'Y'
                                       AND 
                                                        ( 
                                                               to_char(wn.date_of_birth,'DD/MM/YYYY') = P_BIRTHDTE  
                                                            OR 
                                                            WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -4, 4) 
                                                            OR 
                                                             WN.date_of_birth_partial.getMonth()||'/'||
                                                                WN.date_of_birth_partial.getYear() = SUBSTR(P_BIRTHDTE , -7, 7) 
                                                            OR 
                                                            '/'|| WN.date_of_birth_partial.getMonth()||'/'||
                                                            WN.date_of_birth_partial.getYear()||'/' = SUBSTR(P_BIRTHDTE , -8, 8)
                                                        )
                                    AND 
                                    (
                                                    (
                                                        REPLACE(WLFULLNMTWO_T , '') IS NOT NULL
                                                        AND 
                                                        (
                                                            (REPLACE(givenname_thai || middlename_thai || surname_thai, ' ', '')  =  WLFULLNMTWO_T ) OR
                                                            (REPLACE(givenname_thai || surname_thai || middlename_thai, ' ', '')  =  WLFULLNMTWO_T )
                                                        )
                                                    )
                                                    OR
                                                    (
                                                        REPLACE(WLFULLNMTHREE_T , '') IS NOT NULL
                                                        AND
                                                        (
                                                            (REPLACE(givenname_thai || middlename_thai || surname_thai, ' ', '') =  WLFULLNMTHREE_T ) OR
                                                            (REPLACE(givenname_thai || surname_thai || middlename_thai, ' ', '') =  WLFULLNMTHREE_T )
                                                        )
                                                    )
                                                ) 
                                            
                                                AND ( WN.sex = l_sex OR  WN.sex = l_sex_full ) ;
                                END IF;

           --dbms_output.put_line('Step4 query :' || l_query);
            --dbms_output.put_line('Step4 :' || V_Results.COUNT);

        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        -- 4: _END
    END IF;


P_WLCD := v_results;
    dbms_output.put_line( P_WLCD);
   
   /*
        --IF v_results IS NOT NULL AND v_results.COUNT > 0 THEN
            BEGIN
            
        
              --  INSERT INTO pibicsdm2.FOUNDWLResults (WLCD, MOVEMENTID, SYSTEMDATE)
              --  values (v_results, P_MOVEMENTID, SYSDATE);
                
                -- moved to the bottom
                --commit;
                
            EXCEPTION
                WHEN OTHERS THEN
                    -- use logger here
                    NULL;
            END;
        --END IF;
*/
  -- close dblink transaction
  COMMIT;

END P_CHK_BLACKLIST_TTest;
/
