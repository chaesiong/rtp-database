CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONV_SEQNOFROMTM2" (tm2seqno_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
    select conv_seqno into tmp from tm2 where tm2_seqno=trim(tm2seqno_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
