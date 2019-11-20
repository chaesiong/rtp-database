CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_BEGINEXTOVERSTAY" IS
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
    lastPermitdte date;
    --file_ut UTL_FILE.FILE_TYPE;
   
    CURSOR c1 IS
    
        /*
        select * from ext_person where (to_number(to_char(create_date, 'yyyymmdd')) between 20170101 and 20180205) and approve_sts = 'A' 
        and to_number(to_char(permit_date, 'yyyymmdd')) < to_number(to_char(sysdate, 'yyyymmdd')) 
        and statusextdte is null 
        and create_by not in (select user_id from fw_groupuser where group_id = '4')
        and to_number(to_char(permit_date, 'yyyy')) > 2000
        --and extperson_seqno in (3384690)
        --and extperson_seqno in (3160110, 3160111, 3160118, 3160134, 3160135, 3160159, 3160177, 3160178, 3160188, 3160199, 3160200, 3160214, 3160216,
        --3160234, 3160245, 3160251, 3160259, 3160267, 3160271, 3160272, 3160279, 3160285)
       --and rownum <= 1000
        order by create_date; 
        */
        
        select * from processot where pv_seqno is null;

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
        values (batchlogno_seq, 'OVS', '20', 'Begin Overstay ขออยู่ต่อ', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
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
            lastPermitdte := null;
            
            /*
            -- ตรวจสอบข้อมูลการเดินทางออก --
            FOR rec_card2 IN (select * from immigration where tdtno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and nationcd = get_NationsBySeq(rec_ext.nation_seqno, 'S') then 1 else 0 end = 1) 
                and cardtype = '2'
                and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
            LOOP
                flagfound := 'FOUND CARD2 tdtno and nationcd '|| rec_card2.personid;
            END LOOP;
            
            if flagfound = 'NOTFOUND' then
                if rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then -- L F M
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select personid from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '2' 
                    and efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 LFM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_ext.tm6no and cardtype = '2' 
                    and efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 LF and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) 
                    and cardtype = '2' and efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 LM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP; 
                elsif rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_ext.tm6no and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 FM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno)
                    and cardtype = '2' and efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 L and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm is null and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 F and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_ext.tm6no and cardtype = '2' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_ext.in_date, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 M and tm6no and birthdte '|| rec_card2.personid;
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
                FOR rec_wl IN (select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and b.docno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and a.nation_seqno in (45, 94, 143) then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and a.nation_seqno = rec_ext.nation_seqno then 1 else 0 end = 1))         
                LOOP
                    flagfound := 'FOUND WL Overstay '|| rec_wl.wlcd;
                END LOOP;
            end if;
            -- ตรวจสอบ Blacklist Overstay -- 
       
            -- ตรวจสอบ ค่าปรับ --
             if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_ext.cpassportno 
                and (case when rec_ext.nation_seqno in (45, 94, 143) and nation_seqno in (45, 94, 143) then 1 
                when rec_ext.nation_seqno not in (45, 94, 143) and nation_seqno = rec_ext.nation_seqno then 1 else 0 end = 1)
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
                and (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno))
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
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            */
            
         /*
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
                        flagfound := 'FOUND CARD1 LFM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                    and efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 LF and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) 
                    and cardtype = '1' and efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 LM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP; 
                elsif rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 FM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno)
                    and cardtype = '1' and efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 L and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card1 IN (select * from immigration where (tm6no = rec_ext.tm6no or tdtno = rec_ext.cpassportno) and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm is null and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 F and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M extperson_seqno '|| rec_ext.extperson_seqno);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_ext.tm6no and cardtype = '1' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_ext.emiddlenm and birthdte = rec_ext.birth_date
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(lastPermitdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 M and tm6no and birthdte '|| rec_card1.personid;
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
            
            --DBMS_OUTPUT.PUT_LINE('flagfound '|| flagfound ||' extperson_seqno '|| rec_ext.extperson_seqno);
            IF (extFlag = 'Y' OR extFlag IS NULL) AND (chngFlag = 'Y' OR chngFlag IS NULL) AND (rqsFlag = 'Y' OR rqsFlag IS NULL) AND flagfound = 'NOTFOUND' THEN
                totalinsert := totalinsert +1;
                
                insert into processot (
                   extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno,  tm6no, efirstnm, emiddlenm, 
                   efamilynm, sex, birth_date, birth_place, nation_seqno, opassport_place, opassport_date, opassport_expdate, cpassport_place, 
                   cpassport_expdate, cpassport_date, in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, 
                   building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, 
                   person_sts, ext_seqno, feeslip_seqno, seqno, create_by, create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, 
                   rqs_sts, visatypesub_seqno, suffix_seqno, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, extovs_date, processdte, extflag) 
                values (extoverstay_seq.nextval, rec_ext.extperson_seqno, rec_ext.opassportno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno, rec_ext.tm6no,
                 rec_ext.efirstnm, rec_ext.emiddlenm, rec_ext.efamilynm, rec_ext.sex, rec_ext.birth_date, rec_ext.birth_place, rec_ext.nation_seqno, rec_ext.opassport_place,
                 rec_ext.opassport_date, rec_ext.opassport_expdate, rec_ext.cpassport_place, rec_ext.cpassport_expdate, rec_ext.cpassport_date, rec_ext.in_date,
                 rec_ext.conv_seqno, rec_ext.convregno, rec_ext.fromcount, rec_ext.dept_seqno, rec_ext.visatype_seqno, rec_ext.visa_expdate, rec_ext.building,
                 rec_ext.addr, rec_ext.road, rec_ext.pv_seqno, rec_ext.amp_seqno, rec_ext.tmb_seqno, rec_ext.postcode, rec_ext.tel, rec_ext.reason_seqno,
                 rec_ext.reason_day, rec_ext.approve_sts, rec_ext.permit_date, rec_ext.person_sts, rec_ext.ext_seqno, rec_ext.feeslip_seqno, rec_ext.seqno,
                 rec_ext.create_by, rec_ext.create_date, rec_ext.update_by, rec_ext.update_date, rec_ext.version, rec_ext.udept_seqno, rec_ext.statusext, rec_ext.statusextdte,
                 rec_ext.rqs_sts, rec_ext.visatypesub_seqno, rec_ext.suffix_seqno, chngpersonseq, chngpermitdte, chngflag, rqspersonseq, rqspermitdte, rqsflag, sysdate, sysdate, extFlag);
                 
           /* ELSE
            totalinsert := totalinsert +1;
                insert into extoverstay (
                   extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno,  tm6no, efirstnm, emiddlenm, 
                   efamilynm, sex, birth_date, birth_place, nation_seqno, opassport_place, opassport_date, opassport_expdate, cpassport_place, 
                   cpassport_expdate, cpassport_date, in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, 
                   building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, 
                   person_sts, ext_seqno, feeslip_seqno, seqno, create_by, create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, 
                   rqs_sts, visatypesub_seqno, suffix_seqno, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, extovs_date, processdte, remark, extflag) 
                values (extoverstay_seq.nextval, rec_ext.extperson_seqno, rec_ext.opassportno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno, rec_ext.tm6no,
                 rec_ext.efirstnm, rec_ext.emiddlenm, rec_ext.efamilynm, rec_ext.sex, rec_ext.birth_date, rec_ext.birth_place, rec_ext.nation_seqno, rec_ext.opassport_place,
                 rec_ext.opassport_date, rec_ext.opassport_expdate, rec_ext.cpassport_place, rec_ext.cpassport_expdate, rec_ext.cpassport_date, rec_ext.in_date,
                 rec_ext.conv_seqno, rec_ext.convregno, rec_ext.fromcount, rec_ext.dept_seqno, rec_ext.visatype_seqno, rec_ext.visa_expdate, rec_ext.building,
                 rec_ext.addr, rec_ext.road, rec_ext.pv_seqno, rec_ext.amp_seqno, rec_ext.tmb_seqno, rec_ext.postcode, rec_ext.tel, rec_ext.reason_seqno,
                 rec_ext.reason_day, rec_ext.approve_sts, rec_ext.permit_date, rec_ext.person_sts, rec_ext.ext_seqno, rec_ext.feeslip_seqno, rec_ext.seqno,
                 rec_ext.create_by, rec_ext.create_date, rec_ext.update_by, rec_ext.update_date, rec_ext.version, rec_ext.udept_seqno, rec_ext.statusext, rec_ext.statusextdte,
                 rec_ext.rqs_sts, rec_ext.visatypesub_seqno, rec_ext.suffix_seqno, chngpersonseq, chngpermitdte, chngflag, rqspersonseq, rqspermitdte, rqsflag, sysdate, sysdate, 
                 'EXTFLAG = ' || extFlag || ' CHNGFLAG = ' || chngflag || ' RQSFLAG = ' || rqsflag, extFlag);         */   
         /*   END IF;
          END IF; 
          */
          
          flagfound := 'PV_SEQNO is null';
          if flagfound <> 'NOTFOUND' then
                totaldelete := totaldelete +1;
                
                insert into delprocessot (
                   delextovs_seqno, extovs_seqno, extperson_seqno, opassportno, cpassportno, ext_date, docno, tm6no, efirstnm, emiddlenm, efamilynm, sex, 
                   birth_date, birth_place, nation_seqno, opassport_place, opassport_date, opassport_expdate, cpassport_place, cpassport_expdate, cpassport_date, 
                   in_date, conv_seqno, convregno, fromcount, dept_seqno, visatype_seqno, visa_expdate, building, addr, road, pv_seqno, amp_seqno, 
                   tmb_seqno, postcode, tel, reason_seqno, reason_day, approve_sts, permit_date, person_sts, ext_seqno, feeslip_seqno, seqno, create_by, 
                   create_date, update_by, update_date, version, udept_seqno, statusext, statusextdte, rqs_sts, visatypesub_seqno, 
                   suffix_seqno, extovs_date, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, processdte, processdeldte, flagdel, extflag) 
                values (delextovs_seqno.nextval, null, rec_ext.extperson_seqno, rec_ext.opassportno, rec_ext.cpassportno, rec_ext.ext_date, rec_ext.docno,
                 rec_ext.tm6no, rec_ext.efirstnm, rec_ext.emiddlenm, rec_ext.efamilynm, rec_ext.sex, rec_ext.birth_date, rec_ext.birth_place, rec_ext.nation_seqno,
                 rec_ext.opassport_place, rec_ext.opassport_date, rec_ext.opassport_expdate, rec_ext.cpassport_place, rec_ext.cpassport_expdate,
                 rec_ext.cpassport_date, rec_ext.in_date, rec_ext.conv_seqno, rec_ext.convregno, rec_ext.fromcount, rec_ext.dept_seqno, rec_ext.visatype_seqno,
                 rec_ext.visa_expdate, rec_ext.building, rec_ext.addr, rec_ext.road, rec_ext.pv_seqno, rec_ext.amp_seqno, rec_ext.tmb_seqno, rec_ext.postcode,
                 rec_ext.tel, rec_ext.reason_seqno, rec_ext.reason_day, rec_ext.approve_sts, rec_ext.permit_date, rec_ext.person_sts, rec_ext.ext_seqno,
                 rec_ext.feeslip_seqno, rec_ext.seqno, rec_ext.create_by, rec_ext.create_date, rec_ext.update_by, rec_ext.update_date, rec_ext.version,
                 rec_ext.udept_seqno, rec_ext.statusext, rec_ext.statusextdte, rec_ext.rqs_sts, rec_ext.visatypesub_seqno, rec_ext.suffix_seqno, null, null,
                 null, null, null, null, null, sysdate, sysdate, flagfound, extFlag);
                 
                 delete processot where extovs_seqno = rec_ext.extovs_seqno;
          end if;
           
            --DBMS_OUTPUT.PUT_LINE('flagfound '|| flagfound ||' extperson_eeqno '|| rec_ext.extperson_seqno);
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
END PS_BEGINEXTOVERSTAY;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_BEGINEXTOVERSTAY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_BEGINEXTOVERSTAY" TO "BIOSAADM";
