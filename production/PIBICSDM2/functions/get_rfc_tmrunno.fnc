CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RFC_TMRUNNO" (v_cardtype varchar2,v_convregno varchar2,v_inoutdte varchar2,v_dept_seqno varchar2,v_keymatch varchar2,v_fullnameKey varchar2) return varchar2 is 
tmp varchar2(200);
begin
   begin
  select TMRUNNO into tmp from vw_tmonline where cardtype = v_cardtype
       and convregno = v_convregno
       and to_char(inoutdate, 'yyyymmdd') = v_inoutdte
       and dept_seqno = v_dept_seqno
       and EFULLNAME = v_fullnameKey;
   Exception When No_Data_Found Then 
    begin
    select TMRUNNO into tmp from vw_tmonline where cardtype = v_cardtype
       and convregno = v_convregno
       and to_char(inoutdate, 'yyyymmdd') = v_inoutdte
       and dept_seqno = v_dept_seqno
       and tdtno||COUNT_SEQNO = v_keymatch;
    Exception when others then return null;
    end;
    end;
 return tmp;
end;
/
