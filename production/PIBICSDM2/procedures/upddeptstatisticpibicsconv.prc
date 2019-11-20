CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDDEPTSTATISTICPIBICSCONV" (P_YYYYMM IN VARCHAR2, FILED_CNT  IN VARCHAR2, 
                    FILED_THAI IN VARCHAR2, FILED_INTER IN VARCHAR2,  FILED_ALIEN IN VARCHAR2, FILED_SUM IN VARCHAR2) IS
tmpVar NUMBER;

BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
SQLCOMMAND VARCHAR2(1000);
cnt number(20);
thai number(20);
inter number(20);
alien number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
   
    select dept_seqno, count('X') cnt, sum(thai) thai, sum(inter) inter, sum(alien) alien from (
    select dept_seqno, to_char(inoutdate, 'yyyymm') yyyymm, count(convregno) convregno, sum(case when nationcd = 'T03' then 1 else 0 end) thai,
     sum(case when nationcd <> 'T03' and (visatypecd  <> '0010' or visatypecd is null) then 1 else 0 end) as inter, 
    sum(case when nationcd <> 'T03' and visatypecd  = '0010' then 1 else 0 end) alien
    from vw_tmonline where  to_char(inoutdate, 'YYYYMM') = P_YYYYMM
    and dept_seqno in (select dept_seqno from department where convcd = '0003' and checkpoint = 'Y' and actflag = 'Y')
    group by  dept_seqno, to_char(inoutdate, 'yyyymm'), convregno
    ) group by dept_seqno;

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_insertDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level statictispibicsconv .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        SQLCOMMAND:= NULL;
        cnt :=0;
        if recs.cnt is not null then
            cnt :=recs.cnt;
        end if;
        
        thai :=0;
        if recs.thai is not null then
            thai :=recs.thai;
        end if;        
        
        inter :=0;
        if recs.inter is not null then
            inter :=recs.inter;
        end if;   
        
        alien :=0;
        if recs.alien is not null then
            alien :=recs.alien;
        end if;                  
        
        SQLCOMMAND:= 'UPDATE STATISTICPIBICSCONV SET ' || FILED_CNT|| ' = ' || cnt || ', ' || FILED_THAI || ' = ' || thai || ', ' || FILED_INTER || ' = ' || inter 
         || ', ' || FILED_ALIEN || ' = ' || alien || ', ' || FILED_SUM || ' = ' || (thai+inter+alien) || ' WHERE DEPT_SEQNO = '||recs.dept_seqno;
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
 utl_file.put_line(file_ut,sysdateTxt||' End update department level statictispibicsconv .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDDEPTSTATISTICPIBICSCONV;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICPIBICSCONV" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPDDEPTSTATISTICPIBICSCONV" TO "BIOSAADM";
