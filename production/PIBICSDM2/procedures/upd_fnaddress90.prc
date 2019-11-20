CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."UPD_FNADDRESS90" IS
tmpVar NUMBER;
BEGIN
declare
timenow varchar2(25);
begin  
        update fn_address90 set fnzone_seqno = 26 
        where ipaddress in ('172.16.2.82','172.16.2.197','172.16.2.198','172.16.2.112','172.16.2.111','172.16.2.212','172.16.2.213','172.16.2.65');

        update fn_address90 set fnzone_seqno = 26 
        where ipaddress in ('172.16.2.80','172.16.2.71','172.16.2.73','172.16.2.84','172.16.2.72','172.16.2.74','172.16.2.81');
        commit;
end;

END UPD_FNADDRESS90;
/
  GRANT EXECUTE ON "PIBICSDM2"."UPD_FNADDRESS90" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."UPD_FNADDRESS90" TO "BIOSAADM";
