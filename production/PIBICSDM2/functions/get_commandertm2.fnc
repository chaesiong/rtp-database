CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COMMANDERTM2" return number is 
tmp number;
begin
    begin
   select sum(b.otrate) into tmp from hr_profile a ,ot_rate b where a.level_seqno=b.poslevel_seqno  and dept_seqno=3 and level_seqno='7' group by a.level_seqno;
    Exception When No_Data_Found Then null;
        tmp:=0;
    end;
  return tmp;
end;
/
