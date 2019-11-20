CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT3341" 
   (	"TM9DOCATT3341_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"DOCATT3341_1" CHAR(1 CHAR), 
	"DOCATT3341_2" CHAR(1 CHAR), 
	"DOCATT3341_3" CHAR(1 CHAR), 
	"DOCATT3341_41" CHAR(1 CHAR), 
	"DOCATT3341_42" CHAR(1 CHAR), 
	"DOCATT3341_43" CHAR(1 CHAR), 
	"DOCATT3341_44" CHAR(1 CHAR), 
	"DOCATT3341_5" CHAR(1 CHAR), 
	"DOCATT3341_5DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_6" CHAR(1 CHAR), 
	"DOCATT3341_71" CHAR(1 CHAR), 
	"DOCATT3341_72" CHAR(1 CHAR), 
	"DOCATT3341_81" CHAR(1 CHAR), 
	"DOCATT3341_82" CHAR(1 CHAR), 
	"DOCATT3341_9" CHAR(1 CHAR), 
	"DOCATT3341_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_10" CHAR(1 CHAR), 
	"DOCATT3341_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_11" CHAR(1 CHAR), 
	"DOCATT3341_12" CHAR(1 CHAR), 
	"DOCATT3341_13" CHAR(1 CHAR), 
	"DOCATT3341_13DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_14" CHAR(1 CHAR), 
	"DOCATT3341_15" CHAR(1 CHAR), 
	"DOCATT3341_15DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_16" CHAR(1 CHAR), 
	"DOCATT3341_17" CHAR(1 CHAR), 
	"DOCATT3341_18" CHAR(1 CHAR), 
	"DOCATT3341_19" CHAR(1 CHAR), 
	"DOCATT3341_20" CHAR(1 CHAR), 
	"DOCATT3341_20DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_211" CHAR(1 CHAR), 
	"DOCATT3341_212" CHAR(1 CHAR), 
	"DOCATT3341_213" CHAR(1 CHAR), 
	"DOCATT3341_22" CHAR(1 CHAR), 
	"DOCATT3341_22DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3341_23" CHAR(1 CHAR), 
	"DOCATT3341_231" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT3341_232" VARCHAR2(2000 CHAR), 
	"DOCATT3341_233" VARCHAR2(2000 CHAR), 
	"DOCATT3341_234" VARCHAR2(2000 CHAR), 
	"DOCATT3341_235" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3341" ADD CONSTRAINT "RQS_TM9DOCATT3341_PK" PRIMARY KEY ("TM9DOCATT3341_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3341" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT3341_PK" ON "PIBICSDM2"."RQS_TM9DOCATT3341" ("TM9DOCATT3341_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_TM9DOCATT3341" TO "BIOSAADM";
