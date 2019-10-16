CREATE TABLE "PIBICSDM2"."HR_PROFILE_PIBICS" 
   (	"PROFILE_SEQNO" NUMBER NOT NULL ENABLE, 
	"PID" VARCHAR2(39), 
	"RANK_SEQNO" VARCHAR2(9), 
	"LEVEL_SEQNO" VARCHAR2(9), 
	"REL_SEQNO" VARCHAR2(6), 
	"TITLE_SEQNO" VARCHAR2(9), 
	"CARD_ID" VARCHAR2(39), 
	"NAME" VARCHAR2(75), 
	"SNAME" VARCHAR2(75), 
	"SEX" CHAR(3), 
	"C_TYPE" CHAR(3), 
	"MAR_STATUS" CHAR(3), 
	"STATUS_SEQNO" VARCHAR2(9), 
	"BIRTH_DATE" VARCHAR2(24), 
	"POS_SEQNO" VARCHAR2(24), 
	"KP7" VARCHAR2(30), 
	"RETIRE_DATE" VARCHAR2(24), 
	"SIXTY_DATE" VARCHAR2(24), 
	"QUIT_DATE" VARCHAR2(24), 
	"BANK_SEQNO" VARCHAR2(6), 
	"ACC_NO" VARCHAR2(60), 
	"ADDRESS1" VARCHAR2(150), 
	"ADDRESS2" VARCHAR2(150), 
	"PROV_CODE" VARCHAR2(6), 
	"POST_CODE" VARCHAR2(15), 
	"TEL" VARCHAR2(45), 
	"MOBILE" VARCHAR2(30), 
	"EMAIL" VARCHAR2(150), 
	"HEALTH_BENEFIT" VARCHAR2(3), 
	"CREMATION" CHAR(3), 
	"CREATE_BY" VARCHAR2(60), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(60), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"POS_DATE" VARCHAR2(24), 
	"POS_NO" VARCHAR2(60), 
	"STATUS_TM" CHAR(3), 
	"DEPTPOLIS_SEQNO" VARCHAR2(30), 
	"PD_SEQNO" NUMBER, 
	"SHIFT_SEQNO" VARCHAR2(3)
   ) ;
  ALTER TABLE "PIBICSDM2"."HR_PROFILE_PIBICS" ADD CONSTRAINT "SYS_C_SNAP$_222HR_PROFILE_PK" PRIMARY KEY ("PROFILE_SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON MATERIALIZED VIEW "PIBICSDM2"."HR_PROFILE_PIBICS"  IS 'snapshot table for snapshot PIBICSDM2.HR_PROFILE_PIBICS';
  ;