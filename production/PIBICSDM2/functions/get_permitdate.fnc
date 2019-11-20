CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PERMITDATE" (P_passportno varchar2,P_nationseqno number,P_birthdate varchar2,P_sex varchar2,P_systype char) return Date is
V_permitdte date;
begin
    begin    
    select max(permitdte) into V_permitdte from (
    select max(permit_date) permitdte,'RQS' SYSTYPE from RQS_PERSON
    where cpassportno = P_passportno and nation_seqno = P_nationseqno and birth_date = nvl(P_birthdate,birth_date) and sex = P_sex 
    and statusrqs is null  and apprvsts not in ('C','N','R') and (to_date(to_char(sysdate, 'YYYYMMDD'), 'YYYYMMDD') - to_date(to_char(permit_date, 'YYYYMMDD'), 'YYYYMMDD') <=400)
    union
    select max(permit_date) permitdte,'EXT' SYSTYPE from Ext_PERSON
    where cpassportno = P_passportno and nation_seqno = P_nationseqno and birth_date = nvl(P_birthdate,birth_date) and sex = P_sex 
    and statusext is null and approve_sts = 'A' and (to_date(to_char(sysdate, 'YYYYMMDD'), 'YYYYMMDD') - to_date(to_char(permit_date, 'YYYYMMDD'), 'YYYYMMDD') <=400 )   
    union
    select max(visa_expdate) permitdte,'CHNG' SYSTYPE from CHNG_PERSON
    where passportno = P_passportno and nation_seqno = P_nationseqno and birthdate = nvl(P_birthdate,birthdate) and sex = P_sex 
    and (status = 1 or status is null) and actflag = 'Y' and statuschng is null and (to_date(to_char(sysdate, 'YYYYMMDD'), 'YYYYMMDD') - to_date(to_char(visa_expdate, 'YYYYMMDD'), 'YYYYMMDD') <=400)
    union
    select max(decode(newpermit,null,visaexpdte,newpermit)) permitdte,'IMM' SYSTYPE from IMMIGRATION
    where tdtno = P_passportno and count_seqno = P_nationseqno and birthdte = nvl(P_birthdate,birthdte) and sex = P_sex 
    and (to_date(to_char(sysdate, 'YYYYMMDD'), 'YYYYMMDD') - to_date(to_char(visaexpdte, 'YYYYMMDD'), 'YYYYMMDD') <=400)
    ) where systype = nvl(P_systype,systype);
    Exception When No_Data_Found Then Null ;
    end;
  return V_permitdte;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PERMITDATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PERMITDATE" TO "BIOSAADM";
