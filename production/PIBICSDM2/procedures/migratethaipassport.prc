CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATETHAIPASSPORT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migratethaipassport
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        16/03/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migratethaipassport
      Sysdate:         16/03/2011
      Date and Time:   16/03/2011, 15:04:30, and 16/03/2011 15:04:30
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
    --select * from thaipassport;
    select * from thaipassport;
    rec_pass c1%rowtype;  
begin
 totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateThaipassportPibics'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migrate Passprot thai pibics@Thaipassport .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_pass; exit when c1%notfound;
    if (rec_pass.passportsts='1') then
        update thaipassport set pass_seqno=1, pps_seqno=1, typedpassport='A', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;
    elsif (rec_pass.passportsts='2') then
        update thaipassport set pass_seqno=2, pps_seqno=1, typedpassport='A', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;
    elsif (rec_pass.passportsts='3') then
        update thaipassport set pass_seqno=3, pps_seqno=1, typedpassport='A', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;
    elsif (rec_pass.passportsts='5') then
        update thaipassport set pass_seqno=4, pps_seqno=1, typedpassport='A', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;
    elsif (rec_pass.passportsts='6') then
        update thaipassport set pass_seqno=5, pps_seqno=1, typedpassport='A', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;                        
    elsif (rec_pass.passportsts='C') then
        update thaipassport set pass_seqno=6, pps_seqno=2, typedpassport='C', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno; 
    elsif (rec_pass.passportsts='L') then
        update thaipassport set pass_seqno=7, pps_seqno=3, typedpassport='U', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;                        
    elsif (rec_pass.passportsts='R') then
        update thaipassport set pass_seqno=9, pps_seqno=4, typedpassport='U', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;                                                       
    elsif (rec_pass.passportsts='X') then
        update thaipassport set pass_seqno=6, pps_seqno=2, typedpassport='C', create_date=sysdate, update_date=sysdate where citizenid=rec_pass.citizenid and passportno = rec_pass.passportno;        
    end if;
   commit; 
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End migrate Passprot thai pibics@Thaipassport .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
     utl_file.put_line(file_ut,'Error by passportno :'||rec_pass.passportno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migratethaipassport;
/
