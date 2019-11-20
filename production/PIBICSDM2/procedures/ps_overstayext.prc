CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_OVERSTAYEXT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_OVERSTAYEXT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        19/06/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_OVERSTAYEXT
      Sysdate:         19/06/2014
      Date and Time:   19/06/2014, 11:48:33, and 19/06/2014 11:48:33
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
    postfix varchar2(20);
    --file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
    
    select extperson_seqno, cpassportno, nation_seqno, permit_date, in_date, birth_date, 'EXTDAY' flagdata
    from ext_person
    where to_char(update_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd') and approve_sts = 'A' and cpassportno <> 'PASSPORT';
    
    rec_ext c1%ROWTYPE;
    
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
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAYEXT ' || to_char(sysdate -1, 'dd/MM/yyyy'), null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        --file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_OVERSTAYEXT' || sysdateFile || '.txt', 'W');
        --utl_file.put_line(file_ut, sysdateTxt || ' Start PS_OVERSTAYEXT .... !!!');
        --utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_ext; EXIT WHEN c1%NOTFOUND;
            postfix := '';
            IF rec_ext.flagdata = 'EXTDAY' THEN
                DECLARE
                extPersonSeq number(20);
                BEGIN
                    select extperson_seqno into extPersonSeq 
                    from processfines where extperson_seqno = rec_ext.extperson_seqno and rownum = 1;
                    IF extPersonSeq IS NOT NULL THEN
                        IF sysdateCurrent < to_char(rec_ext.permit_date, 'yyyymmdd') THEN
                            postfix := 'DELETE';
                            totaldelete := totaldelete + 1;
                            
                            insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
                            nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
                            convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
                            flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
                            alien_seqno, processdte, processdeldte, flagdel, ovsdte,yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                            tmb_seqno, tel, typeaddr, lastpermitdte)
                            select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
                            visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
                            extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
                            processdte, sysdate, 'PS_OVERSTAYEXT extPerson_seqno ' || extPersonSeq, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                            tmb_seqno, tel, typeaddr, lastpermitdte from processfines where extperson_seqno = extPersonSeq;  
                            
                            delete processfines where extperson_seqno = extPersonSeq;  
                            
                            ----DBMS_OUTPUT.PUT_LINE('cpassportno = ' || rec_ext.cpassportno || ', extperson_seqno = ' || rec_ext.extperson_seqno || ', flagdata = ' || rec_ext.flagdata || ' ' || postfix);
                        END IF;
                    END IF;
                EXCEPTION WHEN NO_DATA_FOUND THEN
                    DECLARE
                    extCountSeq number(20);
                    exeTdtno varchar2(20);
                    BEGIN
                        select tdtno, count_seqno into exeTdtno, extCountSeq 
                        from processfines where tdtno = rec_ext.cpassportno 
                        and (case when rec_ext.nation_seqno in (45, 94, 143) and count_seqno in (45, 94, 143) then 1 
                        when rec_ext.nation_seqno not in (45, 94, 143) and count_seqno = rec_ext.nation_seqno then 1 else 0 end = 1)
                        and rownum = 1;
                        IF exeTdtno IS NOT NULL THEN
                            IF sysdateCurrent < to_char(rec_ext.permit_date, 'yyyymmdd') THEN
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
                            processdte, sysdate, 'PS_OVERSTAYEXT tdtno = ' || exeTdtno || ' and nation_seqno ' || extCountSeq, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                            tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tdtno = exeTdtno and count_seqno = extCountSeq;
                            
                            delete processfines where tdtno = exeTdtno and count_seqno = extCountSeq;                                    
                            ----DBMS_OUTPUT.PUT_LINE('cpassportno = ' || rec_ext.cpassportno || ', nation_seqno = ' || rec_ext.nation_seqno || ', flagdata = ' || rec_ext.flagdata || ' ' || postfix);
                            END IF;
                        END IF;
                    EXCEPTION WHEN NO_DATA_FOUND THEN    
                        NULL;
                    END;
                END;
            END IF;
            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totalins = totalinsert, totalupd = totalupdate, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
            
            ----DBMS_OUTPUT.PUT_LINE('cpassportno = ' || rec_ext.cpassportno || ', nation_seqno = ' || rec_ext.nation_seqno || ', flagdata = ' || rec_ext.flagdata || ' ' || postfix);
            --utl_file.put_line(file_ut, 'cpassportno = ' || rec_ext.cpassportno || ', nation_seqno = ' || rec_ext.nation_seqno || ', flagdata = ' || rec_ext.flagdata || ' ' || postfix);
            --utl_file.fflush(file_ut);
        
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totalins = totalinsert, totalupd = totalupdate, totaldel = totaldelete, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        --utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        --utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut, sysdateTxt || ' End PS_OVERSTAYEXT .... !!!');
        --utl_file.fflush(file_ut);
        --utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            --DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_OVERSTAYEXT;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_OVERSTAYEXT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_OVERSTAYEXT" TO "BIOSAADM";
