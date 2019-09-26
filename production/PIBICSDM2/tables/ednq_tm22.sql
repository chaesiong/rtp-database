CREATE TABLE "PIBICSDM2"."EDNQ_TM22" 
   (	"TM22_SEQNO" NUMBER, 
	"TM22NO" NUMBER, 
	"TM22YEAR" CHAR(4 CHAR), 
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
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"RCISSUE_DATE" DATE, 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNINGNO" NUMBER, 
	"RCNO_YEAR" CHAR(4 CHAR), 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"TM13_SEQNO" NUMBER, 
	"TM13NO" NUMBER, 
	"TM13YEAR" CHAR(4 CHAR), 
	"EDMISSUEBY" VARCHAR2(100 CHAR), 
	"EDMISSUE_DATE" DATE, 
	"EDMEXP_DATE" DATE, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORT_ISSUE" VARCHAR2(50 CHAR), 
	"PASSPORTEXP_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"LEAVE_DATE" DATE, 
	"COUNTCD" CHAR(3 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"TM22TYPE" CHAR(1 CHAR), 
	"PERMIT_SEQNO" NUMBER, 
	"PERMITE_DATE" DATE, 
	"FEES_SEQNO" NUMBER, 
	"TM22STS" CHAR(1 CHAR), 
	"REASONDESC" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"OTHERNM" VARCHAR2(100 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"TM22RUNNINGNO" VARCHAR2(14 CHAR), 
	"RCISSUEPV_SEQNO" NUMBER, 
	"NGISSUE_DATE" DATE, 
	"OCC_DETAIL" VARCHAR2(60 CHAR), 
	"TM22TYPEFLAG" VARCHAR2(1 CHAR), 
	"TEL" VARCHAR2(200 CHAR), 
	"IMGTM22" BLOB, 
	"IMGSTS" CHAR(1 CHAR), 
	"FGPTM22" VARCHAR2(200 CHAR), 
	"FGPREMARK" VARCHAR2(1000 CHAR), 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPMATCHPERCENT" NUMBER, 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"CHKRUNNO" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD CONSTRAINT "EDNQ_TM22_PK" PRIMARY KEY ("TM22_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD CONSTRAINT "EDNQ_TM22_OCCUPATION_FK1" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD CONSTRAINT "EDNQ_TM22_VISATYPE_FK1" FOREIGN KEY ("PERMIT_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD CONSTRAINT "EDNQ_TM22_PROVINCE_FK1" FOREIGN KEY ("RCISSUEPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD FOREIGN KEY ("COUNT_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD FOREIGN KEY ("EDNQPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."EDNQ_PERSON" ("EDNQPERSON_SEQNO") ON DELETE SET NULL DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM22" ADD FOREIGN KEY ("TM13_SEQNO")
	  REFERENCES "PIBICSDM2"."EDNQ_TM13" ("TM13_SEQNO") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EDNQ_TM22_PK" ON "PIBICSDM2"."EDNQ_TM22" ("TM22_SEQNO") 
  ;
  ;
