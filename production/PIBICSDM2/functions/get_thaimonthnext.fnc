CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THAIMONTHNEXT" (MM_TMP varchar2) return varchar2 is
tmp varchar2(60);
begin
    begin
      case 
     when MM_TMP='1' then tmp:='มกราคม';
     when MM_TMP='2' then tmp:='กุมภาพันธ์';
     when MM_TMP='3' then tmp:='มีนาคม';
     when MM_TMP='4' then tmp:='เมษายน';
     when MM_TMP='5' then tmp:='พฤษภาคม';
     when MM_TMP='6' then tmp:='มิถุนายน';
     when MM_TMP='7' then tmp:='กรกฎาคม';
     when MM_TMP='8' then tmp:='สิงหาคม';
     when MM_TMP='9' then tmp:='กันยายน';
     when MM_TMP='10' then tmp:='ตุลาคม';
     when MM_TMP='11' then tmp:='พฤศจิกายน';
     when MM_TMP='12' then tmp:='ธันวาคม';
     when MM_TMP='13' then tmp:='มกราคม';
      when MM_TMP='14' then tmp:='กุมภาพันธ์';
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTHNEXT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTHNEXT" TO "BIOSAADM";
