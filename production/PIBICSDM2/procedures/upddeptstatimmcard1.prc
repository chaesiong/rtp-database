CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPTSTATIMMCARD1" (P_YYYYMM IN VARCHAR2, STATISTICFILED  IN VARCHAR2) IS
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
    
    select a.visatype_seqno, count('X') amount
    from immigration a, visatype b 
    where  a.visatype_seqno = b.visatype_seqno 
    and to_number(to_char(inoutdte,'YYYYMMDDHH24MISS')) between '20140101000000' and to_number(to_char(sysdate,'YYYYMMDDHH24MISS'))
    --and to_number(to_char(inoutdte,'YYYYMMDDHH24MISS')) between '20130101000000' and '20150131235900'
    and cardtype = '1' 
    and nationcd like '%I02%'
    and a.visatype_seqno is not null 
    and a.visatype_seqno not in (10, 9, 19)
    group by a.visatype_seqno;

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
        AMOUNT :=0;
        if recs.amount is not null then
            AMOUNT :=recs.amount;
        end if;
        SQLCOMMAND:='UPDATE STATOVERSTAY SET '||STATISTICFILED||' = '||AMOUNT||' WHERE VISATYPE_SEQNO = '||recs.visatype_seqno;
        --SQLCOMMAND:='UPDATE STATISTICPIBICS_INOUTFN SET '||STATISTICFILED||' = '||AMOUNT||' WHERE DEPT_SEQNO = '||recs.dept_seqno;
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

END UPDDEPTSTATIMMCARD1;
/
