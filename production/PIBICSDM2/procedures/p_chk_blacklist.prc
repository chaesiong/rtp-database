CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHK_BLACKLIST" 
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
    P_WLCD              OUT DL_BLACKLIST.TT_VARCHAR2
) AS

    -- added for direct sql usage
    PRAGMA AUTONOMOUS_TRANSACTION;
    --
    V_Results           DL_BLACKLIST.TT_VARCHAR2 := DL_BLACKLIST.TT_VARCHAR2();
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
    --
    l_bl_demo_search_source NUMBER := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter('BL_DEMO_SEARCH_SRC'), 0));
    l_bl_demo_search_type   NUMBER := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter('BL_DEMO_SEARCH_TYPE'), 0));
    l_search_type_operator  VARCHAR2(1) := '%';
    l_search_type_string    VARCHAR2(4) := 'LIKE';
    --
    -- internal procs
    procedure append_coll as
    begin
        --dbms_output.put_line('before P_WLCD :' || P_WLCD.COUNT);
        --dbms_output.put_line('before V_Results :' || V_Results.COUNT);
        P_WLCD := P_WLCD MULTISET UNION DISTINCT V_Results;
        V_Results.DELETE;
        --dbms_output.put_line('after P_WLCD :' || P_WLCD.COUNT);
        --dbms_output.put_line('after V_Results :' || V_Results.COUNT);
    end append_coll;
    --

