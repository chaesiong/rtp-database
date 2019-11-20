CREATE TABLE "PIBICSDM2"."ARINC" 
   (	"SEQNO" NUMBER, 
	"PAXLST" CLOB, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"NATIONALITY" VARCHAR2(5 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"CUSRES" CLOB, 
	"CREATE_DATE" TIMESTAMP (6), 
	"FLIGHTNO" VARCHAR2(20 CHAR), 
	"AIRLINE" VARCHAR2(50 CHAR), 
	"ISBLACKLIST" CHAR(1 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PAXLST_TYPE" VARCHAR2(50 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARINC_PK" ON "PIBICSDM2"."ARINC" ("SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300750C00002$$" ON "PIBICSDM2"."ARINC" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300750C00009$$" ON "PIBICSDM2"."ARINC" (
  ;
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ARINC" TO "BIOSAADM";
