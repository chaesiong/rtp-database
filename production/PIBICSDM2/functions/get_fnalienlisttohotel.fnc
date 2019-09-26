CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FNALIENLISTTOHOTEL" (ADDRN_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select hotel_seqno into tmp from fn_addressnotify where addrn_seqno=ADDRN_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
