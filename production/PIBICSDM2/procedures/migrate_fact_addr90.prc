CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_FACT_ADDR90" (S_DATE IN VARCHAR2, E_DATE IN VARCHAR2) IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is



SELECT NATION_SEQNO,SEX,VISATYPE_SEQNO,PV_SEQNO,DOCDATE,CREATE_BY,DEPT_SEQNO,NEXT_DATE, COUNT(ANDD_SEQNO) ADDR90_STAT
FROM FN_ADDRESS90
WHERE TO_CHAR(CREATE_DATE,'YYYYMMDD') >= S_DATE AND TO_CHAR(CREATE_DATE,'YYYYMMDD') <= E_DATE
GROUP BY NATION_SEQNO,SEX,VISATYPE_SEQNO,PV_SEQNO,DOCDATE,DEPT_SEQNO,NEXT_DATE,CREATE_BY;

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_MIGRATE_FACT_ADDR24'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start MIGRATE_FACT_ADDR24 .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;

    insert into fact_addr90 (
    addr90_seqno, nation_seqno, sex, visatype_seqno,  docdate,  create_by, next_date, dept_seqno, addr90_stat) 
    values ( faddr90_seqno.nextval, recs.nation_seqno, recs.sex, recs.visatype_seqno, recs.docdate, recs.create_by, recs.next_date, recs.dept_seqno, recs.addr90_stat );

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
 utl_file.put_line(file_ut,sysdateTxt||' End MIGRATE_FACT_ADDR24 .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END MIGRATE_FACT_ADDR90;
/
