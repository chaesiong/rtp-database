CREATE TABLE "PIBICSDM2"."INV_SPSPECIALBEHAVIOR_LOG" 
   (	"SPS_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPS_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPSPECIALBEHAVIORLOG_SEQNO" NUMBER, 
	"SPSPECIALBEHAVIORLOG_DATE" TIMESTAMP (6), 
	"SPSPECIALBEHAVIORLOG_FLAG" CHAR(1 CHAR), 
	"SPSPECIALBEHAVIORLOG_USRUPD" VARCHAR2(20 CHAR), 
	"SPS_BEHAVIOR" CLOB, 
	"SPS_REMARK" CLOB, 
	"SUSPECTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPSPECIALBEHAVIOR_LOG" ADD CONSTRAINT "INV_SPSPECIALBEHAVIOR_LOG_PK" PRIMARY KEY ("SPSPECIALBEHAVIORLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPSPECIALBEHAVIOR_LOG" ADD CONSTRAINT "INV_SPSPECIALBEHAVIOR_LOG_R01" FOREIGN KEY ("SUSPECTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT_LOG" ("SUSPECTLOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPSPECIALBEHAVIOR_LOG_PK" ON "PIBICSDM2"."INV_SPSPECIALBEHAVIOR_LOG" ("SPSPECIALBEHAVIORLOG_SEQNO") 
  ;
  ;
  ;
