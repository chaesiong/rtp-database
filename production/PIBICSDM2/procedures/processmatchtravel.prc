CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSMATCHTRAVEL" (start_yyyymm IN VARCHAR2, end_yyyymm IN VARCHAR2, end_outyyyymm IN VARCHAR2) IS 
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
batchlogno_seq number(20);
totalrownum number(20);
commitrow number(20);
toralrecords number(10);
matchrow number(10);

file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is        
    select * from tmmain where (to_char(indte, 'YYYYMM') between start_yyyymm and end_yyyymm) and indeptcd = '00S10' and nationcd <> 'T03' and intm6no <> '0000000' order by indte asc; 
    rec_tm c1%rowtype;  
begin

    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSMATCHTRAVEL'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESS MATCHTRAVEL .... !!!');utl_file.fflush(file_ut);
    
    toralrecords := 0;
    totalrownum:=0;
    commitrow:=0;
    matchrow:=0;
    
    begin
        select count('X') into toralrecords from tmmain 
        where (to_char(indte, 'YYYYMM') between start_yyyymm and end_yyyymm) and indeptcd = '00S10' 
        and nationcd <> 'T03' and intm6no <> '0000000';
    exception when no_data_found then
         toralrecords := 0;
    end;
    
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSMATCHTRAVEL - '|| start_yyyymm || ' ' || end_yyyymm, 0, toralrecords, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit; 
         
    open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;   
    
        <<itemtm_loop>> for itm in
            (
            select * from (
            select * from vw_tmmain where tdtno = rec_tm.intdtno and tm6no = rec_tm.intm6no and birthdte = rec_tm.birthdte 
            and nationcd = rec_tm.nationcd and cardtype = '2' and deptcd = '00S10' 
            and (to_char(inoutdate, 'YYYYMM') between start_yyyymm and end_outyyyymm)
            and to_char(inoutdate, 'YYYYMMDDHH24MISS') > to_char(rec_tm.indte, 'YYYYMMDDHH24MISS') 
            order by inoutdate asc) where rownum = 1             
            )
        loop
        
        insert into matchtravelone (matchseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, intdtno, intm6no, indte, 
        invisa, invisaexpdte, indtesort, inconveyance, inconvregno, indeptcd, indepttnm, outtdtno, outtm6no, 
        outdte, outdtesort, outconveyance, outconvregno, outdeptcd, outdepttnm, 
        nationcd, amount) 
        values (matchtravel_seqno.nextval, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.sex, rec_tm.birthdte,
        rec_tm.intdtno, rec_tm.intm6no, null, rec_tm.invisatypecd, to_char(rec_tm.invisaexpdte, 'dd/mm/yyyy'), rec_tm.indte, rec_tm.inconvcd,
        rec_tm.inconvregno, rec_tm.indeptcd, null, itm.tdtno, itm.tm6no, null, itm.inoutdate,
        itm.convcd, itm.convregno, itm.deptcd, null, rec_tm.nationcd, null);
       
        matchrow:=matchrow+1;     
        end loop; -- END LOOP
        
       totalrownum:=totalrownum+1;   
       commitrow:=commitrow+1;
       if commitrow = 1000 then
        update batchlog set prrow = totalrownum, totalins = matchrow  where batchlogno = batchlogno_seq;
        commit;
        commitrow:=0;
       end if;             
 end loop; --cursor
 
 update batchlog set prrow = totalrownum, totalins = matchrow, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
 commit;
 
 close c1;

 utl_file.put_line(file_ut,'total :'||totalrownum);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESS MATCHTRAVEL .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;
END PROCESSMATCHTRAVEL;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHTRAVEL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSMATCHTRAVEL" TO "BIOSAADM";
