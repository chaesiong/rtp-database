CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTWOV30" IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
foundin  number(20);
batchlogno_seq number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        select * from tmmain where indte is not null and to_char(indte, 'YYYYMM') between '201211' and '201212' 
        and invisatype_seqno = 16 and indeptcd in ('00062','00166','00175','00127','00176','00132','00S08','00S10','00S11','00S07','00S09') and intdtno||nationcd not in (select tdtno||nationcd from travelinvestigate);
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdatefile from dual;
       
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSTWOV30', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');
      
    commit;  
 
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelInvestigate'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel investtgate .... !!!');utl_file.fflush(file_ut); 
 open c1;
 
    foundin := 0;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        select * from vw_tmmain where to_char(inoutdate, 'YYYYMM') >= '201211' 
        and visatype_seqno = 16 and cardtype = '1' and deptcd not in ('00062','00166','00175','00127','00176','00132','00S08','00S10','00S11','00S07','00S09')
        and tdtno = rec_tm.intdtno and nationcd = rec_tm.nationcd
     )
     loop
      insert into travelinvestigate (INVESTIGATESEQ, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationenm, cardtype, inoutdte, convregno,  depttnm, visa, visaexp, inoutdatetime, nationcd) 
        values (INVESTIGATE_SEQ.nextval,itm.tmrunno, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, 
        itm.nationenm, itm.cardtype, itm.inoutdte,itm.convregno, itm.depttnm,itm.visatypetnm, to_char(itm.visaexpdte, 'dd/mm/yyyy'), itm.inoutdate, itm.nationcd );
         foundin:=foundin+1;         
     Exit itemtm_loop When foundin=2;      
     end loop;
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1;
    
   if commitrow = 1000 then
        update batchlog set prrow =  prrow + commitrow where batchlogno = batchlogno_seq;
        commit;
        commitrow:=0;
    end if;      

 end loop; --cursor
 close c1;
   update batchlog
   set totalrow     = totalrow,
     prrow          = totalrow,
     endprocess     = sysdate,
     status         = '0',
     tfstatus       = 'Y'
   where batchlogno = batchlogno_seq;
   commit;
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End travel investtgate.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSTWOV30;
/
