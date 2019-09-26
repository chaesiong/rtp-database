CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTMPERSONEX30" IS
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
    select intdtno, nationcd, count('X') cnt from tmmain where to_char(indte, 'YYYYMM') between '201310' and to_char(sysdate, 'YYYYMM')
    and invisatypecd = '0017' and nationcd in ('H04','L01','M11','M24','R04','V03') and intdtno <> 'PASSPORT'
    group by intdtno, nationcd
    having count('X') > 3;
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
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSTMPERSONEX30', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit;  
 
    delete tmpersonex30;
    commit;

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSTMPERSONEX30'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSTMPERSONEX30 .... !!!');utl_file.fflush(file_ut); 
    open c1;
 
    foundin := 0;
    checkImage := null;
    addressfn := null;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        select * from (
        select * from vw_tmmain where to_char(inoutdate, 'YYYYMM') > '201310' and cardtype = '1'
        --and tdtno = '85224239' and nationcd = 'S18'  
        and tdtno = rec_tm.intdtno and nationcd = rec_tm.nationcd order by inoutdate desc
        ) where rownum = 1 
     )
     loop
     
        begin         
            select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
        exception when no_data_found then
            checkImage := 'N';
        end;
        
        --addressfn := get_addrfn24(rec_tm.intdtno, rec_tm.nationcd);
        
     
         insert into tmpersonex30 (tmseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, passportno, amount, inoutdte, dept_seqno, tm6no, chkcapture, fn38, cardtype) 
        values 
        (investigate_seq.nextval, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.tdtno, rec_tm.cnt, itm.inoutdate, itm.dept_seqno, itm.tm6no, 
        checkImage, addressfn, itm.cardtype);
        
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
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSTMPERSONEX30 .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSTMPERSONEX30;
/
