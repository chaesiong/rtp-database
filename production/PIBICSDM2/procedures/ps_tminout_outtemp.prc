CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_TMINOUT_OUTTEMP" IS
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
    select * from tmmain where to_char(outdte, 'yyyymmdd') between '20140205' and  '20140205' and outimg is not null and rownum <= 100 and nationcd <> 'T03';
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
    values ( investigate_seq.nextval, rec_tm.outtm6no , rec_tm.outdte , '2' , rec_tm.tfirstnm , rec_tm.tmiddlenm , rec_tm.tfamilynm , rec_tm.efirstnm , rec_tm.emiddlenm , rec_tm.efamilynm ,
     rec_tm.sex , rec_tm.birthdte , rec_tm.nationcd , rec_tm.outdeptcd , rec_tm.outtravcd , rec_tm.outconvcd , rec_tm.outconvregno , rec_tm.outtdtcd , rec_tm.outtdtno , rec_tm.outvisatypecd ,
     rec_tm.outvisaexpdte , rec_tm.outpassportdte , null, rec_tm.outpassportexpdte , rec_tm.outtargetno , rec_tm.outintype , rec_tm.outchkpointno , rec_tm.outcreusr , rec_tm.outcredte ,
     rec_tm.outcredterm , rec_tm.outupdusr , rec_tm.outupddte , rec_tm.outupdterm , null, rec_tm.personid , rec_tm.tfsndxnm , rec_tm.tlsndxnm , rec_tm.tmsndxnm , rec_tm.efsndxnm ,
     rec_tm.elsndxnm , rec_tm.emsndxnm , rec_tm.outremark , null , rec_tm.outimg, null , null , null , null , null , null , rec_tm.outstatus , null , null , null , null , null , null , 0, null , null ,
     null , rec_tm.outconv_seqno , rec_tm.outvisatype_seqno , rec_tm.outdept_seqno , rec_tm.count_seqno , rec_tm.outpermit_seqno , rec_tm.citizenid , rec_tm.pass_seqno ,
     rec_tm.outflightprefix , rec_tm.outflightnumber , rec_tm.typedata);
   commit;   
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
  exception
      when others then
          null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END PS_TMINOUT_OUTTEMP;
/
