CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_REPS_GETPERMITDATE" (passno varchar2,appno_ref varchar2) return Date is
tmp Date;
begin
    begin
        select permit_date into tmp from ext_extensionlist
        where upper(passportno) = upper(passno)
        and doc_no = appno_ref and rownum=1;
    Exception When No_Data_Found Then Null ;
    end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_REPS_GETPERMITDATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_REPS_GETPERMITDATE" TO "BIOSAADM";
