CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_FN24TRAVEL_POINT" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PS_FN24TRAVEL_POINT
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        02/12/2013   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PS_FN24TRAVEL_POINT
      Sysdate:         02/12/2013
      Date and Time:   02/12/2013, 17:09:14, and 02/12/2013 17:09:14
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
 file_ut := UTL_FILE.FOPEN('LOGS_DIR','log_travelpoint_fn24'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start travel point fn24 .... !!!');utl_file.fflush(file_ut); 
 open c1;
    loop fetch c1 into rec_tm; exit when c1%notfound;    
    <<itemtm_loop>> for itm in
     (
        select *
        from(select  passportno, a.count_seqno, checkindte, c.hotel_seqno, alien_seqno, c.name, c.addr, 
        c.road, c.pv_seqno, c.amp_seqno, c.tmb_seqno, c.postcode , c.tel
        from fn_alienlist a,fn_addressnotify b, fn_hotel c
        where a.addrn_seqno = b.addrn_seqno(+)
        and b.hotel_seqno  =c. hotel_seqno(+)
        and a.passportno = rec_tm.tdtno
        and a.count_seqno = rec_tm.count_seqno
        and checkindte is not null
        order by checkindte desc
        )where  rownum =1
     )
     loop
        update travelpoint set alien_seqno = itm.alien_seqno, fn24passportno = itm.passportno, hotel_seqno = itm.hotel_seqno, 
        fn24count_seqno = itm.count_seqno, fn24checkindte = itm.checkindte,  fn24hotelname = itm.name, fn24addr = itm.addr, 
        fn24road = itm.road, fn24pv_seqno = itm.pv_seqno, fn24amp_seqno = itm.amp_seqno, 
        fn24tmb_seqno = itm.tmb_seqno, fn24poscode = itm.postcode, fn24tel = itm.tel
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
 utl_file.put_line(file_ut,sysdateTxt||' End travel point fn24.... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 --Exception
  --when others then
   --null;--prompt(sqlerrm||'[Re-Gen Error]');
end;

END;
/
