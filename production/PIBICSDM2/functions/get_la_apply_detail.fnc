CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_LA_APPLY_DETAIL" (seqno Number, flag char) return varchar2 is
VBIRTHPLACE varchar2(500);
VPRESENT_ADDR varchar2(500);
VPRESENT_ROAD varchar2(500);
VPRESENT_PV_SEQNO varchar2(200);
VPRESENT_AMP_SEQNO varchar2(200);
VPRESENT_TMB_SEQNO varchar2(200);
VPRESENT_TEL varchar2(100);
tmp varchar2(500);
begin
    begin
        select BIRTHPLACE,PRESENT_ADDR,PRESENT_ROAD,PRESENT_PV_SEQNO,PRESENT_AMP_SEQNO,PRESENT_TMB_SEQNO,PRESENT_TEL 
        into VBIRTHPLACE,VPRESENT_ADDR,VPRESENT_ROAD,VPRESENT_PV_SEQNO,VPRESENT_AMP_SEQNO,VPRESENT_TMB_SEQNO,VPRESENT_TEL
        from la_apply where person_seqno = seqno and rownum = 1 order by apply_seqno desc;
    if flag = 'B' then
       tmp := VBIRTHPLACE;
    elsif flag = 'A' then
       tmp := VPRESENT_ADDR;
    elsif flag = 'R' then
       tmp := VPRESENT_ROAD;       
    elsif flag = 'PV' then
       tmp := VPRESENT_PV_SEQNO;       
    elsif flag = 'AM' then
       tmp := VPRESENT_AMP_SEQNO;
    elsif flag = 'TM' then
       tmp := VPRESENT_TMB_SEQNO;       
    elsif flag = 'T' then
       tmp := VPRESENT_TEL;                                          
    else tmp := '';
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_LA_APPLY_DETAIL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_LA_APPLY_DETAIL" TO "BIOSAADM";
