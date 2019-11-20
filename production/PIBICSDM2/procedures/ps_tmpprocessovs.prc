CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_TMPPROCESSOVS" IS
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
    flagfound varchar2(200);
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
    fnPersonSeq number(20);
    alienSeq number(20);        
    --file_ut UTL_FILE.FILE_TYPE;
   
    CURSOR c1 IS

    select * from tmp_processovs;
    
    rec_tm c1%ROWTYPE;
    
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
        values (batchlogno_seq, 'OVS', '44', 'PROCESS TMP_PROCESSOVS', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_BEGINEXTOVERSTAY' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start PS_BEGINEXTOVERSTAY .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_tm; EXIT WHEN c1%NOTFOUND;
            flagfound := 'NOTFOUND';
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
            fnPersonSeq := null;
            alienSeq := null;
            
            -- ตรวจสอบข้อมูลการเดินทางออก Passport + สัญชาติ --
            FOR rec_card2 IN (select * from (select personid from vw_tmonline where tdtno = rec_tm.tdtno            
                and cardtype = '2'
                and to_char(inoutdate, 'YYYYMMDD') >= '20170101' 
                and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdate desc) where rownum = '1')
            LOOP
                flagfound := 'พบข้อมูลขาออก เลขหนังสือเดินทาง และ สัญชาติ '|| rec_card2.personid;
            END LOOP;            
            
            -- ตรวจสอบ Blacklist Overstay --
             if flagfound = 'NOTFOUND' then
                FOR rec_wl IN (select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and b.docno = rec_tm.tdtno)
                LOOP
                    flagfound := 'FOUND WL Overstay '|| rec_wl.wlcd;
                END LOOP;
            end if;
            -- ตรวจสอบ Blacklist Overstay --

             if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_tm.tdtno 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_tm.inoutdte, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno nation_seqno  '|| rec_fines.fines_seqno;
                END LOOP;
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where tdtno = rec_tm.tdtno)
                LOOP
                    flagfound := 'FOUND TMINFORMDEAD tdtno and nationcd '|| rec_tmfd.tminfdeadseqno;
                END LOOP;
            end if;            
            
            FOR rec_ext IN (select to_char(ext.permit_date, 'YYYYMMDD') permit, ext.extperson_seqno, ext.permit_date from ext_person ext 
            where ext.cpassportno = rec_tm.tdtno 
            and ext.cpassportno <> 'PASSPORT'  
            and ext.approve_sts = 'A' 
            and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_tm.visaexpdte, 'yyyymmdd') and rownum = 1)
            LOOP
                IF to_char(rec_ext.permit_date, 'yyyymmdd') < sysdateCurrent THEN
                    extPersonSeq := rec_ext.extperson_seqno;
                    extPermit := rec_ext.permit;
                    extPermitdte := rec_ext.permit_date;
                    extFlag := 'Y';
                ELSE
                    extPersonSeq := rec_ext.extperson_seqno;
                    extPermit := rec_ext.permit;
                    extPermitdte := rec_ext.permit_date;                
                    extFlag := 'N';
                    flagfound := 'FOUND EXT tdtno and nationcd '|| rec_tm.personid;
                END IF;
            END LOOP; 
            
            FOR rec_chng IN (select to_char(chng.visa_expdate, 'yyyymmdd') permit, chng.chngperson_seqno, chng.visa_expdate from chng_person chng 
            where chng.passportno = rec_tm.tdtno 
            and to_char(visa_expdate, 'yyyymmdd') >=  to_char(rec_tm.visaexpdte, 'yyyymmdd') 
            and chng.status = 1 and chng.actflag = 'Y' and rownum = 1)
            LOOP
                IF to_char(rec_chng.visa_expdate, 'yyyymmdd') < sysdateCurrent THEN
                    chngPersonSeq := rec_chng.chngperson_seqno;
                    chngPermit := rec_chng.permit;
                    chngPermitdte := rec_chng.visa_expdate;
                    chngFlag := 'Y';
                ELSE
                    chngPersonSeq := rec_chng.chngperson_seqno;
                    chngPermit := rec_chng.permit;
                    chngPermitdte := rec_chng.visa_expdate;                
                    chngFlag := 'N';
                    flagfound := 'FOUND CHNG tdtno and nationcd '|| rec_tm.personid;
                END IF;
            END LOOP;
            
            FOR rec_rqs IN (select to_char(rqs.permit_date, 'yyyymmdd') permit, rqs.rqsperson_seqno, rqs.permit_date from rqs_person rqs 
            where rqs.cpassportno = rec_tm.tdtno 
            and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_tm.visaexpdte, 'yyyymmdd')
            and rqs.apprvsts not in ('C','N','R') and rownum = 1)
            LOOP
                IF to_char(rec_rqs.permit_date, 'yyyymmdd') < sysdateCurrent THEN
                    rqsPersonSeq := rec_rqs.rqsperson_seqno;
                    rqsPermit := rec_rqs.permit;
                    rqsPermitdte := rec_rqs.permit_date;
                    rqsFlag := 'Y';
                ELSE
                    rqsPersonSeq := rec_rqs.rqsperson_seqno;
                    rqsPermit := rec_rqs.permit;
                    rqsPermitdte := rec_rqs.permit_date;              
                    rqsFlag := 'N';
                    flagfound := 'FOUND RQS tdtno and nationcd '|| rec_tm.personid;
                END IF;
            END LOOP;            
            
           IF flagfound = 'NOTFOUND' THEN      
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
            END IF;
            
            
           -- ตรวจสอบข้อมูลขาเข้า เลขหนังสือเดินทาง สัญชาติ ---
            if flagfound = 'NOTFOUND' then
                FOR rec_card1 IN (select * from (select personid from vw_tmonline where tdtno = rec_tm.tdtno               
                and cardtype = '1'
                and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdate desc) where rownum = '1')
                LOOP
                    flagfound := 'พบข้อมูลขาเข้า เลขหนังสือเดินทาง สัญชาติ '|| rec_card1.personid;
                END LOOP;
            END IF;
            -- ตรวจสอบข้อมูลขาเข้า เลขหนังสือเดินทาง สัญชาติ ---                    
            
 /*           
            -- ตรวจสอบ 2 ใน 3 ชื่อ --
            IF flagfound = 'NOTFOUND' then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm)
                        or (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm)                    
                        or (efamilynm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm))
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล 2 ใน 3 '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                        
             -- ตรวจสอบ 2 ใน 3 ชื่อ --       
             
            IF flagfound = 'NOTFOUND' THEN
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then                    
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null) 
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card2 IN (select * from (select * from tmmain
                            where (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm and emiddlenm is null) 
                            and birthdte = rec_tm.birthdte
                            and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                            and to_char(outdte, 'YYYYMM') > '201612'
                            and (indte is null and outdte is not null)
                            and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                            order by outdte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm) 
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm)
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm)
                        and birthdte = rec_tm.birthdte
                        and nationcd = rec_tm.nationcd                            
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efirstnm = rec_tm.efirstnm)
                        and birthdte = rec_tm.birthdte
                        and nationcd = rec_tm.nationcd                      
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_tm.emiddlenm)
                        and birthdte = rec_tm.birthdte
                        and nationcd = rec_tm.nationcd                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก ชื่อ-นามสกุล '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลการเดินทางออก --
           
            -- ตรวจสอบข้อมูลขาออก Tm6 no. + ชื่อ + วันเกิด + เพศ  --
            IF flagfound = 'NOTFOUND' then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm)
                        or (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm)                    
                        or (efamilynm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm))
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                  
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                        
            
             
            IF flagfound = 'NOTFOUND' THEN
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then                    
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null) 
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card2 IN (select * from (select * from tmmain
                            where (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm and emiddlenm is null) 
                            and outtm6no = rec_tm.tm6no
                            and sex = rec_tm.sex                        
                            and to_char(outdte, 'YYYYMM') > '201612'
                            and (indte is null and outdte is not null)
                            and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                            order by outdte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm) 
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                      
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm)
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm)
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                      
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efirstnm = rec_tm.efirstnm)
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                 
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_tm.emiddlenm)
                        and outtm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                   
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลขาออก Tm6 no. + ชื่อ + วันเกิด + เพศ  --
           
           
            -- ตรวจสอบข้อมูลขาออก Passport + ชื่อ + วันเกิด + เพศ  --
            IF flagfound = 'NOTFOUND' then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm)
                        or (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm)                    
                        or (efamilynm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm))
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                  
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ 2 ใน 3 เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                        
            
             
            IF flagfound = 'NOTFOUND' THEN
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then                    
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null) 
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card2 IN (select * from (select * from tmmain
                            where (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm and emiddlenm is null) 
                            and outtdtno = rec_tm.tdtno
                            and sex = rec_tm.sex                        
                            and to_char(outdte, 'YYYYMM') > '201612'
                            and (indte is null and outdte is not null)
                            and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                            order by outdte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm) 
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                      
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm)
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm)
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                      
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (efirstnm = rec_tm.efirstnm)
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                 
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card2 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_tm.emiddlenm)
                        and outtdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                   
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is null and outdte is not null)
                        and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by outdte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาออก Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card2.outdte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลขาออก Passport + ชื่อ + วันเกิด + เพศ  --           
           
           -- ตรวจสอบข้อมูลขาเข้า เลขหนังสือเดินทาง สัญชาติ ---
            if flagfound = 'NOTFOUND' then
                FOR rec_card1 IN (select * from (select personid from vw_tmonline where tdtno = rec_tm.tdtno  
                and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                 
                and cardtype = '1'
                and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdate desc) where rownum = '1')
                LOOP
                    flagfound := 'พบข้อมูลขาเข้า เลขหนังสือเดินทาง สัญชาติ '|| rec_card1.personid;
                END LOOP;
            END IF;
            -- ตรวจสอบข้อมูลขาเข้า เลขหนังสือเดินทาง สัญชาติ ---           
            
            -- ตรวจสอบขาเข้า 2 ใน 3 ชื่อ --
            IF flagfound = 'NOTFOUND' then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm)
                        or (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm)                    
                        or (efamilynm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm))
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล 2 ใน 3 '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                        
             -- ตรวจสอบ 2 ใน 3 ชื่อ --       
             
            IF flagfound = 'NOTFOUND' THEN
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then                    
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null) 
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card1 IN (select * from (select * from tmmain
                            where (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm and emiddlenm is null) 
                            and birthdte = rec_tm.birthdte
                            and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                            when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                            and to_char(indte, 'YYYYMM') > '201612'
                            and (indte is not null and outdte is null)
                            and to_char(outdte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                            order by indte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm) 
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm)
                        and birthdte = rec_tm.birthdte
                        and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                        when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                           
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm)
                        and birthdte = rec_tm.birthdte
                        and nationcd = rec_tm.nationcd                            
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efirstnm = rec_tm.efirstnm)
                        and birthdte = rec_tm.birthdte
                        and nationcd = rec_tm.nationcd                      
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_tm.emiddlenm)
                        and birthdte = rec_tm.birthdte
                        and nationcd = rec_tm.nationcd                        
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า ชื่อ-นามสกุล '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลการเดินทางออก --
           
            -- ตรวจสอบข้อมูลขาออก Tm6 no. + ชื่อ + วันเกิด + เพศ  --
            IF flagfound = 'NOTFOUND' then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm)
                        or (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm)                    
                        or (efamilynm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm))
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                  
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                        
            
             
            IF flagfound = 'NOTFOUND' THEN
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then                    
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null) 
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                        
                        and to_char(outdte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card1 IN (select * from (select * from tmmain
                            where (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm and emiddlenm is null) 
                            and intm6no = rec_tm.tm6no
                            and sex = rec_tm.sex                        
                            and to_char(indte, 'YYYYMM') > '201612'
                            and (indte is not null and outdte is null)
                            and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                            order by indte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm) 
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                      
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm)
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                        
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm)
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                      
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efirstnm = rec_tm.efirstnm)
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                 
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_tm.emiddlenm)
                        and intm6no = rec_tm.tm6no
                        and sex = rec_tm.sex                   
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า tm6 ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลขาออก Tm6 no. + ชื่อ + วันเกิด + เพศ  --
           
            -- ตรวจสอบข้อมูลขาออก Passport + ชื่อ + วันเกิด + เพศ  --
            IF flagfound = 'NOTFOUND' then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where ((efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm)
                        or (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (efamilynm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm) or (efirstnm = rec_tm.efamilynm and emiddlenm = rec_tm.emiddlenm)
                        or (emiddlenm = rec_tm.efamilynm and efirstnm = rec_tm.emiddlenm) or (emiddlenm = rec_tm.efamilynm and efamilynm = rec_tm.emiddlenm)                    
                        or (efamilynm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (efamilynm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (efirstnm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm) or (efirstnm = rec_tm.emiddlenm and emiddlenm = rec_tm.efirstnm)
                        or (emiddlenm = rec_tm.emiddlenm and efirstnm = rec_tm.efirstnm) or (emiddlenm = rec_tm.emiddlenm and efamilynm = rec_tm.efirstnm))
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                  
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ 2 ใน 3 เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            END IF;                   
             
            IF flagfound = 'NOTFOUND' THEN
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then                    
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null) 
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                        
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                    
                    IF flagfound = 'NOTFOUND' THEN
                        FOR rec_card1 IN (select * from (select * from tmmain
                            where (efirstnm = rec_tm.efamilynm and efamilynm = rec_tm.efirstnm and emiddlenm is null) 
                            and intdtno = rec_tm.tdtno
                            and sex = rec_tm.sex                        
                            and to_char(indte, 'YYYYMM') > '201612'
                            and (indte is not null and outdte is null)
                            and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                            order by indte desc) where rownum = 1)
                        LOOP
                            flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                        END LOOP;
                    END IF;
                elsif (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm) 
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                      
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm)
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                        
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;                
                end if;
            END IF;            
            
            if flagfound = 'NOTFOUND' then
                if (rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efamilynm = rec_tm.efamilynm)
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                      
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (efirstnm = rec_tm.efirstnm)
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                 
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                elsif (rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null) then
                    FOR rec_card1 IN (select * from (select * from tmmain
                        where (emiddlenm = rec_tm.emiddlenm)
                        and intdtno = rec_tm.tdtno
                        and sex = rec_tm.sex                   
                        and to_char(indte, 'YYYYMM') > '201612'
                        and (indte is not null and outdte is null)
                        and to_char(indte, 'yyyymmdd') > to_char(rec_tm.inoutdte, 'yyyymmdd')
                        order by indte desc) where rownum = 1)
                    LOOP
                        flagfound := 'พบข้อมูลขาเข้า Pass ชื่อ - นามสกุล เพศ '|| to_char(rec_card1.indte, 'dd/MM/yyyy');
                    END LOOP;
                end if;
            end if;                        
           -- ตรวจสอบข้อมูลขาออก Passport + ชื่อ + วันเกิด + เพศ  --    
           */              

            if (extFlag = 'Y' OR extFlag IS NULL) AND (chngFlag = 'Y' OR chngFlag IS NULL) AND (rqsFlag = 'Y' OR rqsFlag IS NULL) AND flagfound = 'NOTFOUND' then
                totalinsert := totalinsert +1;
              /*  
                insert into processfines (tmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                   tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, 
                   create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, 
                   deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
                   processdte, match_name, match_name_wlcd, match_tdtno, match_tdtno_wlcd, ovsdte) 
                values (tmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm,
                 rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd,
                 rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr, rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status,
                 rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by, rec_tm.create_date,
                 rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno,
                 rec_tm.permit_seqno, rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, extPersonSeq, extPermitdte, extFlag, chngPersonSeq, chngPermitdte, chngFlag, 
                 rqsPersonSeq, rqsPermitdte, rqsFlag, fnPersonSeq, alienSeq, sysdate, null, null, null, null, sysdate);
                */
            else
                totaldelete := totaldelete +1;
                
                insert into DEL_TMPPROCESSOVS (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                   passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                   visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                   rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte) 
                values (DEL_TMPPROCESSOVS_SEQ.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                 rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                 rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                 rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                 rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, extPersonSeq, extPermitdte, extFlag, chngPersonSeq, chngPermitdte, chngFlag, rqsPersonSeq, rqsPermitdte, rqsFlag, fnPersonSeq, 
                 alienSeq, sysdate, sysdate, flagfound, sysdate); 
                 
                 delete tmp_processovs where tmovsseqno = rec_tm.tmovsseqno;
                 
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
            --DBMS_OUTPUT.PUT_LINE('ERROR voaseqno = ' || rec_tm.vosseqno || to_char(sysdate, 'dd/MM/yyyy hh24mi'));
           DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_TMPPROCESSOVS;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_TMPPROCESSOVS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_TMPPROCESSOVS" TO "BIOSAADM";
