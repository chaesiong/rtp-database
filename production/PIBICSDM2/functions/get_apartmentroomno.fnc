CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_APARTMENTROOMNO" (aptseq number,flag char) return varchar2 is
tnm varchar2(200);
enm varchar2(200);
tmp varchar2(200);
begin
    begin    
        select apt_roomno, apt_water_meterno into tnm, enm  from wf_apartment where apt_seqno = aptseq;
    if flag = 'R' then
       tmp := tnm;
    elsif flag = 'M' then
       tmp := enm;
    else tmp := tnm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
