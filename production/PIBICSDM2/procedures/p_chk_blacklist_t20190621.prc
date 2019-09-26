CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."P_CHK_BLACKLIST_T20190621" 

(P_MOVEMENTID IN VARCHAR2,
 P_NATIONCD   IN VARCHAR2,
 P_PASSNO     IN VARCHAR2,
 P_IDCard     IN VARCHAR2,
 P_BIRTHDTE   IN VARCHAR2,
 P_SEX        IN varchar2,
 P_EFIRSTNM   IN VARCHAR2,
 P_EMIDDLENMN IN VARCHAR2,
 P_EFAMILYNM  IN VARCHAR2,
 P_TFIRSTNM   IN VARCHAR2,
 P_TMIDDLENMN IN VARCHAR2,
 P_TFAMILYNM  IN VARCHAR2,
 P_WLCD       OUT VARCHAR2) AS


-- P_WLCD VARCHAR2(100) := 'NotFound';
  V_Results        VARCHAR2(100) := 'NotFound';
  WLFULLNMTWO      VARCHAR2(100) := null;
  WLFULLNMTHREE    VARCHAR2(100) := null;
  WLFULLNMTWO_SP   VARCHAR2(100) := null;
  WLFULLNMTHREE_SP VARCHAR2(100) := null;
  WLFULLNMTWO_T    VARCHAR2(100) := null;
  WLFULLNMTHREE_T  VARCHAR2(100) := null;
