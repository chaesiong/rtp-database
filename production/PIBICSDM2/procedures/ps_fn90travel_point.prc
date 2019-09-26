CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_FN90TRAVEL_POINT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_FN90TRAVEL_POINT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        02/12/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_FN90TRAVEL_POINT
      Sysdate:         02/12/2013
      Date and Time:   02/12/2013, 17:45:01, and 02/12/2013 17:45:01
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
    select * from travelpoint;
    rec_tm c1%rowtype;  
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelpoint_fn90'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel point fn90 .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (     
        select * from (
        select andd_seqno, docdate, dept_seqno, passportno, nation_seqno, building, addr, road, pv_seqno, amp_seqno, tmb_seqno, tel from fn_address90
        where passportno = rec_tm.tdtno
        and nation_seqno = rec_tm.count_seqno 
        order by update_date desc
        ) where rownum =1 
     )
     loop
        update travelpoint set andd_seqno = itm.andd_seqno, fn90passportno = itm.passportno, fn90doc_date = itm.docdate, 
        fn90count_seqno = itm.nation_seqno, fn90building = itm.building, fn90addr = itm.addr, 
        fn90road  = itm.road, fn90pv_seqno = itm.pv_seqno, fn90amp_seqno = itm.amp_seqno, 
        fn90tmb_seqno = itm.tmb_seqno, fn24tel = itm.tel
        where tpseqno = rec_tm.tpseqno;    
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
 utl_file.put_line(file_ut,sysdateTxt||' End travel point fn90.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PS_FN90TRAVEL_POINT;
/
