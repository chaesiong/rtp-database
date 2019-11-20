CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_PROCESSFINES" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_PROCESSFINES
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        08/02/2018   ITTIPON-S       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_PROCESSFINES
      Sysdate:         08/02/2018
      Date and Time:   08/02/2018, 09:18:55, and 08/02/2018 09:18:55
      Username:        ITTIPON-S (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
    DECLARE
    seqProgram varchar2(50);
    batchlogno_seq number(20);
    
    BEGIN
        
        seqProgram := '0';
       
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAY ALL ' || to_char(sysdate -1, 'YYYYMMDD'), null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        PS_TMOVERSTAY;
        seqProgram := seqProgram ||' '|| '1';
        
        PS_OVERSTAYOUT;
        seqProgram := seqProgram ||' '|| '2';
        
        PS_OVERSTAYIN;
        seqProgram := seqProgram ||' '|| '3';
                
        PS_OVERSTAYEXT;
        seqProgram := seqProgram ||' '|| '4';

        PS_OVERSTAYCHNG;
        seqProgram := seqProgram ||' '|| '5';

        PS_OVERSTAYRQS;
        seqProgram := seqProgram ||' '|| '6';

        PS_OVERSTAY_IFRIP_FINES_BL;
        seqProgram := seqProgram ||' '|| '7';
        
        PS_OVERSTAYFN90;
        seqProgram := seqProgram ||' '|| '9';
        
        PS_OVERSTAYFN24;
        seqProgram := seqProgram ||' '|| '8';
        
        update batchlog set file_name = file_name || ' ' || seqProgram, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        
    EXCEPTION
     WHEN NO_DATA_FOUND THEN
        NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
        RAISE;
    END;
END PS_PROCESSFINES;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_PROCESSFINES" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_PROCESSFINES" TO "BIOSAADM";
