CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_PROCESSOT" IS
tmpVar NUMBER;
BEGIN
    DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    sysdateCurrent varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totalinsert number(20);
    totaldelete number(20);
    batchlogno_seq number(20);
    extPersonSeq number(20);
    extPermit varchar2(8);
    extPermitdte date;
    extFlag char(1);
    chngPersonSeq number(20);
    chngPermit varchar2(8);
    chngPermitdte date;
    chngFlag char(1);
    rqsPersonSeq number(20);
    rqsPermit varchar2(8);
    rqsPermitdte date;
    rqsFlag char(1);
    flagfound varchar2(200);
    flagaction varchar2(200);
    lastPermitdte date;
    udeptSeq number(3);
    --file_ut UTL_FILE.FILE_TYPE;
   
    CURSOR c1 IS
        
        select extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno, tm6no, efirstnm, emiddlenm, efamilynm, sex, birth_date, birth_place, nation_seqno, opassport_place, 
        opassport_date, opassport_expdate, cpassport_place, cpassport_expdate, cpassport_date, in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, 
        building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, person_sts, ext_seqno, feeslip_seqno, 
        seqno, create_by, create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, rqs_sts, visatypesub_seqno, suffix_seqno, extflag, chngperson_seqno, chngpermitdte, 
        chngflag, rqsperson_seqno, rqspermitdte, rqsflag, extovs_date, processdte, null udept_org, yearofdob, sexdesc, deptlevel1, deptlevel2, 'EXTOVERSTAY' flagdata, get_countcd(nation_seqno) nationcode
        from processot 
        union all
        select 0 extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno, tm6no, efirstnm, emiddlenm, efamilynm, sex, birth_date, birth_place, nation_seqno, opassport_place, 
        opassport_date, opassport_expdate, cpassport_place, cpassport_expdate, cpassport_date, in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, 
        building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, person_sts, ext_seqno, feeslip_seqno, 
        seqno, create_by, create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, rqs_sts, visatypesub_seqno, suffix_seqno, 
        null extflag, null chngperson_seqno, null chngpermitdte, null chngflag, null rqsperson_seqno, null rqspermitdte, null rqsflag, null extovs_date, null processdte, null 
        udpet_org,  get_YearOfDob(birth_date) yearofdob, decode(sex, 'M', 'ชาย', 'F', 'หญิง', 'ไม่ระบุ') sexdesc, to_number(get_DeptSeqnoLevel1(udept_seqno)) deptlevel1, 
        to_number(get_DeptSeqnoLevel2(udept_seqno)) deptlevel2, 'OVERSTAY' flagdata, get_countcd(nation_seqno) nationcode
        from ext_person where (to_char(sysdate, 'yyyymmdd') - to_char(permit_date, 'yyyymmdd')) = 1 
        and approve_sts = 'A' and cpassportno <> 'PASSPORT'
        and statusextdte is null 
        and nation_seqno is not null
        and to_number(to_char(permit_date, 'yyyy')) > 2014
        and create_by not in (select user_id from fw_groupuser where group_id = '4'); 

    rec_ext c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totalinsert := 0;
        totaldelete := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '20', 'Overstay ขออยู่ต่อ', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_BEGINEXTOVERSTAY' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start PS_BEGINEXTOVERSTAY .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_ext; EXIT WHEN c1%NOTFOUND;
            extPersonSeq := null;
            extPermit := null;
            extPermitdte := null;
            extFlag := null;
            chngPersonSeq := null;
            chngPermit := null;
            chngPermitdte := null;
            chngFlag := null;
            rqsPersonSeq := null;
            rqsPermit := null;
            rqsPermitdte := null;
            rqsFlag := null;
            flagfound := 'NOTFOUND';
            flagaction := 'NOTACTION';
            lastPermitdte := null;
            udeptSeq :=null;
            
            -- ตรวจสอบข้อมูลขออยู่ต่อของเมื่อวาน --
            if rec_ext.flagdata = 'EXTOVERSTAY' then
                FOR rec_extday IN (select * from ext_person where to_char(update_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd') and approve_sts = 'A' and extperson_seqno = rec_ext.extperson_seqno)
                LOOP
                    IF sysdateCurrent < to_char(rec_extday.permit_date, 'yyyymmdd') THEN 
                        flagfound := 'FOUND EXTDAY extperson_seqno '|| rec_extday.extperson_seqno;
                        flagaction := 'DELETE EXTOVERSTAY';
                        lastPermitdte := rec_extday.permit_date;
                    end if;
                END LOOP;
                
                 if flagfound = 'NOTFOUND' then
                    FOR rec_extday IN (select * from ext_person where to_char(update_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd') 
                    and approve_sts = 'A' and (cpassportno = rec_ext.cpassportno or opassportno = rec_ext.cpassportno)
                    and (case when rec_ext.nation_seqno in (45, 94, 143) and nation_seqno in (45, 94, 143) then 1 
                    when rec_ext.nation_seqno not in (45, 94, 143) and nation_seqno = rec_ext.nation_seqno then 1 else 0 end = 1)                     
                    )
                    LOOP
                        IF sysdateCurrent < to_char(rec_extday.permit_date, 'yyyymmdd') THEN 
                            flagfound := 'FOUND EXTDAY cpassportno nation_seqno '|| rec_extday.extperson_seqno;
                            flagaction := 'DELETE EXTOVERSTAY';
                            lastPermitdte := rec_extday.permit_date;
                        end if;
                    END LOOP;
                 end if;
                 
                 --  ตรวจสอบ  chng rqs
                 if flagaction = 'NOTACTION' then
                    -- ตรวจสอบ วันครบกำหนดอนุญาตล่าสุด (เปลี่ยนประเภทวีซ่า ขอมีถิ่นฯ) --                
                    FOR rec_chng IN (select to_char(chng.visa_expdate, 'yyyymmdd') permit, chng.chngperson_seqno, chng.visa_expdate from chng_person chng 
                    where chng.passportno = rec_ext.cpassportno 
                    and (case when rec_ext.nation_seqno in (45, 94, 143) and chng.nation_seqno in (45, 94, 143) then 1 
                    when rec_ext.nation_seqno not in (45, 94, 143) and chng.nation_seqno = rec_ext.nation_seqno then 1 else 0 end = 1)                        
                    and to_char(visa_expdate, 'yyyymmdd') >=  to_char(rec_ext.permit_date, 'yyyymmdd') 
                    and chng.status = 1 and chng.actflag = 'Y' and rownum = 1)
                    LOOP
                        IF to_char(rec_chng.visa_expdate, 'yyyymmdd') > sysdateCurrent THEN
                            chngPersonSeq := rec_chng.chngperson_seqno;
                            chngPermit := rec_chng.permit;
                            chngPermitdte := rec_chng.visa_expdate;
                            chngFlag := 'Y';
                        ELSE
                            chngFlag := 'N';
                        END IF;
                    END LOOP;
                    
                    FOR rec_rqs IN (select to_char(rqs.permit_date, 'yyyymmdd') permit, rqs.rqsperson_seqno, rqs.permit_date from rqs_person rqs 
                    where rqs.cpassportno = rec_ext.cpassportno
                    and (case when rec_ext.nation_seqno in (45, 94, 143) and rqs.nation_seqno in (45, 94, 143) then 1 
                    when rec_ext.nation_seqno not in (45, 94, 143) and rqs.nation_seqno = rec_ext.nation_seqno then 1 else 0 end = 1)     
                    and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_ext.permit_date, 'yyyymmdd')
                    and rqs.apprvsts not in ('C','N','R') and rownum = 1)
                    LOOP
                        IF to_char(rec_rqs.permit_date, 'yyyymmdd') > sysdateCurrent THEN
                            rqsPersonSeq := rec_rqs.rqsperson_seqno;
                            rqsPermit := rec_rqs.permit;
                            rqsPermitdte := rec_rqs.permit_date;
                            rqsFlag := 'Y';
                        ELSE
                            rqsFlag := 'N';
                        END IF;
                    END LOOP;
                    -- ตรวจสอบ วันครบกำหนดอนุญาตล่าสุด (เปลี่ยนประเภทวีซ่า ขอมีถิ่นฯ) --
                    IF chngFlag = 'Y' THEN
                        IF chngPermit > sysdateCurrent THEN
                            flagfound := 'FOUND CHNG cpassportno nation_seqno ='|| rec_ext.extperson_seqno ||' chngPersonSeq ='|| chngPersonSeq;
                            flagaction := 'DELETE EXTOVERSTAY';
                        END IF;
                    END IF;
                                        
                    IF rqsFlag = 'Y' THEN
                        IF rqsPermit > sysdateCurrent THEN
                            flagfound := 'FOUND RQS cpassportno nation_seqno ='|| rec_ext.extperson_seqno ||' rqsPersonSeq ='|| rqsPersonSeq;
                            flagaction := 'DELETE EXTOVERSTAY';
                        END IF;
                    END IF;   
                 end if;
                 
                -- ตรวจสอบข้อมูลการเดินทางเข้า --
                lastPermitdte :=  rec_ext.permit_date;
                if chngFlag = 'Y' then
                    lastPermitdte := chngPermitdte;
                    --DBMS_OUTPUT.PUT_LINE('Last Permit date chngFlag '|| lastPermitdte);
                elsif rqsFlag = 'Y' then
                    lastPermitdte := rqsPermitdte;
                    --DBMS_OUTPUT.PUT_LINE('Last Permit date rqsFlag '|| lastPermitdte);
                end if;
                
                if flagfound = 'NOTFOUND' then
                    FOR rec_card1 IN (select * from (select * from vw_tmonline 
                        where tdtno = rec_ext.cpassportno and cardtype = '1' 
                        and (case when rec_ext.nation_seqno in (45, 94, 143) and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_ext.nation_seqno not in (45, 94, 143) and nationcd = get_NationsBySeq(rec_ext.nation_seqno, 'S') then 1 else 0 end = 1)                       
                        and to_char(inoutdate, 'YYYYMMDD') > to_char(rec_ext.ext_date, 'YYYYMMDD') order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า เลขหนังสือเดินทาง วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                    END LOOP;        
                end if;
                
            -- ตรวจสอบ 3 ชื่อ --
                IF flagfound = 'NOTFOUND' then
                    if rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then
                        FOR rec_card1 IN (select * from (select * from tmmain
                            where ((efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm) or (efamilynm = rec_ext.efamilynm and emiddlenm = rec_ext.efirstnm)
                            or (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm) or (efirstnm = rec_ext.efamilynm and emiddlenm = rec_ext.efirstnm)
                            or (emiddlenm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm) or (emiddlenm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm)
                            or (efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.emiddlenm) or (efamilynm = rec_ext.efamilynm and emiddlenm = rec_ext.emiddlenm)
                            or (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.emiddlenm) or (efirstnm = rec_ext.efamilynm and emiddlenm = rec_ext.emiddlenm)
                            or (emiddlenm = rec_ext.efamilynm and efirstnm = rec_ext.emiddlenm) or (emiddlenm = rec_ext.efamilynm and efamilynm = rec_ext.emiddlenm)                    
                            or (efamilynm = rec_ext.emiddlenm and efirstnm = rec_ext.efirstnm) or (efamilynm = rec_ext.emiddlenm and emiddlenm = rec_ext.efirstnm)
                            or (efirstnm = rec_ext.emiddlenm and efamilynm = rec_ext.efirstnm) or (efirstnm = rec_ext.emiddlenm and emiddlenm = rec_ext.efirstnm)
                            or (emiddlenm = rec_ext.emiddlenm and efirstnm = rec_ext.efirstnm) or (emiddlenm = rec_ext.emiddlenm and efamilynm = rec_ext.efirstnm))
                            and birthdte = rec_ext.birth_date
                            and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                           
                            and to_char(indte, 'YYYYMM') > '201612'
                            and (indte is not null and outdte is null)
                            and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by indte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                        END LOOP;
                    end if;
                END IF;     
             -- ตรวจสอบ 3 ชื่อ --       
             
                if flagfound = 'NOTFOUND' then
                    if (rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then                    
                        FOR rec_card1 IN (select * from (select * from vw_tmonline
                            where (efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null) 
                            and birthdte = rec_ext.birth_date
                            and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                     
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '1'
                            --and (indte is not null and outdte is null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                        END LOOP;                  
                        
                        IF flagfound = 'NOTFOUND' THEN
                            FOR rec_card1 IN (select * from (select * from vw_tmonline
                                where (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm and emiddlenm is null) 
                                and birthdte = rec_ext.birth_date
                                and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                                when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                            
                                and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '1'
                                --and (inoutdate is not null and outdte is null)
                                and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                                order by inoutdate desc) where rownum = 1)
                            LOOP
                                flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                            END LOOP;
                        END IF;
                    elsif (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                        FOR rec_card1 IN (select * from (select * from vw_tmonline
                            where (efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm) 
                            and birthdte = rec_ext.birth_date
                            and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                           
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '1'
                            --and (indte is not null and outdte is null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                        END LOOP;
                    elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null) then
                        FOR rec_card1 IN (select * from (select * from vw_tmonline
                            where (efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm)
                            and birthdte = rec_ext.birth_date
                            and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                            
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '1'
                            --and (indte is not null and outdte is null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                        END LOOP;                
                    end if;
                END IF;            
            
                if flagfound = 'NOTFOUND' then
                    if (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null) then
                        FOR rec_card1 IN (select * from (select * from vw_tmonline
                            where (efamilynm = rec_ext.efamilynm)
                            and birthdte = rec_ext.birth_date
                            and nationcd = rec_ext.nationcode                           
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '1'
                            --and (indte is not null and outdte is null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                        END LOOP;
                    elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then
                        FOR rec_card1 IN (select * from (select * from vw_tmonline
                            where (efirstnm = rec_ext.efirstnm)
                            and birthdte = rec_ext.birth_date
                            and nationcd = rec_ext.nationcode                              
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '1'
                            --and (indte is not null and outdte is null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                        END LOOP;
                    elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                        FOR rec_card1 IN (select * from (select * from vw_tmonline
                            where (emiddlenm = rec_ext.emiddlenm)
                            and birthdte = rec_ext.birth_date
                            and nationcd = rec_ext.nationcode                                 
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype ='1'
                            --and (indte is not null and outdte is null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
                        END LOOP;
                    end if;
                end if;                        
                
                if flagfound = 'NOTFOUND' then
                    FOR rec_card1 IN (select * from immigration where tdtno = rec_ext.cpassportno and tm6no = rec_ext.tm6no and cardtype = '1'
                    and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 tdtno and tm6no '|| rec_card1.personid;
                    END LOOP;
                end if;
                -- ตรวจสอบข้อมูลการเดินทางเข้า --
              end if;
            -- ตรวจสอบข้อมูลขออยู่ต่อของเมื่อวาน EXTOVERSTAY --
            
            -- ตรวจสอบข้อมูลการเดินทางออก --
            if flagfound = 'NOTFOUND'  then                
                FOR rec_card2 IN (select * from (select * from vw_tmonline 
                    where tdtno = rec_ext.cpassportno and cardtype = '2' 
                    and (case when rec_ext.nation_seqno in (45, 94, 143) and nationcd in ('C10', 'M24', 'H04') then 1 
                    when rec_ext.nation_seqno not in (45, 94, 143) and nationcd = get_NationsBySeq(rec_ext.nation_seqno, 'S') then 1 else 0 end = 1)                     
                    and to_char(inoutdate, 'YYYYMMDD') > to_char(rec_ext.ext_date, 'YYYYMMDD') order by inoutdate desc) where rownum = 1)
                LOOP
                    flagfound := 'พบข้อมูลขาออก เลขหนังสือเดินทาง วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                END LOOP;                
            end if;
            
            -- ตรวจสอบ 3 ชื่อ --
            IF flagfound = 'NOTFOUND' then
                if rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm) or (efamilynm = rec_ext.efamilynm and emiddlenm = rec_ext.efirstnm)
                        or (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm) or (efirstnm = rec_ext.efamilynm and emiddlenm = rec_ext.efirstnm)
                        or (emiddlenm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm) or (emiddlenm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm)
                        or (efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.emiddlenm) or (efamilynm = rec_ext.efamilynm and emiddlenm = rec_ext.emiddlenm)
                        or (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.emiddlenm) or (efirstnm = rec_ext.efamilynm and emiddlenm = rec_ext.emiddlenm)
                        or (emiddlenm = rec_ext.efamilynm and efirstnm = rec_ext.emiddlenm) or (emiddlenm = rec_ext.efamilynm and efamilynm = rec_ext.emiddlenm)                    
                        or (efamilynm = rec_ext.emiddlenm and efirstnm = rec_ext.efirstnm) or (efamilynm = rec_ext.emiddlenm and emiddlenm = rec_ext.efirstnm)
                        or (efirstnm = rec_ext.emiddlenm and efamilynm = rec_ext.efirstnm) or (efirstnm = rec_ext.emiddlenm and emiddlenm = rec_ext.efirstnm)
                        or (emiddlenm = rec_ext.emiddlenm and efirstnm = rec_ext.efirstnm) or (emiddlenm = rec_ext.emiddlenm and efamilynm = rec_ext.efirstnm))
                        and birthdte = rec_ext.birth_date
                        and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                        
             -- ตรวจสอบ 3 ชื่อ --            
            
            IF flagfound = 'NOTFOUND' THEN
                if (rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then                    
                    FOR rec_card2 IN (select * from (select * from vw_tmonline
                        where (efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null) 
                        and birthdte = rec_ext.birth_date
                        and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                                    
                        and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                        --and (indte is null and outdte is not null)
                        and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card2 IN (select * from (select * from vw_tmonline
                            where (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm and emiddlenm is null) 
                            and birthdte = rec_ext.birth_date
                            and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                                  
                            and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                            --and (indte is null and inoutdate is not null)
                            and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by inoutdate desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from vw_tmonline
                        where (efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm) 
                        and birthdte = rec_ext.birth_date
                        and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                                      
                        and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                        --and (indte is null and outdte is not null)
                        and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from vw_tmonline
                        where (efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm)
                        and birthdte = rec_ext.birth_date
                        and (case when rec_ext.nationcode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_ext.nationcode not in ('C10', 'M24', 'H04') and nationcd = rec_ext.nationcode then 1 else 0 end = 1)                                   
                        and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                        --and (indte is null and outdte is not null)
                        and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from vw_tmonline
                        where (efamilynm = rec_ext.efamilynm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = rec_ext.nationcode                            
                        and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                        --and (indte is null and outdte is not null)
                        and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from vw_tmonline
                        where (efirstnm = rec_ext.efirstnm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = rec_ext.nationcode                      
                        and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                        --and (indte is null and outdte is not null)
                        and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from vw_tmonline 
                        where (emiddlenm = rec_ext.emiddlenm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = rec_ext.nationcode                        
                        and to_char(inoutdate, 'YYYYMM') > '201612' and cardtype = '2'
                        --and (indte is null and outdte is not null)
                        and to_char(inoutdate, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by inoutdate desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
            
            if flagfound = 'NOTFOUND' then
                FOR rec_card2 IN (select * from immigration where tdtno = rec_ext.cpassportno and tm6no = rec_ext.tm6no and cardtype = '2'
                and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                LOOP
                    flagfound := 'FOUND CARD2 tdtno and tm6no '|| rec_card2.personid;
                END LOOP;
            end if;
            -- ตรวจสอบข้อมูลการเดินทางออก --
            
            -- ตรวจสอบ Blacklist Overstay --
             if flagfound = 'NOTFOUND' then
                FOR rec_wl IN (select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') 
                and b.docno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and a.nation_seqno in (45, 94, 143) then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and a.nation_seqno = rec_ext.nation_seqno then 1 else 0 end = 1))         
                LOOP
                    flagfound := 'FOUND WL Overstay '|| rec_wl.wlcd;
                END LOOP;
            end if;
            -- ตรวจสอบ Blacklist Overstay -- 
       
            -- ตรวจสอบ ค่าปรับ --
             if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_ext.cpassportno and nation_seqno = rec_ext.nation_seqno 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_ext.ext_date, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno nation_seqno  '|| rec_fines.fines_seqno;
                END LOOP;
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where (tm6no = rec_ext.tm6no or passportno = rec_ext.cpassportno) and nvl(efamilynm, '-') = nvl(rec_ext.efamilynm, '-') and efirstnm = rec_ext.efirstnm 
                and nvl(emiddlenm, '-') = nvl(rec_ext.emiddlenm, '-')  and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_ext.ext_date, 'yyyymmdd')) 
                and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES 3NM tm6no '|| rec_fines.fines_seqno;
                END LOOP;
            end if;  
            
            if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_ext.cpassportno and tm6no = rec_ext.tm6no 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_ext.ext_date, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno tm6no '|| rec_fines.fines_seqno;
                END LOOP;
            end if;            
            -- ตรวจสอบ ค่าปรับ -- 
            
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where tdtno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and nationcd = get_NationsBySeq(rec_ext.nation_seqno, 'S') then 1 else 0 end = 1))    
                LOOP
                    flagfound := 'FOUND TMINFORMDEAD tdtno and nationcd '|| rec_tmfd.tminfdeadseqno;
                END LOOP;
            end if;
            
           if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where nvl(efamilynm, '-') = nvl(rec_ext.efamilynm, '-') and efirstnm = rec_ext.efirstnm and nvl(emiddlenm, '-') = nvl(rec_ext.emiddlenm, '-')
                and tm6no = rec_ext.tm6no)
                LOOP
                    flagfound := 'FOUND TMINFORMDEAD 3NM and tm6no '|| rec_tmfd.tminfdeadseqno;
                END LOOP;
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where tdtno = rec_ext.cpassportno and tm6no = rec_ext.tm6no)
                LOOP
                    flagfound := 'FOUND TMINFORMDEAD tdtno and tm6no '|| rec_tmfd.tminfdeadseqno;
                END LOOP;
            end if;
            
                if flagfound = 'NOTFOUND' then
                    if get_age(rec_ext.birth_date) < 15 then
                        flagfound := 'FOUND AGE < 15 '|| rec_ext.extperson_seqno;
                    end if;
                End if;
            
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            if rec_ext.flagdata = 'OVERSTAY' then
                if flagfound = 'NOTFOUND' then
                -- ตรวจสอบ วันครบกำหนดอนุญาตล่าสุด (เปลี่ยนประเภทวีซ่า ขอมีถิ่นฯ) --
                extPersonSeq := rec_ext.extperson_seqno;
                extPermit := to_char(rec_ext.permit_date, 'yyyymmdd');
                extPermitdte := rec_ext.permit_date;
                extFlag := 'Y';
                
                FOR rec_chng IN (select to_char(chng.visa_expdate, 'yyyymmdd') permit, chng.chngperson_seqno, chng.visa_expdate from chng_person chng 
                where chng.passportno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and chng.nation_seqno in (45, 94, 143) then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and chng.nation_seqno = rec_ext.nation_seqno  then 1 else 0 end = 1)   
                and to_char(visa_expdate, 'yyyymmdd') >=  to_char(rec_ext.permit_date, 'yyyymmdd') 
                and chng.status = 1 and chng.actflag = 'Y' and rownum = 1)
                LOOP
                    IF to_char(rec_chng.visa_expdate, 'yyyymmdd') < sysdateCurrent THEN
                        chngPersonSeq := rec_chng.chngperson_seqno;
                        chngPermit := rec_chng.permit;
                        chngPermitdte := rec_chng.visa_expdate;
                        chngFlag := 'Y';
                    ELSE
                        chngFlag := 'N';
                    END IF;
                END LOOP;
                
                
                FOR rec_rqs IN (select to_char(rqs.permit_date, 'yyyymmdd') permit, rqs.rqsperson_seqno, rqs.permit_date from rqs_person rqs 
                where rqs.cpassportno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and rqs.nation_seqno in (45, 94, 143) then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and rqs.nation_seqno = rec_ext.nation_seqno  then 1 else 0 end = 1) 
                and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_ext.permit_date, 'yyyymmdd')
                and rqs.apprvsts not in ('C','N','R') and rownum = 1)
                LOOP
                    IF to_char(rec_rqs.permit_date, 'yyyymmdd') < sysdateCurrent THEN
                        rqsPersonSeq := rec_rqs.rqsperson_seqno;
                        rqsPermit := rec_rqs.permit;
                        rqsPermitdte := rec_rqs.permit_date;
                        rqsFlag := 'Y';
                    ELSE
                        rqsFlag := 'N';
                    END IF;
                END LOOP;
                -- ตรวจสอบ วันครบกำหนดอนุญาตล่าสุด (เปลี่ยนประเภทวีซ่า ขอมีถิ่นฯ) --
                
                IF extFlag = 'Y' AND chngFlag = 'Y' AND rqsFlag IS NULL THEN
                    IF chngPermit < extPermit THEN
                        IF extPermit < sysdateCurrent THEN
                            extFlag := 'Y';
                            chngFlag := null;
                            rqsFlag := null;
                        END IF;
                    ELSE
                        IF chngPermit < sysdateCurrent THEN
                            extFlag := null;
                            chngFlag := 'Y';
                            rqsFlag := null;
                        END IF;
                    END IF;
                END IF;
                
                IF rqsFlag = 'Y' AND (extFlag = 'Y' OR chngFlag = 'Y') THEN
                    IF rqsPermit < sysdateCurrent THEN
                        extFlag := null;
                        chngFlag := null;
                        rqsFlag := 'Y';
                    END IF;
                END IF;
                
                IF extFlag = 'Y' AND chngFlag = 'N' THEN
                    extPersonSeq := null;
                    chngPersonSeq := null;
                    rqsPersonSeq := null;
                    chngFlag := null;
                ELSIF extFlag = 'Y' AND chngFlag = 'Y' AND rqsFlag = 'N' THEN
                    extPersonSeq := null;
                    chngPersonSeq := null;
                    rqsPersonSeq := null;
                END IF;
                
                -- ตรวจสอบข้อมูลการเดินทางเข้า --
                if extFlag = 'Y' then
                    lastPermitdte := extPermitdte;
                    --DBMS_OUTPUT.PUT_LINE('Last Permit date extFlag '|| lastPermitdte);
                elsif chngFlag = 'Y' then
                    lastPermitdte := chngPermitdte;
                    --DBMS_OUTPUT.PUT_LINE('Last Permit date chngFlag '|| lastPermitdte);
                elsif rqsFlag = 'Y' then
                    lastPermitdte := rqsPermitdte;
                    --DBMS_OUTPUT.PUT_LINE('Last Permit date rqsFlag '|| lastPermitdte);
                end if;
                
                FOR rec_card1 IN (select * from immigration where tdtno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and nationcd = get_NationsBySeq(rec_ext.nation_seqno, 'S') then 1 else 0 end = 1)
                and cardtype = '1'
                and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                LOOP
                    flagfound := 'FOUND CARD1 tdtno and nationcd '|| rec_card1.personid;
                END LOOP;
                
                if flagfound = 'NOTFOUND' then
                    if rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then -- L F M
                        --DBMS_OUTPUT.PUT_LINE('TEST LFM extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select personid from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                        and efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 LFM and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP;
                    elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null then -- L F
                        --DBMS_OUTPUT.PUT_LINE('TEST LF extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                        and efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 LF and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP;
                    elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null then -- L M
                        --DBMS_OUTPUT.PUT_LINE('TEST LM extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno)
                        and cardtype = '1' and efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 LM and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP; 
                    elsif rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then -- F M
                        --DBMS_OUTPUT.PUT_LINE('TEST FM extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                        and efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 FM and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP;
                    elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null then -- L
                        --DBMS_OUTPUT.PUT_LINE('TEST L extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) 
                        and cardtype = '1' and efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 L and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP;
                    elsif rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null then -- F
                        --DBMS_OUTPUT.PUT_LINE('TEST F extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                        and efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm is null and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 F and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP;
                    elsif rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null then -- M
                        --DBMS_OUTPUT.PUT_LINE('TEST M extperson_seqno '|| rec_ext.extperson_seqno);
                        FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                        and efamilynm is null and efirstnm is null and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                        and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                        LOOP
                            flagfound := 'FOUND CARD1 M and tdtno and birthdte '|| rec_card1.personid;
                        END LOOP;
                    end if;
                end if;
                
                if flagfound = 'NOTFOUND' then
                    FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and tm6no = rec_ext.tm6no and cardtype = '1'
                    and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmddd')))
                    LOOP
                        flagfound := 'FOUND CARD1 tdtno and tm6no '|| rec_card1.personid;
                    END LOOP;
                end if;
                -- ตรวจสอบข้อมูลการเดินทางเข้า --      
                          
                --DBMS_OUTPUT.PUT_LINE('flagfound '|| flagfound || 'flagdata '|| rec_extflagdata ||' extperson_seqno '|| rec_ext.extperson_seqno);
                IF (extFlag = 'Y' OR extFlag IS NULL) AND (chngFlag = 'Y' OR chngFlag IS NULL) AND (rqsFlag = 'Y' OR rqsFlag IS NULL AND flagfound = 'NOTFOUND') THEN
                    totalinsert := totalinsert +1;
                    
                    
                    udeptSeq := rec_ext.udept_seqno;
                    if rec_ext.flagdata = 'OVERSTAY' and rec_ext.extperson_seqno is not null and rec_ext.cpassportno is not null 
                        and rec_ext.ext_date is not null and rec_ext.docno is not null and rec_ext.udept_seqno is not null then
                        udeptSeq := get_extudept(rec_ext.extperson_seqno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno, rec_ext.udept_seqno);
                    end if;
                    
                    insert into processot (
                       extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno,  tm6no, efirstnm, emiddlenm, 
                       efamilynm, sex, birth_date, birth_place, nation_seqno, opassport_place, opassport_date, opassport_expdate, cpassport_place, 
                       cpassport_expdate, cpassport_date, in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, 
                       building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, 
                       person_sts, ext_seqno, feeslip_seqno, seqno, create_by, create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, 
                       rqs_sts, visatypesub_seqno, suffix_seqno, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, 
                       extovs_date, processdte, udept_org, yearofdob, sexdesc, deptlevel1, deptlevel2) 
                    values (extoverstay_seq.nextval, rec_ext.extperson_seqno, rec_ext.opassportno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno, rec_ext.tm6no,
                     rec_ext.efirstnm, rec_ext.emiddlenm, rec_ext.efamilynm, rec_ext.sex, rec_ext.birth_date, rec_ext.birth_place, rec_ext.nation_seqno, rec_ext.opassport_place,
                     rec_ext.opassport_date, rec_ext.opassport_expdate, rec_ext.cpassport_place, rec_ext.cpassport_expdate, rec_ext.cpassport_date, rec_ext.in_date,
                     rec_ext.conv_seqno, rec_ext.convregno, rec_ext.fromcount, rec_ext.dept_seqno, rec_ext.visatype_seqno, rec_ext.visa_expdate, rec_ext.building,
                     rec_ext.addr, rec_ext.road, rec_ext.pv_seqno, rec_ext.amp_seqno, rec_ext.tmb_seqno, rec_ext.postcode, rec_ext.tel, rec_ext.reason_seqno,
                     rec_ext.reason_day, rec_ext.approve_sts, rec_ext.permit_date, rec_ext.person_sts, rec_ext.ext_seqno, rec_ext.feeslip_seqno, rec_ext.seqno,
                     rec_ext.create_by, rec_ext.create_date, rec_ext.update_by, rec_ext.update_date, rec_ext.version, udeptSeq, rec_ext.statusext, rec_ext.statusextdte,
                     rec_ext.rqs_sts, rec_ext.visatypesub_seqno, rec_ext.suffix_seqno, chngpersonseq, chngpermitdte, chngflag, rqspersonseq, rqspermitdte, rqsflag, sysdate, sysdate, 
                     rec_ext.udept_seqno, rec_ext.yearofdob, rec_ext.sexdesc, rec_ext.deptlevel1, rec_ext.deptlevel2);
                     
                /*ELSE
                    totalinsert := totalinsert +1;
                    insert into extoverstay (
                       extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno,  tm6no, efirstnm, emiddlenm, 
                       efamilynm, sex, birth_date, birth_place, nation_seqno, opassport_place, opassport_date, opassport_expdate, cpassport_place, 
                       cpassport_expdate, cpassport_date, in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, 
                       building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, 
                       person_sts, ext_seqno, feeslip_seqno, seqno, create_by, create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, 
                       rqs_sts, visatypesub_seqno, suffix_seqno, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, extovs_date, processdte, remark) 
                    values (extoverstay_seq.nextval, rec_ext.extperson_seqno, rec_ext.opassportno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno, rec_ext.tm6no,
                     rec_ext.efirstnm, rec_ext.emiddlenm, rec_ext.efamilynm, rec_ext.sex, rec_ext.birth_date, rec_ext.birth_place, rec_ext.nation_seqno, rec_ext.opassport_place,
                     rec_ext.opassport_date, rec_ext.opassport_expdate, rec_ext.cpassport_place, rec_ext.cpassport_expdate, rec_ext.cpassport_date, rec_ext.in_date,
                     rec_ext.conv_seqno, rec_ext.convregno, rec_ext.fromcount, rec_ext.dept_seqno, rec_ext.visatype_seqno, rec_ext.visa_expdate, rec_ext.building,
                     rec_ext.addr, rec_ext.road, rec_ext.pv_seqno, rec_ext.amp_seqno, rec_ext.tmb_seqno, rec_ext.postcode, rec_ext.tel, rec_ext.reason_seqno,
                     rec_ext.reason_day, rec_ext.approve_sts, rec_ext.permit_date, rec_ext.person_sts, rec_ext.ext_seqno, rec_ext.feeslip_seqno, rec_ext.seqno,
                     rec_ext.create_by, rec_ext.create_date, rec_ext.update_by, rec_ext.update_date, rec_ext.version, rec_ext.udept_seqno, rec_ext.statusext, rec_ext.statusextdte,
                     rec_ext.rqs_sts, rec_ext.visatypesub_seqno, rec_ext.suffix_seqno, chngpersonseq, chngpermitdte, chngflag, rqspersonseq, rqspermitdte, rqsflag, sysdate, sysdate, 
                     'EXTFLAG = ' || extFlag || ' CHNGFLAG = ' || chngflag || ' RQSFLAG = ' || rqsflag);*/            
                END IF;
              END IF; 
          END IF; 
          
          
          if flagfound <> 'NOTFOUND' then
                totaldelete := totaldelete +1;  
                insert into delprocessot (
                   delextovs_seqno, extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno, tm6no, efirstnm, emiddlenm, efamilynm, sex, 
                   birth_date, birth_place, nation_seqno, opassport_place, opassport_date, opassport_expdate, cpassport_place, cpassport_expdate, cpassport_date, 
                   in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, building, addr, road, pv_seqno, amp_seqno, 
                   tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, person_sts, ext_seqno, feeslip_seqno, seqno, create_by, 
                   create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, rqs_sts, visatypesub_seqno, 
                   suffix_seqno, extovs_date, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, processdte, 
                   processdeldte, flagdel, typedata, udept_org, yearofdob, sexdesc, deptlevel1, deptlevel2)
                values (delextovs_seqno.nextval, rec_ext.extovs_seqno, rec_ext.extperson_seqno, rec_ext.opassportno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno,
                 rec_ext.tm6no, rec_ext.efirstnm, rec_ext.emiddlenm, rec_ext.efamilynm, rec_ext.sex, rec_ext.birth_date, rec_ext.birth_place, rec_ext.nation_seqno,
                 rec_ext.opassport_place, rec_ext.opassport_date, rec_ext.opassport_expdate, rec_ext.cpassport_place, rec_ext.cpassport_expdate,
                 rec_ext.cpassport_date, rec_ext.in_date, rec_ext.conv_seqno, rec_ext.convregno, rec_ext.fromcount, rec_ext.dept_seqno, rec_ext.visatype_seqno,
                 rec_ext.visa_expdate, rec_ext.building, rec_ext.addr, rec_ext.road, rec_ext.pv_seqno, rec_ext.amp_seqno, rec_ext.tmb_seqno, rec_ext.postcode,
                 rec_ext.tel, rec_ext.reason_seqno, rec_ext.reason_day, rec_ext.approve_sts, rec_ext.permit_date, rec_ext.person_sts, rec_ext.ext_seqno,
                 rec_ext.feeslip_seqno, rec_ext.seqno, rec_ext.create_by, rec_ext.create_date, rec_ext.update_by, rec_ext.update_date, rec_ext.version,
                 rec_ext.udept_seqno, rec_ext.statusext, rec_ext.statusextdte, rec_ext.rqs_sts, rec_ext.visatypesub_seqno, rec_ext.suffix_seqno, rec_ext.extovs_date, 
                 rec_ext.chngperson_seqno, rec_ext.chngpermitdte, rec_ext.chngflag, rec_ext.rqsperson_seqno, rec_ext.rqspermitdte, rec_ext.rqsflag, rec_ext.processdte, 
                 sysdate, flagfound, rec_ext.flagdata, rec_ext.udept_org, rec_ext.yearofdob, rec_ext.sexdesc, rec_ext.deptlevel1, rec_ext.deptlevel2);
                
                 if rec_ext.flagdata = 'EXTOVERSTAY' then
                    delete processot where extovs_seqno = rec_ext.extovs_seqno;
                 end if;                 
                 
          end if;
           
           
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totalins = totalinsert, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
            --DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_imm.tdtno || ', extPersonSeq : ' || extPersonSeq || ', chngPersonSeq : ' || chngPersonSeq || ', rqsPersonSeq : ' || rqsPersonSeq);
            --DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_imm.tdtno || ', nationcd = ' || rec_imm.nationcd || ', count_seqno = ' || rec_imm.count_seqno || ', extFlag = ' || extFlag || ', chngFlag = ' || chngFlag || ', rqsFlag = ' || rqsFlag);
            --utl_file.put_line(file_ut, 'tdtno = ' || rec_imm.tdtno || ', nationcd = ' || rec_imm.nationcd  || ', count_seqno = ' || rec_imm.count_seqno || ', extFlag = ' || extFlag || ', chngFlag = ' || chngFlag || ', rqsFlag = ' || rqsFlag);
            --utl_file.fflush(file_ut);
        
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totalins = totalinsert, totaldel = totaldelete, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        --utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        --utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut, sysdateTxt || ' End PS_BEGINEXTOVERSTAY .... !!!');
        --utl_file.fflush(file_ut);
        --utl_file.fclose(file_ut);
        EXCEPTION
       WHEN others THEN
           DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_PROCESSOT;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_PROCESSOT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_PROCESSOT" TO "BIOSAADM";
