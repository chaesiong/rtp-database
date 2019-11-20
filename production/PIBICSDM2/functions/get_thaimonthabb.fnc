CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THAIMONTHABB" (MM_TMP varchar2) return varchar2 is
tmp varchar2(60);
begin
    begin
      case 
     when MM_TMP='01' then tmp:='ม.ค.';
     when MM_TMP='02' then tmp:='ก.พ.';
     when MM_TMP='03' then tmp:='มี.ค.';
     when MM_TMP='04' then tmp:='เม.ย.';
     when MM_TMP='05' then tmp:='พ.ค.';
     when MM_TMP='06' then tmp:='มิ.ย.';
     when MM_TMP='07' then tmp:='ก.ค.';
     when MM_TMP='08' then tmp:='ส.ค.';
     when MM_TMP='09' then tmp:='ก.ย.';
     when MM_TMP='10' then tmp:='ต.ค.';
     when MM_TMP='11' then tmp:='พ.ย.';
     when MM_TMP='12' then tmp:='ธ.ค.';
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTHABB" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTHABB" TO "BIOSAADM";
