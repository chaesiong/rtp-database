CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TRANSFER_TM_MIDNIGHT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TRANSFER_TM_MIDNIGHT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        05/02/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TRANSFER_TM_MIDNIGHT
      Sysdate:         05/02/2011
      Date and Time:   05/02/2011, 14:40:13, and 05/02/2011 14:40:13
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
avlrow number(8);
dptrow number(8);
otalrow number(8);
totalrow number(8);
total number(8);
batchlogno_seq number(20);

file_ut UTL_FILE.FILE_TYPE;
   cursor c1 is
    select * from tminout where to_number(to_char(credte, 'YYYYMMDD')) < to_number(to_char(sysdate, 'YYYYMMDD'));
    rec_tm c1%rowtype;  
begin

 batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'tm', '19', 'โอนข้อมูลเดินทางต่อวัน '||to_char(sysdate-1, '(DD/MM/YYYY)'), null, 0, 0, 0, sysdate, null, '1', 'TM0001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;

 avlrow:=0;dptrow:=0;totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD_hh24mi') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_tminout'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tminout into Tmmain .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
   if rec_tm.cardtype='1' then
    --dbms_output.put_line(sysdateTxt||' case tm6inout arrival :'||rec_tm.seqno);
   --utl_file.put_line(file_ut,'case tminout arrival :'||rec_tm.seqno);utl_file.fflush(file_ut);

   insert into tmmain (tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, 
   inseqno, indte, indeptcd, intravcd, inconvcd, inconvregno,  intdtno, intm6no, invisatypecd, inpassportexpdte, inchkpointno, increusr, incredte, 
   incredterm, inupdusr, inupddte, inupdterm, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, 
   inintype, intargetno, inremark, inrescertno, inimg, inpm_re_entry, inpm_reexpdte, inpm_extension, inpm_exexpdte, inpm_non_quota, inpm_nonexpdte,
   instatus, intm5_seqno, intm2inout_seqno, inrpjseqno, citizenid, pass_seqno, inflightprefix, inflightnumber, intdtcd, typedata, flagjoinpass, flagfines, pv_seqno, inpd_seqno, inzone_seqno,
   inpermitcd, inpermitdte, inpassportisu) 
   values (tmmain_seq.nextval, rec_tm.personid, rec_tm.tfirstnm, rec_tm.tmiddlenm, 
   rec_tm.tfamilynm, rec_tm.efirstnm,  rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.nationcd, rec_tm.seqno, rec_tm.inoutdte, 
   rec_tm.deptcd, rec_tm.travcd, rec_tm.convcd, rec_tm.convregno, rec_tm.tdtno, rec_tm.tm6no, rec_tm.visatypecd, rec_tm.passportexpdte, 
   rec_tm.chkpointno, rec_tm.creusr, rec_tm.credte, rec_tm.credterm, rec_tm.updusr, rec_tm.upddte, rec_tm.updterm, rec_tm.tfsndxnm, 
   rec_tm.tlsndxnm, rec_tm.tmsndxnm, rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm, rec_tm.birthdte, rec_tm.visaexpdte, 
   rec_tm.intype, substr(rec_tm.targetno,0,6), rec_tm.remark, rec_tm.rescertno, rec_tm.imginout, rec_tm.pm_re_entry, rec_tm.pm_reexpdte, rec_tm.pm_extension, 
   rec_tm.pm_exexpdte, rec_tm.pm_non_quota, rec_tm.pm_nonexpdte, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.rpjseqno, 
   rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.tdtcd, rec_tm.typedata, rec_tm.flagjoinpass, rec_tm.flagfines, rec_tm.pv_seqno, rec_tm.pd_seqno, rec_tm.zone_seqno,
   rec_tm.permitcd, rec_tm.newpermit, rec_tm.passportisu)  ;
   
   avlrow:=avlrow+1;
   else 
    --dbms_output.put_line(sysdateTxt||' case tm6inout departure :'||rec_tm.seqno);
   --utl_file.put_line(file_ut,'case tminout departure :'||rec_tm.seqno);utl_file.fflush(file_ut);
   
   insert into tmmain (tmrunno, personid, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, nationcd, outseqno, outdte, 
   outdeptcd, outtravcd, outconvcd, outconvregno, outtdtno, outtm6no, outvisatypecd, outpassportexpdte, outchkpointno, outcreusr, outcredte, outcredterm, 
   outupdusr, outupddte, outupdterm, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, birthdte, outvisaexpdte, outintype, outtargetno, outremark, 
   outrescertno, outimg, outpm_re_entry, outpm_reexpdte, outpm_extension, outpm_exexpdte, outpm_non_quota, outpm_nonexpdte,
   outstatus, outtm5_seqno, outtm2inout_seqno, outrpjseqno, citizenid, pass_seqno, outflightprefix, outflightnumber, outtdtcd, typedata, flagjoinpass, flagfines, pv_seqno, outpd_seqno, outzone_seqno,
   outpermitcd, outpermitdte, outpassportisu)  
   values (tmmain_seq.nextval, rec_tm.personid, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm, rec_tm.efirstnm, 
   rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.nationcd, rec_tm.seqno, rec_tm.inoutdte, rec_tm.deptcd, rec_tm.travcd, rec_tm.convcd, 
   rec_tm.convregno, rec_tm.tdtno, rec_tm.tm6no, rec_tm.visatypecd, rec_tm.passportexpdte, rec_tm.chkpointno, rec_tm.creusr, rec_tm.credte, rec_tm.credterm, 
   rec_tm.updusr, rec_tm.upddte, rec_tm.updterm, rec_tm.tfsndxnm, rec_tm.tlsndxnm, rec_tm.tmsndxnm,  rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm, 
   rec_tm.birthdte, rec_tm.visaexpdte, rec_tm.intype,  substr(rec_tm.targetno,0,6), rec_tm.remark, rec_tm.rescertno, rec_tm.imginout, rec_tm.pm_re_entry, rec_tm.pm_reexpdte, 
   rec_tm.pm_extension, rec_tm.pm_exexpdte, rec_tm.pm_non_quota, rec_tm.pm_nonexpdte, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno, rec_tm.rpjseqno, 
   rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.flightprefix, rec_tm.flightnumber, rec_tm.tdtcd, rec_tm.typedata, rec_tm.flagjoinpass, rec_tm.flagfines, rec_tm.pv_seqno, rec_tm.pd_seqno, rec_tm.zone_seqno,
   rec_tm.permitcd, rec_tm.newpermit, rec_tm.passportisu)  ;       
   dptrow:=dptrow+1;
   end if;
   totalrow:=totalrow+1;
  --DBMS_OUTPUT.put_line('total row:'||totalrow);
  delete from tminout where tminout.seqno =rec_tm.seqno ;

   IF totalrow>100 and MOD(totalrow,100)=0  THEN 
  -- utl_file.put_line(file_ut,'Commit Every  :'||totalrow||':row');utl_file.fflush(file_ut);
   commit;
   END IF;
   
 end loop; --cursor
   commit;
 close c1;
   -- delete tminout where to_number(to_char(credte, 'YYYYMMDD')) < to_number(to_char(sysdate, 'YYYYMMDD'));
   -- commit; 
   
   --Ekapong.c 4/21/2015 Edition--
   total:=totalrow;
   update batchlog b set b.status=0 , b.endprocess = sysdate,b.totalrow=total , b.prrow=total,b.TFSTATUS='Y' ,b.totalins=avlrow,b.totalupd=dptrow where b.batchlogno = batchlogno_seq;
   commit;
   -------------------------------
   
 utl_file.put_line(file_ut,'sum arrival :'||avlrow);utl_file.fflush(file_ut);
 utl_file.put_line(file_ut,'sum departure :'||dptrow);utl_file.fflush(file_ut);
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tminout into Tmmain .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
    when others then
        ROLLBACK;
        utl_file.put_line(file_ut,'Exception :'||rec_tm.seqno);utl_file.fflush(file_ut);
        utl_file.put_line(file_ut,'Failure code: ' || SQLCODE);utl_file.fflush(file_ut);
        utl_file.put_line(file_ut,'Failure at: ' || SQLERRM);utl_file.fflush(file_ut);
        utl_file.put_line(file_ut,'Exception timing:'||sysdateTxt);utl_file.fflush(file_ut); 
         null;
        utl_file.fclose(file_ut);
         --DBMS_OUTPUT.put_line('Failure code: ' || SQLCODE);
         --DBMS_OUTPUT.put_line('Failure at: ' || SQLERRM);
        --prompt(sqlerrm||'[Re-Gen Error]');
      
        
end;

END TRANSFER_TM_MIDNIGHT;
/
  GRANT EXECUTE ON "PIBICSDM2"."TRANSFER_TM_MIDNIGHT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TRANSFER_TM_MIDNIGHT" TO "BIOSAADM";
