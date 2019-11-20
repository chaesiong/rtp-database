CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."MIGRATE_FACT_ADDR24" (s_date in varchar2, e_date in varchar2) is
begin
declare
sysdatetxt varchar2(25);
sysdatefile varchar2(8);
totalrow number(20);
commitrow number(20);
file_ut utl_file.file_type;
    cursor c1 is

select to_char(fn_alienlist.checkindte,'YYYYMMDD') checkindte,fn_alienlist.count_seqno,fn_hotel.hotel_seqno,fn_hotel.htype_seqno,
fn_hotel.pv_seqno,fn_hotel.amp_seqno,fn_hotel.tmb_seqno,fn_hotel.dept_seqno,count(fn_alienlist.alien_seqno) alien_seqnocnt, 
get_deptseqnolevel1(fn_hotel.dept_seqno) deptseqnolevel1
from fn_alienlist,fn_addressnotify,fn_hotel
where fn_alienlist.addrn_seqno = fn_addressnotify.addrn_seqno
and  fn_addressnotify.hotel_seqno = fn_hotel.hotel_seqno
and  to_char(fn_alienlist.create_date,'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
group by to_char(fn_alienlist.checkindte,'YYYYMMDD'),fn_alienlist.count_seqno,fn_hotel.hotel_seqno,fn_hotel.htype_seqno,
fn_hotel.pv_seqno,fn_hotel.amp_seqno,fn_hotel.tmb_seqno,fn_hotel.dept_seqno
order by to_char(fn_alienlist.checkindte,'YYYYMMDD') desc;
   
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdatefile from dual;
 file_ut := utl_file.fopen('PISCES_DIR','log_MIGRATE_FACT_ADDR24'||sysdatefile||'.txt','W');
 utl_file.put_line(file_ut,sysdatetxt||' Start MIGRATE_FACT_ADDR24 .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;

insert into fact_addr24 (
   addr24_seqno, checkindte, nation_seqno, age, hotel_seqno, htype_seqno, pv_seqno, amp_seqno, tmb_seqno, 
   dept1_seqno, addr24_stat, dw_insdte, dw_upddte, dept2_seqno, dept3_seqno, dept_seqno, deptseqnolevel1) 
values (  faddr24_seqno.nextval,  to_date(recs.checkindte, 'YYYYMMDD'), recs.count_seqno, null, recs.hotel_seqno, recs.htype_seqno, recs.pv_seqno, recs.amp_seqno,
 recs.tmb_seqno, null, recs.alien_seqnocnt, null, null, null, null, recs.dept_seqno, recs.deptseqnolevel1); 

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
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdatetxt from dual;
 utl_file.put_line(file_ut,sysdatetxt||' End MIGRATE_FACT_ADDR24 .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

end migrate_fact_addr24;
/
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_FACT_ADDR24" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."MIGRATE_FACT_ADDR24" TO "BIOSAADM";
