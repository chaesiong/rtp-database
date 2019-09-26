CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXITEXTENSION" (passno varchar2, nationseqno number, indate varchar2) return VARCHAR2 is
tmp VARCHAR2(2);
BEGIN
    
    begin
        select 'Y' into tmp
        from ext_person where cpassportno = passno and NATION_SEQNO = nationseqno 
        and to_char(IN_DATE, 'yyyymmdd') = indate
        and approve_sts = 'A'  
        and rownum =1;
        
    Exception When No_Data_Found Then Null ;
    end;

    RETURN tmp;
END get_ExitExtension;
/
