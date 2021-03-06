CREATE TABLE "PIBICSDM2"."OFFENDER" 
   (	"OFD_SEQNO" NUMBER, 
	"OFDNO" VARCHAR2(15 CHAR), 
	"OFDDTE" DATE, 
	"OFDUSRID" CHAR(6 CHAR), 
	"DOCID" NUMBER(5,0), 
	"DOCNO" VARCHAR2(20 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(30 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATIONCD" NUMBER, 
	"ISSDTE" DATE, 
	"ISSPLACE" VARCHAR2(100 CHAR), 
	"EXPDTE" DATE, 
	"DEPTFWD" VARCHAR2(60 CHAR), 
	"DEPTFWDNOTE" VARCHAR2(250 CHAR), 
	"OFDREASON" VARCHAR2(60 CHAR), 
	"OFDREASONNOTE" VARCHAR2(250 CHAR), 
	"DEPTPER" VARCHAR2(60 CHAR), 
	"DEPTDOCNO" VARCHAR2(20 CHAR), 
	"DEPTDOCDTE" DATE, 
	"BEHAVIOR" VARCHAR2(250 CHAR), 
	"METHOD" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"INDTE" DATE, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"COUNTCD" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"SECTION_SEQNO" NUMBER, 
	"TM6NO" CHAR(7 CHAR), 
	"CONV_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OFFENDER" ADD CONSTRAINT "OFFENDER_PK" PRIMARY KEY ("OFD_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."OFFENDER" ADD FOREIGN KEY ("NATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."OFFENDER" ADD FOREIGN KEY ("COUNTCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."OFFENDER" ADD FOREIGN KEY ("SECTION_SEQNO")
	  REFERENCES "PIBICSDM2"."SECTION" ("SECTION_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OFFENDER_PK" ON "PIBICSDM2"."OFFENDER" ("OFD_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OFFENDER" TO "BIOSAADM";
