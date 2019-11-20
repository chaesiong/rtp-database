CREATE TABLE "PIBICSDM2"."TM61_TRANSFER_DATA" 
   (	"ROUNDNO" NUMBER, 
	"TYPEDATA" CHAR(1 CHAR), 
	"RECORDCOUNT" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"STATUS" CHAR(1 CHAR), 
	"STARTTIME" VARCHAR2(20 CHAR), 
	"ENDTIME" VARCHAR2(20 CHAR), 
	"ISSUCCESS" CHAR(1 CHAR), 
	"MSG_ERR" VARCHAR2(500 CHAR), 
	"DATE_REQUEST" VARCHAR2(8 CHAR), 
	"CALLBY_USER" VARCHAR2(20 CHAR), 
	"CALLBY_IP" VARCHAR2(20 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TM61_TRANSFER_DATA" TO "BIOSAADM";
