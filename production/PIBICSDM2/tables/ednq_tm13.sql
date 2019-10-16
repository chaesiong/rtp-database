CREATE TABLE "PIBICSDM2"."EDNQ_TM13" 
   (	"TM13_SEQNO" NUMBER, 
	"TM13NO" NUMBER, 
	"TM13YEAR" CHAR(4 CHAR), 
	"DOC_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"EDNQPERSON_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"TMIDDLENM" VARCHAR2(100 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"NATIONCD" CHAR(2 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"BIRTH_CITY" VARCHAR2(60 CHAR), 
	"BIRTH_STATE" VARCHAR2(60 CHAR), 
	"BIRTHCOUNT_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"ALIENCERT_NUMBER" NUMBER, 
	"ALIENCERT_YEAR" CHAR(4 CHAR), 
	"ACISSUE_DATE" DATE, 
	"ACPOLISESTATION_SEQNO" NUMBER, 
	"ACPV_SEQNO" NUMBER, 
	"ACRENEWTYPE" CHAR(1 CHAR), 
	"ACRENEWEXP_DATE" DATE, 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"RCISSUE_DATE" DATE, 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNUNGNO" NUMBER, 
	"RCNO_YEAR" CHAR(4 CHAR), 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"ADDR" VARCHAR2(60 CHAR), 
	"MOO" VARCHAR2(60 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"ROAD" VARCHAR2(60 CHAR), 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(10 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORT_ISSUE" VARCHAR2(50 CHAR), 
	"PASSPORTEXP_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"LEAVE_DATE" DATE, 
	"COUNTCD" CHAR(3 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"TM13STS" CHAR(1 CHAR), 
	"REASONDESC" VARCHAR2(2000 CHAR), 
	"EDMEXP_DATE" DATE, 
	"FEES_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TM13RUNNINGNO" VARCHAR2(14 CHAR), 
	"OTHERNM" VARCHAR2(100 CHAR), 
	"IN_DATE" DATE, 
	"RCISSUEPV_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"OCC_DETAIL" VARCHAR2(60 CHAR), 
	"TEL" VARCHAR2(200 CHAR), 
	"IMGTM13" BLOB, 
	"IMGSTS" CHAR(1 CHAR), 
	"FGPTM13" VARCHAR2(100 CHAR), 
	"FGPREMARK" VARCHAR2(1000 CHAR), 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPMATCHPERCENT" NUMBER, 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"CHKRUNNO" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD CONSTRAINT "EDNQ_TM13_PK" PRIMARY KEY ("TM13_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD CONSTRAINT "EDNQ_TM13_FS_FEES_FK1" FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("ACPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD CONSTRAINT "EDNQ_TM13_PROVINCE_FK1" FOREIGN KEY ("RCISSUEPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("BIRTHCOUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13" ADD FOREIGN KEY ("EDNQPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."EDNQ_PERSON" ("EDNQPERSON_SEQNO") ON DELETE SET NULL DISABLE;
  CREATE INDEX "PIBICSDM2"."EDNQTM13_CERTOFRESIDENCE_INDEX" ON "PIBICSDM2"."EDNQ_TM13" ("CERTOFRESIDENCE_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."EDNQTM13_DOCDATE_INDEX" ON "PIBICSDM2"."EDNQ_TM13" ("DOC_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."EDNQTM13_RCNOPV_INDEX" ON "PIBICSDM2"."EDNQ_TM13" ("RCNO_PVCD") 
  ;
CREATE INDEX "PIBICSDM2"."EDNQTM13_RCNORUNNING_INDEX" ON "PIBICSDM2"."EDNQ_TM13" ("RCNO_RUNNUNGNO") 
  ;
CREATE INDEX "PIBICSDM2"."EDNQTM13_RCNOYEAR_INDEX" ON "PIBICSDM2"."EDNQ_TM13" ("RCNO_YEAR") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."EDNQ_TM13_PK" ON "PIBICSDM2"."EDNQ_TM13" ("TM13_SEQNO") 
  ;
  ;