CREATE TABLE "PIBICSDM2"."VALIDATE_EMAIL" 
   (	"VALIDATE_EMAIL_SEQNO" NUMBER, 
	"EMAIL" VARCHAR2(300 CHAR), 
	"UPDATE_DATE" DATE, 
	"DELIVERABLE" CHAR(1 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."VALIDATE_EMAIL_PK" ON "PIBICSDM2"."VALIDATE_EMAIL" ("VALIDATE_EMAIL_SEQNO") 
  ;
