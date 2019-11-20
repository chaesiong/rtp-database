CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PVFN90" (passno varchar2, nationseqno number, birthdte varchar2, 
v_pv_seqno number, sdte varchar2, edte varchar2, extdte varchar2) return varchar2 is
RETURNVALUE VARCHAR2(30);
tmp number(20);
BEGIN
    
    begin
        select pv_seqno into tmp 
        from fn_address90 where passportno = passno and nation_seqno = nationseqno  and birthdate = birthdte
        and docdate between to_date(sdte, 'YYYYMM') and to_date(edte, 'YYYYMM') 
        and docdate > to_date(extdte, 'yyyymmdd') and rownum =1;
        
        if v_pv_seqno = tmp then        
            RETURNVALUE := 'Y';
        else
            RETURNVALUE := 'N';
        end if;
        
    Exception When No_Data_Found Then Null ;
    end;

    RETURN RETURNVALUE;
END GET_PVFN90;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PVFN90" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PVFN90" TO "BIOSAADM";
