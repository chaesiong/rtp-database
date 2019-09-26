CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TRANSFER_TMINOUT_TMP" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TRANFER_TMINOUT_TMP
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        30/09/2008          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TRANFER_TM_MIDNIGTH
      Sysdate:         30/09/2008
      Date and Time:   30/09/2008, 17:48:48, and 30/09/2008 17:48:48
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
otalrow number(8);
totalrow number(8);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from tminout where to_number(to_char(credte, 'YYYYMMDD')) < to_number(to_char(sysdate, 'YYYYMMDD'));
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_tminout_tmp'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tminout into Tminout_tmp .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
    insert into tminout_tmp (seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, 
    deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportisu, passportexpdte, targetno, intype, chkpointno, creusr, 
    credte, credterm, updusr, upddte, updterm, isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, 
    imginout, pm_re_entry, pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno, create_by, 
    create_date, update_by, update_date, version, rpjseqno, permitcd, newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, 
    citizenid, pass_seqno, flightprefix,  flightnumber, typedata, flagjoinpass, flagfines) 
    values (rec_tm.seqno, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, 
    rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.deptcd, rec_tm.travcd, rec_tm.convcd, rec_tm.convregno, 
    rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.passportdte, rec_tm.passportisu, rec_tm.passportexpdte, rec_tm.targetno, 
    rec_tm.intype, rec_tm.chkpointno, rec_tm.creusr, rec_tm.credte, rec_tm.credterm, rec_tm.updusr, rec_tm.upddte, rec_tm.updterm, rec_tm.isprocess, 
    rec_tm.personid, rec_tm.tfsndxnm, rec_tm.tlsndxnm, rec_tm.tmsndxnm, rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm, rec_tm.remark, 
    rec_tm.rescertno, rec_tm.imginout, rec_tm.pm_re_entry, rec_tm.pm_reexpdte, rec_tm.pm_extension, rec_tm.pm_exexpdte, rec_tm.pm_non_quota, 
    rec_tm.pm_nonexpdte, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.create_by, rec_tm.create_date, rec_tm.update_by, 
    rec_tm.update_date, rec_tm.version, rec_tm.rpjseqno, rec_tm.permitcd, rec_tm.newpermit, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno, 
    rec_tm.count_seqno, rec_tm.permit_seqno, rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.typedata, rec_tm.flagjoinpass, rec_tm.flagfines);
   commit;   
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
 utl_file.put_line(file_ut,'total record tminout to tminout_tmp :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tminout into Tminout_tmp .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  Exception
      when others then
          null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END TRANSFER_TMINOUT_TMP;
/
