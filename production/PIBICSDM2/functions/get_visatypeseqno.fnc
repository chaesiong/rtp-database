CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_VISATYPESEQNO" (visatypecd_tmp varchar2) return varchar2 is
tmp Number(4);
begin
 begin   
   select visatype_seqno into tmp from visatype where visatypecd = visatypecd_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
