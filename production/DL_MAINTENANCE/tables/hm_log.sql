CREATE TABLE "DL_MAINTENANCE"."HM_LOG" 
   (	"ID" NUMBER DEFAULT "DL_MAINTENANCE"."HM_LOG_S"."NEXTVAL", 
	"TSTAMP" DATE, 
	"MESSAGE" VARCHAR2(2000), 
	"ADD_DATA" CLOB
   ) ;
  CREATE INDEX "DL_MAINTENANCE"."HM_LOG_DATE" ON "DL_MAINTENANCE"."HM_LOG" ("TSTAMP") 
  ;
CREATE UNIQUE INDEX "DL_MAINTENANCE"."SYS_IL0000572874C00004$$" ON "DL_MAINTENANCE"."HM_LOG" (
  ;
  GRANT SELECT ON "DL_MAINTENANCE"."HM_LOG" TO "APPSUP";
  GRANT SELECT ON "DL_MAINTENANCE"."HM_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_MAINTENANCE"."HM_LOG" TO "BIOSUPPORT";
  GRANT SELECT ON "DL_MAINTENANCE"."HM_LOG" TO "BIOSAADM";