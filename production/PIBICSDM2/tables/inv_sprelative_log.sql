CREATE TABLE "PIBICSDM2"."INV_SPRELATIVE_LOG" 
   (	"SPR_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"RLT_SEQNO" NUMBER, 
	"SPR_TNAME" VARCHAR2(60 CHAR), 
	"SPR_TSNAME" VARCHAR2(60 CHAR), 
	"SPR_ENAME" VARCHAR2(60 CHAR), 
	"SPR_EMNAME" VARCHAR2(60 CHAR), 
	"SPR_ESNAME" VARCHAR2(60 CHAR), 
	"SPR_CARDID" VARCHAR2(13 CHAR), 
	"SPR_PASSNO" VARCHAR2(7 CHAR), 
	"SPR_REMARK" VARCHAR2(500 CHAR), 
	"SPR_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPRELATIVELOG_SEQNO" NUMBER, 
	"SPRELATIVELOG_DATE" TIMESTAMP (6), 
	"SPRELATIVELOG_FLAG" CHAR(1 CHAR), 
	"SPRELATIVELOG_USRUPD" VARCHAR2(20 CHAR), 
	"SUSPECTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPRELATIVE_LOG" ADD CONSTRAINT "INV_SPRELATIVE_LOG_PK" PRIMARY KEY ("SPRELATIVELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPRELATIVE_LOG" ADD CONSTRAINT "INV_SPRELATIVE_LOG_R01" FOREIGN KEY ("SUSPECTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT_LOG" ("SUSPECTLOG_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPRELATIVE_LOG" ADD CONSTRAINT "INV_SPRELATIVE_LOG_R02" FOREIGN KEY ("RLT_SEQNO")
	  REFERENCES "PIBICSDM2"."RELATIVE" ("RLT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPRELATIVE_LOG_PK" ON "PIBICSDM2"."INV_SPRELATIVE_LOG" ("SPRELATIVELOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPRELATIVE_LOG" TO "BIOSAADM";
