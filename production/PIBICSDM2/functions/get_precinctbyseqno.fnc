CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_PRECINCTBYSEQNO" (precinctseqno_tmp Number) return varchar2 is
tnm varchar2(200);
begin
 begin
   select precincttnm into tnm from precinct where precinct_seqno =precinctseqno_tmp; 
Exception When No_Data_Found Then Null ;
end;
    return tnm;
end;
/