BEGIN

  -- add condtions here to return if required params are null
  WLFULLNMTWO   := REPLACE(P_EFIRSTNM || P_EFAMILYNM, ' ', '') || '%';
  WLFULLNMTHREE := REPLACE(P_EFIRSTNM || P_EFAMILYNM || P_EMIDDLENMN,' ','') || '%';

  WLFULLNMTWO_SP   := REPLACE(P_EFAMILYNM || P_EFIRSTNM, ' ', '') || '%';
  WLFULLNMTHREE_SP := REPLACE(P_EFAMILYNM || P_EFIRSTNM || P_EMIDDLENMN,' ','') || '%';

  WLFULLNMTWO_T   := REPLACE(P_TFIRSTNM||'%'|| P_TFAMILYNM, ' ', '') || '%';
  WLFULLNMTHREE_T := REPLACE(P_TFIRSTNM||'%'|| P_TFAMILYNM || P_TMIDDLENMN,' ','') || '%';

  IF P_NATIONCD = 'V03' THEN
    WLFULLNMTWO    := null;
    WLFULLNMTWO_SP := null;
  END IF;
  
    -- 1: _START
  begin
    select w.WLCD
      into V_Results
      FROM V_watchlist_prod W, V_WATCHLISTNM_PROD WN
     WHERE W.WLCD = WN.WLCD
       AND ((REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE WLFULLNMTWO) OR
           (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO) OR
           (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE WLFULLNMTWO) OR
           (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO) OR
           (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO) OR
           (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO) OR
           (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE WLFULLNMTHREE) OR
           (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE) OR
           (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE WLFULLNMTHREE) OR
           (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE) OR
           (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE) OR
           (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE))
       AND WN.NATIONCD = P_NATIONCD
       AND WN.birthdte = case
             when LENGTH(WN.birthdte) > 4 then
              P_BIRTHDTE
             else
              substr(P_BIRTHDTE, -4, 4)
           end
       AND ROWNUM = 1;
  
    P_WLCD := V_Results;
    dbms_output.put_line('Step1 :' || V_Results);
  
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
      -- 1: _END


      -- 2: _START      
      IF V_Results = 'NotFound' THEN
      begin
        select w.WLCD
          into V_Results
          FROM V_watchlist_prod W, V_WATCHLISTNM_PROD WN
         WHERE W.WLCD = WN.WLCD
           AND ((REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE WLFULLNMTWO_SP) OR
               (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO_SP) OR
               (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE WLFULLNMTWO_SP) OR
               (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO_SP) OR
               (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO_SP) OR
               (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO_SP) OR
               (REPLACE(WLEFIRSTNM || WLEMIDDLENM || WLELASTNM, ' ', '') LIKE WLFULLNMTHREE_SP) OR
               (REPLACE(WLEFIRSTNM || WLELASTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE_SP) OR
               (REPLACE(WLEMIDDLENM || WLEFIRSTNM || WLELASTNM, ' ', '') LIKE WLFULLNMTHREE_SP) OR
               (REPLACE(WLEMIDDLENM || WLELASTNM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE_SP) OR
               (REPLACE(WLELASTNM || WLEFIRSTNM || WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE_SP) OR
               (REPLACE(WLELASTNM || WLEMIDDLENM || WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE_SP))
           AND WN.NATIONCD = P_NATIONCD
           AND WN.birthdte = case
                 when LENGTH(WN.birthdte) > 4 then
                  P_BIRTHDTE
                 else
                  substr(P_BIRTHDTE, -4, 4)
               end
           AND ROWNUM = 1;
      
        P_WLCD := V_Results;
        dbms_output.put_line('Step2 :' || V_Results);
        
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    END IF;
      -- 2: _END

      -- 3: _START      
      IF V_Results = 'NotFound' THEN      
            begin        
            select w.WLCD
              into V_Results
              FROM V_watchlist_prod      W,
                   V_WATCHLISTNM_PROD    WN,
                   V_WLINDICATECARD_PROD WC
             WHERE (replace(WC.DOCNO, '-', '') = replace(P_PASSNO, '-', '') or replace(WC.DOCNO, '-', '') = replace(P_IDCard, '-', ''))
               AND W.WLCD = WC.WLCD
               AND WN.WLCD = W.WLCD
               AND WN.NATIONCD = P_NATIONCD
               AND ROWNUM = 1;
          
            P_WLCD := V_Results;
            dbms_output.put_line('Step3 :' || V_Results);
          
         EXCEPTION
            WHEN NO_DATA_FOUND THEN
                NULL;
        END;
        -- 3: _END
    END IF;
    

      -- 4: _START    Check Nation = Thailand  
      IF V_Results = 'NotFound' THEN    
      IF P_NATIONCD = 'T03' THEN
      begin
        select w.WLCD
          into V_Results
          FROM V_watchlist_prod W, V_WATCHLISTNM_PROD WN
         WHERE W.WLCD = WN.WLCD
           AND ((REPLACE(WLTFIRSTNM || WLTMIDDLENM || WLTLASTNM, ' ', '') LIKE WLFULLNMTWO_T) OR
               (REPLACE(WLTFIRSTNM || WLTLASTNM || WLTMIDDLENM, ' ', '') LIKE WLFULLNMTWO_T) OR
               (REPLACE(WLTMIDDLENM || WLTFIRSTNM || WLTLASTNM, ' ', '') LIKE WLFULLNMTWO_T) OR
               (REPLACE(WLTMIDDLENM || WLTLASTNM || WLTFIRSTNM, ' ', '') LIKE WLFULLNMTWO_T) OR
               (REPLACE(WLTLASTNM || WLTFIRSTNM || WLTMIDDLENM, ' ', '') LIKE WLFULLNMTWO_T) OR
               (REPLACE(WLTLASTNM || WLTMIDDLENM || WLTFIRSTNM, ' ', '') LIKE WLFULLNMTWO_T) OR
               (REPLACE(WLTFIRSTNM || WLTMIDDLENM || WLTLASTNM, ' ', '') LIKE WLFULLNMTHREE_T) OR
               (REPLACE(WLTFIRSTNM || WLTLASTNM || WLTMIDDLENM, ' ', '') LIKE WLFULLNMTHREE_T) OR
               (REPLACE(WLTMIDDLENM || WLTFIRSTNM || WLTLASTNM, ' ', '') LIKE WLFULLNMTHREE_T) OR
               (REPLACE(WLTMIDDLENM || WLTLASTNM || WLTFIRSTNM, ' ', '') LIKE WLFULLNMTHREE_T) OR
               (REPLACE(WLTLASTNM || WLTFIRSTNM || WLTMIDDLENM, ' ', '') LIKE WLFULLNMTHREE_T) OR
               (REPLACE(WLTLASTNM || WLTMIDDLENM || WLTFIRSTNM, ' ', '') LIKE WLFULLNMTHREE_T))
           AND WN.NATIONCD = P_NATIONCD
           AND WN.birthdte = case
                 when LENGTH(WN.birthdte) > 4 then
                  P_BIRTHDTE
                 else
                  substr(P_BIRTHDTE, -4, 4)
               end
           AND ROWNUM = 1
           ;
      
        P_WLCD := V_Results;
        dbms_output.put_line('Step4 :' || V_Results);
        
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    END IF;
END IF;
      -- 4: _END

dbms_output.put_line('Insert log :' || V_Results);
  if V_Results <> 'NotFound' then
    begin
      INSERT INTO pibicsdm2.FOUNDWLResults
        (WLCD, MOVEMENTID, SYSTEMDATE)
      VALUES
        (P_WLCD, P_MOVEMENTID, sysdate);
      --commit;
      -- added exception
    exception
      when others then
        -- use logger here
        NULL;
    end;
  end if;
  commit;

END P_CHK_BLACKLIST_T20190621;
/
