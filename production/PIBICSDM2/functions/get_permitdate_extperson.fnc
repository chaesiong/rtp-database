CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PERMITDATE_EXTPERSON" (P_cpassportno varchar2,P_nation_seqno number) return Date is 
tmp date;
begin
    begin
    select max(permit_date) into tmp from ext_person where cpassportno = P_cpassportno and nation_seqno = P_nation_seqno;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PERMITDATE_EXTPERSON" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PERMITDATE_EXTPERSON" TO "BIOSAADM";
