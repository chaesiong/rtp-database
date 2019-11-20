CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BENDTHAIMONTH" (D_TMP Date) return varchar2 is
tmp varchar2(60);
begin
    begin
      case 
     when to_char(D_TMP, 'mm')='01' then tmp:='ม.ค.';
     when to_char(D_TMP, 'mm')='02' then tmp:='ก.พ.';
     when to_char(D_TMP, 'mm')='03' then tmp:='มี.ค.';
     when to_char(D_TMP, 'mm')='04' then tmp:='เม.ย.';
     when to_char(D_TMP, 'mm')='05' then tmp:='พ.ค.';
     when to_char(D_TMP, 'mm')='06' then tmp:='มิ.ย.';
     when to_char(D_TMP, 'mm')='07' then tmp:='ก.ค.';
     when to_char(D_TMP, 'mm')='08' then tmp:='ส.ค.';
     when to_char(D_TMP, 'mm')='09' then tmp:='ก.ย.';
     when to_char(D_TMP, 'mm')='10' then tmp:='ต.ค.';
     when to_char(D_TMP, 'mm')='11' then tmp:='พ.ย.';
     when to_char(D_TMP, 'mm')='12' then tmp:='ธ.ค.';
end case;
    end;
  return to_char(D_TMP, 'dd')||' '||tmp||' '||substr(to_char(D_TMP, 'yyyy')+543,3);
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_BENDTHAIMONTH" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_BENDTHAIMONTH" TO "BIOSAADM";
