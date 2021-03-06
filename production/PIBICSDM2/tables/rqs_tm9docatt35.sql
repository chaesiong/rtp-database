CREATE TABLE "PIBICSDM2"."RQS_TM9DOCATT35" 
   (	"TM9DOCATT35_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"DOCATT35_1" CHAR(1 CHAR), 
	"DOCATT35_2" CHAR(1 CHAR), 
	"DOCATT35_3" CHAR(1 CHAR), 
	"DOCATT35_4" CHAR(1 CHAR), 
	"DOCATT35_5" CHAR(1 CHAR), 
	"DOCATT35_6" CHAR(1 CHAR), 
	"DOCATT35_7" CHAR(1 CHAR), 
	"DOCATT35_8" CHAR(1 CHAR), 
	"DOCATT35_8DESC" VARCHAR2(2000 CHAR), 
	"DOCATT35_9" CHAR(1 CHAR), 
	"DOCATT35_9DESC" VARCHAR2(2000 CHAR), 
	"DOCATT35_10" CHAR(1 CHAR), 
	"DOCATT35_10DESC" VARCHAR2(2000 CHAR), 
	"DOCATT35_11" CHAR(1 CHAR), 
	"DOCATT35_12" CHAR(1 CHAR), 
	"DOCATT35_12DESC" VARCHAR2(2000 CHAR), 
	"DOCATT35_131" CHAR(1 CHAR), 
	"DOCATT35_132" CHAR(1 CHAR), 
	"DOCATT35_133" CHAR(1 CHAR), 
	"DOCATT35_134" CHAR(1 CHAR), 
	"DOCATT35_14" CHAR(1 CHAR), 
	"DOCATT35_141" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"SPECIALTYPE_DESC" VARCHAR2(2000 CHAR), 
	"DOCATT35_142" VARCHAR2(2000 CHAR), 
	"DOCATT35_143" VARCHAR2(2000 CHAR), 
	"DOCATT35_144" VARCHAR2(2000 CHAR), 
	"DOCATT35_145" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT35" ADD CONSTRAINT "RQS_TM9DOCATT35_PK" PRIMARY KEY ("TM9DOCATT35_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_TM9DOCATT35" ADD FOREIGN KEY ("TM9_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_TM9" ("TM9_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM9DOCATT35_PK" ON "PIBICSDM2"."RQS_TM9DOCATT35" ("TM9DOCATT35_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_TM9DOCATT35" TO "BIOSAADM";
