CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ZONESEQNOBYIP_" (P_DEPT VARCHAR2,ZONE_SEQNO VARCHAR2) return varchar2 is
tmp varchar(400);
begin
    TMP:='D'||P_DEPT;
 begin   
   IF P_DEPT = 12  OR P_DEPT=237 THEN
         TMP:=''||ZONE_SEQNO;
   END IF;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
