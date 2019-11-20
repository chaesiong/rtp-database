CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_OVERSTAYDAY" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_OVERSTAYDAY
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        19/06/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_OVERSTAYDAY
      Sysdate:         19/06/2014
      Date and Time:   19/06/2014, 11:46:42, and 19/06/2014 11:46:42
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    sysdateCurrent varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totalinsert number(20);
    totaldelete number(20);
    totalupdate number(20);
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
    fnPersonSeq number(20);
    alienSeq number(20);
    ovsPersonid varchar2(20);
    postfix varchar2(20);
    --file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
   select * from immigration where (to_char(sysdate, 'yyyymmdd') - to_char(visaexpdte, 'yyyymmdd')) = 1 and cardtype = '1' and (nationcd <> 'T03' and visatype_seqno <> '9')
      and (nationcd is not null and visatype_seqno is not null) 
      union all 
      select * from immigration where personid in (select personid from tminformdead where (to_char(sysdate, 'yyyymmdd') - to_char(credte, 'yyyymmdd')) = 1 and personid is not null);

    rec_imm c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totalinsert := 0;
        totaldelete := 0;
        totalupdate := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAYDAY', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
--        file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_OVERSTAYDAY' || sysdateFile || '.txt', 'W');
--        utl_file.put_line(file_ut, sysdateTxt || ' Start PS_OVERSTAYDAY .... !!!');
--        utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_imm; EXIT WHEN c1%NOTFOUND;
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
            ovsPersonid := null;
            postfix := '';
            
             IF rec_imm.cardtype = 3 THEN
                BEGIN
                    select personid into ovsPersonid 
                    from immoverstay where personid = rec_imm.personid and rownum = 1;
                    IF ovsPersonid IS NOT NULL THEN
                        postfix := 'DELETE';
                        totaldelete := totaldelete + 1;
                        
                        insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                        tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                        create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                        extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                        select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                        tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                        create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                        extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'PS_OVERSTAYDAY_TMDEATH' 
                        from immoverstay where personid = ovsPersonid;
                                    
                        delete immoverstay where personid = ovsPersonid;
                    END IF;
                EXCEPTION WHEN NO_DATA_FOUND THEN
                    NULL;
                END;
                
            ELSE
            
                FOR rec_ext IN (select to_char(ext.permit_date, 'yyyymmdd') permit, ext.extperson_seqno, ext.permit_date from ext_person ext 
                where ext.cpassportno = rec_imm.tdtno and ext.nation_seqno = rec_imm.count_seqno and ext.cpassportno <> 'PASSPORT' 
                and to_char(in_date, 'yyyymmdd') = to_char(rec_imm.inoutdte, 'yyyymmdd') and ext.approve_sts = 'A' and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_imm.visaexpdte, 'yyyymmdd') and rownum = 1)
                LOOP
                    IF to_char(rec_ext.permit_date, 'yyyymmdd') < sysdateCurrent THEN
                        extPersonSeq := rec_ext.extperson_seqno;
                        extPermit := rec_ext.permit;
                        extPermitdte := rec_ext.permit_date;
                        extFlag := 'Y';
                     ELSE
                        extFlag := 'N';
                    END IF;
                END LOOP;
                
                FOR rec_chng IN (select to_char(chng.visa_expdate, 'yyyymmdd') permit, chng.chngperson_seqno, chng.visa_expdate from chng_person chng 
                where chng.passportno = rec_imm.tdtno and chng.nation_seqno = rec_imm.count_seqno and chng.passportno <> 'PASSPORT' 
                and to_char(visa_expdate, 'yyyymmdd') >=  to_char(rec_imm.visaexpdte, 'yyyymmdd') and chng.status = 1 and chng.actflag = 'Y' and rownum = 1)
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
                where rqs.cpassportno = rec_imm.tdtno and rqs.nation_seqno = rec_imm.count_seqno and rqs.cpassportno <> 'PASSPORT' 
                and to_char(permit_date, 'yyyymmdd') >=  to_char(rec_imm.visaexpdte, 'yyyymmdd') and rqs.apprvsts not in ('C','N','R') and rownum = 1)
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
                
                FOR rec_fn IN (select fnperson_seqno from fn_person where passportno = rec_imm.tdtno 
                and nation_seqno = rec_imm.count_seqno and passportno <> 'PASSPORT' and rownum = 1)
                LOOP
                    fnPersonSeq := rec_fn.fnperson_seqno;
                END LOOP;
                
                FOR rec_alien IN 
                (select alien_seqno from
                    (select  passportno, a.count_seqno, checkindte, c.hotel_seqno, alien_seqno, c.name, c.addr,  c.road, c.pv_seqno, c.amp_seqno, c.tmb_seqno, c.postcode , c.tel  
                    from fn_alienlist a,fn_addressnotify b, fn_hotel c 
                    where a.addrn_seqno = b.addrn_seqno(+) 
                    and b.hotel_seqno = c. hotel_seqno(+) 
                    and a.passportno = rec_imm.tdtno 
                    and a.count_seqno = rec_imm.count_seqno 
                    and checkindte is not null 
                    and a.passportno <> 'PASSPORT' 
                    order by checkindte desc)
                where  rownum =1)
                LOOP
                    alienSeq := rec_alien.alien_seqno;
                END LOOP;
                
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
                
                IF (extFlag = 'Y' OR extFlag IS NULL) AND (chngFlag = 'Y' OR chngFlag IS NULL) AND (rqsFlag = 'Y' OR rqsFlag IS NULL) THEN
                    
                    BEGIN
                        select personid into ovsPersonid 
                        from immoverstay where personid = rec_imm.personid and rownum = 1;
                         IF ovsPersonid IS NOT NULL THEN
                            postfix := 'UPDATE';
                            totalupdate := totalupdate + 1;
                            
                            -- Ittipon edit
                            insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                            tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                            extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                            select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                            tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                            extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'PS_UPDOVERSTAYDAY' 
                            from immoverstay where personid = rec_imm.personid;                            
                            
                            update immoverstay set ovsdte=sysdate,tm6no = rec_imm.tm6no, inoutdte = rec_imm.inoutdte, cardtype = rec_imm.cardtype, tfirstnm = rec_imm.tfirstnm, 
                            tmiddlenm = rec_imm.tmiddlenm, tfamilynm = rec_imm.tfamilynm, efirstnm = rec_imm.efirstnm, emiddlenm = rec_imm.emiddlenm, efamilynm = rec_imm.efamilynm, 
                            sex = rec_imm.sex, birthdte = rec_imm.birthdte, nationcd = rec_imm.nationcd, tdtcd = rec_imm.tdtcd, tdtno = rec_imm.tdtno, visatypecd = rec_imm.visatypecd, 
                            visaexpdte = rec_imm.visaexpdte, passportdte = rec_imm.passportdte, passportexpdte = rec_imm.passportexpdte, updusr = rec_imm.updusr, upddte = rec_imm.upddte, 
                            updterm = rec_imm.updterm, remark = rec_imm.remark, status = rec_imm.status, tm5_seqno = rec_imm.tm5_seqno, tm2inout_seqno = rec_imm.tm2inout_seqno, 
                            convcd = rec_imm.convcd, convregno = rec_imm.convregno, seqno = rec_imm.seqno, create_by = rec_imm.create_by, create_date = rec_imm.create_date, update_by = rec_imm.update_by, 
                            update_date = rec_imm.update_date, version = rec_imm.version, conv_seqno = rec_imm.conv_seqno, visatype_seqno = rec_imm.visatype_seqno, dept_seqno = rec_imm.dept_seqno, 
                            count_seqno = rec_imm.count_seqno, permit_seqno = rec_imm.permit_seqno, flightprefix = rec_imm.flightprefix, flightnumber = rec_imm.flightnumber, deptcd = rec_imm.deptcd, 
                            extperson_seqno = extPersonSeq, extpermitdte = extPermitdte, extflag = extFlag, chngperson_seqno = chngPersonSeq, chngpermitdte = chngPermitdte, chngflag = chngFlag, 
                            rqsperson_seqno = rqsPersonSeq, rqspermitdte = rqsPermitdte, rqsflag = rqsFlag, fnperson_seqno = fnPersonSeq, alien_seqno = alienSeq, processdte = sysdate 
                            where personid = rec_imm.personid;
                         END IF;
                    EXCEPTION WHEN NO_DATA_FOUND THEN
                        postfix := 'INSERT';
                        totalinsert := totalinsert +1;
                        insert into immoverstay (ovsdte,iovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, 
                        sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, 
                        remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, 
                        version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
                        extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte) 
                        values (sysdate,immoverstay_seq.nextval, rec_imm.personid, rec_imm.tm6no, rec_imm.inoutdte, rec_imm.cardtype, rec_imm.tfirstnm, rec_imm.tmiddlenm, rec_imm.tfamilynm, rec_imm.efirstnm, rec_imm.emiddlenm, rec_imm.efamilynm,
                        rec_imm.sex, rec_imm.birthdte, rec_imm.nationcd, rec_imm.tdtcd, rec_imm.tdtno, rec_imm.visatypecd, rec_imm.visaexpdte, rec_imm.passportdte, rec_imm.passportexpdte, rec_imm.updusr, rec_imm.upddte, rec_imm.updterm, 
                        rec_imm.remark, rec_imm.status, rec_imm.tm5_seqno, rec_imm.tm2inout_seqno, rec_imm.convcd, rec_imm.convregno, rec_imm.seqno, rec_imm.create_by, rec_imm.create_date, rec_imm.update_by, rec_imm.update_date, 
                        rec_imm.version, rec_imm.conv_seqno, rec_imm.visatype_seqno, rec_imm.dept_seqno, rec_imm.count_seqno, rec_imm.permit_seqno, rec_imm.flightprefix, rec_imm.flightnumber, rec_imm.deptcd, 
                        extPersonSeq, extPermitdte, extFlag, chngPersonSeq, chngPermitdte, chngFlag, rqsPersonSeq, rqsPermitdte, rqsFlag, fnPersonSeq, alienSeq, sysdate);
                    END;
                        
                END IF;
                
            END IF;
            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totalins = totalinsert, totaldel = totaldelete, totalupd = totalupdate where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
        
            ----DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_imm.tdtno || ', extPersonSeq : ' || extPersonSeq || ', chngPersonSeq : ' || chngPersonSeq || ', rqsPersonSeq : ' || rqsPersonSeq);
            ----DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_imm.tdtno || ', nationcd = ' || rec_imm.nationcd || ', count_seqno = ' || rec_imm.count_seqno || ', extFlag = ' || extFlag || ', chngFlag = ' || chngFlag || ', rqsFlag = ' || rqsFlag);
           -- utl_file.put_line(file_ut, 'tdtno = ' || rec_imm.tdtno || ', nationcd = ' || rec_imm.nationcd  || ', count_seqno = ' || rec_imm.count_seqno || ', extFlag = ' || extFlag || ', chngFlag = ' || chngFlag || ', rqsFlag = ' || rqsFlag || ' ' || postfix);
            --utl_file.fflush(file_ut);
        
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totalins = totalinsert, totaldel = totaldelete, totalupd = totalupdate, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
--        utl_file.put_line(file_ut, 'Total : ' || totalrownum);
--        utl_file.fflush(file_ut);
--        utl_file.put_line(file_ut, sysdateTxt || ' End PS_OVERSTAYDAY .... !!!');
--        utl_file.fflush(file_ut);
--        utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            --DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_OVERSTAYDAY;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_OVERSTAYDAY" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_OVERSTAYDAY" TO "BIOSAADM";
