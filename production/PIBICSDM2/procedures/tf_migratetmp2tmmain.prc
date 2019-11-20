CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TF_MIGRATETMP2TMMAIN" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TF_MIGRATETMP2TMMAIN
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        05/09/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TF_MIGRATETMP2TMMAIN
      Sysdate:         05/09/2011
      Date and Time:   05/09/2011, 22:15:07, and 05/09/2011 22:15:07
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
cmtrow number(20);
totalrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from tmmain_tmp where flagprocess is null;
    --select * from tmmain_tmp where tmrunno in (32381709,32381710);
    rec_tm c1%rowtype;  
begin
 cmtrow:=0;totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_TF_MigrateTmp2Tmmain'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tmmain_tmp into Tmmain .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
    insert into tmmain (tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno, indte, 
    indeptcd, intravcd, inconvcd, inconvregno, intdtcd, intdtno, intm6no, invisatypecd, inpermitcd,  inpermitdte, inpassportdte, inpassportisu, 
    inpassportexpdte, visano, visaissue, visadte, visabyrights, inchkpointno, increusr, incredte, incredterm, inupdusr, inupddte, inupdterm, 
    inprocessusr, inprocessdte, inprocessterm, xtndeptcd, xtnaddress, xtntype, inputxtndeptcd, appdte, outseqno, outdte, outdeptcd, outtravcd, 
    outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecd, outpermitcd, outpermitdte, outpassportdte, outpassportisu, outpassportexpdte, outchkpointno, 
    outcreusr, outcredte, outcredterm, outupdusr, outupddte, outupdterm, outprocessusr, outprocessdte, outprocessterm, matchprocessusr, matchprocessdte, matchprocessterm, 
    tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype, outintype, intargetno, outtargetno, inremark, outremark, 
    flagmatch, inrescertno, outrescertno, inimg, outimg, extid, inpm_re_entry, inpm_reexpdte, inpm_extension, inpm_exexpdte, inpm_non_quota, inpm_nonexpdte, 
    instatus, intm5_seqno, intm2inout_seqno, outpm_re_entry, outpm_reexpdte, outpm_extension, outpm_exexpdte, outpm_non_quota, outpm_nonexpdte, 
    outstatus, outtm5_seqno, outtm2inout_seqno, inconv_seqno, invisatype_seqno, indept_seqno, count_seqno, inpermit_seqno, outconv_seqno, 
    outvisatype_seqno, outdept_seqno, outpermit_seqno, inflightprefix, inflightnumber, outflightprefix, outflightnumber, citizenid, pass_seqno, inrpjseqno, outrpjseqno, indeptcdorg, 
    outdeptcdorg, typedata, flagjoinpass, flagfines, invisatypecdorg, outvisatypecdorg) 
    values (rec_tm.tmrunno||'IMM', rec_tm.personid, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm,
    rec_tm.sex, rec_tm.nationcd, decode(rec_tm.inseqno, null, null, rec_tm.inseqno||'IMM'), rec_tm.indte, migratedeptcd(rec_tm.indeptcd), rec_tm.intravcd, rec_tm.inconvcd, rec_tm.inconvregno,
    decode(rec_tm.indte, null, null, '1'), rec_tm.intdtno, rec_tm.intm6no, migrateVisatypeCd(rec_tm.invisatypecd), rec_tm.inpermitcd, rec_tm.inpermitdte, rec_tm.inpassportdte, rec_tm.inpassportisu,
    rec_tm.inpassportexpdte, rec_tm.visano, rec_tm.visaissue, rec_tm.visadte, rec_tm.visabyrights, rec_tm.inchkpointno, rec_tm.increusr, rec_tm.incredte,
    rec_tm.incredterm, rec_tm.inupdusr, rec_tm.inupddte, rec_tm.inupdterm, rec_tm.inprocessusr, rec_tm.inprocessdte, rec_tm.inprocessterm, rec_tm.xtndeptcd,
    rec_tm.xtnaddress, rec_tm.xtntype, rec_tm.inputxtndeptcd, rec_tm.appdte, decode(rec_tm.outseqno, null, null, rec_tm.outseqno||'IMM'), rec_tm.outdte, migratedeptcd(rec_tm.outdeptcd),
    rec_tm.outtravcd, rec_tm.outconvcd, rec_tm.outconvregno,  decode(rec_tm.outdte, null, null, '1'), rec_tm.outtdtno, rec_tm.outtm6no, migrateVisatypeCd(rec_tm.outvisatypecd),
    rec_tm.outpermitcd, rec_tm.outpermitdte, rec_tm.outpassportdte, rec_tm.outpassportisu, rec_tm.outpassportexpdte, rec_tm.outchkpointno, rec_tm.outcreusr,
    rec_tm.outcredte, rec_tm.outcredterm, rec_tm.outupdusr, rec_tm.outupddte, rec_tm.outupdterm, rec_tm.outprocessusr, rec_tm.outprocessdte, rec_tm.outprocessterm,
    rec_tm.matchprocessusr, rec_tm.matchprocessdte, rec_tm.matchprocessterm, rec_tm.tfsndxnm, rec_tm.tlsndxnm, rec_tm.tmsndxnm, rec_tm.efsndxnm, rec_tm.elsndxnm,
    rec_tm.emsndxnm, rec_tm.birthdte, rec_tm.invisaexpdte, rec_tm.outvisaexpdte, rec_tm.inintype, rec_tm.outintype, rec_tm.intargetno, rec_tm.outtargetno,
    rec_tm.inremark, rec_tm.outremark, rec_tm.flagmatch, rec_tm.inrescertno, rec_tm.outrescertno, rec_tm.inimg, rec_tm.outimg, rec_tm.extid, rec_tm.inpm_re_entry,
    rec_tm.inpm_reexpdte, rec_tm.inpm_extension, rec_tm.inpm_exexpdte, rec_tm.inpm_non_quota, rec_tm.inpm_nonexpdte, '0', rec_tm.intm5_seqno, rec_tm.intm2inout_seqno,
    rec_tm.outpm_re_entry, rec_tm.outpm_reexpdte, rec_tm.outpm_extension, rec_tm.outpm_exexpdte, rec_tm.outpm_non_quota, rec_tm.outpm_nonexpdte, '0',
    rec_tm.outtm5_seqno, rec_tm.outtm2inout_seqno, rec_tm.inconv_seqno, rec_tm.invisatype_seqno, rec_tm.indept_seqno, rec_tm.count_seqno, rec_tm.inpermit_seqno,
    rec_tm.outconv_seqno, rec_tm.outvisatype_seqno, rec_tm.outdept_seqno, rec_tm.outpermit_seqno, rec_tm.inflightprefix, rec_tm.inflightnumber, rec_tm.outflightprefix,
    rec_tm.outflightnumber, rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.inrpjseqno, rec_tm.outrpjseqno, rec_tm.indeptcd, rec_tm.outdeptcd, rec_tm.typedata,
    rec_tm.flagjoinpass, rec_tm.flagfines, rec_tm.invisatypecd, rec_tm.outvisatypecd);
    
    update tmmain_tmp set flagprocess='Y', flagprocesdte = sysdate where tmrunno =  rec_tm.tmrunno;
    
    cmtrow:=cmtrow+1;
    totalrow:=totalrow+1;
    if cmtrow = 1000 then
        --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
        commit;
        cmtrow:=0;
    end if;
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tmmain_tmp into Tmmain .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
Exception
   when others then
         null;--prompt(sqlerrm||'[Re-Gen Error]');

end;

END TF_MIGRATETMP2TMMAIN;
/
  GRANT EXECUTE ON "PIBICSDM2"."TF_MIGRATETMP2TMMAIN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TF_MIGRATETMP2TMMAIN" TO "BIOSAADM";
