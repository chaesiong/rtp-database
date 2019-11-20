CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEPP10PPNO" is
tmpvar number;
begin
declare
    sysdatetxt varchar2(25);
    sysdatefile varchar2(8);
    totalrows number(20);
    cmtrow number(20);
    updrow number(20);
    batchlogno_seq number(20);
    file_ut utl_file.file_type;
    cursor c1  is 
        --select * from exp_imm where substr(PP10PPNO,1,1) <> 'O' and substr(PP10PPNO,3,1) <> '0';
        select * from exp_imm;
    rec_tm c1%rowtype;
begin
    cmtrow:=0;totalrows:=0;updrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdatefile from dual;
       
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'MFA', '999', 'migrate PP10PPNO ', null, 0, 0, 0, sysdate, null, '1', 'MFA002', sysdate, 'N');
      
    commit;
    
    file_ut := utl_file.fopen('LOGS_DIR','logRemoveThaipass'||sysdatefile||'.txt','W');
    
   utl_file.put_line(file_ut,sysdatetxt||' Start migrate PP10PPNO .... !!!');     
   utl_file.fflush (file_ut );
    
   open c1;
   loop fetch c1 into rec_tm; exit when c1%notfound; 
    
    if substr(rec_tm.PP10PPNO,1,1) <> 'O' and substr(rec_tm.PP10PPNO,3,1) <> '0' then
        update exp_imm set PP10PPNO_PIBICS =PP10PPNO where PP10PPNO = rec_tm.PP10PPNO;
    else
        update exp_imm set PP10PPNO_PIBICS = substr(PP10PPNO,2,1) ||substr(PP10PPNO,4,6) where PP10PPNO = rec_tm.PP10PPNO;
    end if;
    
   totalrows:=totalrows+1;
   cmtrow:=cmtrow+1;
   if cmtrow = 1000 then
        --utl_file.put_line(file_ut,sysdatetxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        update batchlog set prrow =  prrow + cmtrow where batchlogno = batchlogno_seq;
        commit;
        cmtrow:=0;
   end if;  
   end loop;--Loop Cursor
   close c1; 
   update batchlog
   set totalrow     = totalrows,
     prrow          = totalrows,
     endprocess     = sysdate,
     status         = '0',
     tfstatus       = 'Y'
   where batchlogno = batchlogno_seq;
   commit;
   utl_file.put_line(file_ut,'Total migrate data  :'||totalrows);utl_file.fflush(file_ut);
   utl_file.put_line(file_ut,sysdatetxt||' Complete migrate PP10PPNO  ...!!!!'); 
   utl_file.fclose(file_ut); 
end;

end migratePP10PPNO;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEPP10PPNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEPP10PPNO" TO "BIOSAADM";
