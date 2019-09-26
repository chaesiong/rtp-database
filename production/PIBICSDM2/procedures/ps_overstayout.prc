CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_OVERSTAYOUT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_OVERSTAYOUT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        19/06/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_OVERSTAYOUT
      Sysdate:         19/06/2014
      Date and Time:   19/06/2014, 11:47:43, and 19/06/2014 11:47:43
      Username:        Sumet-C (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
  DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totaldelete number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    --file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
    
     select cardtype, tm6no, efamilynm, efirstnm, emiddlenm, tdtno, nationcd, birthdte, 
     --max(inoutdte) maxinoutdte,
     inoutdte maxinoutdte,
     personid
     from immigration 
     where to_char(inoutdte, 'YYYYMMDD') = to_char(sysdate -1, 'YYYYMMDD') 
     --where to_char(inoutdte, 'YYYYMMDD') between '20180204' and '20180205'
     and cardtype = '2'
     and (nationcd <> 'T03' and visatype_seqno <> '9') 
     and (tdtno is not null and nationcd is not null);
      
     --group by  cardtype, tm6no, efamilynm, efirstnm, emiddlenm, tdtno, nationcd, birthdte ,personid;
 
  
    rec_imm c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totaldelete := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAYOUT ' || to_char(sysdate -1, 'dd/MM/yyyy'), null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
--        file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_OVERSTAYOUT' || sysdateFile || '.txt', 'W');
--        utl_file.put_line(file_ut, sysdateTxt || ' Start PS_OVERSTAYOUT .... !!!');
--        utl_file.fflush(file_ut);
        
      OPEN c1;
        LOOP FETCH c1 INTO rec_imm; EXIT WHEN c1%NOTFOUND;
            postfix := '';
           
            FOR rec_tm IN (select * from processfines where personid = rec_imm.personid and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) < to_number(to_char(rec_imm.maxinoutdte, 'YYYYMMDDHH24MI')))
            LOOP
                postfix := 'DELETE';
                totaldelete := totaldelete + 1;
                
                insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                   passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                   visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                   rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                   tmb_seqno, tel, typeaddr, lastpermitdte) 
                values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                 rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                 rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                 rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                 rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, rec_tm.extperson_seqno, rec_tm.extpermitdte, rec_tm.extflag, rec_tm.chngperson_seqno, rec_tm.chngpermitdte, rec_tm.chngflag, 
                 rec_tm.rqsperson_seqno, rec_tm.rqspermitdte, rec_tm.rqsflag, rec_tm.fnperson_seqno, rec_tm.alien_seqno, rec_tm.processdte, sysdate, 'OVERSTAY_OUT Personid = ' || rec_tm.personid, 
                 rec_tm.ovsdte, rec_tm.yearofdob, rec_tm.sexdesc, rec_tm.deptlevel1, rec_tm.deptlevel2, rec_tm.building, rec_tm.addr, rec_tm.road, rec_tm.pv_seqno, 
                 rec_tm.amp_seqno, rec_tm.tmb_seqno, rec_tm.tel, rec_tm.typeaddr, rec_tm.lastpermitdte); 
                 
                 delete processfines where tmovsseqno = rec_tm.tmovsseqno;            
            END LOOP;
            
           
            IF postfix IS NULL THEN
                FOR rec_tm IN (select * from processfines where tdtno = rec_imm.tdtno 
                and (case when rec_imm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                when rec_imm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_imm.nationcd then 1 else 0 end = 1)
                and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) < to_number(to_char(rec_imm.maxinoutdte, 'YYYYMMDDHH24MI')))
                LOOP
                    postfix := 'DELETE';
                    totaldelete := totaldelete + 1;
                    
                    insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                    passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                    visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                    rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                    tmb_seqno, tel, typeaddr, lastpermitdte) 
                    values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                    rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                    rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                    rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                    rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, rec_tm.extperson_seqno, rec_tm.extpermitdte, rec_tm.extflag, rec_tm.chngperson_seqno, rec_tm.chngpermitdte, rec_tm.chngflag, 
                    rec_tm.rqsperson_seqno, rec_tm.rqspermitdte, rec_tm.rqsflag, rec_tm.fnperson_seqno, rec_tm.alien_seqno, rec_tm.processdte, sysdate, 'OVERSTAY_OUT tdtno nationcd = ' || rec_tm.personid, 
                    rec_tm.ovsdte, rec_tm.yearofdob, rec_tm.sexdesc, rec_tm.deptlevel1, rec_tm.deptlevel2, rec_tm.building, rec_tm.addr, rec_tm.road, rec_tm.pv_seqno, rec_tm.amp_seqno, 
                    rec_tm.tmb_seqno, rec_tm.tel, rec_tm.typeaddr, rec_tm.lastpermitdte); 
                 
                    delete processfines where tmovsseqno = rec_tm.tmovsseqno;                
                END LOOP;
            END IF;                       
           
            IF postfix IS NULL THEN
                FOR rec_tm IN (select * from processfines i where i.tm6no = rec_imm.tm6no 
                and i.efamilynm||i.emiddlenm||i.efirstnm like rec_imm.efamilynm||rec_imm.emiddlenm||rec_imm.efirstnm and i.birthdte=rec_imm.birthdte
                and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) < to_number(to_char(rec_imm.maxinoutdte, 'YYYYMMDDHH24MI')))
                LOOP
                    postfix := 'DELETE';
                    totaldelete := totaldelete + 1;
                        
                    insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                    passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                    visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                    rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                    tmb_seqno, tel, typeaddr, lastpermitdte) 
                    values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                    rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                    rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                    rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                    rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, rec_tm.extperson_seqno, rec_tm.extpermitdte, rec_tm.extflag, rec_tm.chngperson_seqno, rec_tm.chngpermitdte, rec_tm.chngflag, 
                    rec_tm.rqsperson_seqno, rec_tm.rqspermitdte, rec_tm.rqsflag, rec_tm.fnperson_seqno, rec_tm.alien_seqno, rec_tm.processdte, sysdate, 'OVERSTAY_OUT tm6no 3 name birhtdte = ' || rec_tm.personid, 
                    rec_tm.ovsdte, rec_tm.yearofdob, rec_tm.sexdesc, rec_tm.deptlevel1, rec_tm.deptlevel2, rec_tm.building, rec_tm.addr, rec_tm.road, rec_tm.pv_seqno, rec_tm.amp_seqno, 
                    rec_tm.tmb_seqno, rec_tm.tel, rec_tm.typeaddr, rec_tm.lastpermitdte);
                     
                 
                    delete processfines where tmovsseqno = rec_tm.tmovsseqno;
                END LOOP;
           END IF;
           
           /*
            IF postfix IS NULL THEN
                FOR rec_tm IN (select * from processfines i where i.tm6no = rec_imm.tm6no 
                and i.efamilynm||i.emiddlenm||i.efirstnm like rec_imm.efamilynm||rec_imm.emiddlenm||rec_imm.efirstnm 
                and i.birthdte=rec_imm.birthdte and to_number(to_char(i.inoutdte, 'YYYYMMDDHH24MI')) < to_number(to_char(rec_imm.maxinoutdte, 'YYYYMMDDHH24MI')))
                LOOP
                    postfix := 'DELETE';
                    totaldelete := totaldelete + 1;
                
                    insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                    passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                    visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                    rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                    tmb_seqno, tel, typeaddr, lastpermitdte) 
                    values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                    rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                    rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                    rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                    rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, rec_tm.extperson_seqno, rec_tm.extpermitdte, rec_tm.extflag, rec_tm.chngperson_seqno, rec_tm.chngpermitdte, rec_tm.chngflag, 
                    rec_tm.rqsperson_seqno, rec_tm.rqspermitdte, rec_tm.rqsflag, rec_tm.fnperson_seqno, rec_tm.alien_seqno, rec_tm.processdte, sysdate, 'OVERSTAY_IN tm6 3 name birthdte = ' || rec_tm.personid, 
                    rec_tm.ovsdte, rec_tm.yearofdob, rec_tm.sexdesc, rec_tm.deptlevel1, rec_tm.deptlevel2, rec_tm.building, rec_tm.addr, rec_tm.road, rec_tm.pv_seqno, rec_tm.amp_seqno, 
                    rec_tm.tmb_seqno, rec_tm.tel, rec_tm.typeaddr, rec_tm.lastpermitdte); 
                    
                    delete processfines where tmovsseqno = rec_tm.tmovsseqno;
                END LOOP;
            END IF;
            */
            IF postfix IS NULL THEN
                IF rec_imm.efamilynm is not null and rec_imm.efirstnm is not null and rec_imm.emiddlenm is null THEN 
                    FOR rec_tm IN (select * from processfines
                    where ((efamilynm = rec_imm.efamilynm and efirstnm = rec_imm.efirstnm) or (efamilynm = rec_imm.efamilynm and emiddlenm = rec_imm.efirstnm)
                    or (efirstnm = rec_imm.efamilynm and efamilynm = rec_imm.efirstnm) or (efirstnm = rec_imm.efamilynm and emiddlenm = rec_imm.efirstnm)
                    or (emiddlenm = rec_imm.efamilynm and efirstnm = rec_imm.efirstnm) or (emiddlenm = rec_imm.efamilynm and efamilynm = rec_imm.efirstnm))
                    and birthdte = rec_imm.birthdte
                    and (case when rec_imm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                    when rec_imm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_imm.nationcd then 1 else 0 end = 1) 
                    and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) < to_number(to_char(rec_imm.maxinoutdte, 'YYYYMMDDHH24MI')))
                    LOOP
                        postfix := 'DELETE';
                        totaldelete := totaldelete + 1;
                    
                        insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                        passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                        visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                        rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                        tmb_seqno, tel, typeaddr, lastpermitdte) 
                        values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                        rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                        rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                        rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                        rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, rec_tm.extperson_seqno, rec_tm.extpermitdte, rec_tm.extflag, rec_tm.chngperson_seqno, rec_tm.chngpermitdte, rec_tm.chngflag, 
                        rec_tm.rqsperson_seqno, rec_tm.rqspermitdte, rec_tm.rqsflag, rec_tm.fnperson_seqno, rec_tm.alien_seqno, rec_tm.processdte, sysdate, 'OVERSTAY_OUT 2in3 name birthdte = ' || rec_tm.personid, 
                        rec_tm.ovsdte, rec_tm.yearofdob, rec_tm.sexdesc, rec_tm.deptlevel1, rec_tm.deptlevel2, rec_tm.building, rec_tm.addr, rec_tm.road, rec_tm.pv_seqno, rec_tm.amp_seqno, 
                    rec_tm.tmb_seqno, rec_tm.tel, rec_tm.typeaddr, rec_tm.lastpermitdte); 
                        
                        delete processfines where tmovsseqno = rec_tm.tmovsseqno;
                    END LOOP;
                END IF;
            END IF;
            
            IF postfix IS NULL THEN
                IF rec_imm.efamilynm is not null and rec_imm.efirstnm is not null and rec_imm.emiddlenm is not null THEN 
                    FOR rec_tm IN (select * from processfines
                    where ((efamilynm = rec_imm.efamilynm and efirstnm = rec_imm.efirstnm) or (efamilynm = rec_imm.efamilynm and emiddlenm = rec_imm.efirstnm)
                    or (efirstnm = rec_imm.efamilynm and efamilynm = rec_imm.efirstnm) or (efirstnm = rec_imm.efamilynm and emiddlenm = rec_imm.efirstnm)
                    or (emiddlenm = rec_imm.efamilynm and efirstnm = rec_imm.efirstnm) or (emiddlenm = rec_imm.efamilynm and efamilynm = rec_imm.efirstnm)
                    or (efamilynm = rec_imm.efamilynm and efirstnm = rec_imm.emiddlenm) or (efamilynm = rec_imm.efamilynm and emiddlenm = rec_imm.emiddlenm)
                    or (efirstnm = rec_imm.efamilynm and efamilynm = rec_imm.emiddlenm) or (efirstnm = rec_imm.efamilynm and emiddlenm = rec_imm.emiddlenm)
                    or (emiddlenm = rec_imm.efamilynm and efirstnm = rec_imm.emiddlenm) or (emiddlenm = rec_imm.efamilynm and efamilynm = rec_imm.emiddlenm)                    
                    or (efamilynm = rec_imm.emiddlenm and efirstnm = rec_imm.efirstnm) or (efamilynm = rec_imm.emiddlenm and emiddlenm = rec_imm.efirstnm)
                    or (efirstnm = rec_imm.emiddlenm and efamilynm = rec_imm.efirstnm) or (efirstnm = rec_imm.emiddlenm and emiddlenm = rec_imm.efirstnm)
                    or (emiddlenm = rec_imm.emiddlenm and efirstnm = rec_imm.efirstnm) or (emiddlenm = rec_imm.emiddlenm and efamilynm = rec_imm.efirstnm))
                    and birthdte = rec_imm.birthdte
                    and (case when rec_imm.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
                    when rec_imm.nationcd not in ('C10', 'M24', 'H04') and nationcd = rec_imm.nationcd then 1 else 0 end = 1) 
                    and to_number(to_char(inoutdte, 'YYYYMMDDHH24MI')) < to_number(to_char(rec_imm.maxinoutdte, 'YYYYMMDDHH24MI')))
                    LOOP
                        postfix := 'DELETE';
                        totaldelete := totaldelete + 1;
                    
                        insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, 
                        passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, 
                        visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, 
                        rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
                        tmb_seqno, tel, typeaddr, lastpermitdte) 
                        values (deltmoverstay_seqno.nextval, rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
                        rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportexpdte, rec_tm.updusr,
                        rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by,
                        rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno,
                        rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.deptcd, rec_tm.extperson_seqno, rec_tm.extpermitdte, rec_tm.extflag, rec_tm.chngperson_seqno, rec_tm.chngpermitdte, rec_tm.chngflag, 
                        rec_tm.rqsperson_seqno, rec_tm.rqspermitdte, rec_tm.rqsflag, rec_tm.fnperson_seqno, rec_tm.alien_seqno, rec_tm.processdte, sysdate, 'OVERSTAY_OUT 2in3 name birthdte = ' || rec_tm.personid, 
                        rec_tm.ovsdte, rec_tm.yearofdob, rec_tm.sexdesc, rec_tm.deptlevel1, rec_tm.deptlevel2, rec_tm.building, rec_tm.addr, rec_tm.road, rec_tm.pv_seqno, rec_tm.amp_seqno, 
                        rec_tm.tmb_seqno, rec_tm.tel, rec_tm.typeaddr, rec_tm.lastpermitdte); 
                        
                        delete processfines where tmovsseqno = rec_tm.tmovsseqno;
                    END LOOP;
                END IF;
            END IF;                       
           
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
            
            ----DBMS_OUTPUT.PUT_LINE('personid = ' || rec_imm.personid || ' ' || postfix);
            --utl_file.put_line(file_ut, 'personid = ' || rec_imm.personid || ' ' ||  'tdtno = ' || rec_imm.tdtno || ' ' ||  'nationcd = ' || rec_imm.nationcd || ' ' || postfix);
            --utl_file.fflush(file_ut);
            
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totaldel = totaldelete, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
--        utl_file.put_line(file_ut, 'Total : ' || totalrownum);
--        utl_file.fflush(file_ut);
--        utl_file.put_line(file_ut, sysdateTxt || ' End PS_OVERSTAYOUT .... !!!');
--        utl_file.fflush(file_ut);
--        utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            --DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_OVERSTAYOUT;
/
