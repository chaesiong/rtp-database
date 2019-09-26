CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_BEGINCARDTYPETWO" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_BEGINCARDTYPETWO
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        28/08/2014   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_BEGINCARDTYPETWO
      Sysdate:         28/08/2014
      Date and Time:   28/08/2014, 17:47:32, and 28/08/2014 17:47:32
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
    file_ut UTL_FILE.FILE_TYPE;
    
    CURSOR c1 IS
    
    select cardtype, tm6no, efamilynm, efirstnm, emiddlenm, tdtno, nationcd, birthdte, max(inoutdte) maxinoutdte ,personid
    from immigration 
    where to_char(inoutdte, 'YYYYMM')  between '201401'
    and  to_char(sysdate, 'YYYYMM') 
    and cardtype = '2' and (nationcd <> 'T03' and visatype_seqno <> '9') 
    and (tdtno is not null and nationcd is not null) 
    and to_char(inoutdte,'YYYYMMDD')between '20140101' and '20150531' 
    group by  cardtype, tm6no, efamilynm, efirstnm, emiddlenm, tdtno, nationcd, birthdte,personid;
    
    rec_imm c1%ROWTYPE;
    
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totaldelete := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'BEGINCARDTYPETWO', null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        file_ut := UTL_FILE.FOPEN('LOGS_DIR', 'log_PS_BEGINCARDTYPETWO' || sysdateFile || '.txt', 'W');
        utl_file.put_line(file_ut, sysdateTxt || ' Start PS_BEGINCARDTYPETWO .... !!!');
        utl_file.fflush(file_ut);
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_imm; EXIT WHEN c1%NOTFOUND;
           postfix := '';
           
            FOR rec_immover IN (select personid, inoutdte, tdtno, nationcd from immoverstay where tdtno = rec_imm.tdtno and nationcd = rec_imm.nationcd)
            LOOP
                FOR rec_imm_inner IN (select * from (select inoutdte from immigration where tdtno = rec_imm.tdtno and nationcd = rec_imm.nationcd 
                and to_char(inoutdte,'YYYYMMDD')between '20140101' and '20150531'  and cardtype = '2' and nationcd <> 'T03' order by inoutdte desc) where rownum = 1)
                 LOOP
                    IF rec_imm_inner.inoutdte > rec_immover.inoutdte THEN
                        postfix := 'DELETE';
                        totaldelete := totaldelete + 1;
                        
                        insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                        tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                        create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                        extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                        select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                        tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                        create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                        extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'PS_BEGINCARDTYPETWO_1' 
                        from immoverstay where personid = rec_immover.personid;
                        
                        delete immoverstay where personid = rec_immover.personid;
                    END IF;
                 END LOOP;                             
            END LOOP;
            
             FOR rec_immover IN (select personid, inoutdte, tdtno, nationcd,tm6no,efamilynm,efirstnm,emiddlenm,birthdte from immoverstay i where i.tm6no=rec_imm.tm6no and i.birthdte=rec_imm.birthdte and i.efamilynm||i.efirstnm||i.emiddlenm like rec_imm.efamilynm||rec_imm.efirstnm||rec_imm.emiddlenm)
            LOOP
                FOR rec_imm_inner IN (select * from (select inoutdte from immigration where tdtno = rec_imm.tdtno and nationcd = rec_imm.nationcd 
                and to_char(inoutdte,'YYYYMMDD')between '20140101' and '20150531'   and cardtype = '2' and nationcd <> 'T03' order by inoutdte desc) where rownum = 1)
                 LOOP
                    IF rec_imm_inner.inoutdte > rec_immover.inoutdte THEN
                        postfix := 'DELETE';
                        totaldelete := totaldelete + 1;
                        
                        insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                        tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                        create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                        extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                        select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                        tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                        create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                        extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'PS_BEGINCARDTYPETWO_2' 
                        from immoverstay where personid = rec_immover.personid;
                        
                        delete immoverstay where personid = rec_immover.personid;
                    END IF;
                 END LOOP;
             END LOOP;
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow, totaldel = totaldelete where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
            
            --DBMS_OUTPUT.PUT_LINE('tdtno = ' || rec_imm.tdtno || ' nationcd = ' || rec_imm.nationcd || ' ' || postfix);
           -- utl_file.put_line(file_ut, 'tdtno = ' || rec_imm.tdtno || ' nationcd = ' || rec_imm.nationcd || ' ' || postfix);
            utl_file.fflush(file_ut);
            
        END LOOP;
        CLOSE c1;
        
        update batchlog  set totalrow = totalrownum, prrow = totalrownum, totaldel = totaldelete, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
        
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        utl_file.put_line(file_ut, 'Total : ' || totalrownum);
        utl_file.fflush(file_ut);
        utl_file.put_line(file_ut, sysdateTxt || ' End PS_BEGINCARDTYPETWO .... !!!');
        utl_file.fflush(file_ut);
        utl_file.fclose(file_ut);
    
--    EXCEPTION
--        WHEN others THEN
--            --DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
     -- null;--prompt(sqlerrm||'[Re-Gen Error]');
     
    END;
END PS_BEGINCARDTYPETWO;
/
