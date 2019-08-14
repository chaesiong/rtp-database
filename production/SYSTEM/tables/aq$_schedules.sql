CREATE TABLE "SYSTEM"."AQ$_SCHEDULES" SHARING=METADATA 
   (	"OID" RAW(16), 
	"DESTINATION" VARCHAR2(390) NOT NULL ENABLE, 
	"START_TIME" DATE, 
	"DURATION" VARCHAR2(8), 
	"NEXT_TIME" VARCHAR2(128), 
	"LATENCY" VARCHAR2(8), 
	"LAST_TIME" DATE, 
	"JOBNO" NUMBER
   ) ;
  ALTER TABLE "SYSTEM"."AQ$_SCHEDULES" ADD CONSTRAINT "AQ$_SCHEDULES_PRIMARY" PRIMARY KEY ("OID", "DESTINATION")
  USING INDEX  ENABLE;
  ALTER TABLE "SYSTEM"."AQ$_SCHEDULES" ADD CONSTRAINT "AQ$_SCHEDULES_CHECK" UNIQUE ("JOBNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SYSTEM"."AQ$_SCHEDULES_CHECK" ON "SYSTEM"."AQ$_SCHEDULES" ("JOBNO") 
  ;
CREATE UNIQUE INDEX "SYSTEM"."AQ$_SCHEDULES_PRIMARY" ON "SYSTEM"."AQ$_SCHEDULES" ("OID", "DESTINATION") 
  ;
