CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSTMPERSONEX3090ALL" IS
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
foundvisarunday varchar2(50);
total number(20);
indate date;
outdate date;
diffdate number(10);
totaldiff number(10);
flagdiff number(10);
flagcompleate varchar2(40);

file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
     
    /*
    select '1' cardtype, intdtno tdtno, nationcd, invisatypecd, count('X') cnt from tmmain where to_char(indte, 'yyyymmdd') between  to_char(sysdate - 160, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd')
    and invisatypecd = '0017' and intdtno <> 'PASSPORT'
    --and intdtno in ('B7636603','B7474286','B4605843')
    and nationcd in ('R04', 'V03')
    group by intdtno, nationcd, invisatypecd
    having count('X') > 3
    union all
    select '1' cardtype, intdtno tdtno, nationcd, invisatypecd, count('X') cnt from tmmain where to_char(indte, 'yyyymmdd') between  to_char(sysdate - 360, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd')
    and invisatypecd = '0018' and intdtno <> 'PASSPORT' 
    --and intdtno  in ('7146696', 'M10544961', 'M53637964' )
     and nationcd = 'K02'
    group by intdtno, nationcd, invisatypecd
    having count('X') > 3
    union all
    select '1' cardtype, intdtno tdtno, nationcd, invisatypecd, count('X') cnt from tmmain where to_char(indte, 'yyyymmdd') between  to_char(sysdate - 60, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd')
     and invisatypecd = '0015' and nationcd =  'C01' and intdtno <> 'PASSPORT' 
    --and intdtno  in ('7146696', 'M10544961', 'M53637964' )
    group by intdtno, nationcd, invisatypecd
    having count('X') > 3;    
    */
    
        select '1' cardtype, intdtno tdtno, nationcd, invisatypecd, count('X') cnt from tmmain where to_char(indte, 'YYYYMM') between '201301' and '201312'
        and invisatypecd = '0018' and intdtno <> 'PASSPORT' 
        --and intdtno  in ('7146696', 'M10544961', 'M53637964' )
         and nationcd = 'K02'
        group by intdtno, nationcd, invisatypecd
        having count('X') >= 4;
        
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

    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSTMPERSONEX3090ALL'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSTMPERSONEX3090ALL .... !!!');utl_file.fflush(file_ut); 
    open c1;
 
    foundin := 0;
    checkImage := null;
    addressfn := null;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    
    foundvisarun := 'NOTFOUND';
    foundvisarunday  := 'NOTFOUND';
    total := 0;
    flagdiff := 0;
    totaldiff := 0;
     indate := null;
     outdate := null;    
    
    if rec_tm.invisatypecd = '0018' then
        begin            
        <<itemtm_loop>> for itm in
         (
            select  tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatype_seqno from vw_tmmain where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd
            --and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 360, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') and visatype_seqno = 34
            and to_char(inoutdate, 'YYYYMM') between '201301' and '201312' and visatype_seqno = 34
            order by inoutdate asc
         )
         loop     
            flagcompleate := 'NO';
            diffdate := 0;

            if itm.cardtype = '1' then
                indate := itm.inoutdate;
            end if;         
            if itm.cardtype = '2' and indate is not null  then
                outdate := itm.inoutdate;
            end if;
            if indate is not null and outdate is not null then
                diffdate := outdate - indate;
                if diffdate >= 50 then
                    flagdiff := flagdiff + 1;
                end if;            
                flagcompleate := 'YES';
            end if;        
            totaldiff := totaldiff + diffdate;     
                     
            if flagcompleate = 'YES' then
                indate := null;
                outdate := null;
            end if;
     end loop;
    end;               
      if flagdiff >= 4 then
        foundvisarun := 'FOUND';
      end if;  
      if foundvisarun = 'NOTFOUND' then
          if totaldiff >= 210 then
            foundvisarunday := 'FOUND';
          end if;      
      end if;
    end if;
    
    if rec_tm.invisatypecd = '0017' then
        begin            
        <<itemtm_loop>> for itm in
         (
            select  tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatype_seqno from vw_tmmain where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 160, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') and visatype_seqno = 41
            order by inoutdate asc
         )
         loop     
            flagcompleate := 'NO';
            diffdate := 0;
            if itm.cardtype = '1' then
                indate := itm.inoutdate;
            end if;         
            if itm.cardtype = '2' and indate is not null  then
                outdate := itm.inoutdate;
            end if;
            if indate is not null and outdate is not null then
                diffdate := outdate - indate;
                if diffdate >= 25 then
                    flagdiff := flagdiff + 1;
                end if;            
                flagcompleate := 'YES';
            end if;        
            totaldiff := totaldiff + diffdate;              
            if flagcompleate = 'YES' then
                indate := null;
                outdate := null;
            end if;
     end loop;
    end;               
    
    
      if flagdiff >= 4 then
        foundvisarun := 'FOUND';
      end if;
      

      
      if foundvisarun = 'NOTFOUND' then
          if totaldiff >= 70 then
            foundvisarunday := 'FOUND';
          end if;      
      end if;
    end if;
    
 
    if rec_tm.invisatypecd = '0015' then
        begin            
        <<itemtm_loop>> for itm in
         (
            select  tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatype_seqno from vw_tmmain where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd
            and to_char(inoutdate, 'yyyymmdd') between  to_char(sysdate - 60, 'yyyymmdd') and to_char(sysdate, 'yyyymmdd') and visatype_seqno = 39
            order by inoutdate asc
         )
         loop     
            flagcompleate := 'NO';
            diffdate := 0;
            if itm.cardtype = '1' then
                indate := itm.inoutdate;
            end if;         
            if itm.cardtype = '2' and indate is not null  then
                outdate := itm.inoutdate;
            end if;
            if indate is not null and outdate is not null then
                diffdate := outdate - indate;
                if diffdate >= 10 then
                    flagdiff := flagdiff + 1;
                end if;            
                flagcompleate := 'YES';
            end if;        
            totaldiff := totaldiff + diffdate;              
            if flagcompleate = 'YES' then
                indate := null;
                outdate := null;
            end if;
     end loop;
    end;               
    
    
      if flagdiff >= 4 then
        foundvisarun := 'FOUND';
      end if;
      

      
      if foundvisarun = 'NOTFOUND' then
          if totaldiff >= 40 then
            foundvisarunday := 'FOUND';
          end if;      
      end if;
    end if;

    if foundvisarun = 'FOUND' or foundvisarunday = 'FOUND' then
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
        
     
        insert into tmpersonex3090 (tmseqno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, passportno, amount, 
        inoutdte, dept_seqno, tm6no, chkcapture, fn38, cardtype, visatype_seqno, credte, flagvisarun, visarundays, flagdiff) 
        values 
        (investigate_seq.nextval, itm.efamilynm, itm.efirstnm, itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.tdtno, 
        rec_tm.cnt, itm.inoutdate, itm.dept_seqno, itm.tm6no, checkImage, addressfn, itm.cardtype, itm.visatype_seqno, sysdate, 
        decode(foundvisarunday, 'FOUND', 'Y', null), totaldiff, flagdiff);
        
     end loop;
    end if;  

   
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
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSTMPERSONEX3090ALL .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PROCESSTMPERSONEX3090ALL;
/
