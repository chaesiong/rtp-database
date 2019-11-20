CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_TM2CONVREGNO" (tm2seqno_tmp varchar2) return varchar2 is 
convregno varchar2(200);
tmp varchar2(200);
begin
    begin
    select convregno into convregno  from tm2 where tm2_seqno=trim(tm2seqno_tmp) ;
    tmp := convregno;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_TM2CONVREGNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_TM2CONVREGNO" TO "BIOSAADM";
