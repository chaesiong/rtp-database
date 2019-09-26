CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEOUTDEPTCD00" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATEOUTDEPTCD00
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        26/02/2014   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATEOUTDEPTCD00
      Sysdate:         26/02/2014
      Date and Time:   26/02/2014, 17:54:54, and 26/02/2014 17:54:54
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
 declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
cmtrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select outtdtno, nationcd, count('X') cnt, min(tmrunno) mintmrunno  from tmmain where outdeptcd = '00' and (outdte is not null and indte is null) group by outtdtno, nationcd order by outtdtno;
    --select outtdtno, nationcd, count('X') cnt, min(tmrunno) mintmrunno  from tmmain where outdeptcd = '00' and (outdte is not null and indte is null) and outtdtno = '301601503' group by outtdtno, nationcd order by outtdtno;    
    rec_tm c1%rowtype;
begin
 cmtrow:=0;totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_DEPT00'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Transfer migrate DEPT00 .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound; 
            <<itemInter1_loop>> FOR itemInter1 IN
            (
               select * from tmmain where outtdtno = rec_tm.outtdtno and nationcd = rec_tm.nationcd and outdeptcd = '00' and (outdte is not null and indte is null)
            )
            LOOP
                if itemInter1.tmrunno = rec_tm.mintmrunno then
                    update tmmain set outdeptcd = get_deptcd(get_deptseqnobyip(outcredterm)) where tmrunno = itemInter1.tmrunno;
                else
                    delete tmmain where tmrunno = itemInter1.tmrunno;
                end if;
            END LOOP;--Loop For itemInter1      
        commit;
        totalrow:=totalrow+1;
        cmtrow:=cmtrow+1;
        --if cmtrow = 1 then
            --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
          --  commit;
       cmtrow:=0;
        --end if;   
 end loop; --cursor
 close c1;
 COMMIT;
 utl_file.put_line(file_ut,'total record Transfer migrate DEPT00 :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer migrate DEPT00 .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  --Exception
    --  when others then
      --    null;--prompt(sqlerrm||'[Re-Gen Error]');
end;
END MIGRATEOUTDEPTCD00;
/
