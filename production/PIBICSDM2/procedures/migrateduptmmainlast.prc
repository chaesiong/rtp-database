CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATEDUPTMMAINLAST" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       migrateDupImmigration
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        30/09/2008          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     migrateDupImmigration
      Sysdate:         30/09/2008
      Date and Time:   30/09/2008, 17:48:48, and 30/09/2008 17:48:48
      Username:         (set in TOAD Options, Procedure Editor)
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
    select efamilynm, efirstnm , emiddlenm, sex, nationcd, birthdte, to_number(to_char(minoutdte,'YYYYMMDDHH24MISS')) inoutdatepk, minoutdte from (
        select efamilynm, efirstnm , emiddlenm, sex, nationcd, birthdte, count(efamilynm), max(inoutdte) minoutdte from tmmainlast
        group by efamilynm, efirstnm , emiddlenm, sex, nationcd, birthdte
        having count(efamilynm) > 1
    );
    --) where rownum <=10;
    rec_tm c1%rowtype;
begin
 cmtrow:=0;totalrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --dbms_output.put_line(sysdateTxt||' Start Transfer Tm6inout into Tmmain_tmp .... !!!');
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_migrateDupTmmainLast'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Transfer migrate Duplicate TmmainLast .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
        if (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is not null) then
            <<itemInter1_loop>> FOR itemInter1 IN
            (
                select b.* from tmmainlast b
                where b.efamilynm = rec_tm.efamilynm and b.efirstnm = rec_tm.efirstnm and b.emiddlenm= rec_tm.emiddlenm and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and to_number(to_char(b.inoutdte,'YYYYMMDDHH24MISS')) = rec_tm.inoutdatepk
                and rownum = 1
            )
            LOOP
                delete tmmainlast b
                where b.efamilynm = rec_tm.efamilynm and b.efirstnm = rec_tm.efirstnm and b.emiddlenm= rec_tm.emiddlenm and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and  b.tmrunno <> itemInter1.tmrunno;
            END LOOP;--Loop For itemInter1
        elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
            <<itemInter1_loop>> FOR itemInter1 IN
            (
                select b.* from tmmainlast b
                where b.efamilynm = rec_tm.efamilynm and b.efirstnm = rec_tm.efirstnm and b.emiddlenm is null and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and to_number(to_char(b.inoutdte,'YYYYMMDDHH24MISS')) = rec_tm.inoutdatepk
                and rownum = 1
            )
            LOOP
                delete tmmainlast b
                where b.efamilynm = rec_tm.efamilynm and b.efirstnm = rec_tm.efirstnm and b.emiddlenm is null and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and b.tmrunno  <> itemInter1.tmrunno;
            END LOOP;--Loop For itemInter1
        elsif (rec_tm.efamilynm is not null) and (rec_tm.efirstnm is null) and (rec_tm.emiddlenm is null) then
            <<itemInter1_loop>> FOR itemInter1 IN
            (
                select b.* from tmmainlast b
                where b.efamilynm = rec_tm.efamilynm and b.efirstnm is null and b.emiddlenm is null and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and to_number(to_char(b.inoutdte,'YYYYMMDDHH24MISS')) = rec_tm.inoutdatepk
                and rownum = 1
            )
            LOOP
                delete tmmainlast b
                where b.efamilynm = rec_tm.efamilynm and b.efirstnm is null and b.emiddlenm is null and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and b.tmrunno  <> itemInter1.tmrunno;
            END LOOP;--Loop For itemInter1
        elsif (rec_tm.efamilynm is null) and (rec_tm.efirstnm is not null) and (rec_tm.emiddlenm is null) then
            <<itemInter1_loop>> FOR itemInter1 IN
            (
            select b.* from tmmainlast b
            where b.efamilynm is null and b.efirstnm = rec_tm.efirstnm and b.emiddlenm is null and
            b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and to_number(to_char(b.inoutdte,'YYYYMMDDHH24MISS')) = rec_tm.inoutdatepk
            and rownum = 1
            )
            LOOP
                delete tmmainlast b
                where b.efamilynm is null and b.efirstnm = rec_tm.efirstnm and b.emiddlenm is null and
                b.nationcd =rec_tm.nationcd and b.sex = rec_tm.sex and b.birthdte = rec_tm.birthdte and b.tmrunno  <> itemInter1.tmrunno;
            END LOOP;--Loop For itemInter1
        end if;
        totalrow:=totalrow+1;
        cmtrow:=cmtrow+1;
        if cmtrow = 1000 then
            --utl_file.put_line(file_ut,sysdateTxt||' Commit:'||cmtrow);utl_file.fflush(file_ut);
            commit;
            cmtrow:=0;
        end if;
 end loop; --cursor
 close c1;
 COMMIT;
 utl_file.put_line(file_ut,'total record Transfer migrate Duplicate Tmmainlast :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End Transfer migrate Duplicate Tmmainlast .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
  Exception
      when others then
          null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END migrateDupTmmainLast; 
/
