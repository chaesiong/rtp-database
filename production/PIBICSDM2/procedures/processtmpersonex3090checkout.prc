CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTMPERSONEX3090CHECKOUT" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrownum number(20);
commitrow number(20);
foundin  number(20);
batchlogno_seq number(20);
checkImage char(1);
addressfn varchar2(1800);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from tmpersonex3090 where flagprocess  is null;
     --and visatype_seqno = 39;
    rec_tm c1%rowtype;  
begin
    totalrownum:=0;
    commitrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
       
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSTMPERSONEX3090CHECKOUT', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit; 

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSTMPERSONEX3090CHECKOUT'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSTMPERSONEX3090CHECKOUT .... !!!');utl_file.fflush(file_ut); 
    open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    
    <<itemtm_loop>> for itm in
     (
        select * from (
        select * from immigration where tdtno = rec_tm.passportno and nationcd = rec_tm.nationcd order by inoutdte desc
        ) where rownum = 1 
     )
     loop
     
        if itm.cardtype = '2' then
            update tmpersonex3090 set flagout = 'Y' where tmseqno = rec_tm.tmseqno;
        end if;
        
        
     end loop;
    
    totalrownum:=totalrownum+1;   
    commitrow:=commitrow+1;
    if commitrow = 1000 then
        update batchlog set prrow = totalrownum where batchlogno = batchlogno_seq;
        commit;
      commitrow:=0;
    end if; 

 end loop; --cursor
 close c1;
  update batchlog
   set totalrow     = totalrownum,
     prrow          = totalrownum,
     endprocess     = sysdate,
     status         = '0',
     tfstatus       = 'Y'
   where batchlogno = batchlogno_seq;
   commit;
 utl_file.put_line(file_ut,'total :'||totalrownum);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSTMPERSONEX3090CHECKOUT .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSTMPERSONEX3090CHECKOUT;
/
