CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_INOUTCASINO" ( cardtypeflag char,nationcdflag char,tdtcdflag char,flagmain char) return Number is
tmp Number;
begin
    begin

    if flagmain = 'A' then
         if cardtypeflag ='1' and nationcdflag='T03' and tdtcdflag='1' then
            tmp := 1;
        else
            tmp := 0;
         end if;
    elsif  flagmain =  'B' then
       if  cardtypeflag ='2' and nationcdflag='T03' and tdtcdflag='1' then
            tmp := 1;
        else
            tmp := 0;
        end if;
    elsif  flagmain =  'C' then
       if  cardtypeflag ='1' and nationcdflag='T03' and tdtcdflag='7' then
            tmp := 1;
        else
            tmp := 0;
        end if;
    elsif  flagmain =  'D' then
       if  cardtypeflag ='2' and nationcdflag='T03' and tdtcdflag='7' then
            tmp := 1;
        else
            tmp := 0;
        end if;
   elsif  flagmain =  'E' then
       if  cardtypeflag ='1' and nationcdflag <>'T03' and tdtcdflag='1' then
            tmp := 1;
        else
            tmp := 0;
        end if;
    elsif  flagmain =  'F' then
       if  cardtypeflag ='2' and nationcdflag<>'T03' and tdtcdflag='1' then
            tmp := 1;
        else
            tmp := 0;
        end if;
   elsif  flagmain =  'G' then
       if  cardtypeflag ='1' and nationcdflag<>'T03' and tdtcdflag='7' then
            tmp := 1;
        else
            tmp := 0;
        end if;
    elsif  flagmain =  'H' then
       if  cardtypeflag ='2' and nationcdflag<>'T03' and tdtcdflag='7' then
            tmp := 1;
        else
            tmp := 0;
        end if;
    end if; 

Exception When No_Data_Found Then  tmp := 0 ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_INOUTCASINO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_INOUTCASINO" TO "BIOSAADM";
