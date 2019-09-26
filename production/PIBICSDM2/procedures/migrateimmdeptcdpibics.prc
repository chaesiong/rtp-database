CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMMDEPTCDPIBICS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEIMMDEPTCDPIBICS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        22/02/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEIMMDEPTCDPIBICS
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
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from immigration;
    rec_imm c1%rowtype;  
begin
 totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateImmDeptPibics'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migrate deptcd pibics@Immigration .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_imm; exit when c1%notfound;
    update immigration set deptcd = migrateDeptCd(rec_imm.deptcdorg) where personid = rec_imm.personid;
   commit; 
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End migrate deptcd pibics@Immigration .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
     utl_file.put_line(file_ut,'Error by personid :'||rec_imm.personid);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATEIMMDEPTCDPIBICS;
/
