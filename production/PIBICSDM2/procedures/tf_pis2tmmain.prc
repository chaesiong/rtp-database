CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."TF_PIS2TMMAIN" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TF_PIS2TMMAIN
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
sysdateFile varchar2(8);
cmtrow number(20);
totalrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from tmmain_pis where flagprocess is null;
    --select * from tmmain_pis where tmrunno in ('PIS52431094','PIS52431095');
    rec_tm c1%rowtype;  
begin
    cmtrow:=0;totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
    --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_pis2tmmain'||sysdateFile||'.txt','W');
    utl_file.put_line(file_ut,sysdateTxt||' Start Transfer Pis into Tmmain .... !!!');utl_file.fflush(file_ut); 
    open c1;
        loop fetch c1 into rec_tm; exit when c1%notfound;
        
        insert into tmmain (tmrunno, personid, efirstnm, emiddlenm, efamilynm, sex, nationcd, inseqno, indte, indeptcd, intravcd, inconvcd,
        inconvregno, intdtcd, intdtno, intm6no, invisatypecd, increusr, incredte, incredterm, outdte, outdeptcd, outtravcd,
        outconvcd, outconvregno, outtdtcd, outtdtno, outtm6no, outvisatypecd, outcreusr, outcredte, outcredterm,
        efsndxnm, elsndxnm, emsndxnm, birthdte, invisaexpdte, outvisaexpdte, inintype, outintype, intargetno, outtargetno,
        invisatypecdorg, outvisatypecdorg, indeptcdorg, outdeptcdorg, typedata) values 
        (rec_tm.tmrunno, rec_tm.personid, rec_tm.efirstnm, rec_tm.emiddlenm, rec_tm.efamilynm, rec_tm.sex, rec_tm.nationcd, rec_tm.inseqno, 
        rec_tm.indte, rec_tm.indeptcd, rec_tm.intravcd, rec_tm.inconvcd, rec_tm.inconvregno, rec_tm.intdtcd, rec_tm.intdtno, rec_tm.intm6no, 
        rec_tm.invisatypecd, rec_tm.increusr, rec_tm.incredte, rec_tm.incredterm, rec_tm.outdte, rec_tm.outdeptcd, rec_tm.outtravcd,
        rec_tm.outconvcd, rec_tm.outconvregno, rec_tm.outtdtcd, rec_tm.outtdtno, rec_tm.outtm6no, rec_tm.outvisatypecd, rec_tm.outcreusr, 
        rec_tm.outcredte, rec_tm.outcredterm, rec_tm.efsndxnm, rec_tm.elsndxnm, rec_tm.emsndxnm, rec_tm.birthdte, rec_tm.invisaexpdte, 
        rec_tm.outvisaexpdte, rec_tm.inintype, rec_tm.outintype, rec_tm.intargetno, rec_tm.outtargetno, rec_tm.invisatypecdorg, rec_tm.outvisatypecdorg, 
        rec_tm.indeptcdorg, rec_tm.outdeptcdorg, 'PISCES');
        
       update tmmain_pis set flagprocess='Y', flagprocesdte = sysdate where tmrunno =  rec_tm.tmrunno;
    
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
    utl_file.put_line(file_ut,sysdateTxt||' End Transfer Pis into Tmmain .... !!!');utl_file.fflush(file_ut);
    utl_file.fclose(file_ut);
Exception
  when others then
        null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END TF_PIS2TMMAIN;
/
  GRANT EXECUTE ON "PIBICSDM2"."TF_PIS2TMMAIN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."TF_PIS2TMMAIN" TO "BIOSAADM";
