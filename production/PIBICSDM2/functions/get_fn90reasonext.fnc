CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FN90REASONEXT" (passno varchar2, nationseqno number, birthdte varchar2,  s_docdate varchar2,  e_docdate varchar2) return number is
RETURNVALUE VARCHAR2(30);
tmp number(20);
tmpdept number(20);
BEGIN
    
    begin
        select reason_seqno, udept_seqno into tmp, tmpdept 
        from ext_extensionlist where passportno = passno and nation_seqno = nationseqno 
        and to_char(ext_date, 'yyyymmdd') between s_docdate and e_docdate
        --and birth_date = birthdte
        and approve_sts = 'A'
        and actflag <> 'C'        
        and rownum =1;
        
    Exception When No_Data_Found Then Null ;
    end;

    RETURN tmp;
END get_fn90ReaSonExt;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FN90REASONEXT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FN90REASONEXT" TO "BIOSAADM";
