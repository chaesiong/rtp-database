CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTRATEDEFAULT" (profileseq Number) return NumbER is
tmp number;
begin
    begin   
            select b.otrate into tmp from hr_profile_ot a,ot_rate b  where a.level_seqno= b.poslevel_seqno and a.profile_seqno=profileseq;
   Exception When No_Data_Found Then Null ;
               tmp:=0;       
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTRATEDEFAULT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTRATEDEFAULT" TO "BIOSAADM";
