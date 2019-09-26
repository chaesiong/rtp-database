CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."EXPMFA2PIBICS" IS
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
    select passportno, tfirstnm, trim(tfamilynm ||' '|| tmiddlenm) tfamilynm, efirstnm, trim(emiddlenm||' ' ||efamilynm) efamilynm, citizenid,
    decode(length(birthdte), '10', substr(birthdte, 7)||substr(birthdte, 4, 2)||substr(birthdte, 1, 2), '4', birthdte||'0000', '8',  substr(birthdte, 5)||substr(birthdte, 2, 2)||'00')
    birthdte, to_char(passportdte, 'YYYYMMDD') passportdte, to_char(passportexpdte, 'YYYYMMDD') passportexpdte, pps_seqno
    from thaipassport where to_char(passportdte, 'YYYYMMDD') >= '20081101';
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
    
   -- begin
        insert into exp_pibics ( pp10ppno, ppthfnm, ppthlnm, ppenfnm, ppenlnm, ppnfid, ppnfbhdt, ppnfisdt, ppnfexdt, ppstatus) 
        values ( rec_thp.passportno, rec_thp.tfirstnm, rec_thp.tfamilynm, rec_thp.efirstnm, rec_thp.efamilynm, rec_thp.citizenid, rec_thp.birthdte, 
        rec_thp.passportdte, rec_thp.passportexpdte,  rec_thp.pps_seqno);
        
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

END expMfa2Pibics;
/
