CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEIMMIGRATIONFIX" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEIMMIGRATIONFIX
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        08/07/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEIMMIGRATIONFIX
      Sysdate:         08/07/2012
      Date and Time:   08/07/2012, 05:56:29, and 08/07/2012 05:56:29
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
PERSONIDFORDUP VARCHAR2(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from IMMIGRATION_CORRUPT where TO_NUMBER(TO_CHAR(UPDDTE, 'YYYYMMDDHH24MISS')) >= '20120707030000';
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_migrateImmigrationFIX'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start process migrate immigration .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    

    BEGIN
        insert into immigration (
           personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, 
           passportisu, passportexpdte, updusr, upddte, updterm, remark, rescertno, imginout, deptcdorg, imgpass, flagpass, status, tm5_seqno, tm2inout_seqno, pm_re_entry, 
           pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, newpermit, permitcd, convcd, convregno, seqno, create_by, create_date, update_by, update_date, version, 
           rpjseqno, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, deptcd, visatypecdorg, rescerttype, respvcd, resnoyear) 
        values ( rec_tm.personid, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm,
         rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportisu, rec_tm.passportexpdte,
         rec_tm.updusr, rec_tm.upddte, rec_tm.updterm, rec_tm.remark, rec_tm.rescertno, rec_tm.imginout, rec_tm.deptcdorg, rec_tm.imgpass, rec_tm.flagpass, rec_tm.status, rec_tm.tm5_seqno,
         rec_tm.tm2inout_seqno, rec_tm.pm_re_entry, rec_tm.pm_reexpdte, rec_tm.pm_extension, rec_tm.pm_exexpdte, rec_tm.pm_non_quota, rec_tm.pm_nonexpdte, rec_tm.newpermit,
         rec_tm.permitcd, rec_tm.convcd, rec_tm.convregno, rec_tm.seqno, rec_tm.create_by, rec_tm.create_date, rec_tm.update_by, rec_tm.update_date, rec_tm.version, rec_tm.rpjseqno,
         rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, rec_tm.count_seqno, rec_tm.permit_seqno, rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.flightprefix, rec_tm.flightnumber,
         rec_tm.deptcd, rec_tm.visatypecdorg, rec_tm.rescerttype, rec_tm.respvcd, rec_tm.resnoyear);        
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
        update immigration
        set tm6no = rec_tm.tm6no, inoutdte = rec_tm.inoutdte, cardtype = rec_tm.cardtype, tfirstnm = rec_tm.tfirstnm, tmiddlenm= rec_tm.tmiddlenm, tfamilynm= rec_tm.tfamilynm,
        efirstnm = rec_tm.efirstnm, emiddlenm= rec_tm.emiddlenm, efamilynm= rec_tm.efamilynm, sex= rec_tm.sex, birthdte = rec_tm.birthdte, nationcd = rec_tm.nationcd, tdtcd = rec_tm.tdtcd,
        tdtno = rec_tm.tdtno, visatypecd = rec_tm.visatypecd, visaexpdte = rec_tm.visaexpdte, passportdte = rec_tm.passportdte, passportisu = rec_tm.passportisu, passportexpdte = rec_tm.passportexpdte,
        updusr = rec_tm.updusr, upddte = rec_tm.upddte, updterm = rec_tm.updterm, remark = rec_tm.remark, rescertno= rec_tm.rescertno, imginout = rec_tm.imginout, deptcdorg= rec_tm.deptcdorg, 
        imgpass = rec_tm.imgpass, flagpass = rec_tm.flagpass, status = rec_tm.status, tm5_seqno= rec_tm.tm5_seqno, tm2inout_seqno = rec_tm.tm2inout_seqno, pm_re_entry = rec_tm.pm_re_entry, 
        pm_reexpdte = rec_tm.pm_reexpdte, pm_extension = rec_tm.pm_extension, pm_exexpdte = rec_tm.pm_exexpdte, pm_non_quota = rec_tm.pm_non_quota, pm_nonexpdte = rec_tm.pm_nonexpdte,
        newpermit= rec_tm.newpermit, permitcd = rec_tm.permitcd, convcd = rec_tm.convcd, convregno = rec_tm.convregno, seqno = rec_tm.seqno, create_by = rec_tm.create_by, create_date = rec_tm.create_date,
        update_by= rec_tm.update_by, update_date = rec_tm.update_date, version = rec_tm.version, rpjseqno = rec_tm.rpjseqno, conv_seqno = rec_tm.conv_seqno, visatype_seqno = rec_tm.visatype_seqno, 
        dept_seqno = rec_tm.dept_seqno, count_seqno = rec_tm.count_seqno, permit_seqno = rec_tm.permit_seqno, citizenid= rec_tm.citizenid, pass_seqno = rec_tm.pass_seqno, flightprefix = rec_tm.flightprefix, 
        flightnumber = rec_tm.flightnumber, deptcd = rec_tm.deptcd, visatypecdorg = rec_tm.visatypecdorg, rescerttype = rec_tm.rescerttype, respvcd = rec_tm.respvcd, resnoyear= rec_tm.resnoyear
        where  personid = rec_tm.personid;
    END;
         
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1;
    if commitrow = 100 then
     commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut); 
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' Endprocess migrate immigration .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
 -- when others then
  -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATEIMMIGRATIONFIX;
/
