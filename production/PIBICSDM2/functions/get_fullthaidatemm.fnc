CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FULLTHAIDATEMM" (MM_TMP Date) return varchar2 is
tmp varchar2(100);
begin
    begin
      case 
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='01' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ม.ค.'||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='02' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ก.พ. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='03' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' มี.ค. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='04' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' เม.ย. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='05' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' พ.ค. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='06' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' มิ.ย. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='07' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ก.ค. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='08' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ส.ค. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='09' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ก.ย. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='10' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ต.ค.'||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='11' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' พ.ย. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='12' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ธ.ค. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);
     when substr(to_char(MM_TMP,'DD/MM/YYYY'),4,2)='13' then tmp:=to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),0,2))||' ม.ค. '||to_number(substr(to_char(MM_TMP,'DD/MM/YYYY'),7)+543);   
end case;
Exception
      when others then
          null;
    end;
  return tmp;
end;
/
