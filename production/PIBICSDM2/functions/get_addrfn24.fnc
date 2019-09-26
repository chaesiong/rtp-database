CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ADDRFN24" (passno varchar2, nation varchar2) return varchar2 is

tmp varchar2(1000);
begin
    begin
    select  fnaddr into tmp
    from(
    select   trim(c.name ||' '||c.addr||DECODE(c.road,NULL,'', ' ถนน ')|| c.road|| DECODE(c.tmb_seqno,NULL,'', (DECODE (c.pv_seqno,1,' แขวง ' ,' ต.')))|| get_tumbon(c.tmb_seqno)
    ||' '||  DECODE(c.amp_seqno,NULL,'', (DECODE (c.pv_seqno,1,'เขต ' ,'อ.'))) || get_ampur(c.amp_seqno)||' .'||get_province(c.pv_seqno)) || decode(tel, null, '', ' โทรศัพท์ '|| tel) fnaddr,
    to_char(b.addrndte, 'dd/mm/yyyy') docdate, to_char(a.update_date, 'dd/mm/yyyy')  create_date
    from fn_alienlist a,fn_addressnotify b, fn_hotel c
    where a.addrn_seqno = b.addrn_seqno(+)
    and b.hotel_seqno  =c. hotel_seqno(+)
    and a.count_seqno= get_countseqno(nation)
    and a.passportno = passno
    and checkindte is not null
    order by CHECKINDTE desc
    )
    where  rownum =1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
