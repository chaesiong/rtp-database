CREATE TABLE "PIBICSDM2"."DISC_COMPLAIN" 
   (	"COM_SEQNO" NUMBER, 
	"COM_DATE" DATE, 
	"COM_CHANNEL" VARCHAR2(100 CHAR), 
	"COM_CNL_OTHER" VARCHAR2(100 CHAR), 
	"COM_IDEN_NAME" CHAR(1 CHAR), 
	"COM_FNAME" VARCHAR2(30 CHAR), 
	"COM_LNAME" VARCHAR2(30 CHAR), 
	"COM_TYPE" VARCHAR2(100 CHAR), 
	"COM_TYPE_OTHER" VARCHAR2(100 CHAR), 
	"COM_RESULT" VARCHAR2(1000 CHAR), 
	"COM_PROCESSDATE" DATE, 
	"COM_FINISHDATE" DATE, 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"COM_CODE" VARCHAR2(40 CHAR), 
	"COM_REMARK" VARCHAR2(1000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."DISC_COMPLAIN" ADD CONSTRAINT "DISC_COMPLAIN_PK" PRIMARY KEY ("COM_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DISC_COMPLAIN_PK" ON "PIBICSDM2"."DISC_COMPLAIN" ("COM_SEQNO") 
  ;
