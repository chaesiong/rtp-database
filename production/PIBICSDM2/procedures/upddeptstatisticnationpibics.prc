CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPTSTATISTICNATIONPIBICS" (P_YYYYMM IN VARCHAR2, STATISTICFILED  IN VARCHAR2) IS
--tmpVar NUMBER;
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
    
    --INOUT
    /*select nationcd, count(nationcd) amount
    from vw_tmmain  
    where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and cardtype = '2'
    and nationcd is not null
    --and decode(length(birthdte), 4, birthdte, substr(birthdte, 7)) between 1996  and 2012
    group by nationcd;*/
    
    /*select nationcd, Count('X') amount from vw_tmonline where to_char(inoutdate, 'YYYYMM') = P_YYYYMM and cardtype = '1'
    and nationcd in ('N06', 'C02', 'L04', 'G04', 'G02', 'S11', 'COD', 'C12', 'G13', 'T04', 'C11', 'P06', 'G08', 'M08', 'C09', 'Z01')
    group by nationcd;*/
    
    /* VOA BY nation
    select nationcd, count('X') amount from vw_tmonline
    where (to_char(inoutdate, 'YYYYMM') = P_YYYYMM) 
    and cardtype = '1'
    and nationcd in  (select Countcd from country where actflag = 'Y' and visaflag = 'Y')
    and visatypecd = '0007'
    group by nationcd;
    */
    
    select get_countcd(nation_seqno) nationcd, count('X') amount from ext_extensionlist 
    where to_char(create_date, 'YYYYMM') = P_YYYYMM
    and approve_sts = 'A' and actflag <> 'C' 
    and nation_seqno is not null
    and nation_seqno <> 200
    group by get_countcd(nation_seqno);
   
    /*
    select nationcd, count('X') amount from immigration 
    where (to_char(inoutdte, 'YYYYMM') = P_YYYYMM) 
    and cardtype = 1
    and nationcd is not null
    --and nationcd = 'A08'
    --and visatypecd = '0014'
    group by nationcd;
    */    

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_insertDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level statictisnationpibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        SQLCOMMAND:= NULL;
        AMOUNT :=0;
        if recs.amount is not null then
            AMOUNT :=recs.amount;
        end if;
        SQLCOMMAND:='UPDATE STATISTICNATIONPIBICS SET '||STATISTICFILED||' = '||AMOUNT||' WHERE COUNTCD = '''||recs.nationcd||'''';
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
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End update department level statictisnationpibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDDEPTSTATISTICNATIONPIBICS;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICNATIONPIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICNATIONPIBICS" TO "BIOSAADM";
