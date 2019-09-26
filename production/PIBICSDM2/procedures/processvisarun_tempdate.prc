CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSVISARUN_TEMPDATE" (start_yyyymmdd IN VARCHAR2, end_yyyymmdd IN VARCHAR2) IS 
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
exprieExtdate date;
visaExpDate date;
diffdate number(10);
totaldiff number(10);
flagdiff number(10);
flagcompleate varchar2(40);
toralrecords number(10);
checkmastervisarun varchar2(30);
chkinoutdate date;
visarun_seq number(20);
totalin number(10);
v_pcsreasion varchar2(1000);
flagExt varchar2(40);
extlistseqno number(10);


file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is        
       select to_char(visarundte, 'yyyymmdd') visarundte from tempdate where to_char(visarundte, 'yyyymmdd') between start_yyyymmdd and end_yyyymmdd order by visarundte asc;
       -- select start_yyyymmdd as visarundte from dual;
    rec_tm c1%rowtype;  
begin

    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;

    v_pcsreasion := 'PROCESS MANUAL VISARUN';
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_PROCESSVISARUN_TEMPDATE'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start PROCESSVISARUN_TEMPDATE .... !!!');utl_file.fflush(file_ut); 
    open c1;

    loop fetch c1 into rec_tm; exit when c1%notfound;   

    toralrecords := 0;
    totalrownum:=0;
    commitrow:=0;
    foundin := 0;
    checkImage := null;    
    
    
    begin
        select count('X') into toralrecords from (
        select intdtno tdtno, nationcd, invisatypecd from tmmain 
        where to_char(indte, 'yyyymmdd')  = rec_tm.visarundte
        and invisatypecd in ('0017', '0018', '0014') and intdtno <> 'PASSPORT'
        --and nationcd not in ('M03', 'L01', 'C01','B16') 
        --and invisatypecd = '0018' and intdtno <> 'PASSPORT'
        group by intdtno, nationcd, invisatypecd);
    exception when no_data_found then
         toralrecords := 0;
    end;
    
    batchlogno_seq := batchlog_seq.nextval;
    insert
    into batchlog
    (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus) 
    values ( batchlogno_seq, 'PIBICS', '999', 'PROCESSVISARUN_TEMPDATE  -'||+ rec_tm.visarundte, 0, toralrecords, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N');     
    commit; 
    
        <<itemtm_loop>> for visarun in
            (
                select intdtno tdtno, nationcd, invisatypecd, to_char(indte, 'yyyymmdd') indte from tmmain 
                where to_char(indte, 'yyyymmdd')  = rec_tm.visarundte
                and invisatypecd in ('0017', '0018', '0014') and intdtno <> 'PASSPORT' 
                --and invisatypecd = '0018' and intdtno <> 'PASSPORT'
                group by intdtno, nationcd, invisatypecd, to_char(indte, 'yyyymmdd')
            )
        loop     

        foundvisarun := 'NOTFOUND';
        foundvisarunday  := 'NOTFOUND';
        total := 0;
        flagdiff := 0;
        totaldiff := 0;
        indate := null;
        outdate := null; 
        totalin := 0;   
        flagExt := 'NOTFOUNDEXT';
       
    
            /*** @กลุ่ม ผผ.90
            เดินทางเช้าเกินกว่า 2 ครั้ง ภายในระยะเวลา 1 ปี โดยแต่ละครั้งพำนักอยู่ในประเทศตั้งแต่ 75 วัน ขึ้นไป หรือ
            มีจำนวนวันรวมที่พำนักอยู่ในประเทศไทยเกิน 180 วัน ภายในระยะเวลา 1 ปี            
            ***/
            if visarun.invisatypecd = '0018' then
                begin            
                <<itemtm_loop>> for itm in
                 (
                    select  tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatype_seqno from vw_tmmain where tdtno = visarun.tdtno and nationcd = visarun.nationcd
                    and to_char(inoutdate, 'yyyymmdd') between to_char(to_date(rec_tm.visarundte, 'yyyymmdd') - 365, 'yyyymmdd') and rec_tm.visarundte and visatype_seqno = 34
                    order by inoutdate asc
                 )
                 loop     
                    flagcompleate := 'NO';
                    diffdate := 0;

                    if itm.cardtype = '1' then
                        indate := itm.inoutdate;
                        totalin := totalin + 1;
                    end if;         
                    if itm.cardtype = '2' and indate is not null  then
                        outdate := itm.inoutdate;
                    end if;
                    if indate is not null and outdate is not null then
                        diffdate := outdate - indate;
                        if diffdate = 0 then 
                            diffdate:=1;
                        end if;
                        
                        if diffdate >= 75 then
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
              if flagdiff >= 2 then
                foundvisarun := 'FOUND';
              end if;  
              if foundvisarun = 'NOTFOUND' then
                  if totaldiff >= 180 then
                    foundvisarunday := 'FOUND';
                  end if;      
              end if;
            end if;
            
            /*** @กลุ่ม ผผ.30
            เดินทางเช้าเกินกว่า 3 ครั้ง ภายในระยะเวลา 1 ปี โดยแต่ละครั้งพำนักอยู่ในประเทศตั้งแต่ 25 วัน ขึ้นไป หรือ
            มีจำนวนวันรวมที่พำนักอยู่ในประเทศไทยเกิน 90 วัน ภายในระยะเวลา 1 ปี            
            ***/            
            if visarun.invisatypecd = '0017' then
                begin            
                <<itemtm_loop>> for itm in
                 (
                    select  tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatype_seqno from vw_tmmain where tdtno = visarun.tdtno and nationcd = visarun.nationcd
                    and to_char(inoutdate, 'yyyymmdd') between to_char(to_date(rec_tm.visarundte, 'yyyymmdd') - 365, 'yyyymmdd') and rec_tm.visarundte and visatype_seqno = 41
                    order by inoutdate asc
                 )
                 loop     
                    flagcompleate := 'NO';
                    diffdate := 0;
                    if itm.cardtype = '1' then
                        indate := itm.inoutdate;
                        totalin := totalin + 1;
                    end if;         
                    if itm.cardtype = '2' and indate is not null  then
                        outdate := itm.inoutdate;
                    end if;
                    if indate is not null and outdate is not null then
                        diffdate := outdate - indate;
                        if diffdate = 0 then 
                            diffdate:=1;
                        end if;                        
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
              if flagdiff >= 3 then
                foundvisarun := 'FOUND';
              end if;
              if foundvisarun = 'NOTFOUND' then
                  if totaldiff >= 90 then
                    foundvisarunday := 'FOUND';
                  end if;      
              end if;
            end if;
            
            
            /*** @กลุ่ม ผ.30
            เดินทางเข้าเกินกว่า 6 ครั้ง ภายในระยะเวลา 1 ปี โดยแต่ละครั้งพำนักอยู่ในประเทศตั้งแต่ 10 วัน ขึ้นไป หรือ
            มีจำนวนวันรวมที่พำนักอยู่ในประเทศไทยเกิน 90 วัน ภายในระยะเวลา 1 ปี            
            การคำนวณวันที่พำนักอยู่ในประเทศไทย ไม่รวมการพำนักตามสิทธิ์การขออยู่ต่อ
            ***/     
            if visarun.invisatypecd = '0014' then
                begin            
                <<itemtm_loop>> for itm in
                 (
                    select  tm6no, tdtno, cardtype, efullname, inoutdate, dept_seqno, visatype_seqno, count_seqno, visaexpdte  from vw_tmmain where tdtno = visarun.tdtno and nationcd = visarun.nationcd
                    and to_char(inoutdate, 'yyyymmdd') between to_char(to_date(rec_tm.visarundte, 'yyyymmdd') - 365, 'yyyymmdd') and rec_tm.visarundte and visatype_seqno = 16
                    order by inoutdate asc
                 )
                 loop   
                    flagcompleate := 'NO';
                    diffdate := 0;
                    exprieExtdate := null;
                    visaExpDate := null;
                    extlistseqno := null;
                    
                    if itm.cardtype = '1' then
                        indate := itm.inoutdate;
                        totalin := totalin + 1;   
                        
                      -- ตรวจสอบข้อมูลขออยู่ต่อ
                        begin
                            select extlist_seqno, permit_date into extlistseqno, exprieExtdate from (
                            select extlist_seqno, passportno, nation_seqno, permit_date, in_date, update_date from ext_extensionlist where passportno = itm.tdtno and nation_seqno = itm.count_seqno 
                            and to_char(in_date, 'yyyymmdd') = to_char(itm.inoutdate, 'yyyymmdd') and approve_sts = 'A' and cpassportno <> 'PASSPORT'
                            and permit_date is not null and actflag <> 'C'  order by update_date desc) where rownum = 1;
                        exception when no_data_found then
                            exprieExtdate := null;
                            extlistseqno := null;
                        end;            
                        
                        if itm.visaexpdte is not null then
                            visaExpDate := itm.visaexpdte;    
                        end if;        
                    end if;         
                    
                    if itm.cardtype = '2' and indate is not null  then
                        outdate := itm.inoutdate;
                    end if;
                    
                    
                    if indate is not null and outdate is not null then                    
                        -- check ข้อมลอยู่ต่อ
                        if exprieExtdate is not null then     
                            if visaExpDate is not null and outdate < visaExpDate then
                                diffdate := outdate - indate;     
                                flagExt := 'ออกก่อนวันครบกำหนดอนุญาต visa';
                            elsif outdate > exprieExtdate then
                                diffdate := outdate - indate;           
                                flagExt := 'อยู่เกินกำหนดอนุญาตฯ ขออยู่ต่อ';
                            elsif  visaExpDate is not null and outdate > visaExpDate  and outdate < exprieExtdate then
                                diffdate := outdate - visaExpDate;  
                                flagExt := 'ใช้สิทธิ์การขออยู่ต่อ';
                            else
                                 diffdate := outdate - indate;  
                                 flagExt := 'ออกก่อนวันครบกำหนดอนุญาต visa';
                            end if;
                        else 
                            diffdate := outdate - indate;   
                        end if;        
                        
                        if diffdate = 0 then 
                            diffdate:=1;
                        end if;   
                                             
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
              if flagdiff >= 6 then
                foundvisarun := 'FOUND';
              end if;
              if foundvisarun = 'NOTFOUND' then
                  if totaldiff >= 90 then
                    foundvisarunday := 'FOUND';
                  end if;      
              end if;
            end if;
            
            
            visarun_seq := 0;
            
            if visarun.invisatypecd = '0018' then
            if foundvisarun = 'FOUND' or foundvisarunday = 'FOUND' then
                <<itemtm_loop>> for itm in
                 (                  
                    select * from (
                    select * from vw_tmonline where cardtype = '1'
                    and to_char(inoutdate, 'yyyymmdd') between to_char(to_date(rec_tm.visarundte, 'yyyymmdd') - 365, 'yyyymmdd') and rec_tm.visarundte
                    and tdtno = visarun.tdtno and nationcd = visarun.nationcd order by inoutdate desc
                    ) where rownum = 1
             )
             loop
                begin         
                    select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
                exception when no_data_found then
                    checkImage := 'N';
                end;
                                
                checkmastervisarun := null;
                chkinoutdate := null;
                begin
                        select vsrpersonseqno, inoutdte into checkmastervisarun, chkinoutdate 
                        from tmvisarunperson where passportno = itm.tdtno and nationcd = itm.nationcd and rownum = 1;
                exception when no_data_found then  
                    checkmastervisarun := null;
                    chkinoutdate := null;
                end;                
                
                if checkmastervisarun is null then        
                    insert into tmvisarunperson (vsrpersonseqno, visarunseqno, cardtype, tm6no, passportno, efamilynm, efirstnm, 
                    emiddlenm, sex, birthdte, nationcd, amount, inoutdte, dept_seqno, conv_seqno, count_seqno, 
                    visatype_seqno, visaexpdte, chkcapture, flagvisarun, visarundays, intype, typedata, creusr, 
                    credte, credterm, remark, tmrunno, personid, flagprocess, flagvisa, flagdiff, upddte, visaprocessdte, pcsreasion, flagext, extlistseqno) 
                    values (vsrperson_seqno.nextval, visarun_seq, itm.cardtype, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm,
                    itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, totalin, itm.inoutdate, itm.dept_seqno, 
                    itm.conv_seqno, itm.count_seqno, itm.visatype_seqno, itm.visaexpdte, checkImage, 
                    decode(foundvisarunday, 'FOUND', 'Y', null), totaldiff, itm.intype, itm.typedata, itm.creusr, 
                    itm.credte, itm.credterm, itm.remark, itm.tmrunno, itm.personid, null, visarun.invisatypecd, 
                    flagdiff, sysdate, to_date(rec_tm.visarundte, 'yyyymmdd'), v_pcsreasion, flagext, extlistseqno);                            
                elsif checkmastervisarun is not null  and to_number(to_char(itm.inoutdate, 'yyyymmddhh24miss')) > to_number(to_char(chkinoutdate, 'yyyymmddhh24miss')) then
                    update tmvisarunperson set visarunseqno = visarun_seq, cardtype = itm.cardtype, tm6no = itm.tm6no, passportno = itm.tdtno, 
                    efamilynm = itm.efamilynm, efirstnm = itm.efirstnm, emiddlenm = itm.emiddlenm, sex = itm.sex, birthdte = itm.birthdte, nationcd = itm.nationcd,
                    amount = totalin, inoutdte = itm.inoutdate, dept_seqno = itm.dept_seqno, conv_seqno = itm.conv_seqno, count_seqno = itm.count_seqno,
                    visatype_seqno = itm.visatype_seqno, visaexpdte = itm.visaexpdte, chkcapture = checkImage, flagvisarun = decode(foundvisarunday, 'FOUND', 'Y', null), 
                    visarundays = totaldiff, intype = itm.intype, typedata = itm.typedata, creusr = itm.creusr, credte = itm.credte, credterm = itm.credterm,
                    remark = itm.remark, tmrunno = itm.tmrunno, personid = itm.personid, flagprocess = null, flagvisa = visarun.invisatypecd, flagdiff = flagdiff,
                    upddte = sysdate, visaprocessdte = to_date(rec_tm.visarundte, 'yyyymmdd'), pcsreasion = v_pcsreasion, flagext = flagext, extlistseqno = extlistseqno where vsrpersonseqno = checkmastervisarun;
                end if;
                
                update tmmain set visarunday = flagdiff where tmrunno = itm.tmrunno;
             end loop;
            end if;
            
            if foundvisarun = 'NOTFOUND' and foundvisarunday = 'NOTFOUND' then
                checkmastervisarun := null;
                chkinoutdate := null;
                begin
                        select vsrpersonseqno, inoutdte into checkmastervisarun, chkinoutdate 
                        from tmvisarunperson where passportno = visarun.tdtno and nationcd = visarun.nationcd and to_number(to_char(inoutdte, 'yyyymmdd')) < visarun.indte and rownum = 1;
                exception when no_data_found then  
                    checkmastervisarun := null;
                    chkinoutdate := null;
                end;                
                
                if checkmastervisarun is not null then
                    <<itemtm_loop>> for itm in
                    (
                        select * from tmvisarunperson where vsrpersonseqno = checkmastervisarun
                    )
                     loop
                     
                         insert into visarunlog (visarunlogseqno, vsrpersonseqno, cardtype, tm6no, passportno, efamilynm, efirstnm, emiddlenm, sex, 
                         birthdte, nationcd, inoutdte, dept_seqno, conv_seqno, count_seqno, visatype_seqno, visaexpdte, action, creusr, credte, credterm, 
                         remark, deptcd, visatypecd, convcd, lastinoutdte) 
                         values (visarunlog_seqno.nextval, itm.vsrpersonseqno, itm.cardtype, itm.tm6no, itm.passportno, itm.efamilynm, itm.efirstnm,
                         itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.inoutdte, itm.dept_seqno, itm.conv_seqno, itm.count_seqno,
                         itm.visatype_seqno, itm.visaexpdte, 'D', 'VISARUNDEL', sysdate, '192.169.1.12', 'ยกเลิการเป็น Visa Run', null,
                         null, null, to_date(visarun.indte, 'yyyymmdd'));
                         
                        delete tmvisarunperson  where vsrpersonseqno = checkmastervisarun;
                    end loop;   
               end if;      
             end if;   
            end if;
            
            if visarun.invisatypecd = '0017' then
            if foundvisarun = 'FOUND' or foundvisarunday = 'FOUND' then
                <<itemtm_loop>> for itm in
                 (                  
                    select * from (
                    select * from vw_tmonline where cardtype = '1'                    
                    and to_char(inoutdate, 'yyyymmdd') between to_char(to_date(rec_tm.visarundte, 'yyyymmdd') - 365, 'yyyymmdd') and rec_tm.visarundte
                    and tdtno = visarun.tdtno and nationcd = visarun.nationcd order by inoutdate desc
                    ) where rownum = 1
             )
             loop
                begin         
                    select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
                exception when no_data_found then
                    checkImage := 'N';
                end;
                                
                checkmastervisarun := null;
                chkinoutdate := null;
                
                begin
                    select vsrpersonseqno, inoutdte into checkmastervisarun, chkinoutdate 
                    from tmvisarunperson where passportno = itm.tdtno and nationcd = itm.nationcd and rownum = 1;                    
                exception when no_data_found then  
                    checkmastervisarun := null;
                    chkinoutdate := null;
                end;

                if checkmastervisarun is null then        
                    insert into tmvisarunperson (vsrpersonseqno, visarunseqno, cardtype, tm6no, passportno, efamilynm, efirstnm, 
                    emiddlenm, sex, birthdte, nationcd, amount, inoutdte, dept_seqno, conv_seqno, count_seqno, 
                    visatype_seqno, visaexpdte, chkcapture, flagvisarun, visarundays, intype, typedata, creusr, 
                    credte, credterm, remark, tmrunno, personid, flagprocess, flagvisa, flagdiff, upddte, visaprocessdte, pcsreasion, flagext, extlistseqno) 
                    values (vsrperson_seqno.nextval, visarun_seq, itm.cardtype, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm,
                    itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, totalin, itm.inoutdate, itm.dept_seqno, 
                    itm.conv_seqno, itm.count_seqno, itm.visatype_seqno, itm.visaexpdte, checkImage, 
                    decode(foundvisarunday, 'FOUND', 'Y', null), totaldiff, itm.intype, itm.typedata, itm.creusr, 
                    itm.credte, itm.credterm, itm.remark, itm.tmrunno, itm.personid, null, visarun.invisatypecd, 
                    flagdiff, sysdate, to_date(rec_tm.visarundte, 'yyyymmdd'), v_pcsreasion, flagext, extlistseqno);                            
                elsif checkmastervisarun is not null  and to_number(to_char(itm.inoutdate, 'yyyymmddhh24miss')) > to_number(to_char(chkinoutdate, 'yyyymmddhh24miss')) then
                    update tmvisarunperson set visarunseqno = visarun_seq, cardtype = itm.cardtype, tm6no = itm.tm6no, passportno = itm.tdtno, 
                    efamilynm = itm.efamilynm, efirstnm = itm.efirstnm, emiddlenm = itm.emiddlenm, sex = itm.sex, birthdte = itm.birthdte, nationcd = itm.nationcd,
                    amount = totalin, inoutdte = itm.inoutdate, dept_seqno = itm.dept_seqno, conv_seqno = itm.conv_seqno, count_seqno = itm.count_seqno,
                    visatype_seqno = itm.visatype_seqno, visaexpdte = itm.visaexpdte, chkcapture = checkImage, flagvisarun = decode(foundvisarunday, 'FOUND', 'Y', null), 
                    visarundays = totaldiff, intype = itm.intype, typedata = itm.typedata, creusr = itm.creusr, credte = itm.credte, credterm = itm.credterm,
                    remark = itm.remark, tmrunno = itm.tmrunno, personid = itm.personid, flagprocess = null, flagvisa = visarun.invisatypecd, flagdiff = flagdiff,
                    upddte = sysdate, visaprocessdte = to_date(rec_tm.visarundte, 'yyyymmdd'), pcsreasion = v_pcsreasion, flagext = flagext, extlistseqno = extlistseqno where vsrpersonseqno = checkmastervisarun;
                end if;
                
                update tmmain set visarunday = flagdiff where tmrunno = itm.tmrunno;
             end loop;
            end if;
            
            if foundvisarun = 'NOTFOUND' and foundvisarunday = 'NOTFOUND' then
                checkmastervisarun := null;
                chkinoutdate := null;
                begin
                        select vsrpersonseqno, inoutdte into checkmastervisarun, chkinoutdate 
                        from tmvisarunperson where passportno = visarun.tdtno and nationcd = visarun.nationcd and to_number(to_char(inoutdte, 'yyyymmdd')) < visarun.indte and rownum = 1;
                exception when no_data_found then  
                    checkmastervisarun := null;
                    chkinoutdate := null;
                end;                
                
                if checkmastervisarun is not null then
                    <<itemtm_loop>> for itm in
                    (
                        select * from tmvisarunperson where vsrpersonseqno = checkmastervisarun
                    )
                     loop
                     
                         insert into visarunlog (visarunlogseqno, vsrpersonseqno, cardtype, tm6no, passportno, efamilynm, efirstnm, emiddlenm, sex, 
                         birthdte, nationcd, inoutdte, dept_seqno, conv_seqno, count_seqno, visatype_seqno, visaexpdte, action, creusr, credte, credterm, 
                         remark, deptcd, visatypecd, convcd, lastinoutdte) 
                         values (visarunlog_seqno.nextval, itm.vsrpersonseqno, itm.cardtype, itm.tm6no, itm.passportno, itm.efamilynm, itm.efirstnm,
                         itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.inoutdte, itm.dept_seqno, itm.conv_seqno, itm.count_seqno,
                         itm.visatype_seqno, itm.visaexpdte, 'D', 'VISARUNDEL', sysdate, '192.169.1.12', 'ยกเลิการเป็น Visa Run', null,
                         null, null, to_date(visarun.indte, 'yyyymmdd'));
                         
                        delete tmvisarunperson  where vsrpersonseqno = checkmastervisarun;
                    end loop;   
               end if;      
             end if;             
            end if;
            
        if visarun.invisatypecd = '0014' then
            if foundvisarun = 'FOUND' or foundvisarunday = 'FOUND' then
                <<itemtm_loop>> for itm in
                 (                  
                    select * from (
                    select * from vw_tmonline where cardtype = '1'                    
                    and to_char(inoutdate, 'yyyymmdd') between to_char(to_date(rec_tm.visarundte, 'yyyymmdd') - 365, 'yyyymmdd') and rec_tm.visarundte
                    and tdtno = visarun.tdtno and nationcd = visarun.nationcd order by inoutdate desc
                    ) where rownum = 1
             )
             loop
                begin         
                    select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
                exception when no_data_found then
                    checkImage := 'N';
                end;
                                
                checkmastervisarun := null;
                chkinoutdate := null;
                
                begin
                    select vsrpersonseqno, inoutdte into checkmastervisarun, chkinoutdate 
                    from tmvisarunperson where passportno = itm.tdtno and nationcd = itm.nationcd and rownum = 1;                    
                exception when no_data_found then  
                    checkmastervisarun := null;
                    chkinoutdate := null;
                end;

                if checkmastervisarun is null then        
                    insert into tmvisarunperson (vsrpersonseqno, visarunseqno, cardtype, tm6no, passportno, efamilynm, efirstnm, 
                    emiddlenm, sex, birthdte, nationcd, amount, inoutdte, dept_seqno, conv_seqno, count_seqno, 
                    visatype_seqno, visaexpdte, chkcapture, flagvisarun, visarundays, intype, typedata, creusr, 
                    credte, credterm, remark, tmrunno, personid, flagprocess, flagvisa, flagdiff, upddte, visaprocessdte, pcsreasion, flagext, extlistseqno) 
                    values (vsrperson_seqno.nextval, visarun_seq, itm.cardtype, itm.tm6no, itm.tdtno, itm.efamilynm, itm.efirstnm,
                    itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, totalin, itm.inoutdate, itm.dept_seqno, 
                    itm.conv_seqno, itm.count_seqno, itm.visatype_seqno, itm.visaexpdte, checkImage, 
                    decode(foundvisarunday, 'FOUND', 'Y', null), totaldiff, itm.intype, itm.typedata, itm.creusr, 
                    itm.credte, itm.credterm, itm.remark, itm.tmrunno, itm.personid, null, visarun.invisatypecd, 
                    flagdiff, sysdate, to_date(rec_tm.visarundte, 'yyyymmdd'), v_pcsreasion, flagext, extlistseqno);                            
                elsif checkmastervisarun is not null  and to_number(to_char(itm.inoutdate, 'yyyymmddhh24miss')) > to_number(to_char(chkinoutdate, 'yyyymmddhh24miss')) then
                    update tmvisarunperson set visarunseqno = visarun_seq, cardtype = itm.cardtype, tm6no = itm.tm6no, passportno = itm.tdtno, 
                    efamilynm = itm.efamilynm, efirstnm = itm.efirstnm, emiddlenm = itm.emiddlenm, sex = itm.sex, birthdte = itm.birthdte, nationcd = itm.nationcd,
                    amount = totalin, inoutdte = itm.inoutdate, dept_seqno = itm.dept_seqno, conv_seqno = itm.conv_seqno, count_seqno = itm.count_seqno,
                    visatype_seqno = itm.visatype_seqno, visaexpdte = itm.visaexpdte, chkcapture = checkImage, flagvisarun = decode(foundvisarunday, 'FOUND', 'Y', null), 
                    visarundays = totaldiff, intype = itm.intype, typedata = itm.typedata, creusr = itm.creusr, credte = itm.credte, credterm = itm.credterm,
                    remark = itm.remark, tmrunno = itm.tmrunno, personid = itm.personid, flagprocess = null, flagvisa = visarun.invisatypecd, flagdiff = flagdiff,
                    upddte = sysdate, visaprocessdte = to_date(rec_tm.visarundte, 'yyyymmdd'), pcsreasion = v_pcsreasion, flagext = flagext, extlistseqno = extlistseqno where vsrpersonseqno = checkmastervisarun;
                end if;                
                
                update tmmain set visarunday = flagdiff where tmrunno = itm.tmrunno;
             end loop;
            end if;

            if foundvisarun = 'NOTFOUND' and foundvisarunday = 'NOTFOUND' then
                checkmastervisarun := null;
                chkinoutdate := null;
                begin
                        select vsrpersonseqno, inoutdte into checkmastervisarun, chkinoutdate 
                        from tmvisarunperson where passportno = visarun.tdtno and nationcd = visarun.nationcd and to_number(to_char(inoutdte, 'yyyymmdd')) < visarun.indte and rownum = 1;
                exception when no_data_found then  
                    checkmastervisarun := null;
                    chkinoutdate := null;
                end;                
                
                if checkmastervisarun is not null then
                    <<itemtm_loop>> for itm in
                    (
                        select * from tmvisarunperson where vsrpersonseqno = checkmastervisarun
                    )
                     loop
                     
                         insert into visarunlog (visarunlogseqno, vsrpersonseqno, cardtype, tm6no, passportno, efamilynm, efirstnm, emiddlenm, sex, 
                         birthdte, nationcd, inoutdte, dept_seqno, conv_seqno, count_seqno, visatype_seqno, visaexpdte, action, creusr, credte, credterm, 
                         remark, deptcd, visatypecd, convcd, lastinoutdte) 
                         values (visarunlog_seqno.nextval, itm.vsrpersonseqno, itm.cardtype, itm.tm6no, itm.passportno, itm.efamilynm, itm.efirstnm,
                         itm.emiddlenm, itm.sex, itm.birthdte, itm.nationcd, itm.inoutdte, itm.dept_seqno, itm.conv_seqno, itm.count_seqno,
                         itm.visatype_seqno, itm.visaexpdte, 'D', 'VISARUNDEL', sysdate, '192.169.1.12', 'ยกเลิการเป็น Visa Run', null,
                         null, null, to_date(visarun.indte, 'yyyymmdd'));
                         
                        delete tmvisarunperson  where vsrpersonseqno = checkmastervisarun;
                    end loop;   
               end if;      
             end if;            
            end if;  
            
            totalrownum:=totalrownum+1;   
            commitrow:=commitrow+1;
             if commitrow = 1000 then
                 update batchlog set prrow = totalrownum where batchlogno = batchlogno_seq;
                 commit;
                commitrow:=0;
            end if;             
        end loop; -- END LOOP VISARUN
         update batchlog set prrow = totalrownum, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
         commit;
 end loop; --cursor
 close c1;

 utl_file.put_line(file_ut,'total :'||totalrownum);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End PROCESSVISARUN_TEMPDATE  .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
 -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;
END PROCESSVISARUN_TEMPDATE ;
/
