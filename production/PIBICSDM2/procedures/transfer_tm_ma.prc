CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TRANSFER_TM_MA" IS
tmpVar NUMBER;
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
    select * from tmmain where tmrunno = '400832030';
    --select * from tmmain where  (to_char(incredte, 'yyyymmdd') = '20180910' or to_char(outcredte, 'yyyymmdd') = '20180910') and intdtno = 'ED2267194';
    rec_tm c1%rowtype;  
begin

 batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'tm', '19', 'โอนข้อมูลเดินทางต่อวัน MA '||to_char(sysdate, '(DD/MM/YYYY)'), null, 0, 0, 0, sysdate, null, '1', 'TM0001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;

 avlrow:=0;dptrow:=0;totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD_hh24mi') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 --file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_tminout_ma'||sysdateFile||'.txt','W');
 --utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tmmain into Tminout_ma .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
    if rec_tm.indte is not null and rec_tm.outdte is null then

    insert into tminout_ma (
       seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
       nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportisu, passportexpdte, 
       targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte, updterm, personid, tfsndxnm, 
       tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, imginout, pm_re_entry, 
       pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno, rpjseqno, permitcd, 
       newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, 
       flightnumber, typedata, deptcdorg, flagjoinpass, flagfines, pv_seqno, pd_seqno, zone_seqno, shift_seqno, flagmatch) 
    values ( rec_tm.inseqno, rec_tm.intm6no, rec_tm.indte, '1',  rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm,
     rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.indeptcd,
     rec_tm.intravcd, rec_tm.inconvcd, rec_tm.inconvregno, rec_tm.intdtcd, rec_tm.intdtno, rec_tm.invisatypecd, rec_tm.invisaexpdte,
     rec_tm.inpassportdte, rec_tm.inpassportisu, rec_tm.inpassportexpdte, rec_tm.intargetno, rec_tm.inintype, rec_tm.inchkpointno,
     rec_tm.increusr, rec_tm.incredte, rec_tm.incredterm, rec_tm.inupdusr, rec_tm.inupddte, rec_tm.inupdterm, 
     rec_tm.personid, rec_tm.tfsndxnm, rec_tm.tlsndxnm, rec_tm.tmsndxnm, rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm,
     rec_tm.inremark, rec_tm.inrescertno, rec_tm.inimg, rec_tm.inpm_re_entry, rec_tm.inpm_reexpdte, rec_tm.inpm_extension,
     rec_tm.inpm_exexpdte, rec_tm.inpm_non_quota, rec_tm.inpm_nonexpdte, rec_tm.instatus, rec_tm.intm5_seqno, rec_tm.intm2inout_seqno,
     rec_tm.inrpjseqno, rec_tm.inpermitcd, rec_tm.inpermitdte, rec_tm.inconv_seqno, rec_tm.invisatype_seqno, rec_tm.indept_seqno,
     rec_tm.count_seqno, rec_tm.inpermit_seqno, rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.inflightprefix, rec_tm.inflightnumber,
     rec_tm.typedata, rec_tm.indeptcdorg, rec_tm.flagjoinpass, rec_tm.flagfines, rec_tm.pv_seqno, rec_tm.inpd_seqno, rec_tm.inzone_seqno,
     rec_tm.inshift_seqno, rec_tm.flagmatch);

     avlrow:=avlrow+1;
   elsif rec_tm.indte is null and rec_tm.outdte is not null then
   
    insert into tminout_ma (
       seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
       nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportisu, passportexpdte, 
       targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte, updterm, personid, tfsndxnm, 
       tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, imginout, pm_re_entry, 
       pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno, rpjseqno, permitcd, 
       newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, 
       flightnumber, typedata, deptcdorg, flagjoinpass, flagfines, pv_seqno, pd_seqno, zone_seqno, shift_seqno, flagmatch) 
    values ( rec_tm.outseqno, rec_tm.outtm6no, rec_tm.outdte, '2',  rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm,
     rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.outdeptcd,
     rec_tm.outtravcd, rec_tm.outconvcd, rec_tm.outconvregno, rec_tm.outtdtcd, rec_tm.outtdtno, rec_tm.outvisatypecd, rec_tm.outvisaexpdte,
     rec_tm.outpassportdte, rec_tm.outpassportisu, rec_tm.outpassportexpdte, rec_tm.outtargetno, rec_tm.outintype, rec_tm.outchkpointno,
     rec_tm.outcreusr, rec_tm.outcredte, rec_tm.outcredterm, rec_tm.outupdusr, rec_tm.outupddte, rec_tm.outupdterm, 
     rec_tm.personid, rec_tm.tfsndxnm, rec_tm.tlsndxnm, rec_tm.tmsndxnm, rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm,
     rec_tm.outremark, rec_tm.outrescertno, rec_tm.outimg, rec_tm.outpm_re_entry, rec_tm.outpm_reexpdte, rec_tm.outpm_extension,
     rec_tm.outpm_exexpdte, rec_tm.outpm_non_quota, rec_tm.outpm_nonexpdte, rec_tm.outstatus, rec_tm.outtm5_seqno, rec_tm.outtm2inout_seqno,
     rec_tm.outrpjseqno, rec_tm.outpermitcd, rec_tm.outpermitdte, rec_tm.outconv_seqno, rec_tm.outvisatype_seqno, rec_tm.outdept_seqno,
     rec_tm.count_seqno, rec_tm.outpermit_seqno, rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.outflightprefix, rec_tm.outflightnumber,
     rec_tm.typedata, rec_tm.outdeptcdorg, rec_tm.flagjoinpass, rec_tm.flagfines, rec_tm.pv_seqno, rec_tm.outpd_seqno, rec_tm.outzone_seqno,
     rec_tm.outshift_seqno, rec_tm.flagmatch);   
     
        dptrow:=dptrow+1;
   end if;   
   totalrow:=totalrow+1;
  --DBMS_OUTPUT.put_line('total row:'||totalrow);
  delete from tmmain where tmrunno =rec_tm.tmrunno ;

   IF totalrow>100 and MOD(totalrow,100)=0  THEN 
  -- utl_file.put_line(file_ut,'Commit Every  :'||totalrow||':row');utl_file.fflush(file_ut);
   commit;
   END IF;
   
 end loop; --cursor
   commit;
 close c1;
   
   total:=totalrow;
   update batchlog b set b.status=0 , b.endprocess = sysdate,b.totalrow=total , b.prrow=total,b.TFSTATUS='Y' ,b.totalins=avlrow,b.totalupd=dptrow where b.batchlogno = batchlogno_seq;
   commit;
   -------------------------------
   
 --utl_file.put_line(file_ut,'sum arrival :'||avlrow);utl_file.fflush(file_ut);
 --utl_file.put_line(file_ut,'sum departure :'||dptrow);utl_file.fflush(file_ut);
 --utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
-- utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tminout into Tmmain .... !!!');utl_file.fflush(file_ut);
 --utl_file.fclose(file_ut);
 Exception
    when others then
        ROLLBACK;
        --utl_file.put_line(file_ut,'Exception :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
        --utl_file.put_line(file_ut,'Failure code: ' || SQLCODE);utl_file.fflush(file_ut);
       -- utl_file.put_line(file_ut,'Failure at: ' || SQLERRM);utl_file.fflush(file_ut);
       --utl_file.put_line(file_ut,'Exception timing:'||sysdateTxt);utl_file.fflush(file_ut); 
         null;
       -- utl_file.fclose(file_ut);
         --DBMS_OUTPUT.put_line('Failure at: ' || SQLERRM);
        --prompt(sqlerrm||'[Re-Gen Error]');
      
        
end;

END TRANSFER_TM_MA;
/
  GRANT EXECUTE ON "PIBICSDM2"."TRANSFER_TM_MA" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TRANSFER_TM_MA" TO "BIOSAADM";
