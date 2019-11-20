CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_BEGINLOGTMINOUT" (v_days varchar2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_BEGINLOGTMINOUT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        05/08/2015   Sumet-C       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_BEGINLOGTMINOUT
      Sysdate:         05/08/2015
      Date and Time:   05/08/2015, 10:38:04, and 05/08/2015 10:38:04
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
   batchlogno_seq number(20);
   v_logtminout_seq number(20);
   
   CURSOR c1 IS 
    select * from tminoutlog where to_char(logdte, 'dd/mm/yyyy') = v_days;
    --select * from tminoutlog where to_number(to_char(logdte, 'yyyymmddhh24mi')) between 201509040000 and 201509040440;
   rec_tmlog c1%ROWTYPE;
   
   BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totalinsert := 0;
        
        select count('x') into totalinsert from tminoutlog where to_char(logdte, 'dd/mm/yyyy') = v_days;
        --select count('x') into totalinsert from tminoutlog where to_number(to_char(logdte, 'yyyymmddhh24mi')) between 201509040000 and 201509040440;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'LOGTM', '999', 'import data tminoutlog '|| v_days, null, totalinsert, 0, 0, sysdate, null, '1', 'SUMET.C', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
        OPEN c1;
        LOOP FETCH c1 INTO rec_tmlog; EXIT WHEN c1%NOTFOUND;
            v_logtminout_seq := null;
            v_logtminout_seq := logtminout_seq.nextval;            
            
            insert into logtminout (logtminoutid, loguserid, logflag, logdte, seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, deptcd, 
            travcd, convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, permitcd, newpermit, passportdte, passportisu, passportexpdte, targetno, intype, chkpointno, creusr, credte, credterm, 
            updusr, upddte, updterm, isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, imginout, extid, pm_re_entry, pm_reexpdte, pm_extension, 
            pm_exexpdte, pm_non_quota, pm_nonexpdte, tm5_seqno, tm2inout_seqno, status, rpjseqno, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, 
            flightprefix, flightnumber, typedata, flagjoinpass, flagfines, rescerttype, respvcd, resnoyear, delremark, pv_seqno, pd_seqno, zone_seqno, shift_seqno) 
            values (v_logtminout_seq, rec_tmlog.loguserid, rec_tmlog.logflag, rec_tmlog.logdte, rec_tmlog.seqno, rec_tmlog.tm6no, rec_tmlog.inoutdte, rec_tmlog.cardtype, rec_tmlog.tfirstnm, 
            rec_tmlog.tmiddlenm, rec_tmlog.tfamilynm, rec_tmlog.efirstnm, rec_tmlog.emiddlenm, rec_tmlog.efamilynm, rec_tmlog.sex, rec_tmlog.birthdte, rec_tmlog.nationcd, rec_tmlog.deptcd, 
            rec_tmlog.travcd, rec_tmlog.convcd, rec_tmlog.convregno, rec_tmlog.tdtcd, rec_tmlog.tdtno, rec_tmlog.visatypecd, rec_tmlog.visaexpdte, rec_tmlog.permitcd, rec_tmlog.newpermit, 
            rec_tmlog.passportdte, rec_tmlog.passportisu, rec_tmlog.passportexpdte, rec_tmlog.targetno, rec_tmlog.intype, rec_tmlog.chkpointno, rec_tmlog.creusr, rec_tmlog.credte, rec_tmlog.credterm, 
            rec_tmlog.updusr, rec_tmlog.upddte, rec_tmlog.updterm, rec_tmlog.isprocess, rec_tmlog.personid, rec_tmlog.tfsndxnm, rec_tmlog.tlsndxnm, rec_tmlog.tmsndxnm, rec_tmlog.efsndxnm, 
            rec_tmlog.elsndxnm, rec_tmlog.emsndxnm, rec_tmlog.remark, rec_tmlog.rescertno, rec_tmlog.imginout, rec_tmlog.extid, rec_tmlog.pm_re_entry, rec_tmlog.pm_reexpdte, rec_tmlog.pm_extension, 
            rec_tmlog.pm_exexpdte, rec_tmlog.pm_non_quota, rec_tmlog.pm_nonexpdte, rec_tmlog.tm5_seqno, rec_tmlog.tm2inout_seqno, rec_tmlog.status, rec_tmlog.rpjseqno, rec_tmlog.conv_seqno, 
            rec_tmlog.visatype_seqno, rec_tmlog.dept_seqno, rec_tmlog.count_seqno, rec_tmlog.permit_seqno, rec_tmlog.citizenid, rec_tmlog.pass_seqno, rec_tmlog.flightprefix, rec_tmlog.flightnumber, 
            rec_tmlog.typedata, rec_tmlog.flagjoinpass, rec_tmlog.flagfines, rec_tmlog.rescerttype, rec_tmlog.respvcd, rec_tmlog.resnoyear, rec_tmlog.delremark, rec_tmlog.pv_seqno, rec_tmlog.pd_seqno, 
            rec_tmlog.zone_seqno, rec_tmlog.shift_seqno);
            commit;
            
            
            totalrownum := totalrownum + 1;
            commitrow := commitrow + 1;
            
            
            IF commitrow = 1000 THEN
                update batchlog set prrow = prrow + commitrow where batchlogno = batchlogno_seq;
                commit;
                commitrow := 0;
            END IF;
        END LOOP;
        CLOSE c1;
        
        update batchlog set prrow = totalrownum, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
   END;
END PS_BEGINLOGTMINOUT;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_BEGINLOGTMINOUT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_BEGINLOGTMINOUT" TO "BIOSAADM";
