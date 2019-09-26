CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_EXTOVERSTAY8788" IS
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
    nationCode char(3);
    --file_ut UTL_FILE.FILE_TYPE;
   
    CURSOR c1 IS
    
        select a.*, getAge(birth_date) age from tmp_tdtno a;

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
        values (batchlogno_seq, 'OVS', '20', 'Overstay ขออยู่ต่อ 8788 ', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
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
            nationCode := null;
            
            nationCode := get_countcd(rec_ext.nation_seqno);
             
            -- ตรวจสอบข้อมูลการเดินทางออก --
            FOR rec_card2 IN (select * from (select * from vw_tmonline 
                where tdtno = rec_ext.cpassportno and cardtype = '2' and to_char(inoutdate, 'YYYYMMDD') > to_char(rec_ext.ext_date, 'YYYYMMDD') order by inoutdate desc) where rownum = 1)
            LOOP
                flagfound := 'พบข้อมูลขาออก เลขหนังสือเดินทาง วันที่เดินทาง '|| to_char(rec_card2.inoutdate, 'dd/MM/yyyy');
            END LOOP;
            
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
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
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
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null) 
                        and birthdte = rec_ext.birth_date
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card2 IN (select * from (select * from tmmain
                            where (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm and emiddlenm is null) 
                            and birthdte = rec_ext.birth_date
                            and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                            and to_char(outdte, 'YYYYMM') > '201612'
                            and (indte is null and outdte is not null)
                            and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by outdte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm) 
                        and birthdte = rec_ext.birth_date
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm)
                        and birthdte = rec_ext.birth_date
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_ext.efamilynm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = nationCode                            
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efirstnm = rec_ext.efirstnm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = nationCode                      
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_ext.emiddlenm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = nationCode                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลการเดินทางออก --
           
            if flagfound = 'NOTFOUND' then
                if to_number(rec_ext.age) < 15 then
                    flagfound := 'อายุต่ำกว่า 15 ปี ';
                end if;
            END if;
          
            -- ตรวจสอบ Blacklist Overstay --
             if flagfound = 'NOTFOUND' then
                FOR rec_wl IN (select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and b.docno = rec_ext.cpassportno)      
                LOOP
                    flagfound := 'พบข้อมูล Blacklist Overstay'|| rec_wl.wlcd;
                END LOOP;
            end if;
            -- ตรวจสอบ Blacklist Overstay -- 
         
            -- ตรวจสอบ ค่าปรับ --
             if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_ext.cpassportno 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_ext.ext_date, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'พบข้อมูลค่าปรับ';
                END LOOP;
            end if;
            -- ตรวจสอบ ค่าปรับ -- 
           
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where tdtno = rec_ext.cpassportno)    
                LOOP
                    flagfound := 'พบข้อมูลคนต่างด้าวเสียชีวิต';
                END LOOP;
            end if;
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            
            if flagfound = 'NOTFOUND' then             
                FOR rec_extcurr IN (select * from (
                    select * from ext_person where cpassportno = rec_ext.cpassportno order by update_date desc
                    ) where rownum = 1)
                LOOP
                    IF to_char(rec_extcurr.permit_date, 'yyyymmdd') > sysdateCurrent THEN
                        flagfound := 'พบข้อมูลขออยู่ต่อ วันครบกำหนดอนุญาต ' || to_char(rec_extcurr.permit_date, 'dd/MM/yyyy');
                    END IF;
                END LOOP;
             END IF;            
            
            if flagfound = 'NOTFOUND' then             
                FOR rec_chng IN (select to_char(chng.visa_expdate, 'yyyymmdd') permit, chng.chngperson_seqno, chng.visa_expdate from chng_person chng 
                    where chng.passportno = rec_ext.cpassportno and chng.status = 1 and chng.actflag = 'Y' and rownum = 1)
                LOOP
                    IF to_char(rec_chng.visa_expdate, 'yyyymmdd') > sysdateCurrent THEN
                        flagfound := 'พบข้อมูลเปลี่ยนประเภทวีซ่า วันครบกำหนดอนุญาต ' || to_char(rec_chng.visa_expdate, 'dd/MM/yyyy');
                    END IF;
                END LOOP;
             END IF;            
            
            if flagfound = 'NOTFOUND' then             
                FOR rec_rqs IN (select to_char(rqs.permit_date, 'yyyymmdd') permit, rqs.rqsperson_seqno, rqs.permit_date from rqs_person rqs 
                where rqs.cpassportno = rec_ext.cpassportno and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_ext.permit_date, 'yyyymmdd')
                and rqs.apprvsts not in ('C','N','R') and rownum = 1)
                LOOP
                    IF to_char(rec_rqs.permit_date, 'yyyymmdd') > sysdateCurrent THEN
                        flagfound := 'พบข้อมูลขอมีถิ่น วันครบกำหนดอนุญาต ' || to_char(rec_rqs.permit_date, 'dd/MM/yyyy'); 
                    END IF;
                END LOOP;
            END IF;
            -- ตรวจสอบ วันครบกำหนดอนุญาตล่าสุด (เปลี่ยนประเภทวีซ่า ขอมีถิ่นฯ) --            
            
            -- ตรวจสอบข้อมูลการเดินทางเข้า --
            FOR rec_card1 IN (select * from (select * from vw_tmonline 
                where tdtno = rec_ext.cpassportno and cardtype = '1' and to_char(inoutdate, 'YYYYMMDD') > to_char(rec_ext.ext_date, 'YYYYMMDD') order by inoutdate desc) where rownum = 1)
            LOOP
                flagfound := 'พบข้อมูลขาเข้า เลขหนังสือเดินทาง วันที่เดินทาง '|| to_char(rec_card1.inoutdate, 'dd/MM/yyyy');
            END LOOP;
            
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
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
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
            
            IF flagfound = 'NOTFOUND' THEN
                if (rec_ext.efamilynm is not null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then                    
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_ext.efamilynm and efirstnm = rec_ext.efirstnm and emiddlenm is null) 
                        and birthdte = rec_ext.birth_date
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card1 IN (select * from (select * from tmmain
                            where (efirstnm = rec_ext.efamilynm and efamilynm = rec_ext.efirstnm and emiddlenm is null) 
                            and birthdte = rec_ext.birth_date
                            and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                            and to_char(indte, 'YYYYMM') > '201612'
                            and (indte is not null and outdte is null)
                            and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                            order by indte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_ext.efamilynm and efirstnm is null and emiddlenm = rec_ext.emiddlenm) 
                        and birthdte = rec_ext.birth_date
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_ext.efirstnm and emiddlenm = rec_ext.emiddlenm)
                        and birthdte = rec_ext.birth_date
                        and (case when nationCode in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when nationCode not in ('C10', 'M24', 'H04') and nationcd = nationCode then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_ext.efamilynm is not null and rec_ext.efirstnm is null and rec_ext.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_ext.efamilynm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = nationCode                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is not null and rec_ext.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efirstnm = rec_ext.efirstnm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = nationCode                              
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_ext.efamilynm is null and rec_ext.efirstnm is null and rec_ext.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_ext.emiddlenm)
                        and birthdte = rec_ext.birth_date
                        and nationcd = nationCode                                 
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_ext.ext_date, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล วันที่เดินทาง '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลการเดินทางเข้า --     
            
            if flagfound <> 'NOTFOUND' then
                update tmp_tdtno set delremark = flagfound where NO = rec_ext.No;            
            END IF;
          
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totalins = totalinsert, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
            --DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_ext.tdtno || ', extPersonSeq : ' || extPersonSeq || ', chngPersonSeq : ' || chngPersonSeq || ', rqsPersonSeq : ' || rqsPersonSeq);
            --DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_ext.tdtno || ', nationcd = ' || rec_ext.nationcd || ', count_seqno = ' || rec_ext.count_seqno || ', extFlag = ' || extFlag || ', chngFlag = ' || chngFlag || ', rqsFlag = ' || rqsFlag);
            --utl_file.put_line(file_ut, 'tdtno = ' || rec_ext.tdtno || ', nationcd = ' || rec_ext.nationcd  || ', count_seqno = ' || rec_ext.count_seqno || ', extFlag = ' || extFlag || ', chngFlag = ' || chngFlag || ', rqsFlag = ' || rqsFlag);
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
           DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]' || rec_ext.NO);
     null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_EXTOVERSTAY8788;
/
