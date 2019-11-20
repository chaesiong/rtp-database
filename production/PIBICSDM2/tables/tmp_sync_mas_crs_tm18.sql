CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18" 
   (	"TM18_SEQNO" NUMBER, 
	"TM18NO" VARCHAR2(20 CHAR), 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"DOC_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"ARSNO" VARCHAR2(10 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"OTHERNM" VARCHAR2(100 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BTH_TAMBON" VARCHAR2(50 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"HEIGHT" NUMBER, 
	"MARK" VARCHAR2(60 CHAR), 
	"HOMETOWN_STATE" VARCHAR2(60 CHAR), 
	"HOMETOWNCOUNT_SEQNO" NUMBER, 
	"TADDRNO" VARCHAR2(20 CHAR), 
	"TROAD" VARCHAR2(100 CHAR), 
	"TTMB_SEQNO" NUMBER, 
	"TAMP_SEQNO" NUMBER, 
	"TPV_SEQNO" NUMBER, 
	"TZIPCODE" VARCHAR2(5 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORTISSUE" VARCHAR2(60 CHAR), 
	"VISABYEMBASSY" VARCHAR2(60 CHAR), 
	"VISANO" VARCHAR2(20 CHAR), 
	"VISA_DATE" DATE, 
	"APPVSTS" CHAR(1 CHAR), 
	"APPOINT_DATE" DATE, 
	"REMARK" VARCHAR2(100 CHAR), 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"PROCESSINGISSUE_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"BTH_AMPUR" VARCHAR2(50 CHAR), 
	"BTH_PROVICE" VARCHAR2(50 CHAR), 
	"BTH_COUNTRY" NUMBER, 
	"RACE_SEQNO" NUMBER, 
	"PASSPORTEXP_DATE" DATE, 
	"TM18_RUNNINGNO" VARCHAR2(15 CHAR), 
	"OCC_DETAIL" VARCHAR2(60 CHAR), 
	"RACEOTHER" VARCHAR2(200 CHAR), 
	"IMGTM18" BLOB, 
	"IMGSTS" CHAR(1 CHAR), 
	"FGPTM18" VARCHAR2(100 CHAR), 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPREMARK" VARCHAR2(1000 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"CHKRUNNO" CHAR(1 CHAR), 
	"TM18RUNNO" NUMBER, 
	"TM18YEAR" CHAR(4 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18" ADD CONSTRAINT "TMP_SYNC_MAS_CRS_TM18_PK" PRIMARY KEY ("TM18_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000696731C00057$$" ON "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_CRS_TM18" ("TM18_SEQNO") 
  ;
