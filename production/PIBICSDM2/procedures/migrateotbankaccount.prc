CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEOTBANKACCOUNT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEOTBANKACCOUNT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        10/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEOTBANKACCOUNT
      Sysdate:         10/09/2012
      Date and Time:   10/09/2012, 16:38:07, and 10/09/2012 16:38:07
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
foundhr varchar2(20);
seqno number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is              
    select a.namekey, a.name, a.sname, b.accno, a.profile_seqno from (
    select a.*, name||sname namekey from hr_profile_ot a
    ) a, (select b.*, replace(name, ' ', '') namekey from banknumber_ot b) b where a.namekey = b.namekey(+);         
    rec_ot c1%rowtype;
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_hrProfileBankOT'||sysdateFile,'W');
    utl_file.put_line(file_ut,sysdateTxt||' Start migrate Bank OT 2 PIBICS Bankaccount .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into rec_ot; exit when c1%notfound;
        foundhr:='NOTFOUND';
        
               seqno:=GetSEQ_RUNNO('OT_BANKACCOUNT');
               --foundhr:='FOUND';
               insert into ot_bankaccount (
               bankacctseqno, bank_seqno, bankacctno, 
               profile_seqno, bankacctname, bankbranch, 
               bankremark, actflag, create_by, 
               create_date, update_by, update_date,  version) 
               values (seqno, 3,  rec_ot.accno,  rec_ot.profile_seqno, rec_ot.name || ' ' || rec_ot.sname,
               null, null, 'A',  'ittipon', sysdate, 'ittipon', sysdate,  0 );
               totalrow:=totalrow+1;
     
        commit;
        end loop;
        
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End migrate Bank OT 2 PIBICS Bankaccount .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;
END MIGRATEOTBANKACCOUNT;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEOTBANKACCOUNT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEOTBANKACCOUNT" TO "BIOSAADM";
