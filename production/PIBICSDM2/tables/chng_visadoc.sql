CREATE TABLE "PIBICSDM2"."CHNG_VISADOC" 
   (	"VISADOC_SEQNO" NUMBER, 
	"VISADOCNM" VARCHAR2(300 CHAR), 
	"VISADOC_RUNNING" NUMBER, 
	"VISADOC_STS" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."CHNG_VISADOC_PK" ON "PIBICSDM2"."CHNG_VISADOC" ("VISADOC_SEQNO") 
  ;
