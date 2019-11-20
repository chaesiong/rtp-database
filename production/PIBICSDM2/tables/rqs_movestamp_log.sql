CREATE TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" 
   (	"MOVESTAMP_SEQNO" NUMBER, 
	"RQSPERSON_SEQNO" NUMBER, 
	"REQUESTTYPETM" CHAR(1 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"TMNO" CHAR(3 CHAR), 
	"RUNNINGNO" CHAR(3 CHAR), 
	"YEAR" CHAR(4 CHAR), 
	"APPLYTMDATE" DATE, 
	"SUFFIX_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"OPASSPORT_PIC" VARCHAR2(50 CHAR), 
	"OPASSPORTISSUE_DATE" DATE, 
	"OPASSPORTISSUE_BY" VARCHAR2(60 CHAR), 
	"OPASSPORTEXP_DATE" DATE, 
	"NPASSPORTNO" VARCHAR2(20 CHAR), 
	"NPASSPORT_PIC" VARCHAR2(50 CHAR), 
	"NPASSPORTISSUE_DATE" DATE, 
	"NPASSPORTISSUE_BY" VARCHAR2(60 CHAR), 
	"NPASSPORTEXP_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"IN_DATE" DATE, 
	"PORTOFARRV" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"REASONDESC" VARCHAR2(2000 CHAR), 
	"PERMIT_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TMFLAG" VARCHAR2(2 CHAR), 
	"TM_SEQNO" NUMBER, 
	"TM_LOG_SEQNO" NUMBER, 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"MOVESTAMP_LOG_SEQNO" NUMBER, 
	"FLIGHTNO" VARCHAR2(30 CHAR), 
	"VISA_DATE" DATE, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" ADD PRIMARY KEY ("MOVESTAMP_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" ADD FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" ADD FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" ADD FOREIGN KEY ("RQSPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."RQS_PERSON" ("RQSPERSON_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_MOVESTAMP_LOG" ADD FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00206979" ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" ("MOVESTAMP_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_MOVESTAMP_LOG" TO "BIOSAADM";
