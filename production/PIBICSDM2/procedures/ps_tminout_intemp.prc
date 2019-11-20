CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_TMINOUT_INTEMP" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_TMINOUT_INTEMP
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        28/02/2014   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_TMINOUT_INTEMP
      Sysdate:         28/02/2014
      Date and Time:   28/02/2014, 13:25:03, and 28/02/2014 13:25:03
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/

begin
declare
sysdatetxt varchar2(25);
sysdatefile varchar2(8);
otalrow number(8);
totalrow number(8);
file_ut utl_file.file_type;
    cursor c1 is
    select * from tmmain where to_char(indte, 'yyyymmdd') between '20140205' and  '20140205' and inimg is not null and rownum <= 50;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
   insert into tminout_temp (seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, deptcd, travcd, 
    convcd, convregno, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportisu, passportexpdte, targetno, intype, chkpointno, creusr, credte, credterm, 
    updusr, upddte, updterm, isprocess, personid, tfsndxnm, tlsndxnm, tmsndxnm, efsndxnm, elsndxnm, emsndxnm, remark, rescertno, imginout, pm_re_entry, 
    pm_reexpdte, pm_extension, pm_exexpdte, pm_non_quota, pm_nonexpdte, status, tm5_seqno, tm2inout_seqno, create_by, create_date, update_by, update_date, 
    version, rpjseqno, permitcd, newpermit, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, citizenid, pass_seqno, flightprefix, flightnumber, typedata) 
    values ( investigate_seq.nextval, rec_tm.intm6no , rec_tm.indte , '1' , rec_tm.tfirstnm , rec_tm.tmiddlenm , rec_tm.tfamilynm , rec_tm.efirstnm , rec_tm.emiddlenm , rec_tm.efamilynm ,
     rec_tm.sex , rec_tm.birthdte , rec_tm.nationcd , rec_tm.indeptcd , rec_tm.intravcd , rec_tm.inconvcd , rec_tm.inconvregno , rec_tm.intdtcd , rec_tm.intdtno , rec_tm.invisatypecd ,
     rec_tm.invisaexpdte , rec_tm.inpassportdte , null, rec_tm.inpassportexpdte , rec_tm.intargetno , rec_tm.inintype , rec_tm.inchkpointno , rec_tm.increusr , rec_tm.incredte ,
     rec_tm.incredterm , rec_tm.inupdusr , rec_tm.inupddte , rec_tm.inupdterm , null, rec_tm.personid , rec_tm.tfsndxnm , rec_tm.tlsndxnm , rec_tm.tmsndxnm , rec_tm.efsndxnm ,
     rec_tm.elsndxnm , rec_tm.emsndxnm , rec_tm.inremark , null , rec_tm.inimg, null , null , null , null , null , null , rec_tm.instatus , null , null , null , null , null , null , 0, null , null ,
     null , rec_tm.inconv_seqno , rec_tm.invisatype_seqno , rec_tm.indept_seqno , rec_tm.count_seqno , rec_tm.inpermit_seqno , rec_tm.citizenid , rec_tm.pass_seqno ,
     rec_tm.inflightprefix , rec_tm.inflightnumber , rec_tm.typedata  );
   commit;   
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
  exception
      when others then
          null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END PS_TMINOUT_INTEMP;
/
  GRANT EXECUTE ON "PIBICSDM2"."PS_TMINOUT_INTEMP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PS_TMINOUT_INTEMP" TO "BIOSAADM";
