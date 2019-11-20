CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_VISARUNLOG_IMAGE" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATE_VISARUNLOG_IMAGE
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        09/01/2015          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATE_VISARUNLOG_IMAGE
      Sysdate:         09/01/2015
      Date and Time:   09/01/2015 11:19
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
checkImage varchar2(1);

file_ut UTL_FILE.FILE_TYPE;
cursor c1 is
select VISARUNLOGSEQNO,TM6NO, PASSPORTNO, NATIONCD, TO_CHAR(INOUTDTE,'YYYYMMDDHH24MISS') INOUTDTE from visarunlog where ACTION = 'T' and CHKCAPTURE is null;
rec_tm c1%rowtype;  

begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_visarunlogImage'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Visarunlog Image .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
    (
        select * from VW_TMONLINE a where TM6NO = rec_tm.TM6NO AND tdtno = rec_tm.PASSPORTNO and nationcd = rec_tm.NATIONCD and to_char(inoutdate, 'YYYYMMDDHH24MISS') = rec_tm.INOUTDTE  order by inoutdate desc
    )
    loop
        begin         
            select case when itm.imginout is null then 'N' else 'Y' end into checkImage from dual;
        exception when no_data_found then
            checkImage := 'N';
        end; 
                
        UPDATE visarunlog SET CHKCAPTURE = checkImage where VISARUNLOGSEQNO = rec_tm.VISARUNLOGSEQNO;
    end loop;
    
    totalrow:=totalrow+1;   
    commitrow:=commitrow+1;
    if commitrow = 100 then
    commitrow:=0;
    
    commit; 
   end if;   
 end loop; --cursor
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Visarunlog Image.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
   null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END MIGRATE_VISARUNLOG_IMAGE;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_VISARUNLOG_IMAGE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_VISARUNLOG_IMAGE" TO "BIOSAADM";
