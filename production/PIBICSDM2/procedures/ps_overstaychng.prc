CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_OVERSTAYCHNG" IS
BEGIN
   DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    sysdateCurrent varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totaldelete number(20);
    totalinsert number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    --file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
    
    select chngperson_seqno, passportno, nation_seqno, visa_expdate,  'CHNGDAY' flagdata 
    from chng_person 
    where to_char(update_date, 'yyyymmdd') = to_char(sysdate - 1, 'yyyymmdd') and passportno <> 'PASSPORT'
    and (status = '1' or status is null);

    rec_chng c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totaldelete := 0;
        totalinsert :=0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAYCHNG || ' || to_char(sysdate - 1, 'dd/MM/yyyy'), null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_OVERSTAYCHNG' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start PS_OVERSTAYCHNG .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_chng; EXIT WHEN c1%NOTFOUND;
           postfix := '';
           
            IF rec_chng.flagdata = 'CHNGDAY' THEN
                DECLARE
                chngPersonSeq number(20);
                BEGIN
                    select chngperson_seqno into chngPersonSeq 
                    from processfines where chngperson_seqno = rec_chng.chngperson_seqno and rownum = 1;
                    IF chngPersonSeq IS NOT NULL THEN
                        IF sysdateCurrent < to_char(rec_chng.visa_expdate, 'yyyymmdd') THEN
                            postfix := 'DELETE';
                            totaldelete := totaldelete + 1;
                            
                            insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
                            nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
                            convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
                            flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
                            alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                            tmb_seqno, tel, typeaddr, lastpermitdte)
                            select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
                            visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
                            extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
                            processdte, sysdate, 'PS_OVERSTAYCHNG chngperson_seqno ' || chngPersonSeq, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                            tmb_seqno, tel, typeaddr, lastpermitdte from processfines where chngperson_seqno = chngPersonSeq;
                            
                            delete processfines where chngperson_seqno = chngPersonSeq;                                                          
                            --DBMS_OUTPUT.PUT_LINE('passportno = ' || rec_chng.passportno || ', chngperson_seqno = ' || rec_chng.chngperson_seqno || ', flagdata = ' || rec_chng.flagdata || ' ' || postfix);
                        END IF;
                    END IF;
                EXCEPTION WHEN NO_DATA_FOUND THEN
             
                    DECLARE
                    chngTdtno varchar2(20);
                    chngCountSeq number(20);
                    BEGIN
                        select tdtno, count_seqno into chngTdtno, chngCountSeq 
                        from processfines where tdtno = rec_chng.passportno 
                        and (case when rec_chng.nation_seqno in (45, 94, 143) and count_seqno in (45, 94, 143) then 1 
                        when rec_chng.nation_seqno not in (45, 94, 143) and count_seqno = rec_chng.nation_seqno then 1 else 0 end = 1)
                        and rownum = 1;
                        IF chngTdtno IS NOT NULL THEN
                            IF sysdateCurrent < to_char(rec_chng.visa_expdate, 'yyyymmdd') THEN
                                postfix := 'DELETE';
                                totaldelete := totaldelete + 1;
                                
                            insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
                            nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
                            convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
                            flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
                            alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                            tmb_seqno, tel, typeaddr, lastpermitdte)
                            select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
                            visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
                            extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
                            processdte, sysdate, 'PS_OVERSTAYCHNG tdtno = ' || chngTdtno || ' nation_seqno = ' || count_seqno, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, 
                            pv_seqno, amp_seqno, tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tdtno = chngTdtno and count_seqno = chngCountSeq; 
                            
                            delete processfines where tdtno = chngTdtno and count_seqno = chngCountSeq;        
                            --DBMS_OUTPUT.PUT_LINE('passportno = ' || rec_chng.passportno || ', nation_seqno = ' || rec_chng.nation_seqno || ', flagdata = ' || rec_chng.flagdata || ' ' || postfix);
                            END IF;
                        END IF;
                        EXCEPTION WHEN NO_DATA_FOUND THEN    
                        NULL;
                    END;
               END;
            END IF;

