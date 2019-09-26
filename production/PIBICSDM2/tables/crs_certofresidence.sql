CREATE TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" 
   (	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"PAIDBOOK_DATE" DATE, 
	"CONTROLBOOK_NO" VARCHAR2(10 CHAR), 
	"FEES_SEQNO" NUMBER, 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNINGNO" NUMBER, 
	"RCNO_YEAR" VARCHAR2(4 CHAR), 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"RCISSUE_DATE" DATE, 
	"RCISSUEPV_SEQNO" NUMBER, 
	"RCISSUEAMP_SEQNO" NUMBER, 
	"QUOTATYPE" VARCHAR2(15 CHAR), 
	"QUOTANO" VARCHAR2(10 CHAR), 
	"QUOTA_DATE" DATE, 
	"ISSUETIME" VARCHAR2(200 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"OTHERNM" VARCHAR2(60 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"BIRTH_COUNTRY" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"NATION_SEQNO" NUMBER, 
	"HEIGHT" NUMBER, 
	"MARK" VARCHAR2(60 CHAR), 
	"ADDR" VARCHAR2(15 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"ZIPCODE" VARCHAR2(5 CHAR), 
	"REMARK" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CRS_STS" CHAR(1 CHAR), 
	"CRS_SCAN" BLOB, 
	"RACE" NUMBER, 
	"REVOKE_DEPT_SEQNO" NUMBER, 
	"REMARK_TYPE" VARCHAR2(1 CHAR), 
	"OCC_DETAIL" VARCHAR2(60 CHAR), 
	"T_IDICONCEPT" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"IMGCRS" BLOB, 
	"IMGSTS" CHAR(1 CHAR), 
	"FGPCRS" VARCHAR2(1000 CHAR), 
	"FGPREMARK" VARCHAR2(1000 CHAR), 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPMATCHPERCENT" NUMBER, 
	"TM18_SEQNO" NUMBER, 
	"TM20_SEQNO" NUMBER, 
	"TEL" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD CONSTRAINT "CRS_CERTOFRESIDENCE_PK" PRIMARY KEY ("CERTOFRESIDENCE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD CONSTRAINT "CRS_CERTOFRESIDENCE_COUNT_FK2" FOREIGN KEY ("BIRTH_COUNTRY")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD CONSTRAINT "CRS_CERTOFRESIDENCE_COUNT_FK1" FOREIGN KEY ("RACE")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD CONSTRAINT "CRS_CERTOFRESIDENCE_AMPUR_FK1" FOREIGN KEY ("RCISSUEAMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_CERTOFRESIDENCE" ADD FOREIGN KEY ("RCISSUEPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CRS_CERTOFRESIDENCE_PK" ON "PIBICSDM2"."CRS_CERTOFRESIDENCE" ("CERTOFRESIDENCE_SEQNO") 
  ;
  ;
  ;
