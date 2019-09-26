CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEPERMITCD" IS
tmpVar NUMBER;
BEGIN
declare
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    totalrow number(20);
    commitrow number(20);
    toralrecords  number(20);
    totalrownum number(20);
    batchlogno_seq number(20);
    
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
   select * from tminoutlog where to_char(inoutdte,  'yyyymm') = '201501' and logflag = 'E' and permitcd is not null;
    rec_tm c1%rowtype;  
begin

    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;

 totalrow:=0;
 commitrow:=0;
 toralrecords := 0;
 totalrownum:=0; 
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migratePermitcd'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migratePermitcd .... !!!');utl_file.fflush(file_ut); 
 
  begin
        select count('X') into toralrecords from tminoutlog where to_char(inoutdte,  'yyyymm') = '201501' and logflag = 'E' and permitcd is not null;
    exception when no_data_found then
         toralrecords := 0;
    end;
    
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSMIGRATEPEMITCD -'||+ rec_tm.logflag, 0, toralrecords, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit; 
 
 
 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
    totalrow:=totalrow+1;   
    
    if rec_tm.cardtype = '1' then
         update tmmain set inpermitcd = rec_tm.permitcd, inpermitdte= rec_tm.newpermit where inseqno = rec_tm.seqno;
    else
        update tmmain set outpermitcd = rec_tm.permitcd, outpermitdte= rec_tm.newpermit where outseqno = rec_tm.seqno;
    end if;
    
   commitrow:=commitrow+1;
   totalrownum:=totalrownum+1;   
   if commitrow = 1000 then
    update batchlog set prrow = totalrownum where batchlogno = batchlogno_seq;
    commitrow:=0;
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 update batchlog set prrow =  totalrownum, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End migratePermitcd.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
-- Exception
  --when others then
    --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migratePermitcd;
/
