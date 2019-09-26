CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPDATEFNSTATISTICMONTHPIBICS" (P_YYYYMM IN VARCHAR2, P_DEPT_SEQNO IN NUMBER, P_PV_SEQNO IN NUMBER, P_MONTH IN NUMBER) IS
tmpVar NUMBER;
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
SQLCOMMAND VARCHAR2(1000);
AMOUNT number(20);
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is
        select sum(net_hotel_Y) net_hotel_Y, sum(net_hotel_N) net_hotel_N, sum(office_hotel_Y) office_hotel_Y, sum(office_hotel_N) office_hotel_N from (
            select
            case when a.create_by like get_ProvinceBySeqno(P_PV_SEQNO, 'C')||'%' and c.htype_seqno in (1) then 1 else 0 end as net_hotel_Y,
            case when a.create_by like get_ProvinceBySeqno(P_PV_SEQNO, 'C')||'%' and c.htype_seqno not in (1) then 1 else 0 end as net_hotel_N,
            case when a.create_by not like get_ProvinceBySeqno(P_PV_SEQNO, 'C')||'%' and c.htype_seqno in (1) then 1 else 0 end as office_hotel_Y,
            case when a.create_by not like get_ProvinceBySeqno(P_PV_SEQNO, 'C')||'%' and c.htype_seqno not in (1) then 1 else 0 end as office_hotel_N
            from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+) and c.pv_seqno = P_PV_SEQNO
            and to_char(a.checkindte, 'YYYYMM') = P_YYYYMM and c.dept_seqno = P_DEPT_SEQNO  
        ); 
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_FNSTATISTICMONTHPIBICS'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start update FNSTATISTICMONTHPIBICS .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        update FNSTATISTICMONTHPIBICS set DEPT_SEQNO = P_DEPT_SEQNO, PV_SEQNO = P_PV_SEQNO, net_hotel_Y = recs.net_hotel_Y,
        net_hotel_N = recs.net_hotel_N, office_hotel_Y = recs.office_hotel_Y, office_hotel_N = recs.office_hotel_N
        where FNMONTHSEQNO = P_MONTH;
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
 utl_file.put_line(file_ut,sysdateTxt||' End update FNSTATISTICMONTHPIBICS .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END UPDATEFNSTATISTICMONTHPIBICS;
/
