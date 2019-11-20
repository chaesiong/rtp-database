CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CHKWL_THAILANDELITE" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       CHKWL_THAILANDELITE
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        21/04/2014   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     CHKWL_THAILANDELITE
      Sysdate:         21/04/2014
      Date and Time:   21/04/2014, 17:38:19, and 21/04/2014 17:38:19
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
DECLARE
    WLFULLNMTWO VARCHAR(100);
    WLFULLNMTHREE VARCHAR(100);
CURSOR C1 IS              
    SELECT * FROM THAILANDELITE_TMP ;
    REC_TM C1%ROWTYPE;
BEGIN
    OPEN C1;
    LOOP
    FETCH C1 INTO REC_TM; EXIT WHEN C1%NOTFOUND;
    
    WLFULLNMTWO := NULL;
    WLFULLNMTHREE := NULL;
    
    WLFULLNMTWO := REPLACE(REC_TM.EFIRSTNM || REC_TM.EFAMILYNM,' ','')||'%';
    WLFULLNMTHREE := REPLACE(REC_TM.EFIRSTNM || REC_TM.EFAMILYNM || REC_TM.EMIDDLENM,' ','')||'%';
    <<IITEMBKL1_LOOP>> FOR ITEMBKL1 IN
            (
               SELECT W.WLCD, WN.SEQNO,WN.WLTLASTNM,WN.WLTFIRSTNM,WN.WLTMIDDLENM,WN.WLELASTNM,WN.WLEMIDDLENM,
               WN.WLEFIRSTNM,WN.NATIONCD,WN.BIRTHDTE, W.SEX,C.NATIONTNM,C.NATIONENM 
                FROM WATCHLIST W, WATCHLISTNM WN, COUNTRY C WHERE W.WLCD=WN.WLCD AND WN.NATIONCD=C.COUNTCD AND
                ((REPLACE(WLEFIRSTNM||WLEMIDDLENM||WLELASTNM, ' ', '') LIKE WLFULLNMTWO) OR (REPLACE(WLEFIRSTNM||WLELASTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO) OR
                (REPLACE(WLEMIDDLENM||WLEFIRSTNM||WLELASTNM, ' ', '') LIKE WLFULLNMTWO) OR (REPLACE(WLEMIDDLENM||WLELASTNM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO) OR
                (REPLACE(WLELASTNM||WLEFIRSTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTWO) OR (REPLACE(WLELASTNM||WLEMIDDLENM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTWO) OR
                (REPLACE(WLEFIRSTNM||WLEMIDDLENM||WLELASTNM, ' ', '') LIKE WLFULLNMTHREE) OR (REPLACE(WLEFIRSTNM||WLELASTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE) OR
                (REPLACE(WLEMIDDLENM||WLEFIRSTNM||WLELASTNM, ' ', '') LIKE WLFULLNMTHREE) OR (REPLACE(WLEMIDDLENM||WLELASTNM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE) OR
                (REPLACE(WLELASTNM||WLEFIRSTNM||WLEMIDDLENM, ' ', '') LIKE WLFULLNMTHREE) OR (REPLACE(WLELASTNM||WLEMIDDLENM||WLEFIRSTNM, ' ', '') LIKE WLFULLNMTHREE))
                AND (WN.NATIONCD = REC_TM.NATIONCD OR WN.NATIONCD IN('S21','U05')) AND WN.BIRTHDTE = REC_TM.BIRTHDTE AND FLAGCHECKPOINT IS NULL AND W.REASONCD <> '0076'
                AND FLAGCHECKPOINT IS NULL
                AND ROWNUM = 1
            )
    LOOP
        UPDATE THAILANDELITE_TMP SET MATCH_NAME = 'Y', MATCH_NAME_WLCD = ITEMBKL1.WLCD WHERE NO = REC_TM.NO;
        COMMIT;
    END LOOP;--Loop   
        
    <<IITEMBKL2_LOOP>> FOR ITEMBKL2 IN
            (
               SELECT W.WLCD, WN.SEQNO,WN.WLTLASTNM,WN.WLTFIRSTNM,WN.WLTMIDDLENM,WN.WLELASTNM,WN.WLEMIDDLENM,WN.WLEFIRSTNM,
               WN.NATIONCD,WN.BIRTHDTE,W.SEX,C.NATIONTNM,C.NATIONENM FROM WATCHLIST W, WATCHLISTNM WN, COUNTRY C, WLINDICATECARD WC 
               WHERE W.WLCD=WN.WLCD AND FLAGCHECKPOINT IS NULL AND WN.NATIONCD=C.COUNTCD AND W.WLCD=WC.WLCD(+) 
               AND W.REASONCD <> '0076' AND FLAGCHECKPOINT IS NULL AND WN.NATIONCD = REC_TM.NATIONCD AND WC.DOCNO = REC_TM.PASSPORTNO
               AND ROWNUM = 1
            )
    LOOP
        UPDATE THAILANDELITE_TMP SET MATCH_TDTNO = 'Y', MATCH_TDTNO_WLCD = ITEMBKL2.WLCD WHERE NO = REC_TM.NO;
        COMMIT;
    END LOOP;--Loop   
        
                        
    END LOOP;        
    CLOSE C1;
COMMIT;

END;
END CHKWL_THAILANDELITE;
/
  GRANT EXECUTE ON "PIBICSDM2"."CHKWL_THAILANDELITE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CHKWL_THAILANDELITE" TO "BIOSAADM";
