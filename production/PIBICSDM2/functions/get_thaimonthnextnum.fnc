CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THAIMONTHNEXTNUM" (MM_TMP varchar2) return varchar2 is
tmp varchar2(60);
NUM NUMBER;
begin
    NUM:= MM_TMP;
    NUM:=TO_CHAR(NUM+1);
    
    begin
      case 
     when NUM='1' then tmp:='มกราคม';
     when NUM='2' then tmp:='กุมภาพันธ์';
     when NUM='3' then tmp:='มีนาคม';
     when NUM='4' then tmp:='เมษายน';
     when NUM='5' then tmp:='พฤษภาคม';
     when NUM='6' then tmp:='มิถุนายน';
     when NUM='7' then tmp:='กรกฎาคม';
     when NUM='8' then tmp:='สิงหาคม';
     when NUM='9' then tmp:='กันยายน';
     when NUM='10' then tmp:='ตุลาคม';
     when NUM='11' then tmp:='พฤศจิกายน';
     when NUM='12' then tmp:='ธันวาคม';
     when NUM='13' then tmp:='มกราคม';
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTHNEXTNUM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_THAIMONTHNEXTNUM" TO "BIOSAADM";
