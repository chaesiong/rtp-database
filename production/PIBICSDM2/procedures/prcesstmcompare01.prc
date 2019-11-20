CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PRCESSTMCOMPARE01" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       TMCOMPARE01
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        30/04/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     TMCOMPARE01
      Sysdate:         30/04/2012
      Date and Time:   30/04/2012, 15:54:27, and 30/04/2012 15:54:27
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
    select deptcd, deptl2tnm, decode(cardtype, '1', 'IN', '2', 'OUT') TypeOfTrvavel, tm6no TM6NO, 'ITTIPON'||tdtno PassNo, replace(efamilynm, '0','') Lastname, replace(efirstnm, '0','') Firstname, replace(emiddlenm, '0','') Middlename, 
    'ITTIPON'||birthdte DateOfBirth, to_number(to_char(sysdate, 'YYYY')) - to_number(substr(birthdte, 7)) AGE, get_nationnm(nationcd, 'E') NATION, b.visatypeenm VISA, sex, convregno,
    'ITTIPON'||inoutdte INDATE from vw_tmmain a, visatype b where a.visatypecd=B.VISATYPECD(+) and (to_char(inoutdate, 'yyyymmdd') between '20120219' and '20120221') 
    and cardtype='1' and sex='M' and nationcd not in ('M03','C01','T03','B16','L01','P07','V03','S10','I03','B14') 
    and to_number(substr(birthdte, 7)) between 1957 and 1993;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_TmConpare'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start tmmain Compare .... !!!');utl_file.fflush(file_ut); 
 open c1;
 loop
        fetch c1 into rec_tm; exit when c1%notfound;
       insert into tmcompare01 (tmseq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, nationenm, cardtype, inoutdte, convregno,  depttnm, visa, age) 
        values (investigate_seq.nextval, rec_tm.tm6no, rec_tm.passno, rec_tm.lastname, rec_tm.firstname, rec_tm.middlename, rec_tm.sex, rec_tm.dateofbirth, 
        rec_tm.nation, rec_tm.typeoftrvavel, rec_tm.indate, rec_tm.convregno, rec_tm.deptl2tnm, rec_tm.visa, rec_tm.age );
        totalrow:=totalrow+1;   
        commitrow:=commitrow+1;
        if commitrow = 1000 then
         commitrow:=0;
         commit; 
       end if;   
     end loop;
 close c1;
 commit; 
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End tmmain Compare .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
 -- when others then
   -- null;--prompt(sqlerrm||'[Re-Gen Error]');
end;
END PRCESSTMCOMPARE01;
/
  GRANT EXECUTE ON "PIBICSDM2"."PRCESSTMCOMPARE01" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PRCESSTMCOMPARE01" TO "BIOSAADM";
