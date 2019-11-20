CREATE TABLE "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" 
   (	"PASSHIST_SEQNO" NUMBER, 
	"MOVESTAMP_SEQNO" NUMBER, 
	"EXTPERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_PIC" VARCHAR2(50 CHAR), 
	"ISSUE_DATE" DATE, 
	"ISSUE_PLACE" VARCHAR2(100 CHAR), 
	"EXP_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"BOIVISATYPE_SEQNO" NUMBER, 
	"BOIVISASUBTYPE_SEQNO" NUMBER, 
	"BOIVISADATE" DATE, 
	"BOIPERMITDATE" DATE, 
	"BOIREMARK" VARCHAR2(2000 CHAR), 
	"MOVESTAMP_TYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" ADD CONSTRAINT "EXT_CHANGEPASSHIST_PK" PRIMARY KEY ("PASSHIST_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" ADD CONSTRAINT "EXT_CHANGEPASSPORTHIST_R01" FOREIGN KEY ("MOVESTAMP_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_MOVESTAMP" ("EXTMOVESTAMP_SEQNO") ENABLE NOVALIDATE;
  ALTER TABLE "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" ADD CONSTRAINT "EXT_CHANGEPASSPORTHIST_R02" FOREIGN KEY ("EXTPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PERSON" ("EXTPERSON_SEQNO") ENABLE NOVALIDATE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_CHANGEPASSHIST_PK" ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" ("PASSHIST_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_CHANGEPASSPORTHIST" TO "BIOSAADM";
