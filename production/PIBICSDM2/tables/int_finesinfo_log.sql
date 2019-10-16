CREATE TABLE "PIBICSDM2"."INT_FINESINFO_LOG" 
   (	"FI_SEQNO" NUMBER, 
	"FI_IDCARD" VARCHAR2(13 CHAR), 
	"FI_TNAME" VARCHAR2(20 CHAR), 
	"FI_TSNAME" VARCHAR2(20 CHAR), 
	"FI_ENAME" VARCHAR2(20 CHAR), 
	"FI_EMNAME" VARCHAR2(20 CHAR), 
	"FI_ESNAME" VARCHAR2(20 CHAR), 
	"COUNT_SEQNO1" NUMBER, 
	"COUNT_SEQNO2" NUMBER, 
	"FI_GENDER" CHAR(1 CHAR), 
	"FI_BIRTHDATE" VARCHAR2(10 CHAR), 
	"FI_PASSNO" VARCHAR2(20 CHAR), 
	"FI_PASSISSUE" VARCHAR2(20 CHAR), 
	"FI_PASSISSUEDATE" DATE, 
	"FI_PASSEXPIREDATE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"FI_VISAEXPIREDATE" DATE, 
	"FI_TM6" VARCHAR2(7 CHAR), 
	"FI_EVENTADDR" VARCHAR2(60 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"FI_PLAINTIFFNM" VARCHAR2(30 CHAR), 
	"FI_PLAINTIFFSNM" VARCHAR2(30 CHAR), 
	"FI_PLAINTIFF_ID" VARCHAR2(13 CHAR), 
	"FI_PLAINTIFF_ADDR" VARCHAR2(60 CHAR), 
	"PV_SEQNO_PT" NUMBER, 
	"AMP_SEQNO_PT" NUMBER, 
	"TMB_SEQNO_PT" NUMBER, 
	"FI_ACCUSE" VARCHAR2(200 CHAR), 
	"FI_ACC_REMARK" VARCHAR2(500 CHAR), 
	"PRATE_SEQNO" NUMBER, 
	"FI_FINE_REMARK" VARCHAR2(200 CHAR), 
	"FINESSEQNO" NUMBER, 
	"FI_REMARK1" VARCHAR2(200 CHAR), 
	"FI_REMARK2" VARCHAR2(200 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"VERSION" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"FI_FINESSTATUS" CHAR(1 CHAR), 
	"INTFINESINFOLOG_SEQNO" NUMBER, 
	"INTFINESINFOLOG_DATE" TIMESTAMP (6), 
	"INTFINESINFOLOG_FLAG" CHAR(1 CHAR), 
	"INTFINESINFOLOG_USRUPD" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_PK" PRIMARY KEY ("INTFINESINFOLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R04" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R07" FOREIGN KEY ("PV_SEQNO_PT")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R03" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R06" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R09" FOREIGN KEY ("TMB_SEQNO_PT")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R08" FOREIGN KEY ("AMP_SEQNO_PT")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R01" FOREIGN KEY ("COUNT_SEQNO1")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R02" FOREIGN KEY ("COUNT_SEQNO2")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R05" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R12" FOREIGN KEY ("FINESSEQNO")
	  REFERENCES "PIBICSDM2"."FS_FINES" ("FINES_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INT_FINESINFO_LOG" ADD CONSTRAINT "INT_FINESINFO_LOG_R10" FOREIGN KEY ("PRATE_SEQNO")
	  REFERENCES "PIBICSDM2"."PAYMENTRATE" ("PRATE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INT_FINESINFO_LOG_PK" ON "PIBICSDM2"."INT_FINESINFO_LOG" ("INTFINESINFOLOG_SEQNO") 
  ;