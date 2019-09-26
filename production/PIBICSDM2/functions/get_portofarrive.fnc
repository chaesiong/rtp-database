CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PORTOFARRIVE" (port_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select seqno into tmp  from EXTDEPARTMENT_TMP where code=trim(port_tmp) and rownum=1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
