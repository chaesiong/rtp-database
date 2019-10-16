CREATE TABLE "PIBICSDM2"."LA_VISANO" 
   (	"SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"FMT_DEPT" VARCHAR2(20 CHAR), 
	"FMT_RUNNING" NUMBER, 
	"FMT_CODE_MMR" VARCHAR2(5 CHAR), 
	"ACTFLAG" CHAR(1 CHAR) DEFAULT 'Y', 
	"FMT_CODE_LAO" VARCHAR2(5 CHAR), 
	"FMT_CODE_KHM" VARCHAR2(5 CHAR), 
	"YEAR" VARCHAR2(4 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."LA_VISANO_PK" ON "PIBICSDM2"."LA_VISANO" ("SEQNO") 
  ;