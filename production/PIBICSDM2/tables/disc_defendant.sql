CREATE TABLE "PIBICSDM2"."DISC_DEFENDANT" 
   (	"DEF_SEQNO" NUMBER, 
	"DEF_RANK" VARCHAR2(40 CHAR), 
	"DEF_NAME" VARCHAR2(80 CHAR), 
	"DEF_SNAME" VARCHAR2(80 CHAR), 
	"DEF_DEPTABBFMT1" VARCHAR2(200 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"COM_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DISC_DEFENDANT" ADD FOREIGN KEY ("COM_SEQNO")
	  REFERENCES "PIBICSDM2"."DISC_COMPLAIN" ("COM_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DISC_DEFENDANT_PK" ON "PIBICSDM2"."DISC_DEFENDANT" ("DEF_SEQNO") 
  ;