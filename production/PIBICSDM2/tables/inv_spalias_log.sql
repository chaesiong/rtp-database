CREATE TABLE "PIBICSDM2"."INV_SPALIAS_LOG" 
   (	"SPA_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPA_ALIASTYPE" VARCHAR2(20 CHAR), 
	"SPA_ALIAS" VARCHAR2(60 CHAR), 
	"SPA_REMARK" VARCHAR2(500 CHAR), 
	"SPA_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPALIASLOG_SEQNO" NUMBER, 
	"SPALIASLOG_DATE" TIMESTAMP (6), 
	"SPALIASLOG_FLAG" CHAR(1 CHAR), 
	"SPALIASLOG_USRUPD" VARCHAR2(20 CHAR), 
	"SUSPECTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPALIAS_LOG" ADD CONSTRAINT "INV_SPALIAS_LOG_PK" PRIMARY KEY ("SPALIASLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPALIAS_LOG" ADD CONSTRAINT "INV_SPALIAS_LOG_R01" FOREIGN KEY ("SUSPECTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT_LOG" ("SUSPECTLOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPALIAS_LOG_PK" ON "PIBICSDM2"."INV_SPALIAS_LOG" ("SPALIASLOG_SEQNO") 
  ;
