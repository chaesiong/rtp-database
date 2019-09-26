CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESS_2M" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PROCESS_2M
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        29/11/2012          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROCESS_2M
      Sysdate:         29/11/2012
      Date and Time:   29/11/2012, 12:46:14, and 29/11/2012 12:46:14
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    totalrow number(20);
    file_ut UTL_FILE.FILE_TYPE;
    cursor c1  is 
    
    select cardtype, tm6no, deptcd, inoutdate, nationcd, convcd, convregno, efamilynm, efirstnm, emiddlenm, visatypecd, 
    sex, birthdte, tdtno, visaexpdte, personid from vw_tmmain where nationcd in ('A05', 'K02', 'J02','T03','B12') 
    and to_char(inoutdate, 'yyyymmdd') between '20140801' and '20140830'
    and deptcd in ('00S07', '00S10', '00146', '00210', '00S08')     
    and tdtno not in ('PASSPORT') and tm6no not in ('0000000');
    
    rectm c1%rowtype;  
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    --dbms_output.put_line(sysdateTxt||' Start Process Match Tmmain .... !!!');
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','logMatch'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Process 2M to tminout .... !!!');
    open c1;
        loop 
        fetch c1 into rectm; 
        exit when c1%notfound;

        insert into travel2m (seqno, tm6no, inoutdte, cardtype, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, creusr, credte, personid) 
        values (travel_seqno.nextval, rectm.tm6no, rectm.inoutdate, rectm.cardtype, rectm.efirstnm, rectm.emiddlenm,
         rectm.efamilynm, rectm.sex, rectm.birthdte, rectm.nationcd, rectm.deptcd, '0001', rectm.convcd, rectm.convregno,
         '1', rectm.tdtno, rectm.visatypecd, rectm.visaexpdte, 'DEMOUSER', sysdate, rectm.personid);
         totalrow:=totalrow+1;
     commit;
     if totalrow = 1000000 then
        exit;
     end if;
  END LOOP;--Loop Cursor\
  close c1;
  COMMIT;
  select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
  --dbms_output.put_line(sysdateTxt||' Complete Match Tmmain  ...!!!!');
  utl_file.put_line(file_ut,sysdateTxt||' Complete Match Tmmain  ...!!!!'); 
  UTL_FILE.FCLOSE(file_ut); 
END;

END;
/
