CREATE TABLE "PIBICSDM2"."RFC_TM3LOG" 
   (	"LOGTM2_SEQNO" NUMBER, 
	"TM3_SEQNO" NUMBER, 
	"TM2_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"GENDER" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RFC_TM3LOG" TO "BIOSAADM";
