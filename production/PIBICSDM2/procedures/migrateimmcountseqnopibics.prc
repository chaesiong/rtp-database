CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMMCOUNTSEQNOPIBICS" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
cmtrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from immigration where count_seqno is null;
    rec_imm c1%rowtype;  
begin
 totalrow:=0;cmtrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateImmCountseqno'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migrate Countseqno pibics@Immigration .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_imm; exit when c1%notfound;
    update immigration set remark = trim(remark) where personid = rec_imm.personid;
   commit; 
   totalrow:=totalrow+1;
   cmtrow:=cmtrow+1;
    if cmtrow = 1000 then
        --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End migrate Countseqno pibics@Immigration .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
     utl_file.put_line(file_ut,'Error by personid :'||rec_imm.personid);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATEIMMCOUNTSEQNOPIBICS;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEIMMCOUNTSEQNOPIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEIMMCOUNTSEQNOPIBICS" TO "BIOSAADM";
