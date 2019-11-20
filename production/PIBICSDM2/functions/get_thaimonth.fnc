CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THAIMONTH" (MM_TMP varchar2) return varchar2 is
tmp varchar2(60);
begin
    begin
      case 
     when MM_TMP='01' then tmp:='มกราคม';
     when MM_TMP='02' then tmp:='กุมภาพันธ์';
     when MM_TMP='03' then tmp:='มีนาคม';
     when MM_TMP='04' then tmp:='เมษายน';
     when MM_TMP='05' then tmp:='พฤษภาคม';
     when MM_TMP='06' then tmp:='มิถุนายน';
     when MM_TMP='07' then tmp:='กรกฎาคม';
     when MM_TMP='08' then tmp:='สิงหาคม';
     when MM_TMP='09' then tmp:='กันยายน';
     when MM_TMP='10' then tmp:='ตุลาคม';
     when MM_TMP='11' then tmp:='พฤศจิกายน';
     when MM_TMP='12' then tmp:='ธันวาคม';
     when MM_TMP='13' then tmp:='มกราคม';
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTH" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTH" TO "BIOSAADM";
