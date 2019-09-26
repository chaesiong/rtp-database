CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ADDR" (IDAMP_TMP VARCHAR2) return varchar2 is
tmp varchar2(2000);
begin
    begin
    select  fnaddr into tmp
    from(
    select  d.cardtype,d.tmrunno, trim(c.name ||' '||c.addr||DECODE(c.road,NULL,'', ' ถนน ')|| c.road|| DECODE(c.tmb_seqno,NULL,'', (DECODE (c.pv_seqno,1,' แขวง ' ,' ต.')))|| get_tumbon(c.tmb_seqno)
    ||' '||  DECODE(c.amp_seqno,NULL,'', (DECODE (c.pv_seqno,1,'เขต ' ,'อ.'))) || get_ampur(c.amp_seqno)||' จ.'||get_province(c.pv_seqno)) fnaddr,
    to_char(b.addrndte, 'dd/mm/yyyy') docdate, to_char(a.update_date, 'dd/mm/yyyy')  create_date
    from fn_alienlist a,fn_addressnotify b, fn_hotel c,vw_tmmain d
    where a.addrn_seqno = b.addrn_seqno(+)
    and b.hotel_seqno  =c. hotel_seqno(+)
    and a.count_seqno= get_countseqno(d.nationcd)
    and a.passportno = d.tdtno
    and d.tmrunno= IDAMP_TMP
    and checkindte is not null
    order by CHECKINDTE desc
    )
    where  rownum =1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
