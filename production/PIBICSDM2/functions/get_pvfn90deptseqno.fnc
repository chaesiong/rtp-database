CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PVFN90DEPTSEQNO" (passno varchar2, nationseqno number, birthdte varchar2, 
v_pv_seqno number, sdte varchar2, edte varchar2, extdte varchar2) return number is
RETURNVALUE VARCHAR2(30);
tmp number(20);
tmpdept number(20);
BEGIN
    
    begin
        select pv_seqno, dept_seqno into tmp, tmpdept 
        from fn_address90 where passportno = passno and nation_seqno = nationseqno  
        --and birthdate = birthdte
        and to_char(docdate,'yyyymmdd') between sdte and edte 
        and to_char(docdate,'yyyymmdd')  > extdte
        and rownum =1;
        
        if v_pv_seqno = tmp then        
            RETURNVALUE := 9999;
        else
            RETURNVALUE := tmpdept;
        end if;
        
    Exception When No_Data_Found Then Null ;
    end;

    RETURN RETURNVALUE;
END GET_PVFN90deptSeqno;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_PVFN90DEPTSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_PVFN90DEPTSEQNO" TO "BIOSAADM";
