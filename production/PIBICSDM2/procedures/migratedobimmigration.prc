CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEDOBIMMIGRATION" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateDOBTMMAIN
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        25/05/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateDOBTMMAIN
      Sysdate:         25/05/2012
      Date and Time:   25/05/2012, 10:59:01, and 25/05/2012 10:59:01
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
otalrow number(8);
totalrow number(8);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select * from immigration where birthdte like '00/00%';
    rec_tm c1%rowtype;   
begin
 totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateIMMIGRATIONDOB0000'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Magrate DOB immigration 0000 .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
   update immigration set birthdte = substr(rec_tm.birthdte, 7) where personid = rec_tm.personid; 
   --utl_file.put_line(file_ut,'tmrunno migrate DOB 0000 :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
   commit;   
   totalrow:=totalrow+1;
 end loop; --cursor
 close c1;
 utl_file.put_line(file_ut,'total record migrate DOB immigration 0000 :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Magrate DOB immigration 0000 .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
      --when others then
          --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migrateDOBIMMIGRATION;
/
