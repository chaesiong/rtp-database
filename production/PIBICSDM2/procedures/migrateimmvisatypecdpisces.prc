CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMMVISATYPECDPISCES" IS
tmpVar NUMBER;
/*****************************************************************************
   NAME:       MIGRATEIMMVISACDPIBICS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        22/02/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEIMMVISACDPIBICS
      Sysdate:         22/02/2011
      Date and Time:   22/02/2011, 16:18:05, and 22/02/2011 16:18:05
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
PERMITDAYS DATE;

file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
   select * from immigration where personid in (select personid from tmmain_pis) and cardtype=1 and visatypecd in (select OLD_VISATYPE from visatype);
    rec_imm c1%rowtype;  
begin
 totalrow:=0;
  commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateImmVisaPisces'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migrate visatypecd pisces@Immigration .... !!!');utl_file.fflush(file_ut);

 open c1;
 loop fetch c1 into rec_imm; exit when c1%notfound;
    PERMITDAYS := NULL;
    if rec_imm.cardtype=1 and rec_imm.nationcd <> 'T03' and rec_imm.visatypecd is not null then
        select rec_imm.inoutdte + visatype.permittdays -1 into PERMITDAYS from visatype where visatype.visatypecd = migratevisatypecd(rec_imm.visatypecd);         
    end if;
    
    update immigration set visatypecd = migrateVisatypeCd(rec_imm.visatypecd), visatypecdorg = visatypecd, visaexpdte = PERMITDAYS  where personid = rec_imm.personid;
    
   commit; 
   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
   if commitrow = 1000 then
    commitrow:=0;
    utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut); 
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End migrate visatypecd pisces@Immigration .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
     utl_file.put_line(file_ut,'Error by personid :'||rec_imm.personid);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATEIMMVISATYPECDPISCES;
/
