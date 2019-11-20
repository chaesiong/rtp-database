CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEOVSDEPT64" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MigrateOVSDept64
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        02/11/2015   ittipon       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MigrateOVSDept64
      Sysdate:         02/11/2015
      Date and Time:   02/11/2015, 16:44:22, and 02/11/2015 16:44:22
      Username:        ittipon (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
begin
declare    
    totalrownum number(20);
    commitrow number(20);
    totaldelete number(20);
    batchlogno_seq number(20);
    caseflag varchar2(20);
    personid_tmp varchar2(20);
    inoutdte_tmp date;
    cardtype_tmp varchar2(1);    
    
    cursor c1 is
        -- ดึงข้อมูล Overstay ของหน่วยงาน 64: ตม.จว.ภูเก็ต
        select * from immoverstay where dept_seqno=64 and rownum <=10 order by inoutdte asc;
    recovs c1%rowtype;  
    begin 
        totalrownum := 0;
        commitrow := 0;
        totaldelete := 0;
        
        -- บันทึกลงตาราง Batchlog
        batchlogno_seq := batchlog_seq.nextval;
        /*insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'TVL', '3', 'MIGRATEDEPT64', null, 0, 0, 0, sysdate, null, '1', 'ADMIN01', sysdate, 'N', 0, 0, 0, sysdate);
        commit;*/

        open c1;
        loop fetch c1 into recovs; exit when c1% notfound; --dbms_output.put_line(' case overstay '|| rectm.personid);
            totalrownum := totalrownum + 1;
            caseflag := null;
            personid_tmp := null;
            inoutdte_tmp := null;
            cardtype_tmp := null;
            -- First case ค้นหาข้อมูลการเดินทางล่าสุด (Immigration) โดยใช้ personid เงื่อนไข ขาเข้า + (วันที่เดินทางเข้า (IMMOVERSTAY) = วันที่เดินทางเข้า (IMMIGRATION)) + dept_seqno = 64 
            begin
                            
                select personid, cardtype, inoutdte into personid_tmp, cardtype_tmp, inoutdte_tmp from immigration 
                where personid = recovs.personid and cardtype ='1' and to_char(inoutdte,'YYYYMMDD') =  to_char(recovs.inoutdte,'YYYYMMDD') 
                and dept_seqno=recovs.dept_seqno;
             -- กรณีที่พบข้อมูล ไปค้นหาการเดินทางที่ตาราง Tmmain เงื่อนไข ขาออก + (วันที่เดินทางออก (TMMAIN) = วันที่เดินทางเข้า (IMMIGRATION)) + dept_seqno = 64 
                if personid_tmp is not null then 
                    for rec_tmmain in (
                        select * from tmmain where personid = personid_tmp and to_char(outdte,'YYYYMMDD') = to_char(inoutdte_tmp,'YYYYMMDD') 
                        and outdept_seqno = recovs.dept_seqno and rownum = 1
                    )
                    loop
                        -- กรณีที่พบข้อมูล ตรวจสอบเพิ่มเติม เงื่อนไข เวลาเดินทางเข้า (IMMIGRATION) > เวลาเดินทางออก (TMMAIN)
                        if to_number(to_char(inoutdte_tmp,'HHMI')) > to_number(to_char(rec_tmmain.outdte,'HHMI')) then
                            /* 
                                1. บันทึก ข้อมูลการเดินทางล่าสุด (IMMIGRATION) ที่ตาราง IMMGRATIONMIGRATE 
                                2. update ข้อมูลการเดินทางขาออกที่ตาราง IMMIGRATION
                                3.  บันทึกข้อมูล Overstay ที่ตาราง DELIMMOVERSTAY
                                4. delete ข้อมูล Overstay (IMMOVERSTAY)
                            */
                            caseflag := 'BYPERSONID'; 
                            
                            insert into immigrationmigrate (migrateeqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, 
                            birthdte, nationcd, tdtcd, tdtno, visatypecdorg, visaexpdte, passportdte, passportisu, passportexpdte, updusr, upddte, updterm, remark, rescertno, deptcd, 
                            flagpass, status, tm5_seqno, tm2inout_seqno, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, newpermit, permitcd, 
                            convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, rpjseqno, conv_seqno, visatype_seqno, dept_seqno, 
                            count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, deptcdorg, visatypecd, rescerttype, respvcd, resnoyear, pv_seqno, 
                            pd_seqno, zone_seqno, shift_seqno, flag) 
                            select investigate_seq.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, 
                            birthdte, nationcd, tdtcd, tdtno, visatypecdorg, visaexpdte, passportdte, passportisu, passportexpdte, updusr, upddte, updterm, remark, rescertno, deptcd, 
                            flagpass, status, tm5_seqno, tm2inout_seqno, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, newpermit, permitcd, 
                            convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, rpjseqno, conv_seqno, visatype_seqno, dept_seqno, 
                            count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, deptcdorg, visatypecd, rescerttype, respvcd, resnoyear, pv_seqno, 
                            pd_seqno, zone_seqno, shift_seqno, 'BYPERSONID'
                            from immigration where personid = personid_tmp;                            
                            
                            
                            update immigration set tm6no = rec_tmmain.outtm6no, inoutdte = rec_tmmain.outdte, cardtype = '2',
                            tfirstnm = rec_tmmain.tfirstnm, tmiddlenm = rec_tmmain.tmiddlenm, tfamilynm = rec_tmmain.tfamilynm, efirstnm = rec_tmmain.efirstnm,
                            emiddlenm = rec_tmmain.emiddlenm, efamilynm = rec_tmmain.efamilynm, sex = rec_tmmain.sex, birthdte = rec_tmmain.birthdte,
                            nationcd = rec_tmmain.nationcd, tdtcd = rec_tmmain.outtdtcd, tdtno = rec_tmmain.outtdtno, visaexpdte = rec_tmmain.outvisaexpdte,
                            passportdte = rec_tmmain.outpassportdte,  passportexpdte = rec_tmmain.outpassportexpdte, updusr = rec_tmmain.outcreusr, 
                            upddte = rec_tmmain.outcredte, updterm = rec_tmmain.outcredterm, remark = rec_tmmain.outremark,  deptcd = rec_tmmain.outdeptcd, 
                            newpermit= rec_tmmain.outpermitdte, permitcd = rec_tmmain.outpermitcd, convcd = rec_tmmain.outconvcd, 
                            convregno = rec_tmmain.outconvregno, seqno = rec_tmmain.outseqno, flightprefix = rec_tmmain.outflightprefix, 
                            flightnumber = rec_tmmain.outflightnumber,  visatypecd = rec_tmmain.outvisatypecd where  personid = personid_tmp;  
                            
                            
                            insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                            tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                            extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                            select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                            tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                            create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                            extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'MIGRATEDEPT64' 
                            from immoverstay where  iovseqno = recovs.iovseqno;
                    
                            delete immoverstay where  iovseqno = recovs.iovseqno;
                            commit;          
                        end if;
                    end loop;
                end if;        
            exception when no_data_found then
                /* 
                กรณีใช้ personid ค้นหาแล้วไม่พบ
                Second case ค้นหาข้อมูลการเดินทางล่าสุด (Immigration) โดยใช้ เลขหนังสือเดินทางและสัญชาติ เงื่อนไข ขาเข้า + (วันที่เดินทางเข้า (IMMOVERSTAY) = วันที่เดินทางเข้า (IMMIGRATION)) + dept_seqno = 64
                */
     
                begin
                    select personid, cardtype, inoutdte into personid_tmp, cardtype_tmp, inoutdte_tmp from (
                        select * from immigration 
                        where tdtno = recovs.tdtno and nationcd = recovs.nationcd and cardtype ='1' and to_char(inoutdte,'YYYYMMDD') =  to_char(recovs.inoutdte,'YYYYMMDD') 
                        and dept_seqno=recovs.dept_seqno order by inoutdte desc
                    )
                    where rownum = 1;
                    -- กรณีที่พบข้อมูล ไปค้นหาการเดินทางที่ตาราง Tmmain เงื่อนไข ขาออก + (วันที่เดินทางออก (TMMAIN) = วันที่เดินทางเข้า (IMMIGRATION)) + dept_seqno = 64 
                    if personid_tmp is not null then
                        for rec_tmmain in (
                            select * from tmmain where personid = personid_tmp and to_char(outdte,'YYYYMMDD') = to_char(inoutdte_tmp,'YYYYMMDD') 
                            and outdept_seqno=recovs.dept_seqno and rownum=1
                        )
                        loop
                            if to_number(to_char(inoutdte_tmp,'HHMI')) > to_number(to_char(rec_tmmain.outdte,'HHMI')) then
                                 /* 
                                    1. บันทึก ข้อมูลการเดินทางล่าสุด (IMMIGRATION) ที่ตาราง IMMGRATIONMIGRATE 
                                    2. update ข้อมูลการเดินทางขาออกที่ตาราง IMMIGRATION
                                    3.  บันทึกข้อมูล Overstay ที่ตาราง DELIMMOVERSTAY
                                    4. delete ข้อมูล Overstay (IMMOVERSTAY)
                                */
                                caseflag := 'BYPASSNATION';
                        
                                insert into immigrationmigrate (migrateeqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, 
                                birthdte, nationcd, tdtcd, tdtno, visatypecdorg, visaexpdte, passportdte, passportisu, passportexpdte, updusr, upddte, updterm, remark, rescertno, deptcd, 
                                flagpass, status, tm5_seqno, tm2inout_seqno, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, newpermit, permitcd, 
                                convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, rpjseqno, conv_seqno, visatype_seqno, dept_seqno, 
                                count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, deptcdorg, visatypecd, rescerttype, respvcd, resnoyear, pv_seqno, 
                                pd_seqno, zone_seqno, shift_seqno, flag) 
                                select investigate_seq.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, 
                                birthdte, nationcd, tdtcd, tdtno, visatypecdorg, visaexpdte, passportdte, passportisu, passportexpdte, updusr, upddte, updterm, remark, rescertno, deptcd, 
                                flagpass, status, tm5_seqno, tm2inout_seqno, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, newpermit, permitcd, 
                                convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, rpjseqno, conv_seqno, visatype_seqno, dept_seqno, 
                                count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, deptcdorg, visatypecd, rescerttype, respvcd, resnoyear, pv_seqno, 
                                pd_seqno, zone_seqno, shift_seqno, 'BYPASSNATION'
                                from immigration where personid = personid_tmp;
                        
                                update immigration set tm6no = rec_tmmain.outtm6no, inoutdte = rec_tmmain.outdte, cardtype = '2',
                                tfirstnm = rec_tmmain.tfirstnm, tmiddlenm = rec_tmmain.tmiddlenm, tfamilynm = rec_tmmain.tfamilynm, efirstnm = rec_tmmain.efirstnm,
                                emiddlenm = rec_tmmain.emiddlenm, efamilynm = rec_tmmain.efamilynm, sex = rec_tmmain.sex, birthdte = rec_tmmain.birthdte,
                                nationcd = rec_tmmain.nationcd, tdtcd = rec_tmmain.outtdtcd, tdtno = rec_tmmain.outtdtno, visaexpdte = rec_tmmain.outvisaexpdte,
                                passportdte = rec_tmmain.outpassportdte,  passportexpdte = rec_tmmain.outpassportexpdte, updusr = rec_tmmain.outcreusr, 
                                upddte = rec_tmmain.outcredte, updterm = rec_tmmain.outcredterm, remark = rec_tmmain.outremark,  deptcd = rec_tmmain.outdeptcd, 
                                newpermit= rec_tmmain.outpermitdte, permitcd = rec_tmmain.outpermitcd, convcd = rec_tmmain.outconvcd, 
                                convregno = rec_tmmain.outconvregno, seqno = rec_tmmain.outseqno, flightprefix = rec_tmmain.outflightprefix, 
                                flightnumber = rec_tmmain.outflightnumber,  visatypecd = rec_tmmain.outvisatypecd where  personid = personid_tmp;  
                         
                                insert into delimmoverstay (ovsdte,diovseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, 
                                tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                                create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                                extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, processdeldte, flagdel) 
                                select ovsdte,diov_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd,  
                                tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
                                create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, extperson_seqno, 
                                extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, processdte, sysdate, 'MIGRATEDEPT64' 
                                from immoverstay where  iovseqno = recovs.iovseqno;
                                
                                delete immoverstay where iovseqno = recovs.iovseqno;
                                commit;
                            end if;
                        end loop;
                    end if;     
                exception when no_data_found then
                    -- ถ้าไม่พบข้อมูลให้บันทึกตาราง IMMIGRATIONMIGRATE
                    caseflag := 'BYNOTFOUND';
            
                    insert into IMMIGRATIONMIGRATE (migrateeqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, 
                    birthdte, nationcd, tdtcd, tdtno, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, deptcd,
                    status, tm5_seqno, tm2inout_seqno,
                    create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, flag) 
                    select investigate_seq.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex,
                    birthdte, nationcd, tdtcd, tdtno, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, deptcd,
                    status, tm5_seqno, tm2inout_seqno,
                    create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno,
                    'BYNOTFOUND'
                    from immoverstay where iovseqno = recovs.iovseqno;
                    commit;
                end;        
            null;
            end; -- end ของเงื่อนไขแรกในการค้นหา
        end loop; --cursor
        close c1;    
        update batchlog  set totalrow = totalrownum, prrow = 0, totalins = 0, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit; 
    exception
        when others then
            null;--prompt(sqlerrm||'[Re-Gen Error]');
    end;
end MigrateOVSDept64;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEOVSDEPT64" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEOVSDEPT64" TO "BIOSAADM";
