CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ZONESEQNOBYIP" (P_DEPT VARCHAR2,P_IPADDRESS varchar2) return varchar2 is
tmp varchar(400);
begin
    SELECT 'D'||get_deptseqnoL2(P_DEPT) INTO TMP FROM DUAL;
 begin   
   IF P_DEPT = 12 OR P_DEPT=237 OR P_DEPT =43 THEN
        SELECT REPSZONE_SEQNO INTO TMP FROM MAPPINGIP WHERE IPADDRESS= P_IPADDRESS;
   END IF;
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
