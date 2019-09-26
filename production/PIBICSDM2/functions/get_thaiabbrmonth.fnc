CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THAIABBRMONTH" (D_TMP varchar2) return varchar2 is
tmp varchar2(60);
begin
    begin
      case 
     when D_TMP='1' then tmp:='ม.ค.';
     when D_TMP='2' then tmp:='ก.พ.';
     when D_TMP='3' then tmp:='มี.ค.';
     when D_TMP='4' then tmp:='เม.ย.';
     when D_TMP='5' then tmp:='พ.ค.';
     when D_TMP='6' then tmp:='มิ.ย.';
     when D_TMP='7' then tmp:='ก.ค.';
     when D_TMP='8' then tmp:='ส.ค.';
     when D_TMP='9' then tmp:='ก.ย.';
     when D_TMP='10' then tmp:='ต.ค.';
     when D_TMP='11' then tmp:='พ.ย.';
     when D_TMP='12' then tmp:='ธ.ค.';
     when D_TMP='13' then tmp:='ม.ค.';
     when D_TMP='14' then tmp:='ก.พ.';
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
