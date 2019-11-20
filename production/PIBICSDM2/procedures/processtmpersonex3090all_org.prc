CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTMPERSONEX3090ALL_ORG" IS
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
foundvisarun varchar2(50);
total number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
     
    select '1' cardtype, intdtno tdtno, nationcd, invisatypecd, count('X') cnt from tmmain where to_char(indte, 'yyyymmdd') between  to_char(sysdate - 180, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd')
    and invisatypecd = '0017' and intdtno <> 'PASSPORT' 
    --and intdtno = 'B5887138'
    group by intdtno, nationcd, invisatypecd
    having count('X') > 3
    union all
     select '1' cardtype, intdtno tdtno, nationcd, invisatypecd, count('X') cnt from tmmain where to_char(indte, 'yyyymmdd') between  to_char(sysdate - 420, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd')
    and invisatypecd = '0018' and intdtno <> 'PASSPORT' 
    --and intdtno = 'GK1679591'
    group by intdtno, nationcd, invisatypecd
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
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSTMPERSONEX3090ALL', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit;  
 
    --delete tmpersonex3090;
    --commit;

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSTMPERSONEX3090'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSTMPERSONEX3090 .... !!!');utl_file.fflush(file_ut); 
    open c1;
 
    foundin := 0;
    checkImage := null;
    addressfn := null;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    
    foundvisarun := 'NOTFOUND';
    total := 0;
    
    if rec_tm.invisatypecd = '0018' then
        begin
            
            select sum(case when chkdiffdate > 1 then 1 else chkdiffdate end) into total from (  
            with tmcardin as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatypecd from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 420, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd')  and visatypecd = '0018'
            and cardtype = '1'
            ),  tmcardout as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatypecd from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 420, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') and visatypecd = '0018'
            and cardtype = '2'
            ) select sum(case when round(b.inoutdate - a.inoutdate) between 30 and 100 then 1 else 0 end) chkdiffdate, 
            to_char(a.inoutdate, 'YYYYMMDDHH24MI') indte 
            from tmcardin a, tmcardout b where a.tm6no = b.tm6no 
            and round(b.inoutdate - a.inoutdate) < 100
            group by to_char(a.inoutdate, 'YYYYMMDDHH24MI'));
         
        exception when no_data_found then
        foundvisarun := 'NOTFOUND';
        end;    
            /*select sum(chkdiffdate) into total from (                  
            with tmcardin as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 360, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') 
            and cardtype = '1'
            ),  tmcardout as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 360, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') 
            and cardtype = '2'
            ) select round(b.inoutdate - a.inoutdate) diffdate, case when round(b.inoutdate - a.inoutdate) between 60 and 100 then 1 else 0 end chkdiffdate, 
            a.cardtype, a.efullname, a.tm6no intm6no, a.inoutdate indte, a.dept_seqno indept_seqno, 
            --get_deptabbfmt3(a.dept_seqno) indeptname, 
            b.tm6no outtm6no, b.inoutdate outdte, b.dept_seqno outdept_seqno 
            --get_deptabbfmt3(b.dept_seqno) outdeptname 
            from tmcardin a, tmcardout b where a.tm6no = b.tm6no and round(b.inoutdate - a.inoutdate) < 100);
      exception when no_data_found then
        foundvisarun := 'NOTFOUND';
      end;*/
      
      if total >= 4 then
        foundvisarun := 'FOUND';
      end if;
    end if;
    
    if rec_tm.invisatypecd = '0017' then
        begin
            select sum(case when chkdiffdate > 1 then 1 else chkdiffdate end) into total from (
            with tmcardin as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 180, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') and visatypecd = '0017'
            and cardtype = '1'
            ),  tmcardout as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 180, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') and visatypecd = '0017'
            and cardtype = '2'
            ) select sum(case when round(b.inoutdate - a.inoutdate) between 25 and 45 then 1 else 0 end) chkdiffdate, 
             to_char(a.inoutdate, 'YYYYMMDDHH24MI') indte 
            from tmcardin a, tmcardout b where a.tm6no = b.tm6no 
            and round(b.inoutdate - a.inoutdate) < 45
            group by to_char(a.inoutdate, 'YYYYMMDDHH24MI'));           
        /*
            select sum(chkdiffdate) into total from (  
            with tmcardin as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 120, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') 
            and cardtype = '1'
            ),  tmcardout as (
            select tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno from vw_tmmain where tdtno = rec_tm.tdtno  and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 120, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') 
            and cardtype = '2'
            ) select round(b.inoutdate - a.inoutdate) diffdate, case when round(b.inoutdate - a.inoutdate) between 25 and 45 then 1 else 0 end chkdiffdate, 
            a.cardtype, a.efullname, a.tm6no intm6no, a.inoutdate indte, a.dept_seqno indept_seqno, 
            --get_deptabbfmt3(a.dept_seqno) indeptname, 
            b.tm6no outtm6no, b.inoutdate outdte, b.dept_seqno outdept_seqno 
            --get_deptabbfmt3(b.dept_seqno) outdeptname 
            from tmcardin a, tmcardout b where a.tm6no = b.tm6no and round(b.inoutdate - a.inoutdate) < 45);            */
      exception when no_data_found then
        foundvisarun := 'NOTFOUND';
      end;
      
      if total >= 4 then
        foundvisarun := 'FOUND';
      end if;
    end if;
    
    
    if foundvisarun = 'FOUND' then
        <<itemtm_loop>> for itm in
         (
        select * from (
        select * from vw_tmonline where cardtype = '1'
        --and tdtno = '85224239' and nationcd = 'S18'  
        and tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd order by inoutdate desc
        ) where rownum = 1 
     )
     loop
     
        begin         
            select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
        exception when no_data_found then
            checkImage := 'N';
        end;
        
     
         insert into tmpersonex3090 (tmseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, passportno, amount, inoutdte, dept_seqno, tm6no, chkcapture, fn38, cardtype, visatype_seqno, credte) 
        values 
        (investigate_seq.nextval, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.tdtno, rec_tm.cnt, itm.inoutdate, itm.dept_seqno, itm.tm6no, 
        checkImage, addressfn, itm.cardtype, itm.visatype_seqno, sysdate);
        
     end loop;
    end if;  


   /* if rec_tm.cardtype = '2' then
        <<itemtm_loop>> for itm in
         (
        select * from (
        select * from vw_tmonline where to_char(inoutdate, 'YYYYMM') > '201310' and cardtype = '2'
        --and tdtno = '85224239' and nationcd = 'S18'  
        and tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd order by inoutdate desc
        ) where rownum = 1 
     )
     loop
     
        begin         
            select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
        exception when no_data_found then
            checkImage := 'N';
        end;
        
     
         insert into tmpersonex3090 (tmseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, passportno, amount, inoutdte, dept_seqno, tm6no, chkcapture, fn38, cardtype, visatype_seqno) 
        values 
        (investigate_seq.nextval, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.tdtno, rec_tm.cnt, itm.inoutdate, itm.dept_seqno, itm.tm6no, 
        checkImage, addressfn, itm.cardtype, itm.visatype_seqno);
        
     end loop;
       end if;  */

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

END PROCESSTMPERSONEX3090ALL_ORG;
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSTMPERSONEX3090ALL_ORG" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSTMPERSONEX3090ALL_ORG" TO "BIOSAADM";
