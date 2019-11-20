CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHK_BLACKLIST_20190621" 
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
    P_PIBICSPRDCONN     IN  NUMBER   DEFAULT 0,
    P_WLCD              OUT VARCHAR2
) AS

    -- added for direct sql usage
    PRAGMA AUTONOMOUS_TRANSACTION;

    V_Results          VARCHAR2(100) := 'NotFound';
    WLFULLNMTWO         VARCHAR2(1000) := NULL;
    WLFULLNMTHREE       VARCHAR2(1000) := NULL;
    WLFULLNMTWO_SP      VARCHAR2(1000) := NULL;
    WLFULLNMTHREE_SP    VARCHAR2(1000) := NULL;

    -- 
    l_query             VARCHAR2(3500) := NULL;
    --

BEGIN

    -- add condtions here to return if required params are null
    WLFULLNMTWO   := REPLACE(P_EFIRSTNM || P_EFAMILYNM, ' ', '') || '%';
    WLFULLNMTHREE := REPLACE(P_EFIRSTNM || P_EFAMILYNM || P_EMIDDLENMN, ' ', '') || '%';

    WLFULLNMTWO_SP   := REPLACE(P_EFAMILYNM || P_EFIRSTNM, ' ', '') || '%';
    WLFULLNMTHREE_SP := REPLACE(P_EFAMILYNM || P_EFIRSTNM || P_EMIDDLENMN, ' ', '') || '%';

    IF P_NATIONCD = 'V03' THEN
        WLFULLNMTWO    := NULL;
        WLFULLNMTWO_SP := NULL;
    END IF;

    -- 1: _START
    BEGIN
        l_query := 
        q'[ 
        SELECT 
            CAST(COLLECT(DISTINCT w.WLCD) AS TT_VARCHAR2) 
        ]'
        || 
        CASE P_PIBICSPRDCONN
            WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN ]'
            ELSE q'[ FROM watchlist W, WATCHLISTNM WN ]'
        END
        || 
        q'[ 
        WHERE W.WLCD = WN.WLCD
        AND ((REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE ']' || WLFULLNMTWO   || q'[' ) OR
            (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTWO   || q'[' ) OR
            (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE  ']' || WLFULLNMTWO   || q'[' ) OR
            (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTWO   || q'[' ) OR
            (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTWO   || q'[' ) OR
            (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTWO   || q'[' ) OR
            (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE || q'[' ) OR
            (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTHREE || q'[' ) OR
            (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE || q'[' ) OR
            (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE || q'[' ) OR
            (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTHREE || q'[' ) OR
            (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE || q'[' ))
        AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
        AND WN.birthdte = CASE 
                            WHEN LENGTH(WN.birthdte) > 4 THEN ']' || P_BIRTHDTE || q'[' 
                            ELSE SUBSTR( ']' || P_BIRTHDTE || q'[' , -4, 4) 
                          END
        ]';

        IF TRIM(l_query) IS NOT NULL THEN
            EXECUTE IMMEDIATE l_query INTO V_Results;
        END IF;

        P_WLCD := V_Results;
        --dbms_output.put_line('Step1 :' || V_Results);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- 2: _START
            BEGIN
                l_query := 
                q'[
                SELECT 
                    CAST(COLLECT(DISTINCT w.WLCD) AS DL_BLACKLIST.TT_VARCHAR2) 
                ]'
                || 
                CASE P_PIBICSPRDCONN
                    WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN ]'
                    ELSE q'[ FROM watchlist W, WATCHLISTNM WN ]'
                END
                || 
                q'[ 
                WHERE W.WLCD = WN.WLCD
                AND ((REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE ']' || WLFULLNMTWO_SP   || q'[' ) OR
                    (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTWO_SP   || q'[' ) OR
                    (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE  ']' || WLFULLNMTWO_SP   || q'[' ) OR
                    (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTWO_SP   || q'[' ) OR
                    (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTWO_SP   || q'[' ) OR
                    (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTWO_SP   || q'[' ) OR
                    (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE_SP || q'[' ) OR
                    (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTHREE_SP || q'[' ) OR
                    (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE_SP || q'[' ) OR
                    (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE_SP || q'[' ) OR
                    (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE  ']' || WLFULLNMTHREE_SP || q'[' ) OR
                    (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE  ']' || WLFULLNMTHREE_SP || q'[' ))
                AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
                AND WN.birthdte = CASE 
                                      WHEN LENGTH(WN.birthdte) > 4 THEN ']' || P_BIRTHDTE || q'[' 
                                      ELSE SUBSTR( ']' || P_BIRTHDTE || q'[' , -4, 4) 
                                  END
                ]';

                IF TRIM(l_query) IS NOT NULL THEN
                    EXECUTE IMMEDIATE l_query INTO V_Results;
                END IF;

                P_WLCD := V_Results;
                --dbms_output.put_line('Step2 :' || V_Results);

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    -- 3: _START
                    BEGIN
                        l_query := 
                        q'[
                        SELECT 
                            CAST(COLLECT(DISTINCT w.WLCD) AS DL_BLACKLIST.TT_VARCHAR2) 
                        ]'
                        || 
                        CASE P_PIBICSPRDCONN
                            WHEN 1 THEN q'[ FROM v_watchlist_prod W, v_WATCHLISTNM_prod WN, v_WLINDICATECARD_prod WC ]'
                            ELSE q'[ FROM watchlist W, WATCHLISTNM WN, WLINDICATECARD WC ]'
                        END
                        || 
                        q'[ 
                        WHERE  (REPLACE(WC.DOCNO, '-', '') = REPLACE( ']' || P_PASSNO || q'[' , '-', '') OR
                                REPLACE(WC.DOCNO, '-', '') = REPLACE( ']' || P_IDCard || q'[' , '-', ''))
                        AND W.WLCD = WC.WLCD
                        AND WN.WLCD = W.WLCD
                        AND WN.NATIONCD = ']' || P_NATIONCD || q'[' 
                        ]';

                        IF TRIM(l_query) IS NOT NULL THEN
                            EXECUTE IMMEDIATE l_query INTO V_Results;
                        END IF;

                        P_WLCD := V_Results;
                        --dbms_output.put_line('Step3 :' || V_Results);

                    EXCEPTION
                        WHEN NO_DATA_FOUND THEN
                            NULL;
                    END;
                    -- 3: _END
            END;
            -- 2: _END
    END;
    -- 1: _END

    IF V_Results IS NOT NULL THEN
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

END P_CHK_BLACKLIST_20190621;
/
  GRANT EXECUTE ON "PIBICSDM2"."P_CHK_BLACKLIST_20190621" TO "BIOSAADM";
