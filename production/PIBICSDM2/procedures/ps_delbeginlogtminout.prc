CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_DELBEGINLOGTMINOUT" (v_yyyymm in varchar2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_DELBEGINLOGTMINOUT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        07/08/2015   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_DELBEGINLOGTMINOUT
      Sysdate:         07/08/2015
      Date and Time:   07/08/2015, 13:51:04, and 07/08/2015 13:51:04
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   DECLARE
   sysdateTxt varchar2(25);
   sysdateFile varchar2(8);
   sysdateCurrent varchar2(8);
   commitrow number(20);
   totaldelete number(20);
   batchlogno_seq number(20);
   v_yyyy varchar(4) := substr(v_yyyymm, 1, 4);
   v_mm varchar(2) := substr(v_yyyymm, 5, 6);
   v_dd varchar(2);
   
   BEGIN
    sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
    sysdateFile := to_char(sysdate, 'yyyymmdd');
    sysdateCurrent := to_char(sysdate, 'yyyymmdd');
    commitrow := 0;
    totaldelete := 0;
    
    select count('x') into totaldelete from tminoutlog where to_char(logdte, 'yyyymm') = v_yyyymm;
    
    batchlogno_seq := batchlog_seq.nextval;
    insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
    values (batchlogno_seq, 'LOGTM', '999', 'delete data begin tminoutlog '||v_yyyymm, null, totaldelete, 0, 0, sysdate, null, '1', 'SUMET.C', sysdate, 'N', 0, 0, 0, sysdate);
    commit;
    
    FOR dd IN 1..31 LOOP
        LOOP
            BEGIN
                IF dd < 10 THEN
                    v_dd := '0'||dd;
                ELSE
                    v_dd := dd;
                END IF;
                delete tminoutlog where to_char(logdte, 'dd/mm/yyyy') = v_dd||'/'||v_mm||'/'||v_yyyy and rownum <= 10000;
                IF SQL%NOTFOUND THEN
                    EXIT;
                ELSIF SQL%FOUND THEN
                    commitrow := commitrow + SQL%ROWCOUNT;
                    update batchlog set prrow = commitrow where batchlogno = batchlogno_seq;
                    commit;
                END IF; 
            END; 
        END LOOP;
        
        update batchlog set prrow = commitrow, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
    END LOOP;
   END;
END PS_DELBEGINLOGTMINOUT;
/
