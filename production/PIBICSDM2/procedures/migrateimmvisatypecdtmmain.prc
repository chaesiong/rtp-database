CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMMVISATYPECDTMMAIN" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEIMMVISATYPECDTMMAIN
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        17/11/2011          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEIMMVISATYPECDTMMAIN
      Sysdate:         17/11/2011
      Date and Time:   17/11/2011, 21:04:00, and 17/11/2011 21:04:00
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select tmrunno, indte, invisatypecd, invisaexpdte from tmmain a, visatype b where a.invisatypecd = b.visatypecd and b.permittdays =0 and increusr='PIS001' 
    and invisaexpdte is not null;
    --and tmrunno in ('PIS35980783IMM','PIS35980812IMM');
    rec_imm c1%rowtype;  
begin
 totalrow:=0;
  commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateTmmainVisaPibics'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migrate visatypecd pibics@tmmain .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_imm; exit when c1%notfound;
    update tmmain set invisaexpdte = null where tmrunno = rec_imm.tmrunno;
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
 utl_file.put_line(file_ut,sysdateTxt||' End migrate visatypecd pibics@tmmain .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmurnno :'||rec_imm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATEIMMVISATYPECDTMMAIN; 
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEIMMVISATYPECDTMMAIN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEIMMVISATYPECDTMMAIN" TO "BIOSAADM";
