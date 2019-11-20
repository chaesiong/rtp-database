CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDFN38PERDAYS" (v_nowdate IN VARCHAR2, v_mm IN VARCHAR2, v_filed varchar2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       INSDEPTSTATISTICPIBICS
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        20/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     INSDEPTSTATISTICPIBICS
      Sysdate:         20/09/2012
      Date and Time:   20/09/2012, 12:09:04, and 20/09/2012 12:09:04
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
SQLCOMMAND VARCHAR2(1000);
AMOUNT number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is    

        select * from (select 'OOO'|| v_nowdate from dual)  a,(
        select  (select  count('x') from tmmain where nationcd<>'T03' and to_char(indte,'yyyymmdd')=v_nowdate) - (with tmmainin as (
                    select * from tmmain where 1=1
        and to_char(indte, 'yyyymmdd') = v_nowdate
                    and nationcd <> 'T03'
                    ), tmmainout as (
                    select * from tmmain where 1=1
        and to_char(outdte, 'yyyymmdd') = v_nowdate
                    and nationcd <> 'T03')
                    select count('X') TOTAL
                    from tmmainin a, tmmainout b where (a.intdtno = b.outtdtno and a.intm6no = b.outtm6no)
                    and (to_char(a.indte, 'yyyymmdd') = to_char(b.outdte, 'yyyymmdd') and to_char(a.indte, 'yyyymmddhh24mi') < to_char(b.outdte, 'yyyymmddhh24mi'))
                    and a.intm6no <> '0000000' and b.outtm6no <> '000000'
        ) sumInout from dual)  b,
(select  
sum(case when TO_CHAR("CHECKINDTE",'yyyymmdd') = v_nowdate then 1 else 0 end) checkinNow,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-01' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien1,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-02' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien2,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-03' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien3,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-04' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien4,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-05' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien5,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-06' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien6,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-07' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien7,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-08' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien8,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-09' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien9,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-10' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien10,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-11' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien11,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-12' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien12,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-13' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien13,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-14' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien14,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-15' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien15,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-16' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien16,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-17' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien17,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-18' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien18,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-19' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien19,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-20' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien20,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-21' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien21,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-22' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien22,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-23' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien23,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-24' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien24,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-25' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien25,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-26' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien26,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-27' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien27,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-28' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end) alien28,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-29' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end)  alien29,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-30' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end)  alien30,
sum(case when  TO_CHAR("CHECKINDTE",'yyyy-mm-dd') ='2015-' || v_mm || '-31' and TO_CHAR("CREATE_DATE",'yyyymmdd') =v_nowdate 
and (decode( to_number(to_char(checkindte,'yyyymmdd')) - to_number(to_char(cast(INDTE as date),'yyyymmdd')),1,1,0,1,0) = 1) then 1 else 0 end)  alien31
from FN_ALIENLIST);

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 --file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_insertImmcard1'||sysdateFile||'.txt','W');
 --utl_file.put_line(file_ut,sysdateTxt||' Start update immcardtype1 .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        SQLCOMMAND:= NULL;        
        
       SQLCOMMAND:=' UPDATE FN38PERDAY SET  CARDIN =  ' || recs.sumInout ||' , CHKINNOW =  '|| recs.checkinNow ||
        ' , A1 = ' || recs.alien1 ||' , A2 = ' || recs.alien2 ||' , A3 = ' || recs.alien3 || ' , A4 = ' || recs.alien4 || ' , A5 = ' || recs.alien5 ||
        ' , A6 = ' || recs.alien6 ||' , A7 = ' || recs.alien7 ||' , A8 = ' || recs.alien8 || ' , A9 = ' || recs.alien9 || ' , A10 = ' || recs.alien10 ||
        ' , A11 = ' || recs.alien11 || ' , A12 = ' || recs.alien12 || ' , A13 = ' || recs.alien13 || ' , A14 = ' || recs.alien14 || ' , A15 = ' || recs.alien15 ||
        ' , A16 = ' || recs.alien16 || ' , A17 = ' || recs.alien17 || ' , A18 = ' || recs.alien18 || ' , A19 = ' || recs.alien19 || ' , A20 = ' || recs.alien20 ||
        ' , A21 = ' || recs.alien21 || ' , A22 = ' || recs.alien22 || ' , A23 = ' || recs.alien23 || ' , A24 = ' || recs.alien24 || ' , A25 = ' || recs.alien25 ||
        ' , A26 = ' || recs.alien26 || ' , A27 = ' || recs.alien27 || ' , A28 = ' || recs.alien28 || ' , A29 = ' || recs.alien29 || ' , A30 = ' || recs.alien30 || 
        ' , A31 = ' || recs.alien31 || ' WHERE DAYS = ' || v_filed;
        
         /*SQLCOMMAND:=' UPDATE FN38PERDAY SET  CARDIN =  ' || recs.sumInout ||' , CHKINNOW =  '|| recs.checkinNow ||
        ' , A1 = ' || recs.alien1 ||' , A2 = ' || recs.alien2 ||' , A3 = ' || recs.alien3 || ' , A4 = ' || recs.alien4 || ' , A5 = ' || recs.alien5 || 
        ' , A6 = ' || recs.alien6 ||' , A7 = ' || recs.alien7 ||' , A8 = ' || recs.alien8 || ' , A9 = ' || recs.alien9 || ' , A10 = ' || recs.alien10 || ' , A11 = ' || recs.alien11 || 
        ' , A12 = ' || recs.alien12 || ' , A13 = ' || recs.alien13 || ' , A14 = ' || recs.alien14 || ' , A15 = ' || recs.alien15 ||
        ' , A16 = ' || recs.alien16 || ' , A17 = ' || recs.alien17 || ' , A18 = ' || recs.alien18 || ' , A19 = ' || recs.alien19 || ' , A20 = ' || recs.alien20 ||
        ' , A21 = ' || recs.alien21 || ' , A22 = ' || recs.alien22 || ' , A23 = ' || recs.alien23 || ' , A24 = ' || recs.alien24 || ' , A25 = ' || recs.alien25 ||
        ' , A26 = ' || recs.alien26 || ' , A27 = ' || recs.alien27 || ' , A28 = ' || recs.alien28 ||  ' WHERE DAYS = ' || v_filed;*/


       -- SQLCOMMAND:='UPDATE FN38PERDAY SET CARDIN =  ' || recs.sumInout ||' , CHKINNOW =  '|| recs.checkinNow ||' WHERE DAYS = ' || v_filed;
        --DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
        EXECUTE IMMEDIATE(SQLCOMMAND);
   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
   if commitrow = 1000 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut);
    commit;
   end if;
 end loop; --cursor
 close c1;
 commit;
 --utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 --utl_file.put_line(file_ut,sysdateTxt||' End update immcard1 .... !!!');utl_file.fflush(file_ut);
 --utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDFN38PERDAYs;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDFN38PERDAYS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDFN38PERDAYS" TO "BIOSAADM";
