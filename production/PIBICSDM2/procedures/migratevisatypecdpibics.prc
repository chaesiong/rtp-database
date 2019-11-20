CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEVISATYPECDPIBICS" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateDeptcdPibics
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        20/02/2011   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateDeptcdPibics
      Sysdate:         20/02/2011
      Date and Time:   20/02/2011, 15:10:00, and 20/02/2011 15:10:00
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
  
    select tmrunno, intdtno, invisatypecd org_visatype, indte, invisaexpdte, migrateVisatypeCd(invisatypecd) new_visatype, personid,
    decode(nationcd, 'T03', null, to_char(indte + (select PERMITTDAYS from visatype where visatypecd = migrateVisatypeCd(invisatypecd)) -1, 'YYYYMMDDHH24MISS')) as permitdays
    from tmmain a, visatype b where a.invisatypecd = b.visatypecd(+) and to_char(indte, 'yyyymmdd') between '20130426' and '20130502' and inseqno is not null and increusr = 'PIS001';
    
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateVisatypecdPibics'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start migrate visatypecd pibics@Tmmain .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
    update tmmain set 
    invisatypecd = rec_tm.new_visatype, invisatypecdorg = rec_tm.org_visatype, invisaexpdte = to_date(rec_tm.permitdays, 'YYYYMMDDHH24MISS') where tmrunno = rec_tm.tmrunno;   
   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
   if commitrow = 100 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut); 
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End migrate visatypecd pibics@Tmmain .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migrateVisatypecdPibics;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEVISATYPECDPIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATEVISATYPECDPIBICS" TO "BIOSAADM";
