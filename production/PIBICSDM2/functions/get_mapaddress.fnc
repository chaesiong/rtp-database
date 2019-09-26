CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_MAPADDRESS" (v_SEQNO Number, flag varchar2) return varchar2 is
tmp varchar2(1000);
begin
    tmp := null;
    begin
      if flag = 'P' then
        select 'จ.'||pv_desc into tmp from province where pv_seqno= v_SEQNO;
      elsif flag = 'A' then      
        select trim(decode(amp_seqno,null,'', (decode (pv_seqno,1,'เขต' ,'อ.'))) || get_ampur(amp_seqno)||'<BR>จ.'||get_province(pv_seqno)) into tmp from ampur where amp_seqno = v_SEQNO;
      elsif flag = 'T' then
        select trim(decode(a.tmb_seqno,null,'', (decode (c.pv_seqno,1,' แขวง' ,' ต.')))|| get_tumbon(a.tmb_seqno) ||' '||  decode(b.amp_seqno,null,'', (decode (c.pv_seqno,1,'<BR>เขต' ,'<BR>อ.'))) || 
        get_ampur(a.amp_seqno)||'<BR>จ.'||get_province(c.pv_seqno)) into tmp from tambon a, ampur b, province c where a.amp_seqno = b.amp_seqno and b.pv_seqno = c.pv_seqno
        and a.tmb_seqno = v_SEQNO;
      end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
