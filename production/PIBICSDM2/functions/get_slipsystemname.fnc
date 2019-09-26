CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SLIPSYSTEMNAME" (fss_seqno_tmp Number) return varchar2 is
tmp varchar2(200);
begin
 begin
   select system_name into tmp from fs_slipsystem where fss_seqno =fss_seqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