/*            
              IF rec_chng.flagdata = 'OVERSTAY' THEN
                DECLARE
                chngPersonSeq number(20);
                fnPersonSeq number(20);
                alienSeq number(20);
                imm_rec immigration%ROWTYPE;
                imm_over_rec immoverstay%ROWTYPE;
                BEGIN
                    select * into imm_over_rec 
                    from immoverstay where chngperson_seqno = rec_chng.chngperson_seqno and rownum = 1;
                    --
                    SELECT * into imm_rec FROM immigration where imm_over_rec.personid=immigration.personid and rownum=1;
                    --
                    chngPersonSeq:=imm_over_rec.chngperson_seqno;
                    IF imm_over_rec.chngperson_seqno IS NOT NULL THEN
                       IF to_char(imm_rec.inoutdte,'YYYYMMDD') <= to_char(imm_over_rec.inoutdte,'YYYYMMDD') THEN
                        postfix := 'NO ACTION';
                        NULL;
                        ELSIF to_char(imm_rec.inoutdte,'YYYYMMDD') > to_char(imm_over_rec.inoutdte,'YYYYMMDD') THEN
                          IF sysdateCurrent < to_char(rec_chng.visa_expdate, 'yyyymmdd') THEN
                            postfix := 'UPDATE';
                            totaldelete := totaldelete + 1;
                            
                             insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                            tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                            extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                            select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                            tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                            extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'PS_OVERSTAYCHNG' 
                            from immoverstay where chngperson_seqno = chngPersonSeq;
                            
                              update immoverstay set ovsdte=sysdate, personid = imm_rec.personid, tm6no = imm_rec.tm6no, inoutdte = imm_rec.inoutdte, cardtype = imm_rec.cardtype, tfirstnm = imm_rec.tfirstnm, 
                                    tmiddlenm = imm_rec.tmiddlenm, tfamilynm = imm_rec.tfamilynm, efirstnm = imm_rec.efirstnm, emiddlenm = imm_rec.emiddlenm, efamilynm = imm_rec.efamilynm, 
                                    sex = imm_rec.sex, birthdte = imm_rec.birthdte, nationcd = imm_rec.nationcd, tdtcd = imm_rec.tdtcd, tdtno = imm_rec.tdtno, visatypecd = imm_rec.visatypecd, 
                                    visaexpdte = imm_rec.visaexpdte, passportdte = imm_rec.passportdte, passportexpdte = imm_rec.passportexpdte, updusr = imm_rec.updusr, upddte = imm_rec.upddte, 
                                    updterm = imm_rec.updterm, remark = imm_rec.remark, status = imm_rec.status, tm5_seqno = imm_rec.tm5_seqno, tm2inout_seqno = imm_rec.tm2inout_seqno, 
                                    convcd = imm_rec.convcd, convregno = imm_rec.convregno, seqno = imm_rec.seqno, create_by = imm_rec.create_by, create_date = imm_rec.create_date, update_by = imm_rec.update_by, 
                                    update_date = imm_rec.update_date, version = imm_rec.version, conv_seqno = imm_rec.conv_seqno, visatype_seqno = imm_rec.visatype_seqno, dept_seqno = imm_rec.dept_seqno, 
                                    count_seqno = imm_rec.count_seqno, permit_seqno = imm_rec.permit_seqno, flightprefix = imm_rec.flightprefix, flightnumber = imm_rec.flightnumber, deptcd = imm_rec.deptcd, 
                                    extperson_seqno = null, extpermitdte = null, extflag = null, chngperson_seqno = rec_chng.chngperson_seqno, chngpermitdte = rec_chng.visa_expdate, chngflag = 'Y', 
                                    rqsperson_seqno = null, rqspermitdte = null, rqsflag = null, fnperson_seqno = null, alien_seqno = null, processdte = sysdate 
                                    where iovseqno = imm_over_rec.iovseqno;
                            
                          
                            
                          
                           
                            --DBMS_OUTPUT.PUT_LINE('passportno = ' || rec_chng.passportno || ', chngperson_seqno = ' || rec_chng.chngperson_seqno || ', flagdata = ' || rec_chng.flagdata || ' ' || postfix);
                          END IF;                         
                        END IF;             
                    END IF;
                EXCEPTION WHEN NO_DATA_FOUND THEN
                --
                      fnPersonSeq := null;
                            alienSeq := null;
                            postfix := 'INSERT';
                            totalinsert := totalinsert +1;
                            
                            FOR rec_fn IN (select fnperson_seqno from fn_person where passportno = imm_rec.tdtno 
                            and nation_seqno = imm_rec.count_seqno and passportno <> 'PASSPORT' and rownum = 1)
                            LOOP
                                fnPersonSeq := rec_fn.fnperson_seqno;
                            END LOOP;
                            
                            FOR rec_alien IN 
                            (select alien_seqno from
                                (select  passportno, a.count_seqno, checkindte, c.hotel_seqno, alien_seqno, c.name, c.addr,  c.road, c.pv_seqno, c.amp_seqno, c.tmb_seqno, c.postcode , c.tel  
                                from fn_alienlist a,fn_addressnotify b, fn_hotel c 
                                where a.addrn_seqno = b.addrn_seqno(+) 
                                and b.hotel_seqno = c. hotel_seqno(+) 
                                and a.passportno = imm_rec.tdtno 
                                and a.count_seqno = imm_rec.count_seqno 
                                and checkindte is not null 
                                and a.passportno <> 'PASSPORT' 
                                order by checkindte desc)
                            where  rownum =1)
                            LOOP
                                alienSeq := rec_alien.alien_seqno;
                            END LOOP;
                            
                            insert into immoverstay (ovsdte,iovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, 
                            sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, 
                            remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, 
                            version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
                            extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte) 
                            values (sysdate,immoverstay_seq.nextval, imm_rec.personid, imm_rec.tm6no, imm_rec.inoutdte, imm_rec.cardtype, imm_rec.tfirstnm, imm_rec.tmiddlenm, imm_rec.tfamilynm, imm_rec.efirstnm, imm_rec.emiddlenm, imm_rec.efamilynm,
                            imm_rec.sex, imm_rec.birthdte, imm_rec.nationcd, imm_rec.tdtcd, imm_rec.tdtno, imm_rec.visatypecd, imm_rec.visaexpdte, imm_rec.passportdte, imm_rec.passportexpdte, imm_rec.updusr, imm_rec.upddte, imm_rec.updterm, 
                            imm_rec.remark, imm_rec.status, imm_rec.tm5_seqno, imm_rec.tm2inout_seqno, imm_rec.convcd, imm_rec.convregno, imm_rec.seqno, imm_rec.create_by, imm_rec.create_date, imm_rec.update_by, imm_rec.update_date, 
                            imm_rec.version, imm_rec.conv_seqno, imm_rec.visatype_seqno, imm_rec.dept_seqno, imm_rec.count_seqno, imm_rec.permit_seqno, imm_rec.flightprefix, imm_rec.flightnumber, imm_rec.deptcd, 
                            rec_chng.chngperson_seqno, null, 'Y', null, null, null, null, null, null, fnPersonSeq, alienSeq, sysdate);
                            
                            ----DBMS_OUTPUT.PUT_LINE('cpassportno = ' || rec_ext.cpassportno || ', flagdata = ' || rec_ext.flagdata || ' ' || postfix);
                      
                --                      
                END;
            END IF;
*/         
   
            
            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
        
            --DBMS_OUTPUT.PUT_LINE('passportno = ' || rec_chng.passportno || ', nation_seqno = ' || rec_chng.nation_seqno || ', flagdata = ' || rec_chng.flagdata || ' ' || postfix);
         --   utl_file.put_line(file_ut, 'passportno = ' || rec_chng.passportno || ', nation_seqno = ' || rec_chng.nation_seqno || ', flagdata = ' || rec_chng.flagdata || ' ' || postfix);
         --   utl_file.fflush(file_ut);
        
        END LOOP;
        CLOSE c1;
      
        update batchlog  set totalrow = totalrownum, prrow = totalrownum,totalins = totalinsert, totaldel = totaldelete, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        --utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        --utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut, sysdateTxt || ' End PS_OVERSTAYCHNG .... !!!');
        --utl_file.fflush(file_ut);
        --utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_OVERSTAYCHNG;
/
