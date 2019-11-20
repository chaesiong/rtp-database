CREATE TABLE "PIBICSDM2"."CRS_DEPOSITION" 
   (	"DEPOSITION_SEQNO" NUMBER, 
	"TMNO" VARCHAR2(20 CHAR), 
	"CRSTM18_SEQNO" NUMBER, 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"NOTICE_OF" VARCHAR2(1000 CHAR), 
	"TESTIFY" VARCHAR2(1000 CHAR), 
	"PSTATION" VARCHAR2(1000 CHAR), 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"DOC_DATE" TIMESTAMP (6), 
	"CHARGER" VARCHAR2(1000 CHAR), 
	"SUSPECT" VARCHAR2(1000 CHAR), 
	"OFFICER_NAME" VARCHAR2(1000 CHAR), 
	"OFFICER_POSITION" VARCHAR2(1000 CHAR), 
	"INVESTIGATION" VARCHAR2(1000 CHAR), 
	"NAME_NOTICE" VARCHAR2(1000 CHAR), 
	"AGE" NUMBER, 
	"RACE" VARCHAR2(500 CHAR), 
	"NATION" VARCHAR2(500 CHAR), 
	"RELIGION" VARCHAR2(500 CHAR), 
	"OCC_DESC" VARCHAR2(1000 CHAR), 
	"ADDR" VARCHAR2(500 CHAR), 
	"MOO" VARCHAR2(500 CHAR), 
	"TAMBON" VARCHAR2(500 CHAR), 
	"HEADMAN" VARCHAR2(500 CHAR), 
	"VILLAGE_CHIEF" VARCHAR2(500 CHAR), 
	"HEAD_AMP_SEQNO" NUMBER, 
	"HEAD_PV_SEQNO" NUMBER, 
	"FATHERNM" VARCHAR2(500 CHAR), 
	"MOTHERNM" VARCHAR2(500 CHAR), 
	"RELATION" VARCHAR2(500 CHAR), 
	"ASK_ANSWER" CLOB, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"DOC_FLAG" CHAR(1 CHAR), 
	"CRSTM20_SEQNO" NUMBER, 
	"SEX" VARCHAR2(1 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"VERSION" NUMBER, 
	"NATION_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."CRS_DEPOSITION" ADD CONSTRAINT "CRS_DEPOSITION_AMPUR_FK1" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_DEPOSITION" ADD CONSTRAINT "CRS_DEPOSITION_PROVINCE_FK1" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_DEPOSITION" ADD CONSTRAINT "CRS_DEPOSITION_AMPUR_FK2" FOREIGN KEY ("HEAD_AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_DEPOSITION" ADD CONSTRAINT "CRS_DEPOSITION_PROVINCE_FK2" FOREIGN KEY ("HEAD_PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_DEPOSITION" ADD CONSTRAINT "CRS_DEPOSITION_COUNTRY_FK1" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CRS_DEPOSITION_PK" ON "PIBICSDM2"."CRS_DEPOSITION" ("DEPOSITION_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300957C00032$$" ON "PIBICSDM2"."CRS_DEPOSITION" (
  ;
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CRS_DEPOSITION" TO "BIOSAADM";
