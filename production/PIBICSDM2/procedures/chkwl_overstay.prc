CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CHKWL_OVERSTAY" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       CHKWL_OVERSTAY
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
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    batchlogno_seq number(20);
    file_ut UTL_FILE.FILE_TYPE;    
    
CURSOR C1 IS
              
    select * from immoverstay where to_char(inoutdte, 'YYYYMM') between '201401' and '201502' ;
    
    REC_TM C1%ROWTYPE;
BEGIN

        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'CHKWL_OVERSTAY', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_CHKWL_OVERSTAYT' || sysdateFile || '.txt', 'W');
        utl_file.put_line(file_ut, sysdateTxt || ' Start PS_CHKWL_OVERSTAYT .... !!!');
        utl_file.fflush(file_ut);

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
                AND (WN.NATIONCD = REC_TM.NATIONCD OR WN.NATIONCD IN('S21','U05')) AND WN.BIRTHDTE = REC_TM.BIRTHDTE 
                AND FLAGCHECKPOINT IS NULL AND W.REASONCD <> '0076'
                --AND FLAGCHECKPOINT IS NULL
                AND ROWNUM = 1
            )
    LOOP
        UPDATE IMMOVERSTAY SET MATCH_NAME = 'Y', MATCH_NAME_WLCD = ITEMBKL1.WLCD WHERE IOVSEQNO = REC_TM.IOVSEQNO;
        COMMIT;
    END LOOP;--Loop   
        
    <<IITEMBKL2_LOOP>> FOR ITEMBKL2 IN
            (
               SELECT W.WLCD, WN.SEQNO,WN.WLTLASTNM,WN.WLTFIRSTNM,WN.WLTMIDDLENM,WN.WLELASTNM,WN.WLEMIDDLENM,WN.WLEFIRSTNM,
               WN.NATIONCD,WN.BIRTHDTE,W.SEX,C.NATIONTNM,C.NATIONENM FROM WATCHLIST W, WATCHLISTNM WN, COUNTRY C, WLINDICATECARD WC 
               WHERE W.WLCD=WN.WLCD AND FLAGCHECKPOINT IS NULL AND WN.NATIONCD=C.COUNTCD AND W.WLCD=WC.WLCD(+) 
               AND W.REASONCD <> '0076' AND FLAGCHECKPOINT IS NULL AND WN.NATIONCD = REC_TM.NATIONCD AND WC.DOCNO = REC_TM.TDTNO
               AND ROWNUM = 1
            )
    LOOP
        UPDATE IMMOVERSTAY SET MATCH_TDTNO = 'Y', MATCH_TDTNO_WLCD = ITEMBKL2.WLCD WHERE IOVSEQNO = REC_TM.IOVSEQNO;
        COMMIT;
    END LOOP;--Loop   
        
           totalrownum := totalrownum + 1;
           commitrow := commitrow + 1;
            update batchlog set prrow = prrow + 1  where batchlogno = batchlogno_seq;
            commit;

            utl_file.fflush(file_ut);
                      
    END LOOP;        
    CLOSE C1;

        update batchlog  set totalrow = totalrownum, prrow = totalrownum, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        utl_file.fflush(file_ut);
        utl_file.put_line(file_ut, sysdateTxt || ' End PS_CHKWL_OVERSTAYT .... !!!');
        utl_file.fflush(file_ut);
        utl_file.fclose(file_ut);
COMMIT;

END;
END CHKWL_OVERSTAY;
/
  GRANT EXECUTE ON "PIBICSDM2"."CHKWL_OVERSTAY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CHKWL_OVERSTAY" TO "BIOSAADM";
