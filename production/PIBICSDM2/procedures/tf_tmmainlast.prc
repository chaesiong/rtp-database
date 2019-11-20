CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TF_TMMAINLAST" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TF_TMMAINLAST
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        31/10/2011   Training       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TF_TMMAINLAST
      Sysdate:         31/10/2011
      Date and Time:   31/10/2011, 17:37:25, and 31/10/2011 17:37:25
      Username:        Training (set in TOAD Options, Procedure Editor)
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
    select a.tmrunno, a.personid, a.efamilynm, a.efirstnm, a.emiddlenm, a.sex, a.birthdte, a.nationcd, a.tm6no, a.cardtype, a.tdtcd, a.tdtno,
    a.passportdte, a.passportexpdte, a.visatypecd, a.visaexpdte, a.imginout, a.deptcd, a.convregno, a.convcd, a.inoutdate
    from vw_tmmain a, immigration b
    where (to_char(a.inoutdate, 'YYYYMM') between '201101' and '201111') and a.creusr='PIS001' --and a.personid='S1901200915422060640'
    and nvl(a.efamilynm, ' ') = nvl(b.efamilynm, ' ') and nvl(a.efirstnm, ' ') = nvl(b.efirstnm, ' ') and nvl(a.emiddlenm, ' ')= nvl(b.emiddlenm, ' ') 
    and a.nationcd =b.nationcd and a.sex = b.sex and a.birthdte = b.birthdte 
    and a.inoutdate >  b.inoutdte;
    rec_tm c1%rowtype;
begin
    cmtrow:=0;totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_tmmainlast'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Tmmainlast .... !!!');utl_file.fflush(file_ut);
    open c1;
        loop fetch c1 into rec_tm; exit when c1%notfound;
        
        insert into tmmainlast (tmseqno, tmrunno, immpersonid, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationcd, 
        inoutdte, tm6no, cardtype, tdtcd, tdtno, passportdte, passportexpdte, visatypecd, visaexpdte, deptcd, convregno, convcd, imginout, flagprocess) 
        values (tmlastseqno.nextval, rec_tm.tmrunno, rec_tm.personid, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.sex, rec_tm.birthdte, rec_tm.nationcd, 
        rec_tm.inoutdate, rec_tm.tm6no, rec_tm.cardtype, rec_tm.tdtcd, rec_tm.tdtno, rec_tm.passportdte, rec_tm.passportexpdte, 
        rec_tm.visatypecd, rec_tm.visaexpdte, rec_tm.deptcd, rec_tm.convregno, rec_tm.convcd, rec_tm.imginout, null);
                
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
    utl_file.put_line(file_ut,sysdateTxt||' End Transfer Tmmainlast .... !!!');utl_file.fflush(file_ut);
    utl_file.fclose(file_ut);
Exception
  when others then
        null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END TF_TMMAINLAST;
/
  GRANT EXECUTE ON "PIBICSDM2"."TF_TMMAINLAST" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TF_TMMAINLAST" TO "BIOSAADM";
