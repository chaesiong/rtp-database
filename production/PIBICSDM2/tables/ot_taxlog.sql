CREATE TABLE "PIBICSDM2"."OT_TAXLOG" 
   (	"TAXLOGSEQNO" NUMBER, 
	"TAXSEQNO" NUMBER, 
	"POSLEVEL_SEQNO" NUMBER, 
	"TAXRATE" NUMBER, 
	"ACTFLAG" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(10 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_TAXLOG" ADD CONSTRAINT "OT_TAXLOG_PK" PRIMARY KEY ("TAXLOGSEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OT_TAXLOG" ADD CONSTRAINT "OT_TAXLOG_R01" FOREIGN KEY ("POSLEVEL_SEQNO")
	  REFERENCES "PIBICSDM2"."POSLEVEL" ("POSLEVEL_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_TAXLOG_PK" ON "PIBICSDM2"."OT_TAXLOG" ("TAXLOGSEQNO") 
  ;
