CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_VISATYPECDFROMSEQNO" (visatypseqno_tmp varchar2) return varchar2 is
tmp varchar(4);
begin
 begin   
   select substr(visatypecd,3) into tmp from visatype where visatype_seqno = visatypseqno_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
