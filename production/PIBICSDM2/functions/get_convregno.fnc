CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONVREGNO" (tm2seqno_tmp varchar2) return varchar2 is
regno varchar2(200);
begin
    begin
    select convregno into regno from tm2  where tm2_seqno=trim(tm2seqno_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return regno;
end;
/
