CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPTSTATISTICDAYPIBICS" (S_DATE IN VARCHAR2, E_DATE IN VARCHAR2, STATISTICFILED  IN VARCHAR2, TYPECARD in varchar2) IS
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
    
   with departmentlevel as (
    select deptseq, deptcd, deptabbfmt2, rlc,deptlevel from (
    select dept_seqno deptseq, deptcd,deptabbfmt2,dept_seqno rlc,to_number(deptlevel) deptlevel,deptlevel dld 
    from department where deptlevel = 1 and actflag ='Y'
    union
    select dept_seqno deptseq,deptcd,deptabbfmt2,rel_code rlc,(rel_code*1000000)+(dept_seqno*1000) deptlevel,deptlevel dld 
    from department where deptlevel = 2 and actflag ='Y'
    union
    select  dept_seqno deptseq, deptcd,deptabbfmt2,(select rel_code from department where dept_seqno = d.rel_code) rlc,
    ((select rel_code from department where dept_seqno = d.rel_code)*1000000)+(rel_code*1000)+dept_seqno deptlevel,deptlevel dld 
    from department d where deptlevel = 3 and actflag ='Y'
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, amount, rlc, deptlevel  from departmentlevel a,
    (
    select deptcd, dept_seqno, count(tmrunno) amount from vw_tmmain 
    where to_char(inoutdate, 'YYYYMMDDHH24MISS') between S_DATE and E_DATE 
    and cardtype = TYPECARD
    group by deptcd, dept_seqno
    ) b
    where a.deptcd=b.deptcd(+);

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_insertDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level statictispibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        SQLCOMMAND:= NULL;
        AMOUNT :=0;
        if recs.amount is not null then
            AMOUNT :=recs.amount;
        end if;
        SQLCOMMAND:='UPDATE STATISTICDAYPIBICS SET '||STATISTICFILED||' = '||AMOUNT||' WHERE DEPT_SEQNO = '||recs.dept_seqno;
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
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End update department level statictispibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDDEPTSTATISTICDAYPIBICS;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICDAYPIBICS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICDAYPIBICS" TO "BIOSAADM";
