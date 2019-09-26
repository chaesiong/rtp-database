CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_BEGINOVERSTAY" IS
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
    --file_ut UTL_FILE.FILE_TYPE;
   
    CURSOR c1 IS
    
        select * from immigration m
        --where (to_char(inoutdte, 'YYYYMMDD') between  '20170101' and '20170131') 
        where to_char(inoutdte, 'YYYYMMDD') >=  '20170101'
        and cardtype = '1'
        and (m.nationcd <> 'T03' and m.visatype_seqno <> '9') 
        and (m.nationcd is not null and m.visatype_seqno is not null)
        and to_char(visaexpdte, 'yyyyymmdd') < to_char(sysdate, 'yyyyymmdd')
        and exists(select 'x' from country c where c.countcd = m.nationcd and actflag ='Y' and visaflag = 'Y')
        and visatype_seqno = 23
        and not exists(select 'x' from tminformdead t where personid is not null and t.personid = m.personid);

    rec_voa c1%ROWTYPE;
    
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
        values (batchlogno_seq, 'OVS', '21', 'Begin Overstay VOA TR15', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_BEGINEXTOVERSTAY' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start PS_BEGINEXTOVERSTAY .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_voa; EXIT WHEN c1%NOTFOUND;
            flagfound := 'NOTFOUND';
            
           
            -- ตรวจสอบข้อมูลการเดินทางออก --
            FOR rec_card2 IN (select * from immigration where tdtno = rec_voa.tdtno and nationcd = rec_voa.nationcd and cardtype = '2'
            and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
            LOOP
                flagfound := 'FOUND CARD2 tdtno and nationcd '|| rec_card2.personid;
            END LOOP;
            
             
            if flagfound = 'NOTFOUND' then
                if rec_voa.efamilynm is not null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is not null then 
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select personid from immigration where tm6no = rec_voa.tm6no and cardtype = '2' 
                    and efamilynm = rec_voa.efamilynm and efirstnm = rec_voa.efirstnm and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                    LOOP
                        flagfound := 'FOUND CARD2 LFM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is not null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '2' 
                    and efamilynm = rec_voa.efamilynm and efirstnm = rec_voa.efirstnm and emiddlenm is null and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                    LOOP
                        flagfound := 'FOUND CARD2 LF and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;                
                elsif rec_voa.efamilynm is not null and rec_voa.efirstnm is null and rec_voa.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_voa.tm6no 
                    and cardtype = '2' and efamilynm = rec_voa.efamilynm and efirstnm is null and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                    LOOP
                        flagfound := 'FOUND CARD2 LM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;     
                elsif rec_voa.efamilynm is null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_voa.efirstnm and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                    LOOP
                        flagfound := 'FOUND CARD2 FM and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is not null and rec_voa.efirstnm is null and rec_voa.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_voa.tm6no 
                    and cardtype = '2' and efamilynm = rec_voa.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                    LOOP
                        flagfound := 'FOUND CARD2 L and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '2' 
                    and efamilynm is null and efirstnm = rec_voa.efirstnm and emiddlenm is null and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD2 F and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is null and rec_voa.efirstnm is null and rec_voa.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M personid '|| rec_voa.personid);
                    FOR rec_card2 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '2' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                    LOOP
                        flagfound := 'FOUND CARD2 M and tm6no and birthdte '|| rec_card2.personid;
                    END LOOP;                    
                end if;      
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_card2 IN (select * from immigration where tdtno = rec_voa.tdtno and tm6no = rec_voa.tm6no and cardtype = '2'
                and to_number(to_char(inoutdte, 'YYYYMMDD')) > to_number(to_char(rec_voa.inoutdte, 'YYYYMMDD')))
                LOOP
                    flagfound := 'FOUND CARD2 tdtno and tm6no '|| rec_card2.personid;
                END LOOP;
            end if;
            -- ตรวจสอบข้อมูลการเดินทางออก --
                       
            -- ตรวจสอบ Blacklist Overstay --
             if flagfound = 'NOTFOUND' then
                FOR rec_wl IN (select a.wlcd from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and b.docno = rec_voa.tdtno and a.nationcd = rec_voa.nationcd)
                LOOP
                    flagfound := 'FOUND WL Overstay '|| rec_wl.wlcd;
                END LOOP;
            end if;
            -- ตรวจสอบ Blacklist Overstay -- 
       
            -- ตรวจสอบ ค่าปรับ --
             if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_voa.tdtno and nation_seqno = get_NationSeqno(rec_voa.nationcd)  
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno nation_seqno  '|| rec_fines.fines_seqno;
                END LOOP;
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where tm6no = rec_voa.tm6no and nvl(efamilynm, '-') = nvl(rec_voa.efamilynm, '-') and efirstnm = rec_voa.efirstnm 
                and nvl(emiddlenm, '-') = nvl(rec_voa.emiddlenm, '-')  and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')) 
                and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES 3NM tm6no '|| rec_fines.fines_seqno;
                END LOOP;
            end if;  
            
            if flagfound = 'NOTFOUND' then
                FOR rec_fines IN (select * from fs_fines where passportno = rec_voa.tdtno and tm6no = rec_voa.tm6no 
                and to_number(to_char(fineslipdate, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')) and finestatus = 'ACTIVE' and fineslipno is not null)
                LOOP
                    flagfound := 'FOUND FS_FINES passportno tm6no '|| rec_fines.fines_seqno;
                END LOOP;
            end if;            
            -- ตรวจสอบ ค่าปรับ -- 
            
            -- ตรวจสอบ ข้อมูลคนต่างด้าวเสียชีวิต --
            if flagfound = 'NOTFOUND' then
                FOR rec_tmfd IN (select * from tminformdead where tdtno = rec_voa.tdtno and nationcd = rec_voa.nationcd)
                LOOP
                    flagfound := 'FOUND TMINFORMDEAD tdtno and nationcd '|| rec_tmfd.tminfdeadseqno;
                END LOOP;
            end if;
       
            if flagfound = 'NOTFOUND' then
                FOR rec_card1 IN (select * from immigration where tdtno = rec_voa.tdtno and nationcd = rec_voa.nationcd and cardtype = '1'
                and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                LOOP
                    flagfound := 'FOUND CARD1 tdtno and nationcd '|| rec_card1.personid;
                END LOOP;
            END IF;

            if flagfound = 'NOTFOUND' and rec_voa.tm6no is not null then
                if rec_voa.efamilynm is not null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is not null then -- L F M
                    --DBMS_OUTPUT.PUT_LINE('TEST LFM personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select personid from immigration where tm6no = rec_voa.tm6no and cardtype = '1' 
                    and efamilynm = rec_voa.efamilynm and efirstnm = rec_voa.efirstnm and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 LFM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is not null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is null then -- L F
                    --DBMS_OUTPUT.PUT_LINE('TEST LF personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '1' 
                    and efamilynm = rec_voa.efamilynm and efirstnm = rec_voa.efirstnm and emiddlenm is null and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 LF and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is not null and rec_voa.efirstnm is null and rec_voa.emiddlenm is not null then -- L M
                    --DBMS_OUTPUT.PUT_LINE('TEST LM personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_voa.tm6no 
                    and cardtype = '1' and efamilynm = rec_voa.efamilynm and efirstnm is null and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 LM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP; 
                elsif rec_voa.efamilynm is null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is not null then -- F M
                    --DBMS_OUTPUT.PUT_LINE('TEST FM personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_voa.efirstnm and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 FM and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is not null and rec_voa.efirstnm is null and rec_voa.emiddlenm is null then -- L
                    --DBMS_OUTPUT.PUT_LINE('TEST L personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_voa.tm6no 
                    and cardtype = '1' and efamilynm = rec_voa.efamilynm and efirstnm is null and emiddlenm is null and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 L and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is null and rec_voa.efirstnm is not null and rec_voa.emiddlenm is null then -- F
                    --DBMS_OUTPUT.PUT_LINE('TEST F personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '1' 
                    and efamilynm is null and efirstnm = rec_voa.efirstnm and emiddlenm is null and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 F and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                elsif rec_voa.efamilynm is null and rec_voa.efirstnm is null and rec_voa.emiddlenm is not null then -- M
                    --DBMS_OUTPUT.PUT_LINE('TEST M personid '|| rec_voa.personid);
                    FOR rec_card1 IN (select * from immigration where tm6no = rec_voa.tm6no and cardtype = '1' 
                    and efamilynm is null and efirstnm is null and emiddlenm = rec_voa.emiddlenm and birthdte = rec_voa.birthdte
                    and to_char(inoutdte, 'YYYYMMDD') >= '20170101' and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                    LOOP
                        flagfound := 'FOUND CARD1 M and tm6no and birthdte '|| rec_card1.personid;
                    END LOOP;
                end if;
            end if;
            
            if flagfound = 'NOTFOUND' then
                FOR rec_card1 IN (select * from immigration where tdtno = rec_voa.tdtno and tm6no = rec_voa.tm6no and cardtype = '1'
                and to_number(to_char(inoutdte, 'yyyymmdd')) > to_number(to_char(rec_voa.inoutdte, 'yyyymmdd')))
                LOOP
                    flagfound := 'FOUND CARD1 tdtno and tm6no '|| rec_card1.personid;
                END LOOP;
            end if;
            -- ตรวจสอบข้อมูลการเดินทางเข้า --
            
            if flagfound = 'NOTFOUND' then
                totalinsert := totalinsert +1;
                insert into voaoverstay (vosseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                   tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, 
                   create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, 
                   deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
                   processdte, match_name, match_name_wlcd, match_tdtno, match_tdtno_wlcd, ovsdte) 
                values (voaoverstay_seqno.nextval, rec_voa.personid, rec_voa.tm6no, rec_voa.inoutdte, rec_voa.cardtype, rec_voa.tfirstnm, rec_voa.tmiddlenm, rec_voa.tfamilynm,
                 rec_voa.efirstnm, rec_voa.emiddlenm, rec_voa.efamilynm, rec_voa.sex, rec_voa.birthdte, rec_voa.nationcd, rec_voa.tdtcd, rec_voa.tdtno, rec_voa.visatypecd,
                 rec_voa.visaexpdte, rec_voa.passportdte, rec_voa.passportexpdte, rec_voa.updusr, rec_voa.upddte, rec_voa.updterm, rec_voa.remark, rec_voa.status,
                 rec_voa.tm5_seqno, rec_voa.tm2inout_seqno, rec_voa.convcd, rec_voa.convregno, rec_voa.seqno, rec_voa.create_by, rec_voa.create_date,
                 rec_voa.update_by, rec_voa.update_date, rec_voa.version, rec_voa.conv_seqno, rec_voa.visatype_seqno, rec_voa.dept_seqno, rec_voa.count_seqno,
                 rec_voa.permit_seqno, rec_voa.flightprefix, rec_voa.flightnumber, rec_voa.deptcd, null, null, null, null, null, null, null, null, null, null, null, sysdate, null, 
                 null, null, null, sysdate);       
            else
                totaldelete := totaldelete +1;
                insert into delvoaoverstay (dvosseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                   passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                   visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                   rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte) 
                values ( delvoaovs_seqno.nextval, rec_voa.personid, rec_voa.tm6no, rec_voa.inoutdte, rec_voa.cardtype, rec_voa.tfirstnm, rec_voa.tmiddlenm, rec_voa.tfamilynm, rec_voa.efirstnm, rec_voa.emiddlenm,
                 rec_voa.efamilynm, rec_voa.sex, rec_voa.birthdte, rec_voa.nationcd, rec_voa.tdtcd, rec_voa.tdtno, rec_voa.visatypecd, rec_voa.visaexpdte, rec_voa.passportdte, rec_voa.passportexpdte, rec_voa.updusr,
                 rec_voa.upddte, rec_voa.updterm, rec_voa.remark, rec_voa.status, rec_voa.tm5_seqno, rec_voa.tm2inout_seqno, rec_voa.convcd, rec_voa.convregno, rec_voa.seqno, rec_voa.create_by,
                 rec_voa.create_date, rec_voa.update_by, rec_voa.update_date, rec_voa.version, rec_voa.conv_seqno, rec_voa.visatype_seqno, rec_voa.dept_seqno, rec_voa.count_seqno, rec_voa.permit_seqno,
                 rec_voa.flightprefix, rec_voa.flightnumber, rec_voa.deptcd, null, null, null, null, null, null, null, null, null, null, null, sysdate, sysdate, flagfound, sysdate);                
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
END PS_BEGINOVERSTAY;
/
