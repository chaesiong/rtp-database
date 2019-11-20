CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_FACT_INOUT" IS
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is

    SELECT COUNT(TMRUNNO) TMRUNNOCNT,  TO_CHAR(CREDTE, 'yyyymmdd') CREDTE, TO_CHAR(INOUTDATE, 'yyyymmdd') INOUTDTE , CARDTYPE, SEX, COUNT_SEQNO, NATIONCD, DEPT_SEQNO, CONV_SEQNO,VISATYPE_SEQNO
    FROM vw_tmonline    
    where TO_CHAR(CREDTE, 'yyyymmdd') =TO_CHAR(TRUNC(SYSDATE-1), 'yyyymmdd')      
    --where TO_CHAR(CREDTE, 'yyyymmdd') between '20140101' and'20140527'
    GROUP BY  TO_CHAR(CREDTE, 'yyyymmdd'),  TO_CHAR(INOUTDATE, 'yyyymmdd')  , CARDTYPE, SEX, COUNT_SEQNO, NATIONCD, DEPT_SEQNO, CONV_SEQNO,VISATYPE_SEQNO;
   
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_MIGRATE_FACT_INOUT'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start MIGRATE_FACT_INOUT .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;

INSERT INTO FACT_INOUT (IO_SEQNO, INOUTDTE, CARDTYPE, SEX, COUNT_SEQNO, DEPT1_SEQNO, DEPT2_SEQNO, DEPT3_SEQNO, CONV_SEQNO, 
   CONVREGNO, VISATYPE_SEQNO, CREUSR, CREDTE, INOUT_STAT, DW_INSDTE, DW_UPDDTE, NATIONCD, DEPTCD, VISATYPECD, CONVCD, AGE, DEPT_SEQNO) 
VALUES ( FINOUT_SEQNO.nextval, to_date(recs.INOUTDTE, 'YYYYMMDD'), recs.cardtype, recs.sex, recs.count_seqno, null, null, null,
recs.conv_seqno, null, recs.visatype_seqno, null, to_date(recs.CREDTE, 'YYYYMMDD'), recs.TMRUNNOCNT, null, null,
recs.NATIONCD, null , null, null, null, recs.dept_seqno);    

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
 utl_file.put_line(file_ut,sysdateTxt||' End MIGRATE_FACT_INOUT .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END MIGRATE_FACT_INOUT;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_FACT_INOUT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_FACT_INOUT" TO "BIOSAADM";
