CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PROCESSSPK" IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       PROCESSSPK
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        06/10/2012   Administrator       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     PROCESSSPK
      Sysdate:         06/10/2012
      Date and Time:   06/10/2012, 09:37:04, and 06/10/2012 09:37:04
      Username:        Administrator (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
declare
sysdateTxt varchar2(25);
sysdateFile varchar2(8);
totalrow number(20);
commitrow number(20);
arrival_seqno number(20);
departure_seqno number(20);
visa_seqno number(20);
ext_seqno number(20);
fn90_seqno number(20);
fn24_seqno number(20);
reps_seqno number(20);
SQLCOMMAND VARCHAR2(1000);
AMOUNT number(20);
nowdate DATE;
file_ut UTL_FILE.FILE_TYPE;
    cursor c1 is    
    --สถิติขาเข้า ตั้งแต่ต้นปีที่ผ่านมา
    select count('X') totalin from tmmain where to_char(indte, 'yyyymmdd') between to_char(sysdate, 'YYYY')||'0101' and to_char(sysdate -1, 'yyyymmdd');
    recs c1%rowtype;
begin
 totalrow:=0;
 commitrow:=0;
 nowdate := to_date(to_char(sysdate - 1, 'yyyy-mm-dd'), 'yyyy-mm-dd');
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 select to_char(sysdate,'YYYYMMDD') into sysdateFile from dual;
 file_ut := UTL_FILE.FOPEN('PISCES_DIR','log_spk_statistic'||sysdateFile||'.txt','W');
 utl_file.put_line(file_ut,sysdateTxt||' Start process SPK statistic pibics .... !!!');utl_file.fflush(file_ut);
 open c1;
 loop fetch c1 into recs; exit when c1%notfound;
        arrival_seqno:= spk_seqno.nextval;
        insert into spk_statistic (spkseqno, stat_type, total, spk_date, create_date, actflag) values (arrival_seqno, 'สถิติขาเข้า', recs.totalin, nowdate, sysdate, 'Y');
        commit;
        --สถิติขาเข้าวันที่ผ่านมา
    <<itemInter1_loop>> FOR itemArrival IN
     (
       select count('X') totalin from tmmain where to_char(indte, 'yyyymmdd') =  to_char(sysdate -1, 'yyyymmdd')
     )
     LOOP
        update spk_statistic set totalday = itemArrival.totalin where spkseqno = arrival_seqno;
     END LOOP;
     
    --สถิติขาเข้า 5 สัญชาติมากที่สุด
    <<itemInter2_loop>> FOR itemArrivalNat IN
     (
        select nation, cnt, rownum numrow from (
        select GET_NATIONNM(nationcd, 'T') nation, count('X') cnt from tmmain where to_char(indte, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
        group by nationcd
        order by count('X') desc
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemArrivalNat.numrow||' =  ''' ||itemArrivalNat.nation||''',STAT_NATAMOUNT_NO'||itemArrivalNat.numrow ||'='||itemArrivalNat.cnt||'WHERE spkseqno = '||arrival_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit;
     
     --สถิติขาออก ตั้งแต่ต้นปีที่ผ่านมา     
    departure_seqno:= spk_seqno.nextval;     
    <<itemInter3_loop>> FOR itemDeparture IN
     (
       select count('X') totalout from tmmain where to_char(outdte, 'yyyymmdd') between to_char(sysdate, 'YYYY')||'0101' and to_char(sysdate -1, 'yyyymmdd')
     )
     LOOP        
        insert into spk_statistic (spkseqno, stat_type, total, spk_date, create_date, actflag) values (departure_seqno, 'สถิติขาออก', itemDeparture.totalout, nowdate, sysdate, 'Y');
     END LOOP;
     
    --สถิติขาออกวันที่ผ่านมา
    <<itemInter4_loop>> FOR itemDepartureDay IN
     (
       select count('X') totalout from tmmain where to_char(outdte, 'yyyymmdd') =  to_char(sysdate -1, 'yyyymmdd')
     )
     LOOP
        update spk_statistic set totalday = itemDepartureDay.totalout where spkseqno = departure_seqno;
     END LOOP;
     
    --สถิติขาออก 5 สัญชาติมากที่สุด
    <<itemInter5_loop>> FOR itemDepartureNat IN
     (
        select nation, cnt, rownum numrow from (
        select GET_NATIONNM(nationcd, 'T') nation, count('X') cnt from tmmain where to_char(outdte, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
        group by nationcd
        order by count('X') desc
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemDepartureNat.numrow||' =  ''' ||itemDepartureNat.nation||''',STAT_NATAMOUNT_NO'||itemDepartureNat.numrow ||'='||itemDepartureNat.cnt||'WHERE spkseqno = '||departure_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit;
     
     --สถิติ Visa On Arrival ตั้งแต่ต้นปีที่ผ่านมา     
    visa_seqno:= spk_seqno.nextval;     
    <<itemInter6_loop>> FOR itemVisa IN
     (
       select count('X') totalvisa from voa_voa15 a, voa_voa15list b where a.voa_seqno = b.voa_seqno and to_char(voa15_date, 'yyyymmdd') between  to_char(sysdate, 'YYYY')||'0101' and to_char(sysdate -1, 'yyyymmdd')
     )
     LOOP        
        insert into spk_statistic (spkseqno, stat_type, total, spk_date, create_date, actflag) values (visa_seqno, 'Visa On Arrival', itemVisa.totalvisa, nowdate, sysdate, 'Y');
     END LOOP;
     
    --สถิติ Visa on Arrival วันที่ผ่านมา
    <<itemInter7_loop>> FOR itemVisaDay IN
     (
       select count('X') totalday from voa_voa15 a, voa_voa15list b where a.voa_seqno = b.voa_seqno and to_char(voa15_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
     )
     LOOP
        update spk_statistic set totalday = itemVisaDay.totalday where spkseqno = visa_seqno;
     END LOOP;
     
    --สถิติ Visa On Arrival 5 สัญชาติมากที่สุด
    <<itemInter8_loop>> FOR itemVisaNat IN
     (
        select nation, cnt, rownum numrow from (
        select get_nationnm(nation_seqno, 'T') nation , count('X') cnt from voa_voa15 a, voa_voa15list b where a.voa_seqno = b.voa_seqno 
        and to_char(voa15_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
        group by nation_seqno
        order by count('X') desc 
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemVisaNat.numrow||' =  ''' ||itemVisaNat.nation||''',STAT_NATAMOUNT_NO'||itemVisaNat.numrow ||'='||itemVisaNat.cnt||'WHERE spkseqno = '||visa_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit;

    --สถิติการขออยู่ต่อ วันที่ผ่านมา
     ext_seqno:= spk_seqno.nextval;   
    <<itemInter9_loop>> FOR itemExtDay IN
     (
       select count('X') totalday from ext_extensionlist where to_char(ext_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd') and actflag <> 'C'
     )
     LOOP
         insert into spk_statistic (spkseqno, stat_type, totalday, spk_date, create_date, actflag) values (ext_seqno, 'สถิติการขออยู่ต่อ', itemExtDay.totalday, nowdate, sysdate, 'Y');
     END LOOP;
     
    --สถิติการขออยู่ต่อ  3 สัญชาติมากที่สุด
    <<itemInter10_loop>> FOR itemExtNat IN
     (
        select nation, cnt, rownum numrow from (
        select get_nationnm(NATION_SEQNO, 'T') nation , count('X') cnt from ext_extensionlist b where to_char(ext_date, 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd') and actflag <> 'C'
        group by nation_seqno
        order by count('X') desc 
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemExtNat.numrow||' =  ''' ||itemExtNat.nation||''',STAT_NATAMOUNT_NO'||itemExtNat.numrow ||'='||itemExtNat.cnt||'WHERE spkseqno = '||ext_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit; 
     
    --สถิติการแจ้ง 90 วัน วันที่ผ่านมา
     fn90_seqno:= spk_seqno.nextval;   
    <<itemInter11_loop>> FOR itemFn90Day IN
     (
       select count('X') totalday from fn_address90 b where  DOCDATE= to_date(to_char(sysdate -1, 'yyyymmdd'), 'yyyymmdd')
     )
     LOOP
         insert into spk_statistic (spkseqno, stat_type, totalday, spk_date, create_date, actflag) values (fn90_seqno, 'สถิติการแจ้ง 90 วัน', itemFn90Day.totalday, nowdate, sysdate, 'Y');
     END LOOP;
     
    --สถิติการแจ้ง 90 วัน 3 สัญชาติมากที่สุด
    <<itemInter12_loop>> FOR itemFn90Nat IN
     (
        select nation, cnt, rownum numrow from (
        select get_nationnm(NATION_SEQNO, 'T') nation , count('X') cnt from fn_address90 b where DOCDATE= to_date(to_char(sysdate -1, 'yyyymmdd'), 'yyyymmdd')
        group by nation_seqno
        order by count('X') desc 
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemFn90Nat.numrow||' =  ''' ||itemFn90Nat.nation||''',STAT_NATAMOUNT_NO'||itemFn90Nat.numrow ||'='||itemFn90Nat.cnt||'WHERE spkseqno = '||fn90_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit;         

    --สถิติการแจ้งที่พัก วันที่ผ่านมา
     fn24_seqno:= spk_seqno.nextval;   
    <<itemInter13_loop>> FOR itemFn24Day IN
     (
       select count('X') totalday  from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+) and to_char(a.checkindte , 'yyyy-mm-dd') = to_char(sysdate -1, 'yyyy-mm-dd')
     )
     LOOP
         insert into spk_statistic (spkseqno, stat_type, totalday, spk_date, create_date, actflag) values (fn24_seqno, 'สถิติการแจ้งที่พัก', itemFn24Day.totalday, nowdate, sysdate, 'Y');
     END LOOP;
     
    --สถิติการแจ้งที่พัก 3 สัญชาติมากที่สุด
    <<itemInter14_loop>> FOR itemFn24Nat IN
     (
        select nation, cnt, rownum numrow from (
        select get_nationnm(COUNT_SEQNO, 'T') nation , count('X') cnt 
        from fn_alienlist a, fn_addressnotify b, fn_hotel c where a.addrn_seqno=b.addrn_seqno(+) and b.hotel_seqno=c.hotel_seqno(+)
        and to_char(A.CHECKINDTE , 'yyyy-mm-dd') = to_char(sysdate -1, 'yyyy-mm-dd')
        group by COUNT_SEQNO
        order by count('X') desc
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemFn24Nat.numrow||' =  ''' ||itemFn24Nat.nation||''',STAT_NATAMOUNT_NO'||itemFn24Nat.numrow ||'='||itemFn24Nat.cnt||'WHERE spkseqno = '||fn24_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit;  
     
    --Re-Entry วันที่ผ่านมา
     reps_seqno:= spk_seqno.nextval;   
    <<itemInter15_loop>> FOR itemRepsDay IN
     (
       select count('X') totalday  from reps_tm8 where to_char(DOC_DATE , 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
     )
     LOOP
         insert into spk_statistic (spkseqno, stat_type, totalday, spk_date, create_date, actflag) values (reps_seqno, 'Re-Entry', itemRepsDay.totalday, nowdate, sysdate, 'Y');
     END LOOP;
     
    --Re-Entry 3 สัญชาติมากที่สุด
    <<itemInter16_loop>> FOR itemRepsNat IN
     (
        select nation, cnt, rownum numrow from (
        select  get_nationnm(NATIONAL_SEQNO, 'T') nation, count('X') cnt  
        from reps_tm8 where  to_char(DOC_DATE , 'yyyymmdd') = to_char(sysdate -1, 'yyyymmdd')
        group by NATIONAL_SEQNO
        order by count('X') desc
        ) where rownum <=5
     )
     LOOP
             SQLCOMMAND:= NULL;
             SQLCOMMAND:='UPDATE spk_statistic SET STAT_NATNAME_NO'||itemRepsNat.numrow||' =  ''' ||itemRepsNat.nation||''',STAT_NATAMOUNT_NO'||itemRepsNat.numrow ||'='||itemRepsNat.cnt||'WHERE spkseqno = '||reps_seqno;
            DBMS_OUTPUT.PUT_LINE(SQLCOMMAND);
            EXECUTE IMMEDIATE(SQLCOMMAND);               
     END LOOP;
     commit;           

   totalrow:=totalrow+1;
   commitrow:=commitrow+1;
/*   if commitrow = 1000 then
    commitrow:=0;
    --utl_file.put_line(file_ut,sysdateTxt||' Commit Rows'||totalrow);utl_file.fflush(file_ut);
    commit;
   end if;
*/
 end loop; --cursor
 close c1;
 commit;
 utl_file.put_line(file_ut,'total :'||totalrow);utl_file.fflush(file_ut);
 select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') into sysdateTxt from dual;
 utl_file.put_line(file_ut,sysdateTxt||' End process SPK statistic pibics .... !!!');utl_file.fflush(file_ut);
 utl_file.fclose(file_ut);
 /*Exception
  when others then
     utl_file.put_line(file_ut,'Error by tmrunno :'||rec_tm.tmrunno);utl_file.fflush(file_ut);
     utl_file.fclose(file_ut);
    null;--prompt(sqlerrm||'[Re-Gen Error]');*/
end;

END PROCESSSPK;
/
