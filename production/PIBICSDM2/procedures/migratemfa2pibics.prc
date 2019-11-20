CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEMFA2PIBICS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateMfa2Pibics
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        04/04/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateMfa2Pibics
      Sysdate:         04/04/2012
      Date and Time:   04/04/2012, 15:37:22, and 04/04/2012 15:37:22
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
cmtrow number(20);
dob varchar2(20);
datenow timestamp(6);
checkmaster varchar(10);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        select * from exp_imm where PP10PPNO not in (select passportno from thaipassport);
    rec_thp c1%rowtype;  
begin
    cmtrow:=0;totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateMFA2Thaipassport.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Transfer migrate MFA 2 PIBICS thaipassport .... !!!');utl_file.fflush(file_ut);
    open c1;
    loop fetch c1 into rec_thp; exit when c1%notfound;    
    dob:='';    
    if substr(rec_thp.PPNFBHDT,0,2) = '99' and substr(rec_thp.PPNFBHDT,3,2) <> '99' then
        dob := '/'||substr(rec_thp.PPNFBHDT, 3, 2)||'/'||substr(rec_thp.PPNFBHDT, 5);    
        --utl_file.put_line(file_ut,sysdateTxt||' case dob /mm/yyyy : '||dob);utl_file.fflush(file_ut);
    elsif substr(rec_thp.PPNFBHDT,0,4) = '9999' then
        dob := substr(rec_thp.PPNFBHDT, 5);
        --utl_file.put_line(file_ut,sysdateTxt||' case dob yyyy : '||dob);utl_file.fflush(file_ut);
    else
        dob := substr(rec_thp.PPNFBHDT, 0, 2)||'/'||substr(rec_thp.PPNFBHDT, 3, 2)||'/'||substr(rec_thp.PPNFBHDT, 5);
        --utl_file.put_line(file_ut,sysdateTxt||' case dob dd/mm/yyyy : '||dob);utl_file.fflush(file_ut);
    end if;
    
   -- begin
         utl_file.put_line(file_ut,sysdateTxt||' PP10PPNO : '||rec_thp.PP10PPNO);utl_file.fflush(file_ut);
        insert into thaipassport
        (citizenid, passportno, passno, tfamilynm, tfirstnm, efamilynm, efirstnm, sex, nationcd, passportdte, passportexpdte, micropicno, 
        birthdte, pps_seqno, pass_seqno, create_date, update_date, typedpassport, passportsts, personid)
        values
        (rec_thp.ppnfid, rec_thp.PP10PPNO, '00'||rec_thp.pp10subp, rec_thp.ppthlnm, rec_thp.ppthfnm, rec_thp.ppenlnm, rec_thp.ppenfnm, rec_thp.pp10sex, 
        'T03', to_date(rec_thp.ppnfisdt, 'ddmmyyyy'), to_date(rec_thp.ppnfexdt, 'ddmmyyyy'), rec_thp.pp10roll||rec_thp.ppnffram||rec_thp.ppnfitem, dob, 1, 4, sysdate, sysdate, 'A', '5','MFA002');
       -- Exception when others then null;
     ---end;
   
    totalrow:=totalrow+1;
    cmtrow:=cmtrow+1;
    if cmtrow = 1000 then
        utl_file.put_line(file_ut,sysdateTxt||' Commit:'||totalrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;   
 end loop; --cursor
 close c1;
 COMMIT;
 utl_file.put_line(file_ut,'total record MFA 2 PIBICS : '||totalrow|| ' records');utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer migrate MFA 2 PIBICS thaipassport.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
     -- when others then
        --utl_file.put_line(file_ut,'Error  :'||rec_fn.t_id);utl_file.fflush(file_ut);
        -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migrateMfa2Pibics;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEMFA2PIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEMFA2PIBICS" TO "BIOSAADM";
