CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OUTDATEBYTMONLINE" (passno varchar2, tm6 varchar2, nationseqno number, indate varchar2) return DATE is
tnm date;
BEGIN
    
    begin
        select inoutdate into tnm from vw_tmonline
        where  cardtype='2' and tdtno =passno 
        --and tm6no =tm6 
        and count_seqno =nationseqno
        and to_char(inoutdate,'yyyymmdd') >=indate
        and rownum =1;
        
    Exception When No_Data_Found Then Null ;
    end;

    RETURN tnm;
END get_outdateByTmonline;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OUTDATEBYTMONLINE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OUTDATEBYTMONLINE" TO "BIOSAADM";
