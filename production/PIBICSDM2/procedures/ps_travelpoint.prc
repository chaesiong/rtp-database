CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_TRAVELPOINT" (startdate IN VARCHAR2, enddate IN VARCHAR2) IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_TRAVELPOINT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        02/12/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_TRAVELPOINT
      Sysdate:         02/12/2013
      Date and Time:   02/12/2013, 14:28:19, and 02/12/2013 14:28:19
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

    select cardtype, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, 
    to_number(to_char(sysdate, 'YYYY')) - to_number(substr(birthdte, 7)) age, nationcd,
    inoutdate, visatypecd, visaexpdte, convregno, deptcd, count_seqno, dept_seqno, getImmOutBound(personid) outbound
    from vw_tmonline 
    where to_char(inoutdate, 'yyyymmdd') between startdate and enddate
    and nationcd in (select countcd from country where continentcd  in ('05')) and cardtype = '1';
   
    rec_tm c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_travelpoint'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start Travel point .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into rec_tm; exit when c1%notfound;
 
    insert into travelpoint (tpseqno, cardtype, tdtno, tm6no, efamilynm, efirstnm, emiddlenm, sex, birthdte, 
    age, nationcd, inoutdte, visatypecd, visaexpdte, convregno, deptcd, count_seqno, dept_seqno, outbound) 
    values (tp_seqno.nextval, rec_tm.cardtype, rec_tm.tdtno, rec_tm.tm6no, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm,
    rec_tm.sex, rec_tm.birthdte, rec_tm.age, rec_tm.nationcd, rec_tm.inoutdate, rec_tm.visatypecd, rec_tm.visaexpdte,
    rec_tm.convregno, rec_tm.deptcd, rec_tm.count_seqno, rec_tm.dept_seqno, rec_tm.outbound);

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
 utl_file.put_line(file_ut,sysdateTxt||' End Travel point .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END PS_TRAVELPOINT;
/
