CREATE TABLE "PIBICSDM2"."HR_PROFILE" 
   (	"PROFILE_SEQNO" NUMBER, 
	"PID" VARCHAR2(13 CHAR), 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"LEVEL_SEQNO" VARCHAR2(3 CHAR), 
	"REL_SEQNO" VARCHAR2(2 CHAR), 
	"TITLE_SEQNO" VARCHAR2(3 CHAR), 
	"CARD_ID" VARCHAR2(13 CHAR), 
	"NAME" VARCHAR2(25 CHAR), 
	"SNAME" VARCHAR2(25 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"C_TYPE" CHAR(1 CHAR), 
	"MAR_STATUS" CHAR(1 CHAR), 
	"STATUS_SEQNO" VARCHAR2(3 CHAR), 
	"BIRTH_DATE" VARCHAR2(8 CHAR), 
	"POS_SEQNO" VARCHAR2(8 CHAR), 
	"KP7" VARCHAR2(10 CHAR), 
	"RETIRE_DATE" VARCHAR2(8 CHAR), 
	"SIXTY_DATE" VARCHAR2(8 CHAR), 
	"QUIT_DATE" VARCHAR2(8 CHAR), 
	"BANK_SEQNO" VARCHAR2(2 CHAR), 
	"ACC_NO" VARCHAR2(20 CHAR), 
	"ADDRESS1" VARCHAR2(50 CHAR), 
	"ADDRESS2" VARCHAR2(50 CHAR), 
	"PROV_CODE" VARCHAR2(2 CHAR), 
	"POST_CODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(15 CHAR), 
	"MOBILE" VARCHAR2(10 CHAR), 
	"EMAIL" VARCHAR2(50 CHAR), 
	"HEALTH_BENEFIT" VARCHAR2(1 CHAR), 
	"CREMATION" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"POS_DATE" VARCHAR2(8 CHAR), 
	"POS_NO" VARCHAR2(20 CHAR), 
	"STATUS_TM" CHAR(1 CHAR), 
	"DEPTPOLIS_SEQNO" VARCHAR2(10 CHAR), 
	"PD_SEQNO" NUMBER, 
	"SHIFT_SEQNO" VARCHAR2(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."HR_PROFILE" ADD CONSTRAINT "HR_PROFILE_PK" PRIMARY KEY ("PROFILE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."HR_PROFILE" ADD CONSTRAINT "HR_PROFILE_R06" FOREIGN KEY ("STATUS_SEQNO")
	  REFERENCES "PIBICSDM2"."STATUS" ("STATUS_CODE") DISABLE;
  ALTER TABLE "PIBICSDM2"."HR_PROFILE" ADD CONSTRAINT "HR_PROFILE_R05" FOREIGN KEY ("TITLE_SEQNO")
	  REFERENCES "PIBICSDM2"."TITLE" ("TITLE_CODE") DISABLE;
  ALTER TABLE "PIBICSDM2"."HR_PROFILE" ADD CONSTRAINT "HR_PROFILE_R04" FOREIGN KEY ("POS_SEQNO")
	  REFERENCES "PIBICSDM2"."POSITION" ("POS_CODE") DISABLE;
  ALTER TABLE "PIBICSDM2"."HR_PROFILE" ADD CONSTRAINT "HR_PROFILE_R02" FOREIGN KEY ("REL_SEQNO")
	  REFERENCES "PIBICSDM2"."RELIGION" ("REL_CODE") DISABLE;
  CREATE INDEX "PIBICSDM2"."HR_PROFILE_DEPTSEQNO_IDX" ON "PIBICSDM2"."HR_PROFILE" ("DEPT_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."HR_PROFILE_PK" ON "PIBICSDM2"."HR_PROFILE" ("PROFILE_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."HR_PROFILE" TO "BIOSAADM";
