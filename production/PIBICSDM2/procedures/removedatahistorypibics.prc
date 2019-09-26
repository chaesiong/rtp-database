CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."REMOVEDATAHISTORYPIBICS" is
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
    --select * from tmmain where (to_char(indte, 'YYYYMM') = '200912' or to_char(outdte, 'YYYYMM') = '200912');
    --select tmrunno from tmmain where to_char(OUTDTE, 'yyyymmdd') = '20130507' and outcreusr = 'PIS001';
    select tmrunno from tmmain where to_char(incredte, 'yyyymmdd') = '20130807';
    rec_tm c1%rowtype;
begin
    cmtrow:=0;totalrows:=0;updrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdatefile from dual;
       
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'HIST', '999', 'ลบข้อมูลการเดินทาง ขาออก Duplicate PIBICS 20130807', null, 0, 0, 0, sysdate, null, '1', 'HIST01', sysdate, 'N');
      
    commit;
    
    file_ut := utl_file.fopen('LOGS_DIR','logRemoveHistoryPIBICS'||sysdatefile||'.txt','W');
    
   utl_file.put_line(file_ut,sysdatetxt||' Start remove data PIBICS History .... !!!');     
   utl_file.fflush (file_ut );
    
   open c1;
   loop fetch c1 into rec_tm; exit when c1%notfound; 
    
    delete
      from tmmain
      where tmrunno = rec_tm.tmrunno;
    
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
   utl_file.put_line(file_ut,'Total remove data  :'||totalrows);utl_file.fflush(file_ut);
   utl_file.put_line(file_ut,sysdatetxt||' Complete remove data PIBICS History  ...!!!!'); 
   utl_file.fclose(file_ut); 
end;

end removedatahistorypibics;
/
