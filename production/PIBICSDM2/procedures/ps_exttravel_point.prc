CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_EXTTRAVEL_POINT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_EXTTRAVEL_POINT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        02/12/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_EXTTRAVEL_POINT
      Sysdate:         02/12/2013
      Date and Time:   02/12/2013, 15:32:42, and 02/12/2013 15:32:42
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
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelpoint_ext'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel point ext .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        select * from (
        select extlist_seqno, count_seqno, doc_no, ext_date, permit_date, udept_seqno, building, addr, road, tmb_seqno, amp_seqno, pv_seqno, postcode, tel, reason_seqno, approve_sts
        from ext_extensionlist where passportno = rec_tm.tdtno and nation_seqno = rec_tm.count_seqno
        order by update_date desc
        ) where rownum =1 
     )
     loop
        update travelpoint set extlist_seqno = itm.extlist_seqno, extcount_seqno = itm.count_seqno, extdocno = itm.doc_no, ext_date = itm.ext_date, 
        extpermit_date = itm.permit_date, extudept_seqno = itm.udept_seqno, extbuilding = itm.building, extaddr = itm.addr, extroad = itm.road, 
        exttmb_seqno = itm.tmb_seqno, extamp_seqno = itm.amp_seqno, extpv_seqno = itm.pv_seqno, extpostcode = itm.postcode, exttel = itm.tel, 
        extreason_seqno = itm.reason_seqno, extapprove_sts = itm.approve_sts where tpseqno = rec_tm.tpseqno;    
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
 utl_file.put_line(file_ut,sysdateTxt||' End travel point ext.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END PS_EXTTRAVEL_POINT;
/
