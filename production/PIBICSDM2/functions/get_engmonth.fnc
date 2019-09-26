CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ENGMONTH" (MM_TMP varchar2) return varchar2 is
tmp varchar2(60);
begin
    begin
      case 
     when MM_TMP='01' then tmp:='January';
     when MM_TMP='02' then tmp:='February';
     when MM_TMP='03' then tmp:='March';
     when MM_TMP='04' then tmp:='April';
     when MM_TMP='05' then tmp:='May';
     when MM_TMP='06' then tmp:='June';
     when MM_TMP='07' then tmp:='July';
     when MM_TMP='08' then tmp:='August';
     when MM_TMP='09' then tmp:='September';
     when MM_TMP='10' then tmp:='October';
     when MM_TMP='11' then tmp:='November';
     when MM_TMP='12' then tmp:='December';
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