BEGIN

    -- add condtions here to return if required params are null
    
    -- init
    P_WLCD := DL_BLACKLIST.TT_VARCHAR2();
    l_bl_demo_search_source := l_bl_demo_search_source * CASE P_PIBICSPRDCONN WHEN 1 THEN 1 ELSE 0 END;
    --
    l_search_type_operator := CASE l_bl_demo_search_type WHEN 0 THEN '%' ELSE NULL END;
    l_search_type_string   := CASE l_bl_demo_search_type WHEN 0 THEN 'LIKE' ELSE '=' END;
    --
    
    IF P_SEX IN ('1', 'M') THEN
        l_sex := 'M';
    ELSIF P_SEX IN ('2', 'F') THEN
        l_sex := 'F';
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
            l_query := 
            q'[ 
            SELECT 
                CAST(COLLECT(DISTINCT W.WLCD) AS DL_BLACKLIST.TT_VARCHAR2) 
            ]'
            || 
            CASE l_bl_demo_search_source
                WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN ]'
                ELSE q'[ FROM watchlist W, WATCHLISTNM WN ]'
            END
            || 
            q'[ 
            WHERE W.WLCD = WN.WLCD
            AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
            AND 
            ( 
                WN.birthdte = ']' || P_BIRTHDTE || q'['  
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -4, 4) 
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -7, 7) 
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -8, 8)
                OR 
                WN.birthdte = '//' || SUBSTR(']' || P_BIRTHDTE || q'[' , -4, 4)
            )
            AND 
            (
                (
                    REPLACE(']' || WLFULLNMTWO || q'[' , ']' || l_search_type_operator || q'[') IS NOT NULL
                    AND 
                    (
                        (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO || q'[' ) OR
                        (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO || q'[' ) 
                    )
                )
                OR
                (
                    REPLACE(']' || WLFULLNMTHREE || q'[' , ']' || l_search_type_operator || q'[') IS NOT NULL
                    AND
                    (
                        (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE || q'[' ) OR
                        (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE || q'[' )
                    )
                )
            )
            ]'
            || CASE WHEN l_sex IS NOT NULL THEN q'[ AND W.sex = ']' || l_sex || q'[' ]' END
            ;
            
            IF TRIM(l_query) IS NOT NULL THEN
                EXECUTE IMMEDIATE l_query INTO V_Results;
            END IF;
            
            --dbms_output.put_line('Step1 query :' || l_query);
            --dbms_output.put_line('Step1 :' || V_Results.COUNT);
        
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        -- 1: _END
    END IF;
    
    -- append and init
    IF V_Results.COUNT > 0 THEN
        append_coll;
    END IF;
    
    IF 
        REPLACE(WLFULLNMTWO_SP, l_search_type_operator) IS NOT NULL 
        OR REPLACE(WLFULLNMTHREE_SP, l_search_type_operator) IS NOT NULL 
    THEN
        -- 2: _START
        BEGIN
            l_query := 
            q'[
            SELECT 
                CAST(COLLECT(DISTINCT w.WLCD) AS DL_BLACKLIST.TT_VARCHAR2) 
            ]'
            || 
            CASE l_bl_demo_search_source
                WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN ]'
                ELSE q'[ FROM watchlist W, WATCHLISTNM WN ]'
            END
            || 
            q'[ 
            WHERE W.WLCD = WN.WLCD
            AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
            AND 
            ( 
                WN.birthdte = ']' || P_BIRTHDTE || q'['  
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -4, 4) 
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -7, 7) 
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -8, 8)
                OR 
                WN.birthdte = '//' || SUBSTR(']' || P_BIRTHDTE || q'[' , -4, 4)
            )
            AND 
            (
                (
                    REPLACE(']' || WLFULLNMTWO_SP || q'[' , ']' || l_search_type_operator || q'[') IS NOT NULL
                    AND 
                    (
                        (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_SP || q'[' ) OR
                        (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_SP || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_SP || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_SP || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_SP || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_SP || q'[' ) 
                    )
                )
                OR
                (
                    REPLACE(']' || WLFULLNMTHREE_SP || q'[' , ']' || l_search_type_operator || q'[') IS NOT NULL
                    AND
                    (
                        (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_SP || q'[' ) OR
                        (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_SP || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_SP || q'[' ) OR
                        (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_SP || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_SP || q'[' ) OR
                        (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_SP || q'[' )
                    )
                )
            )
            ]'
            || CASE WHEN l_sex IS NOT NULL THEN q'[ AND W.sex = ']' || l_sex || q'[' ]' END
            ;
            
            IF TRIM(l_query) IS NOT NULL THEN
                EXECUTE IMMEDIATE l_query INTO V_Results;
            END IF;
                
            --dbms_output.put_line('Step2 query :' || l_query);
            --dbms_output.put_line('Step2 :' || V_Results.COUNT);
        
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        -- 2: _END
    END IF;
    
    -- append and init
    IF V_Results.COUNT > 0 THEN
        append_coll;
    END IF;
    
    IF 
        TRIM(P_PASSNO) IS NOT NULL
        OR TRIM(P_IDCard) IS NOT NULL 
    THEN
        -- 3: _START
        BEGIN
            l_query := 
            q'[
            SELECT 
                CAST(COLLECT(DISTINCT w.WLCD) AS DL_BLACKLIST.TT_VARCHAR2) 
            ]'
            || 
            CASE l_bl_demo_search_source
                WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN, v_WLINDICATECARD_prod WC ]'
                ELSE q'[ FROM watchlist W, WATCHLISTNM WN, WLINDICATECARD WC ]'
            END
            || 
            q'[ 
            WHERE W.WLCD = WC.WLCD
            AND WN.WLCD = W.WLCD
            AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
            AND 
            (
                REPLACE(WC.DOCNO, '-', '') = REPLACE( ']' || P_PASSNO || q'[' , '-', '') 
                OR
                REPLACE(WC.DOCNO, '-', '') = REPLACE( ']' || P_IDCard || q'[' , '-', '')
            ) 
            ]';
            
            IF TRIM(l_query) IS NOT NULL THEN
                EXECUTE IMMEDIATE l_query INTO V_Results;
            END IF;
            
            --dbms_output.put_line('Step3 query :' || l_query);
            --dbms_output.put_line('Step3 :' || V_Results.COUNT);
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
        END;
        -- 3: _END
    END IF;
    
    -- append and init
    IF V_Results.COUNT > 0 THEN
        append_coll;
    END IF;
    
    IF 
        REPLACE(WLFULLNMTWO_T, l_search_type_operator) IS NOT NULL 
        OR REPLACE(WLFULLNMTHREE_T, l_search_type_operator) IS NOT NULL 
    THEN
        -- 4: _START
        BEGIN
            l_query := 
            q'[
            SELECT 
                CAST(COLLECT(DISTINCT W.WLCD) AS DL_BLACKLIST.TT_VARCHAR2) 
            ]'
            || 
            CASE l_bl_demo_search_source
                WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN ]'
                ELSE q'[ FROM watchlist W, WATCHLISTNM WN ]'
            END
            || 
            q'[ 
            WHERE W.WLCD = WN.WLCD 
            AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
            AND 
            ( 
                WN.birthdte = ']' || P_BIRTHDTE || q'['  
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -4, 4) 
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -7, 7) 
                OR 
                WN.birthdte = SUBSTR(']' || P_BIRTHDTE || q'[' , -8, 8)
                OR 
                WN.birthdte = '//' || SUBSTR(']' || P_BIRTHDTE || q'[' , -4, 4)
            )
            AND 
            (
                (
                    REPLACE(']' || WLFULLNMTWO_T || q'[' , ']' || l_search_type_operator || q'[') IS NOT NULL
                    AND 
                    (
                        (REPLACE(WLTFIRSTNM || WLTMIDDLENM || WLTLASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_T || q'[' ) OR
                        (REPLACE(WLTFIRSTNM || WLTLASTNM || WLTMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTWO_T || q'[' )
                    )
                )
                OR
                (
                    REPLACE(']' || WLFULLNMTHREE_T || q'[' , ']' || l_search_type_operator || q'[') IS NOT NULL
                    AND
                    (
                        (REPLACE(WLTFIRSTNM || WLTMIDDLENM || WLTLASTNM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_T || q'[' ) OR
                        (REPLACE(WLTFIRSTNM || WLTLASTNM || WLTMIDDLENM, ' ', '') ]' || l_search_type_string || q'[ ']' || WLFULLNMTHREE_T || q'[' )
                    )
                )
            ) 
            ]'
            || CASE WHEN l_sex IS NOT NULL THEN q'[ AND W.sex = ']' || l_sex || q'[' ]' END
            ;
            
            IF TRIM(l_query) IS NOT NULL THEN
                EXECUTE IMMEDIATE l_query INTO V_Results;
            END IF;
                
            --dbms_output.put_line('Step4 query :' || l_query);
            --dbms_output.put_line('Step4 :' || V_Results.COUNT);
        
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
        END;
        -- 4: _END
    END IF;
    
    -- append and init
    IF V_Results.COUNT > 0 THEN
        append_coll;
    END IF;
    
    --dbms_output.put_line('Result V_Results:' || V_Results.COUNT);
    --dbms_output.put_line('Result P_WLCD:' || P_WLCD.COUNT);

    IF P_WLCD IS NOT NULL AND P_WLCD.COUNT > 0 THEN
        BEGIN
            INSERT INTO pibicsdm2.FOUNDWLResults (WLCD, MOVEMENTID, SYSTEMDATE)
            SELECT 
                column_value AS WLCD
                , P_MOVEMENTID
                , SYSDATE
            FROM TABLE(P_WLCD);
            
            -- moved to the bottom
            --commit;
            
        EXCEPTION
            WHEN OTHERS THEN
                -- use logger here
                NULL;
        END;
    END IF;
  
  -- close dblink transaction
  COMMIT;

END P_CHK_BLACKLIST;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "DL_BLACKLIST";
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "SERVAPP";
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "BIOSAADM";
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "PIBICSAPP";
  GRANT DEBUG ON "PIBICSDM2"."P_CHK_BLACKLIST" TO "DL_BORDERCONTROL";
