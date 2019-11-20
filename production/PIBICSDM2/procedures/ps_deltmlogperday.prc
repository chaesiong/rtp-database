CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_DELTMLOGPERDAY" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_DELTMLOGPERDAY
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        07/08/2015   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_DELTMLOGPERDAY
      Sysdate:         07/08/2015
      Date and Time:   07/08/2015, 15:54:01, and 07/08/2015 15:54:01
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
   totallogtm number(20);
   batchlogno_seq number(20);
   v_date varchar(10);
   v_datelogtm varchar(8);
   
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        v_date := to_char(sysdate - 1, 'dd/mm/yyyy');
        v_datelogtm := to_char(sysdate - 1, 'yyyymmdd');
        commitrow := 0;
        totaldelete := 0;
        
        select count('x') into totaldelete from tminoutlog where to_char(logdte, 'dd/mm/yyyy') = v_date;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'LOGTMDEL', '999', 'delete tminoutlog '||v_date, null, totaldelete, 0, 0, sysdate, null, '1', 'SUMET.C', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        select count('x') into totallogtm from logtminout where to_char(logdte, 'yyyymmdd') = v_datelogtm;
        
        if totaldelete = totallogtm then
            LOOP
                BEGIN
                    delete tminoutlog where to_char(logdte, 'dd/mm/yyyy') = v_date and rownum <= 10000;
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
    else
        update batchlog set endprocess = sysdate, note = 'ข้อมูล TMINOUTLOG ไม่เท่ากับ LOGTIMINOUT' where batchlogno = batchlogno_seq;
    end if;
    
    END;
END PS_DELTMLOGPERDAY;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_DELTMLOGPERDAY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_DELTMLOGPERDAY" TO "BIOSAADM";
