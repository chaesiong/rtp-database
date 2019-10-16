CREATE TABLE "PIBICSDM2"."REPS_TM8" 
   (	"TM8_SEQNO" NUMBER, 
	"TM8NO" NUMBER, 
	"YEAR" CHAR(4 CHAR), 
	"FEES_SEQNO" NUMBER, 
	"WRITTEN" NVARCHAR2(20), 
	"PERSONID" VARCHAR2(20 CHAR), 
	"FAMILYNM" VARCHAR2(100 CHAR), 
	"FIRSTNM" VARCHAR2(100 CHAR), 
	"MIDDLENM" VARCHAR2(100 CHAR), 
	"NATIONAL_SEQNO" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"BIRTH_PLACE" VARCHAR2(2000 CHAR), 
	"BIRTHCOUNT_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORTEXP_DATE" DATE, 
	"PASSPORTISSUEBY" VARCHAR2(2000 CHAR), 
	"CHILDNO" NUMBER(*,0), 
	"ADDR" VARCHAR2(2500 CHAR), 
	"ROAD" VARCHAR2(2500 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"VISANO" VARCHAR2(20 CHAR), 
	"TDT_SEQNO" NUMBER, 
	"VISAISSUE" VARCHAR2(2500 CHAR), 
	"VISA_DATE" DATE, 
	"OPERMIT_SEQNO" NUMBER, 
	"ARRIVE_DATE" DATE, 
	"OPERMIT_DATE" DATE, 
	"DOCTYPE" CHAR(1 CHAR), 
	"PURPOSECOUNT_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"LEAVE_DATE" DATE, 
	"RETURN_DATE" DATE, 
	"PURPOSE" VARCHAR2(2500 CHAR), 
	"APPVSTS" CHAR(1 CHAR), 
	"DOC_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"PERMIT_STATUS" CHAR(1 CHAR), 
	"NEWPERMIT_DATE" DATE, 
	"REASON_SEQNO" NUMBER, 
	"REASONDESC" VARCHAR2(2500 CHAR), 
	"TM6_SEQNO" NUMBER, 
	"ENDPERMIT_DATE" DATE, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"OVISATYPE_SEQNO" NUMBER, 
	"TODAY_DATE" DATE, 
	"IMGINOUT" BLOB, 
	"TM6NO" VARCHAR2(7 CHAR), 
	"APPVSTSBYDATE" DATE, 
	"APPVSTSBYDEPT_SEQNO" NUMBER, 
	"FLAG_BOI" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"T_IDICONCEPT" VARCHAR2(50 CHAR), 
	"ZONE_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"EXTLIST_SEQNO" NUMBER, 
	"MANUALTM8" VARCHAR2(1 CHAR), 
	"REPSPERSON_SEQNO" NUMBER, 
	"TELEPHONE" VARCHAR2(500 CHAR), 
	"IMG_PERSON" BLOB, 
	"FLAG_QUEONLINE" CHAR(1 CHAR), 
	"PD_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_PK" PRIMARY KEY ("TM8_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_REPS_PERSON_FK1" FOREIGN KEY ("REPSPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."REPS_PERSON" ("REPSPERSON_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R12" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R11" FOREIGN KEY ("PURPOSECOUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R05" FOREIGN KEY ("BIRTHCOUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R03" FOREIGN KEY ("NATIONAL_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R07" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R04" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R02" FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R10" FOREIGN KEY ("OPERMIT_SEQNO")
	  REFERENCES "PIBICSDM2"."PERMITTYPE" ("PERMIT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R08" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R16" FOREIGN KEY ("OVISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."REPS_TM8" ADD CONSTRAINT "REPS_TM8_R06" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."REPS_IPADDRESS_INDEX" ON "PIBICSDM2"."REPS_TM8" ("IPADDRESS") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_COMPOSITE_IDX1" ON "PIBICSDM2"."REPS_TM8" ("NATIONAL_SEQNO", "PASSPORTNO", "BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_CREATE_BY_IDX" ON "PIBICSDM2"."REPS_TM8" ("CREATE_BY") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_CREDTE_IDX" ON "PIBICSDM2"."REPS_TM8" ("CREATE_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_DOC_IDX" ON "PIBICSDM2"."REPS_TM8" (TO_CHAR("DOC_DATE",'dd/mm/yyyy')) 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_DOC_MM_IDX" ON "PIBICSDM2"."REPS_TM8" (TO_CHAR("DOC_DATE",'MM')) 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_DOC_YYYYMM_IDX" ON "PIBICSDM2"."REPS_TM8" (TO_CHAR("DOC_DATE",'YYYYMM')) 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_DOC_YYYY_IDX" ON "PIBICSDM2"."REPS_TM8" (TO_CHAR("DOC_DATE",'YYYY')) 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_FEES_IDX" ON "PIBICSDM2"."REPS_TM8" ("FEES_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX1" ON "PIBICSDM2"."REPS_TM8" ("TM8NO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX2" ON "PIBICSDM2"."REPS_TM8" ("YEAR") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX3" ON "PIBICSDM2"."REPS_TM8" ("DEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX4" ON "PIBICSDM2"."REPS_TM8" ("APPVSTSBYDEPT_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX5" ON "PIBICSDM2"."REPS_TM8" ("NATIONAL_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX6" ON "PIBICSDM2"."REPS_TM8" ("OVISATYPE_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_INDEX7" ON "PIBICSDM2"."REPS_TM8" ("EXTLIST_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_NEWPERMIT_IDX" ON "PIBICSDM2"."REPS_TM8" ("NEWPERMIT_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_TM8_PASSPORTNO_IDX" ON "PIBICSDM2"."REPS_TM8" ("PASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."REPS_ZONE_SEQNO_INDEX" ON "PIBICSDM2"."REPS_TM8" ("ZONE_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."REPS_TM8_PK" ON "PIBICSDM2"."REPS_TM8" ("TM8_SEQNO") 
  ;
  ;
  ;