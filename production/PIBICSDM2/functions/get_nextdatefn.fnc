CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NEXTDATEFN" (P_fnperson_seqno number,P_tm6no varchar2,P_indte varchar2) return Date is
v_next_date90 date;
v_docdate varchar2(8);
v_chk char(1);
begin
 begin
    select decode(tm6no||to_char(indte,'yyyymmdd'),P_tm6no||P_indte,'T','F') ,to_char(docdate,'yyyymmdd') docdate,next_date into v_chk,v_docdate,v_next_date90
    from fn_person
    where fnperson_seqno = P_fnperson_seqno;
 if v_chk = 'F' then
    if(P_indte > v_docdate) then
         v_next_date90 := to_date(P_indte,'yyyymmdd')+89;
    end if;
 end if;
 Exception When No_Data_Found Then Null ;
 end;
  return v_next_date90;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_NEXTDATEFN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_NEXTDATEFN" TO "BIOSAADM";
