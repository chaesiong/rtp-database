CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FNHOTELNAME" (HOTELSEQNO Number) return varchar2 is
tmp varchar2(200);
begin
    BEGIN
    select name into tmp from fn_hotel where hotel_seqno=HOTELSEQNO;
    Exception When No_Data_Found Then Null ;
    end;
  RETURN TMP;
END;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FNHOTELNAME" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FNHOTELNAME" TO "BIOSAADM";
