CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT34" 
   (	"TM9DOCATT34_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"DOCATT34_1" CHAR(1 CHAR), 
	"DOCATT34_2" CHAR(1 CHAR), 
	"DOCATT34_3" CHAR(1 CHAR), 
	"DOCATT34_4" CHAR(1 CHAR), 
	"DOCATT34_5" CHAR(1 CHAR), 
	"DOCATT34_61" CHAR(1 CHAR), 
	"DOCATT34_62" CHAR(1 CHAR), 
	"DOCATT34_7" CHAR(1 CHAR), 
	"DOCATT34_8" CHAR(1 CHAR), 
	"DOCATT34_8DESC" VARCHAR2(2000 CHAR), 
	"DOCATT34_9" CHAR(1 CHAR), 
	"DOCATT34_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT34_10" CHAR(1 CHAR), 
	"DOCATT34_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT34_11" CHAR(1 CHAR), 
	"DOCATT34_12" CHAR(1 CHAR), 
	"DOCATT34_12DESC" VARCHAR2(2000 CHAR), 
	"DOCATT34_131" CHAR(1 CHAR), 
	"DOCATT34_132" CHAR(1 CHAR), 
	"DOCATT34_133" CHAR(1 CHAR), 
	"DOCATT34_134" CHAR(1 CHAR), 
	"DOCATT34_14" CHAR(1 CHAR), 
	"DOCATT34_141" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOCATT34_142" VARCHAR2(2000 CHAR), 
	"DOCATT34_143" VARCHAR2(2000 CHAR), 
	"DOCATT34_144" VARCHAR2(2000 CHAR), 
	"DOCATT34_145" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT34" ADD CONSTRAINT "RQS_TM9DOCATT34_PK" PRIMARY KEY ("TM9DOCATT34_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT34" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT34_PK" ON "PIBICSDM2"."RQS_TM9DOCATT34" ("TM9DOCATT34_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_TM9DOCATT34" TO "BIOSAADM";
