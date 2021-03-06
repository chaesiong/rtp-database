CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT3342" 
   (	"TM9DOCATT3342_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"DOCATT3342_1" CHAR(1 CHAR), 
	"DOCATT3342_2" CHAR(1 CHAR), 
	"DOCATT3342_3" CHAR(1 CHAR), 
	"DOCATT3342_41" CHAR(1 CHAR), 
	"DOCATT3342_42" CHAR(1 CHAR), 
	"DOCATT3342_43" CHAR(1 CHAR), 
	"DOCATT3342_44" CHAR(1 CHAR), 
	"DOCATT3342_5" CHAR(1 CHAR), 
	"DOCATT3342_5DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_61" CHAR(1 CHAR), 
	"DOCATT3342_62" CHAR(1 CHAR), 
	"DOCATT3342_71" CHAR(1 CHAR), 
	"DOCATT3342_72" CHAR(1 CHAR), 
	"DOCATT3342_81" CHAR(1 CHAR), 
	"DOCATT3342_82" CHAR(1 CHAR), 
	"DOCATT3342_9" CHAR(1 CHAR), 
	"DOCATT3342_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_10" CHAR(1 CHAR), 
	"DOCATT3342_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_11" CHAR(1 CHAR), 
	"DOCATT3342_12" CHAR(1 CHAR), 
	"DOCATT3342_13" CHAR(1 CHAR), 
	"DOCATT3342_13DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_14" CHAR(1 CHAR), 
	"DOCATT3342_15" CHAR(1 CHAR), 
	"DOCATT3342_15DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_16" CHAR(1 CHAR), 
	"DOCATT3342_17" CHAR(1 CHAR), 
	"DOCATT3342_18" CHAR(1 CHAR), 
	"DOCATT3342_19" CHAR(1 CHAR), 
	"DOCATT3342_20" CHAR(1 CHAR), 
	"DOCATT3342_20DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_211" CHAR(1 CHAR), 
	"DOCATT3342_212" CHAR(1 CHAR), 
	"DOCATT3342_213" CHAR(1 CHAR), 
	"DOCATT3342_22" CHAR(1 CHAR), 
	"DOCATT3342_22DESC" VARCHAR2(2000 CHAR), 
	"DOCATT3342_23" CHAR(1 CHAR), 
	"DOCATT3342_231" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT3342_232" VARCHAR2(2000 CHAR), 
	"DOCATT3342_233" VARCHAR2(2000 CHAR), 
	"DOCATT3342_234" VARCHAR2(2000 CHAR), 
	"DOCATT3342_235" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3342" ADD CONSTRAINT "RQS_TM9DOCATT3342_PK" PRIMARY KEY ("TM9DOCATT3342_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT3342" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT3342_PK" ON "PIBICSDM2"."RQS_TM9DOCATT3342" ("TM9DOCATT3342_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_TM9DOCATT3342" TO "BIOSAADM";
