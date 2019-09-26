CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TRANSFER_TMINOUT_TOMA" IS
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
    --select * from tmmain where  (to_char(incredte, 'yyyymmdd') = '20180918' or to_char(outcredte, 'yyyymmdd') = '20180918');
    select * from tminout where creusr in ('Admin', 'pibicsone');
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
 
    insert into tminout_ma (
       seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
       nationcd, deptcd, travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportisu, passportexpdte, 
       targetno, intype, chkpointno, creusr, credte, credterm, updusr, upddte, updterm, personid, tfsndxnm, 
       tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, imginout, pm_re_entry, 
       pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno, rpjseqno, permitcd, 
       newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, 
       flightnumber, typedata, deptcdorg, flagjoinpass, flagfines, pv_seqno, pd_seqno, zone_seqno, shift_seqno) 
    values ( rec_tm.seqno, rec_tm.tm6no, rec_tm.inoutdte, rec_tm.cardtype, rec_tm.tfirstnm, rec_tm.tmiddlenm, rec_tm.tfamilynm,
     rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, rec_tm.deptcd,
     rec_tm.travcd, rec_tm.convcd, rec_tm.convregno, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.visatypecd, rec_tm.visaexpdte,
     rec_tm.passportdte, rec_tm.passportisu, rec_tm.passportexpdte, rec_tm.targetno, rec_tm.intype, rec_tm.chkpointno,
     rec_tm.creusr, rec_tm.credte, rec_tm.credterm, rec_tm.updusr, rec_tm.upddte, rec_tm.updterm, 
     rec_tm.personid, rec_tm.tfsndxnm, rec_tm.tlsndxnm, rec_tm.tmsndxnm, rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm,
     rec_tm.remark, rec_tm.rescertno, rec_tm.imginout, rec_tm.pm_re_entry, rec_tm.pm_reexpdte, rec_tm.pm_extension,
     rec_tm.pm_exexpdte, rec_tm.pm_non_quota, rec_tm.pm_nonexpdte, rec_tm.status, rec_tm.tm5_seqno, rec_tm.tm2inout_seqno,
     rec_tm.rpjseqno, rec_tm.permitcd, rec_tm.newpermit, rec_tm.conv_seqno, rec_tm.visatype_seqno, rec_tm.dept_seqno,
     rec_tm.count_seqno, rec_tm.permit_seqno, rec_tm.citizenid, rec_tm.pass_seqno, rec_tm.flightprefix, rec_tm.flightnumber,
     rec_tm.typedata, rec_tm.deptcdorg, rec_tm.flagjoinpass, rec_tm.flagfines, rec_tm.pv_seqno, rec_tm.pd_seqno, rec_tm.zone_seqno,
     rec_tm.shift_seqno);

     avlrow:=avlrow+1;

     totalrow:=totalrow+1;
    --DBMS_OUTPUT.put_line('total row:'||totalrow);
    delete from tminout where seqno =rec_tm.seqno ;

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

END TRANSFER_TMINOUT_TOMA;
/
