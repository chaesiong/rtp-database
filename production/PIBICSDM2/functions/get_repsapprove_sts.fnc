CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REPSAPPROVE_STS" (status_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select decode(status_tmp,'InProgress','A','Approved','A','Rejected','R','Cancelled','C','N') into tmp from dual;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
