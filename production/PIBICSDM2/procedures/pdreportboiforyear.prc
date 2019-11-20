CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PDREPORTBOIFORYEAR" (startDte in varchar2,endDte in varchar2,deptSeqno in Number) IS
tmpVar NUMBER;

BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
SQLCOMMAND VARCHAR2(1000);
AMOUNT number(20);
comSeq number(20);
companyStr varchar(1000);
comCheck number(20);
runno number(20);
num number(20);


file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    
SELECT EXTLIST_SEQNO,B.COM_SEQNO,B.COMPANYNM,A.EXTCOUNT,B.NAME,B.REASONNM,B.NATIONSBY,B.BIRTH_DATE,get_CAL_AGE_BOI(B.BIRTH_DATE,TO_DATE(B.EXT_DATE,'dd/mm/yyyy')) AGE ,B.PASSPORTNO,B.EXT_DATE,B.PERMIT_DATE 
FROM ( 
SELECT COM_SEQNO,COUNT(COM_SEQNO) EXTCOUNT 
FROM EXT_EXTENSIONLIST  
WHERE 1=1 AND ACTFLAG <>'C' 
--AND APPROVE_STS ='A' 
AND TO_CHAR(EXT_DATE,'yyyymmdd') BETWEEN startDte AND endDte
--AND TO_CHAR(EXT_DATE,'yyyymm') = yearStr
AND UDEPT_SEQNO IN (SELECT DEPT_SEQNO FROM DEPARTMENT WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) 
OR (REL_CODE =NVL(deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)) OR REL_CODE IN (SELECT DEPT_SEQNO FROM DEPARTMENT 
WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) OR (REL_CODE =NVL (deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)))) 
GROUP BY COM_SEQNO )A, 
( 
SELECT EXTLIST_SEQNO,COM_SEQNO,GET_COMPANYBYSEQ(COM_SEQNO) COMPANYNM,GET_SUFFIXNAME(SUFFIX_SEQNO)||' '||EFAMILYNM||' '||EFIRSTNM||' '||EMIDDLENM AS NAME,
DECODE(REASON_SEQNO,'38',DECODE(FACTTYPE,'1','สำนักงาน(สาขา)','2','สำนักงาน(ผู้แทน)','3','สำนักงาน(ภูมิภาค)','4','สำนักงาน(ปฏิบัติการ)','สำนักงาน'),'42',
DECODE(FACTTYPE,'1','กฎหมายพิเศษ(BOI)','2','กฎหมายพิเศษ(นิคมฯ)','3','กฎหมายพิเศษ(ปิโตรเลี่ยม)','กฎหมายพิเศษ'),get_ExtReason(reason_seqno)) REASONNM,
GET_NATIONSBYSEQ(NATION_SEQNO ,'T') AS NATIONSBY,BIRTH_DATE,PASSPORTNO PASSPORTNO, TO_CHAR (EXT_DATE,'dd/mm/yyyy') AS EXT_DATE, 
TO_CHAR (PERMIT_DATE,'dd/mm/yyyy') AS PERMIT_DATE 
FROM EXT_EXTENSIONLIST  
WHERE 1=1 AND ACTFLAG <>'C' 
--AND APPROVE_STS ='A' 
AND TO_CHAR(EXT_DATE,'yyyymmdd') BETWEEN startDte AND endDte
--AND TO_CHAR(EXT_DATE,'yyyymm') = yearStr
AND UDEPT_SEQNO IN (SELECT DEPT_SEQNO FROM DEPARTMENT WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) 
OR (REL_CODE =NVL(deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)) OR REL_CODE IN (SELECT DEPT_SEQNO FROM DEPARTMENT WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) 
OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) OR (REL_CODE =NVL (deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)))) 
 )B 
WHERE A.COM_SEQNO = B.COM_SEQNO
ORDER BY COMPANYNM,COM_SEQNO,substr(EXT_DATE,7,4)||substr(EXT_DATE,4,2)||substr(EXT_DATE,0,2) DESC ;

    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 
 comCheck:=99999999999999999999;
 num:=1;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_FnDepartmentLevel'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update department level fn statictispibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;

        
        if 99999999999999999999=comCheck then
            comSeq :=recs.COM_SEQNO;
            companyStr:=recs.COMPANYNM;
            AMOUNT := recs.EXTCOUNT;
            comCheck :=recs.COM_SEQNO;
            runno:=num;
       elsif comCheck = recs.COM_SEQNO then
            comSeq := null;
            companyStr:=null;
            AMOUNT := null;
            runno := null;
        else
            comSeq :=recs.COM_SEQNO;
            companyStr:=recs.COMPANYNM;
            AMOUNT := recs.EXTCOUNT;
            comCheck :=recs.COM_SEQNO;
             runno:=num+1;             
             num:=num+1;
        end if;
        
        
INSERT INTO REPORTBOI_FORYEAR (
   COM_SEQNO, COMPANYNM, EXT_DATE, 
   EXTCOUNT, NAME, REASONNM,
   NATIONSBY,BIRTH_DATE,AGE, PASSPORTNO, PERMIT_DATE,COMPANYNM_CHECK,COMSEQNO_CHECK,EXTLIST_SEQNO,RUNNO) 
VALUES ( comSeq,
 companyStr,
to_date( recs.EXT_DATE,'dd/mm/yyyy'),
AMOUNT,
 recs.NAME,
 recs.REASONNM,
 recs.NATIONSBY,
 recs.BIRTH_DATE,
 recs.AGE,
 recs.PASSPORTNO,
 to_date(recs.PERMIT_DATE,'dd/mm/yyyy')  ,
 recs.COMPANYNM,
 recs.COM_SEQNO,
 recs.EXTLIST_SEQNO,
 runno);
        
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
END PDreportboiForYear;
/
  GRANT EXECUTE ON "PIBICSDM2"."PDREPORTBOIFORYEAR" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PDREPORTBOIFORYEAR" TO "BIOSAADM";
