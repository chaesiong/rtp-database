CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTNONTM2" (deptseqno_tmp Number, levelseqno_tmp Number,flag char) return Number is
dept char;
tmp Number;
begin
    begin
select
CASE 
WHEN rel_code =  3 THEN 'Y'
WHEN rel_code in  ( select dept_seqno from department where rel_code=3 ) THEN 'Y'
WHEN dept_seqno = 3  THEN 'Y'
END ENGNAME into dept
from department where dept_seqno = deptseqno_tmp;
    if flag = 'T' then
         if dept ='Y' then
            --16/09/2554 Edit by pill function กรณีให้ทุกคนต้องโดนหัก 2 % จากค่า OT
            --tmp := 0;
            tmp:=2;
        else
            tmp := 2;
         end if;
    elsif  flag =  'Y' then
       if dept ='Y' then
            tmp := 2;
        else
            tmp := 0;
            if levelseqno_tmp != 7 then
                 tmp := 2;
            end if;
        end if;
    end if; 

Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTNONTM2" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTNONTM2" TO "BIOSAADM";
