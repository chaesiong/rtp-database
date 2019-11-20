CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEMFANONACTIVE2PIBICS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateMfaNonActive2Pibics
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        03/07/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateMfaNonActive2Pibics
      Sysdate:         03/07/2013
      Date and Time:   03/07/2013, 16:45:22, and 03/07/2013 16:45:22
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
begin
declare
sysdatetxt varchar2(25);
sysdatefile varchar2(8);
totalrows number(20);
cmtrow number(20);
updrow number(20);
insrow number(20);
dob varchar2(20);
datenow timestamp(6);
checkmaster varchar(10);
pps_no number(20);
pass_no number(20);
tpass varchar2(20);
passsts varchar2(20);
flagfound varchar2(20);
batchlogno_seq number(20);
file_ut utl_file.file_type;
    cursor c1 is
    select * from exp_imm_20130611;
    rec_thp c1%rowtype;  
begin
    cmtrow:=0;totalrows:=0;updrow:=0;insrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdatefile from dual;
    
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd) 
    values ( batchlogno_seq, 'MFA', '999', 'migate data thaipassport', null, 0, 0, 0, sysdate, null, '0', 'MFA003', sysdate, 'N', 0, 0);
      
    commit;    
    
    file_ut := utl_file.fopen('LOGS_DIR','log_migrateMFA2Thaipassport.txt','W');
    utl_file.put_line(file_ut,sysdatetxt||' Start Transfer migrate MFA 2 PIBICS thaipassport .... !!!');utl_file.fflush(file_ut);
    open c1;
    loop fetch c1 into rec_thp; exit when c1%notfound;    
    
    begin    
    flagfound := 'NOTFOUND';
    pps_no := 0;
    pass_no := 0;
    tpass := '';
    passsts := '';
    dob:='';    
    <<itemmfa_loop>> for itemmfa in
    (
            select * from thaipassport where citizenid = rec_thp.ppnfid and passportno = rec_thp.pp10ppno
    )
         loop
         flagfound:='FOUND';
            if rec_thp.pp10stat = 'C' then
                --dbms_output.put_line(sysdatetxt||' C --> itemMFA.citizenid passportno:'|| itemmfa.citizenid ||' ' || itemmfa.passportno);     
                update thaipassport set pps_seqno = 2, pass_seqno = 6, typedpassport = 'C', passportsts = 'X', update_date = sysdate, personid = 'MFA003' where citizenid = itemmfa.citizenid and passportno = itemmfa.passportno;
            end if;
            
            if rec_thp.pp10stat = 'R' then
                --dbms_output.put_line(sysdatetxt||' R --> itemMFA.citizenid passportno:'|| itemmfa.citizenid ||' ' || itemmfa.passportno);     
                update thaipassport set pps_seqno = 4, pass_seqno = 9, typedpassport = 'R', passportsts = 'R', update_date = sysdate, personid = 'MFA003' where citizenid = itemmfa.citizenid and passportno = itemmfa.passportno;
            end if;
            
            if rec_thp.pp10stat = 'L' then
                --dbms_output.put_line(sysdatetxt||' L --> itemMFA.citizenid passportno:'|| itemmfa.citizenid ||' ' || itemmfa.passportno);     
                update thaipassport set pps_seqno = 3, pass_seqno = 7, typedpassport = 'L', passportsts = 'L', update_date = sysdate, personid = 'MFA003' where citizenid = itemmfa.citizenid and passportno = itemmfa.passportno;
            end if;                        
            updrow:=updrow+1;
        end loop;
    
        if flagfound ='NOTFOUND' then
            if rec_thp.pp10stat = 'C' then
                pps_no := 2; pass_no := 6; tpass := 'C'; passsts := 'X';
            end if;
            if rec_thp.pp10stat = 'R' then
                pps_no := 4; pass_no := 9; tpass := 'R'; passsts := 'R';
            end if;
            if rec_thp.pp10stat = 'L' then
                pps_no := 3; pass_no := 7; tpass := 'L'; passsts := 'L';
            end if;          
            
            if substr(rec_thp.ppnfbhdt,0,2) = '99' and substr(rec_thp.ppnfbhdt,3,2) <> '99' then
                dob := '/'||substr(rec_thp.ppnfbhdt, 3, 2)||'/'||substr(rec_thp.ppnfbhdt, 5);    
                --utl_file.put_line(file_ut,sysdateTxt||' case dob /mm/yyyy : '||dob);utl_file.fflush(file_ut);
            elsif substr(rec_thp.ppnfbhdt,0,4) = '9999' then
                dob := substr(rec_thp.ppnfbhdt, 5);
                --utl_file.put_line(file_ut,sysdateTxt||' case dob yyyy : '||dob);utl_file.fflush(file_ut);
            else
                dob := substr(rec_thp.ppnfbhdt, 0, 2)||'/'||substr(rec_thp.ppnfbhdt, 3, 2)||'/'||substr(rec_thp.ppnfbhdt, 5);
            --utl_file.put_line(file_ut,sysdateTxt||' case dob dd/mm/yyyy : '||dob);utl_file.fflush(file_ut);
            end if;              
            
            --dbms_output.put_line(sysdatetxt||'INSERT --> pp10ppno:'|| rec_thp.ppnfid ||' ' || rec_thp.pp10ppno);              
            insert into thaipassport
            (citizenid, passportno, passno, tfamilynm, tfirstnm, efamilynm, efirstnm, sex, nationcd, passportdte, passportexpdte, micropicno, 
            birthdte, pps_seqno, pass_seqno, create_date, update_date, typedpassport, passportsts, personid)
            values
            (rec_thp.ppnfid, rec_thp.PP10PPNO, '00'||rec_thp.pp10subp, rec_thp.ppthlnm, rec_thp.ppthfnm, rec_thp.ppenlnm, rec_thp.ppenfnm, rec_thp.pp10sex, 
            'T03', to_date(rec_thp.ppnfisdt, 'ddmmyyyy'), to_date(rec_thp.ppnfexdt, 'ddmmyyyy'), rec_thp.pp10roll||rec_thp.ppnffram||rec_thp.ppnfitem, dob, pps_no, pass_no, sysdate, sysdate,tpass, passsts,'MFA003');
            insrow:=insrow+1;
        end if;        
     end;
   
    totalrows:=totalrows+1;
    cmtrow:=cmtrow+1;
    if cmtrow = 1000 then
        --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||totalrow);utl_file.fflush(file_ut);
        update batchlog set prrow =  prrow + cmtrow, totalins = insrow, totalupd = updrow where batchlogno = batchlogno_seq;
        commit;
        cmtrow:=0;
    end if;   
 end loop; --cursor
 close c1;
 
   update batchlog set totalrow = totalrows, prrow = totalrows, endprocess = sysdate, status = '1', tfstatus = 'Y', totalins = insrow, totalupd = updrow where batchlogno = batchlogno_seq;

 commit;
 utl_file.put_line(file_ut,'total record MFA 2 PIBICS : '||totalrows|| ' records');utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
 utl_file.put_line(file_ut,sysdatetxt||' End Transfer migrate MFA 2 PIBICS thaipassport.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
     -- when others then
        --utl_file.put_line(file_ut,'Error  :'||rec_fn.t_id);utl_file.fflush(file_ut);
        -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;



END migrateMfaNonActive2Pibics;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEMFANONACTIVE2PIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEMFANONACTIVE2PIBICS" TO "BIOSAADM";
