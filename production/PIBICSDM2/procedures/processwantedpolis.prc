CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSWANTEDPOLIS" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from vwwanted_polis where release_flag = 'N' and to_number(to_char(key_date, 'YYYYMMDD')) <=20120424
    order by key_date asc;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_processwantedpolis'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start process orginal wanted polis .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
   
         insert into wanted_polis (
       wpseqno, wpcd, first_name, 
       nickname, last_name, eng_first_name, 
       eng_middle_name, eng_last_name, birth_date, 
       sex, nation_code, polis_name, 
       mobileno, warrantno, warrant_date, 
       warrant_due_date, addr, cmajor_code, 
       id_no, crime_no, crime_year, 
       org_code, offender_no, release_flag, 
       release_date, cause, login_id, 
       key_date, updusr, upddte, 
       flagprocess, remarkprocess) 
    values ( WP_SEQNO.nextval, null, rec_tm.first_name, rec_tm.nickname, rec_tm.last_name, rec_tm.eng_first_name, rec_tm.eng_middle_name, rec_tm.eng_last_name,
     rec_tm.birth_date, rec_tm.sex, rec_tm.nation_code, rec_tm.polis_name, rec_tm.mobileno, rec_tm.warrantno, rec_tm.warrant_date, rec_tm.warrant_due_date,
     rec_tm.addr, rec_tm.cmajor_code, rec_tm.id_no, rec_tm.crime_no, rec_tm.crime_year, rec_tm.org_code, rec_tm.offender_no, rec_tm.release_flag, rec_tm.release_date,
     rec_tm.cause, rec_tm.login_id, rec_tm.key_date, 'WPSORG001', sysdate, null, null );
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1;
    if commitrow = 1000 then
     commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut); 
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End process orginal wanted polis .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
   null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSWANTEDPOLIS;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSWANTEDPOLIS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSWANTEDPOLIS" TO "BIOSAADM";
