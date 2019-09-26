CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_BEGINTMOVERSTAY" IS
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
    /*
    select *  
    from immigration m
    where to_char(m.inoutdte, 'YYYYMMDD') >= '20170101' 
    and m.cardtype = '1'
    and to_char(m.visaexpdte, 'yyyymmdd') < to_char(sysdate, 'yyyymmdd') 
    and (m.nationcd <> 'T03' and m.visatype_seqno <> '9') 
    and (m.nationcd is not null and m.visatype_seqno is not null)
    and exists(select 'x' from country c where c.countcd  = m.nationcd and actflag ='Y' )
    and exists(select 'x' from visatype visa where visa.visatype_seqno = m.visatype_seqno and actflag ='Y')
    and exists(select 'x' from department d where m.dept_seqno = d.dept_seqno and actflag='Y')
    and not exists(select 'x' from tminformdead t where personid is not null and t.personid = m.personid);
    */
    
    select * from processfines where to_char(visaexpdte, 'YYYY') < 1900;
    
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
        values (batchlogno_seq, 'OVS', '18', 'Begin Overstay TM', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
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
            
           /*
            -- ตรวจสอบข้อมูลการเดินทางออก --
            FOR rec_card2 IN (select * from (select personid from vw_tmonline where tdtno = rec_tm.tdtno 
                and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)             
                and cardtype = '2'
                and to_char(inoutdate, 'YYYYMMDD') >= '20170101' 
                and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdate desc) where rownum = '1')
            LOOP
                flagfound := 'FOUND CARD2 tdtno and nationcd '|| rec_card2.personid;
            END LOOP;       
           */
            
            /* 
            if flagfound = 'NOTFOUND' and rec_tm.tm6no is not null and rec_tm.birthdte is not null then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then 
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) and cardtype = '2' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 LFM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) and cardtype = '2' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 LF and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;                
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) 
                    and cardtype = '2' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 LM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;     
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 FM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) 
                    and cardtype = '2' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 L and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 F and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no) and cardtype = '2' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 M and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;                    
                end if;      
            end if;
            */
            
            /*
            if flagfound = 'NOTFOUND' then
                FOR rec_card2 IN (select * from (select personid from immigration where tdtno = rec_tm.tdtno and tm6no = rec_tm.tm6no and cardtype = '2'
                and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdte desc) where rownum = '1')
                LOOP
                    flagfound := 'FOUND CARD2 tdtno and tm6no '|| rec_card2.personid;
                END LOOP;
            end if;
                 
            if flagfound = 'NOTFOUND' and rec_tm.tdtno is not null and rec_tm.birthdte is not null then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then 
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '2' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 LFM and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '2' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 LF and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;                
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) 
                    and cardtype = '2' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 LM and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;     
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 FM and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) 
                    and cardtype = '2' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 L and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 F and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M personid '|| rec_tm.personid);
                    FOR rec_card2 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '2' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) 
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD2 M and tdtno and birthdte '|| rec_card2.personid;
                    END LOOP;                    
                end if;      
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_card2 IN (select * from (select personid from immigration where tdtno = rec_tm.tdtno and tm6no = rec_tm.tm6no and cardtype = '2' and to_char(inoutdte, 'YYYYMMDD') >= '20170101'
                and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdte desc) where rownum = '1')
                LOOP
                    flagfound := 'FOUND CARD2 tdtno and tm6no '|| rec_card2.personid;
                END LOOP;
            end if;
            -- ตรวจสอบข้อมูลการเดินทางออก --            
                       
            -- ตรวจสอบ Blacklist Overstay --
             if flagfound = 'NOTFOUND' then
                FOR rec_wl IN (select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and b.docno = rec_tm.tdtno
                and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1))
                LOOP
                    flagfound := 'FOUND WL Overstay '|| rec_wl.wlcd;
                END LOOP;
            end if;
            -- ตรวจสอบ Blacklist Overstay --
                             
            -- ตรวจสอบ ค่าปรับ --
             if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_tm.tdtno 
                and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nation_seqno in (45, 94, 143) then 1 
                when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nation_seqno = get_NationSeqno(rec_tm.nationcd) then 1 else 0 end = 1) 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_tm.inoutdte, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno nation_seqno  '|| rec_fines.fines_seqno;
                END LOOP;
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where (tm6no = rec_tm.tm6no or passportno = rec_tm.tdtno) and nvl(efamilynm, '-') = nvl(rec_tm.efamilynm, '-') and efirstnm = rec_tm.efirstnm 
                and nvl(emiddlenm, '-') = nvl(rec_tm.emiddlenm, '-')  and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_tm.inoutdte, 'yyyymmdd')) 
                and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES 3NM tm6no '|| rec_fines.fines_seqno;
                END LOOP;
            end if;            
           
           if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_tm.tdtno and tm6no = rec_tm.tm6no 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_tm.inoutdte, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno tm6no '|| rec_fines.fines_seqno;
                END LOOP;
            end if;            
            -- ตรวจสอบ ค่าปรับ -- 
            
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where tdtno = rec_tm.tdtno
                and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1))
                LOOP
                    flagfound := 'FOUND TMINFORMDEAD tdtno and nationcd '|| rec_tmfd.tminfdeadseqno;
                END LOOP;
            end if;
        
            if flagfound = 'NOTFOUND' then
                FOR rec_card1 IN (select * from (select personid from vw_tmonline where tdtno = rec_tm.tdtno  
                and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_tm.nationcd then 1 else 0 end = 1)                 
                and cardtype = '1'
                and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI')) order by inoutdate desc) where rownum = '1')
                LOOP
                    flagfound := 'FOUND CARD1 tdtno and nationcd '|| rec_card1.personid;
                END LOOP;
            END IF;
          */
            /*
            if flagfound = 'NOTFOUND' and rec_tm.tm6no is not null and rec_tm.birthdte is not null then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then -- L F M
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no ) and cardtype = '1' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 LFM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no ) and cardtype = '1' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 LF and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no ) 
                    and cardtype = '1' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 LM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP; 
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no ) and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 FM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no )
                    and cardtype = '1' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 L and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no ) and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 F and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tm6no = rec_tm.tm6no ) and cardtype = '1' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 M and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                end if;
            end if;
            */
            /*
            if flagfound = 'NOTFOUND' and rec_tm.tdtno is not null and rec_tm.birthdte is not null then
                if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then -- L F M
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '1' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 LFM and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '1' 
                    and efamilynm = rec_tm.efamilynm and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 LF and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) 
                    and cardtype = '1' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 LM and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP; 
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 FM and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is not null and rec_tm.efirstnm is null and rec_tm.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno)
                    and cardtype = '1' and efamilynm = rec_tm.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 L and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is not null and rec_tm.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_tm.efirstnm and emiddlenm is null and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 F and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_tm.efamilynm is null and rec_tm.efirstnm is null and rec_tm.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M personid '|| rec_tm.personid);
                    FOR rec_card1 IN (select * from (select personid from vw_tmonline where (tdtno = rec_tm.tdtno) and cardtype = '1' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_tm.emiddlenm and birthdte = rec_tm.birthdte
                    and to_char(inoutdate, 'yyyymmdd') >= '20170101' and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc) where rownum = '1')
                    LOOP
                        flagfound := 'FOUND CARD1 M and tdtno and birthdte '|| rec_card1.personid;
                    END LOOP;
                end if;
            end if;
            
            --DBMS_OUTPUT.PUT_LINE('6 voaseqno = ' || rec_tm.vosseqno || to_char(sysdate, 'dd/MM/yyyy hh24mi'));
            if flagfound = 'NOTFOUND'  then
                FOR rec_card1 IN (select * from (select personid from immigration where tdtno = rec_tm.tdtno and tm6no = rec_tm.tm6no and cardtype = '1' and 
                to_char(inoutdte, 'YYYYMMDD') >= '20170101'
                and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) > to_number(to_char(rec_tm.inoutdte, 'YYYYMMDDHH24MI'))
                order by inoutdte desc) where rownum = '1')
                LOOP
                    flagfound := 'FOUND CARD1 tdtno and tm6no '|| rec_card1.personid;
                END LOOP;
            end if;
            -- ตรวจสอบข้อมูลการเดินทางเข้า --
            */
            
            /*
            FOR rec_ext IN (select to_char(ext.permit_date, 'YYYYMMDD') permit, ext.extperson_seqno, ext.permit_date from ext_person ext 
            where ext.cpassportno = rec_tm.tdtno 
            and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and ext.nation_seqno in (45, 94, 143) then 1 
            when rec_tm.nationcd not in ('C10', 'M24', 'H04') and ext.nation_seqno = get_nationseqno(rec_tm.nationcd) then 1 else 0 end = 1)      
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
            and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and chng.nation_seqno in (45, 94, 143) then 1 
            when rec_tm.nationcd not in ('C10', 'M24', 'H04') and chng.nation_seqno = get_nationseqno(rec_tm.nationcd) then 1 else 0 end = 1)   
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
            and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and rqs.nation_seqno in (45, 94, 143) then 1 
            when rec_tm.nationcd not in ('C10', 'M24', 'H04') and rqs.nation_seqno = get_nationseqno(rec_tm.nationcd) then 1 else 0 end = 1)   
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
            */ 

            /*
            FOR rec_fn IN (
                select * from (
                    select fnperson_seqno, building  || decode(building, null, null, ' ('|| b.typename ||') ') building, addr, road, pv_seqno, amp_seqno, tmb_seqno, tel, a.create_date, a.update_date
                    from fn_person a, fn_hoteltype b
                    where a.htype_seqno = b.htype_seqno(+)        
                    and passportno = rec_tm.tdtno 
                    and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and nation_seqno in (45, 94, 143) then 1 
                    when rec_tm.nationcd not in ('C10', 'M24', 'H04') and nation_seqno = get_nationseqno(rec_tm.nationcd) then 1 else 0 end = 1)                   
                    and passportno <> 'PASSPORT' order by a.update_date desc) where rownum = 1)
            LOOP
                fnPersonSeq := rec_fn.fnperson_seqno;
           
                update processfines set fnperson_seqno = fnPersonSeq, building = rec_fn.building, addr = rec_fn.addr, road = rec_fn.road, 
                pv_seqno = rec_fn.pv_seqno, amp_seqno = rec_fn.amp_seqno, tmb_seqno = rec_fn.tmb_seqno, tel = rec_fn.tel, typeaddr = 'FN90'
                where tmovsseqno = rec_tm.tmovsseqno;     
                
            END LOOP;
            
           IF fnPersonSeq IS NULL THEN
               FOR rec_alien IN 
                    (select * from
                    (select  passportno, a.count_seqno, checkindte, c.hotel_seqno, alien_seqno, c.name, c.addr,  c.road, c.pv_seqno, c.amp_seqno, c.tmb_seqno, c.postcode, c.tel  
                    from fn_alienlist a,fn_addressnotify b, fn_hotel c 
                    where a.addrn_seqno = b.addrn_seqno(+) 
                    and b.hotel_seqno = c. hotel_seqno(+) 
                    and a.passportno = rec_tm.tdtno 
                    and (case when rec_tm.nationcd in ('C10', 'M24', 'H04') and count_seqno in (45, 94, 143) then 1 
                    when rec_tm.nationcd not in ('C10', 'M24', 'H04') and count_seqno = get_nationseqno(rec_tm.nationcd) then 1 else 0 end = 1) 
                    and checkindte is not null 
                    and a.passportno <> 'PASSPORT' 
                    order by checkindte desc)
                    where  rownum =1)
                LOOP
                    alienSeq := rec_alien.alien_seqno;
                    
                    update processfines set alien_seqno = alienSeq, building = rec_alien.name, addr = rec_alien.addr, road = rec_alien.road, 
                    pv_seqno = rec_alien.pv_seqno, amp_seqno = rec_alien.amp_seqno, tmb_seqno = rec_alien.tmb_seqno, tel = rec_alien.tel, typeaddr = 'FN38'
                    where tmovsseqno = rec_tm.tmovsseqno;
                    
                    commit;
                END LOOP;            
           END IF;
           
            */
            
            flagfound := 'VISAEXPDTE Error';
            
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
                
                insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                   passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                   visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                   rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte) 
                values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                 rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                 rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                 rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                 rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, extPersonSeq, extPermitdte, extFlag, chngPersonSeq, chngPermitdte, chngFlag, rqsPersonSeq, rqsPermitdte, rqsFlag, fnPersonSeq, 
                 alienSeq, sysdate, sysdate, flagfound, sysdate); 
                 
                 delete processfines where tmovsseqno = rec_tm.tmovsseqno;
                 
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
END PS_BEGINTMOVERSTAY;
/
