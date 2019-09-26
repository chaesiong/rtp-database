CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FULLTHAIDATE" (MM_TMP Date) return varchar2 is
tmp varchar2(100);
begin
    begin
      case 
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='01' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' มกราคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='02' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' กุมภาพันธ์ '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='03' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' มีนาคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='04' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' เมษายน '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='05' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' พฤษภาคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='06' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' มิถุนายน '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='07' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' กรกฎาคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='08' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' สิงหาคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='09' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' กันยายน '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='10' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ตุลาคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='11' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' พฤศจิกายน '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='12' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ธันวาคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='13' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' มกราคม '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);   
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
