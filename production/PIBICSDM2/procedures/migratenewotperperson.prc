CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATENEWOTPERPERSON" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       MIGRATENEWOTPERPERSON
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        12/09/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     MIGRATENEWOTPERPERSON
      Sysdate:         12/09/2012
      Date and Time:   12/09/2012, 19:44:26, and 12/09/2012 19:44:26
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(20);
timenow varchar2(25);
totalrow number(20);
foundhr varchar2(20);
seqno number(20);
bankseq number(20);
file_ut UTL_FILE.FILE_TYPE;
cursor c1 is              
    select a.sectionid, rankname, firstname, lastname, b.dept_seqno dept_seqno,  null amtdead, decode(c.rank_seqno, null, 998, c.rank_seqno) rank_seqno, replace(card_id, '-','') card_id, a.bankaccount,
    (select poslevel_seqno from poslevel where POSLEVELABVNM = A.POSITIONNAME) level_seqno
    from otperperson a, deptotmapping b, rank c where a.positionname is not null and a.sectionid = b.sectionid and a.rankname=c.ranknm(+) order by a.sectionid;        
    recHR c1%rowtype;
begin
    totalrow:=0;
    select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
    select to_char(sysdate,'YYYYMMDDHH24MI') into sysdateFile from dual;
    file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_hrProfileNewPersonOT'||sysdateFile,'W');
    utl_file.put_line(file_ut,sysdateTxt||' Start migrate NEW OTPERPERON 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);    
    open c1;
        loop
        fetch c1 into recHR; exit when c1%notfound;
       -- foundhr:='NOTFOUND';
                seqno:=0;
                bankseq:=0;

                seqno:=GetSEQ_RUNNO('HR_PROFILE_OT');
                insert into hr_profile_ot (profile_seqno, rank_seqno, name, sname, c_type, cremation, create_by, create_date, update_by, update_date, version, dept_seqno, 
                sectionid, dept_seqno_old, exitperson, card_id, level_seqno) 
                values (seqno, recHR.rank_seqno, recHR.firstname, recHR.lastname, recHR.amtdead,
                null, 'OTNSYSTEM', sysdate, 'OTNSYSTEM', sysdate, 0, recHR.dept_seqno, recHR.sectionid, null, 'Y', recHR.card_id, recHR.level_seqno);
                totalrow:=totalrow+1;
                
                
                bankseq:=GetSEQ_RUNNO('OT_BANKACCOUNT');
               --foundhr:='FOUND';
               insert into ot_bankaccount (
               bankacctseqno, bank_seqno, bankacctno, 
               profile_seqno, bankacctname, bankbranch, 
               bankremark, actflag, create_by, 
               create_date, update_by, update_date,  version) 
               values (bankseq, 3,  recHR.bankaccount,  seqno, recHR.firstname || ' ' || recHR.lastname,
               null, null, 'A',  'OTNSYSTEM', sysdate, 'OTNSYSTEM', sysdate,  0 );
               totalrow:=totalrow+1;
                
        commit;
        end loop;
        
    close c1;
    commit;
     utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
     select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
     utl_file.put_line(file_ut,sysdateTxt||' End migrate NEW OTPERPERON 2 PIBICS HR_PROFILE_OT .... !!!');utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
end;
END MIGRATENEWOTPERPERSON;
/
