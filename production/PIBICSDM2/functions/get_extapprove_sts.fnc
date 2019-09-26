CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTAPPROVE_STS" (status_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select decode(status_tmp,'ApprovedCancelled','C','Complete','W','InProgress','W','Approved','A','Cancelled','N','Rejected','D') into tmp from dual;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
