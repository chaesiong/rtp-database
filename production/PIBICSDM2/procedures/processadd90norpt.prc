CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSADD90NORPT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PROCESSADD90NORPT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2/2/2012          1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROCESSADD90NORPT
      Sysdate:         2/2/2012
      Date and Time:   2/2/2012, 22:01:13, and 2/2/2012 22:01:13
      Username:         (set in TOAD Options, Procedure Editor)
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
    select fnperson_seqno, passportno, tm6no, efamilynm, efirstnm, emiddlenm, sex, birthdate, get_nationsbyseq(nation_seqno, 'E') nationtnm, to_char(indte, 'dd/mm/yyyy') indte, addr,
    to_char(next_date, 'dd/mm/yyyy') next_date, pibics.get_NationsBySeq(nation_seqno, 'S') nationcd, to_number(to_char(next_date, 'yyyymmdd')) chknext_date
    from fn_person where (next_date+7) < sysdate;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelInvestigate'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel investtgate .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
     select * from (
     select * from vw_tmmain  where tdtno = rec_tm.passportno and nationcd=rec_tm.nationcd
     and cardtype=1 and to_number(to_char(inoutdate, 'yyyymmdd')) < rec_tm.chknext_date
     order by inoutdate desc
     ) where rownum =1
     )
     loop
        insert into pibics.address90noreport (add90norptseq, seq, tm6no, passportno, efamilynm, efirstnm, emiddlenm, sex, birthdte, 
           nationenm, indte, addr, next_date) 
        values ( add90norptseq.nextval, rec_tm.fnperson_seqno, rec_tm.tm6no, rec_tm.passportno, rec_tm.efamilynm, rec_tm.efirstnm, rec_tm.emiddlenm, 
        rec_tm.sex, rec_tm.birthdate, rec_tm.nationtnm, rec_tm.indte, rec_tm.addr, rec_tm.next_date);
     end loop;
    
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
 utl_file.put_line(file_ut,sysdateTxt||' End travel investtgate.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 Exception
  when others then
   null;--prompt(sqlerrm||'[Re-Gen Error]');
end;


END PROCESSADD90NORPT; 
/
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSADD90NORPT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."PROCESSADD90NORPT" TO "BIOSAADM";
