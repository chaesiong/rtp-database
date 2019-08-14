CREATE TABLE "DL_BORDERCONTROL"."XXTMP_REPS_TM8" 
   (	"ENDPERMIT_DATE" DATE, 
	"TM8_SEQNO" NUMBER, 
	"DOCTYPE" VARCHAR2(1), 
	"PASSPORTNO" VARCHAR2(50), 
	"FAMILYNM" VARCHAR2(50), 
	"FIRSTNM" VARCHAR2(50), 
	"SEX" VARCHAR2(1), 
	"BIRTH_DATE" DATE, 
	"PASSPORTEXP_DATE" DATE, 
	"NATIONAL_SEQNO" NUMBER
   ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_REPS_TM8" TO "APPSUP";