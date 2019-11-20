CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSFINE" (fineseqno_tmp Number, flag varchar2)  return varchar2 is
slip varchar2(200);
book varchar2(200);
tmp varchar2(200);
begin
    begin
    select fineslipno,fineslipbookno into slip,book  from fs_fines where  fines_seqno=trim(fineseqno_tmp);
    if flag = 'T' then
       tmp := slip;
    elsif flag = 'E' then
       tmp := book;
    else tmp := slip;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSFINE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FSFINE" TO "BIOSAADM";
