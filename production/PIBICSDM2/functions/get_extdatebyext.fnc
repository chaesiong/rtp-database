CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTDATEBYEXT" (passno varchar2,nationseqno number, indate varchar2) return DATE is
tnm date;
BEGIN
    
    begin
        select ext_date into tnm from ext_person
        where cpassportno =passno and nation_seqno =nationseqno
        and to_char(in_date,'yyyymmdd') =indate
        and approve_sts ='A'
        and rownum =1;
        
    Exception When No_Data_Found Then Null ;
    end;

    RETURN tnm;
END get_extdateByExt;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTDATEBYEXT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTDATEBYEXT" TO "BIOSAADM";
