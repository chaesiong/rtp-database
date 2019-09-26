CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PDREPORTBOIFACTTYPE" (startDte in varchar2, endDte in varchar2, deptSeqno in Number, reasonSeqno in Number, facttypeStr in varchar2) IS
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
    
SELECT EXTLIST_SEQNO,B.COM_SEQNO,B.COMPANYNM,A.EXTCOUNT,B.NAME,B.NATIONSBY,B.PASSPORTNO,B.EXT_DATE,B.PERMIT_DATE 
FROM ( 
SELECT COM_SEQNO,COUNT(COM_SEQNO) EXTCOUNT 
FROM EXT_EXTENSIONLIST  
WHERE 1=1 AND ACTFLAG <>'C' 
AND APPROVE_STS ='A' 
--AND TO_CHAR(PERMIT_DATE,'yyyymm') BETWEEN startDte AND endDte
AND TO_CHAR(PERMIT_DATE,'yyyymm') = startDte
AND UDEPT_SEQNO IN (SELECT DEPT_SEQNO FROM DEPARTMENT WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) 
OR (REL_CODE =NVL(deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)) OR REL_CODE IN (SELECT DEPT_SEQNO FROM DEPARTMENT 
WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) OR (REL_CODE =NVL (deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)))) 
AND REASON_SEQNO =reasonSeqno 
AND FACTTYPE = facttypeStr
GROUP BY COM_SEQNO )A, 
( 
SELECT EXTLIST_SEQNO,COM_SEQNO,GET_COMPANYBYSEQ(COM_SEQNO) COMPANYNM,GET_SUFFIXNAME(SUFFIX_SEQNO)||' '||EFAMILYNM||' '||EFIRSTNM||' '||EMIDDLENM AS NAME , 
GET_NATIONSBYSEQ(NATION_SEQNO ,'T') AS NATIONSBY,PASSPORTNO PASSPORTNO, TO_CHAR (EXT_DATE,'dd/mm/yyyy') AS EXT_DATE, 
TO_CHAR (PERMIT_DATE,'dd/mm/yyyy') AS PERMIT_DATE 
FROM EXT_EXTENSIONLIST  
WHERE 1=1 AND ACTFLAG <>'C' 
AND APPROVE_STS ='A' 
--AND TO_CHAR(PERMIT_DATE,'yyyymm') BETWEEN startDte AND endDte
AND TO_CHAR(PERMIT_DATE,'yyyymm') = startDte
AND UDEPT_SEQNO IN (SELECT DEPT_SEQNO FROM DEPARTMENT WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) 
OR (REL_CODE =NVL(deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)) OR REL_CODE IN (SELECT DEPT_SEQNO FROM DEPARTMENT WHERE (DEPT_SEQNO =NVL(deptSeqno,DEPT_SEQNO) 
OR (deptSeqno IS NULL AND DEPT_SEQNO IS NULL)) OR (REL_CODE =NVL (deptSeqno,REL_CODE) OR (deptSeqno IS NULL AND REL_CODE IS NULL)))) 
AND REASON_SEQNO =reasonSeqno 
AND FACTTYPE = facttypeStr
 )B 
WHERE A.COM_SEQNO = B.COM_SEQNO
ORDER BY COMPANYNM,COM_SEQNO,PERMIT_DATE ;

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
        
        
INSERT INTO REPORTBOI (
   COM_SEQNO, COMPANYNM, EXT_DATE, 
   EXTCOUNT, NAME, 
   NATIONSBY, PASSPORTNO, PERMIT_DATE,COMPANYNM_CHECK,COMSEQNO_CHECK,EXTLIST_SEQNO,RUNNO) 
VALUES ( comSeq,
 companyStr,
to_date( recs.EXT_DATE,'dd/mm/yyyy'),
AMOUNT,
 recs.NAME,
 recs.NATIONSBY,
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
END PDreportboiFacttype;
/
