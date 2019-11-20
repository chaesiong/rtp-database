CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPT_FNSTATISTICPIBICSALL" (P_YYYYMM IN VARCHAR2, STATISTICFILED  IN VARCHAR2) IS
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
    )) select deptseq dept_seqno,  get_deptnamelevel1(deptseq, 'T') deptnamelevel1, get_deptnamelevel2(deptseq, 'T') deptnamelevel2, get_deptnamelevel3(deptseq, 'T') deptnamelevel3, 
    YYYYMM, amount, rlc, deptlevel  from departmentlevel a,
    (
    select c.dept_seqno, to_char(a.CHECKINDTE , 'YYYYMM') YYYYMM, count('X') amount  
    from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+)
    and to_char(a.CHECKINDTE, 'YYYYMM') = P_YYYYMM
    group by c.dept_seqno, to_char(a.CHECKINDTE, 'YYYYMM')
    ) b
    where a.deptseq=b.dept_seqno(+); 
   
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_FnDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level fn statictispibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        SQLCOMMAND:= NULL;
        AMOUNT :=0;
        if recs.amount is not null then
            AMOUNT :=recs.amount;
        end if;
        SQLCOMMAND:='UPDATE FN_STATISTICPIBICS SET '||STATISTICFILED||' = '||AMOUNT||' WHERE DEPT_SEQNO = '||recs.dept_seqno;
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
 utl_file.put_line(file_ut,sysdateTxt||' End update department level fn statictispibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDDEPT_FNSTATISTICPIBICSALL;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPT_FNSTATISTICPIBICSALL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPT_FNSTATISTICPIBICSALL" TO "BIOSAADM";
