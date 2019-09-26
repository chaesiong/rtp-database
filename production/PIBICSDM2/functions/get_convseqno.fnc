CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CONVSEQNO" (convcd_tmp varchar2) return varchar2 is
tmp Number(4);
begin
 begin   
   select conv_seqno into tmp from conveyance where convcd = convcd_tmp;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
