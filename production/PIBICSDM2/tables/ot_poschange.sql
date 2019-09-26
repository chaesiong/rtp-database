CREATE TABLE "PIBICSDM2"."OT_POSCHANGE" 
   (	"OTPOSCHANGESEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_POSCHANGE" ADD CONSTRAINT "OT_POSCHANGE_PK" PRIMARY KEY ("OTPOSCHANGESEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_POSCHANGE_PK" ON "PIBICSDM2"."OT_POSCHANGE" ("OTPOSCHANGESEQNO") 
  ;
