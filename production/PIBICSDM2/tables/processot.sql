CREATE TABLE "PIBICSDM2"."PROCESSOT" 
   (	"EXTOVS_SEQNO" NUMBER, 
	"EXTPERSON_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(50 CHAR), 
	"CPASSPORTNO" VARCHAR2(50 CHAR), 
	"EXT_DATE" DATE, 
	"DOCNO" VARCHAR2(50 CHAR), 
	"TM6NO" VARCHAR2(50 CHAR), 
	"EFIRSTNM" VARCHAR2(150 CHAR), 
	"EMIDDLENM" VARCHAR2(150 CHAR), 
	"EFAMILYNM" VARCHAR2(150 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(50 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"OPASSPORT_PLACE" VARCHAR2(50 CHAR), 
	"OPASSPORT_DATE" DATE, 
	"OPASSPORT_EXPDATE" DATE, 
	"CPASSPORT_PLACE" VARCHAR2(50 CHAR), 
	"CPASSPORT_EXPDATE" DATE, 
	"CPASSPORT_DATE" DATE, 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"FROMCOUNT" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"BUILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(200 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"REASON_DAY" NUMBER, 
	"APPROVE_STS" CHAR(1 CHAR), 
	"PERMIT_DATE" DATE, 
	"PERSON_STS" CHAR(1 CHAR), 
	"EXT_SEQNO" NUMBER, 
	"FEESLIP_SEQNO" NUMBER, 
	"SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"UDEPT_SEQNO" NUMBER, 
	"STATUSEXT" CHAR(1 CHAR), 
	"STATUSEXTDTE" DATE, 
	"RQS_STS" CHAR(1 CHAR), 
	"VISATYPESUB_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"EXTFLAG" CHAR(1 CHAR), 
	"CHNGPERSON_SEQNO" NUMBER, 
	"CHNGPERMITDTE" DATE, 
	"CHNGFLAG" CHAR(1 CHAR), 
	"RQSPERSON_SEQNO" NUMBER, 
	"RQSPERMITDTE" DATE, 
	"RQSFLAG" CHAR(1 CHAR), 
	"EXTOVS_DATE" TIMESTAMP (6), 
	"PROCESSDTE" TIMESTAMP (6), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"UDEPT_ORG" NUMBER, 
	"YEAROFDOB" VARCHAR2(4 CHAR), 
	"SEXDESC" VARCHAR2(10 CHAR), 
	"DEPTLEVEL1" NUMBER, 
	"DEPTLEVEL2" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."PROCESSOT" ADD CONSTRAINT "EXTOVERSTAY_PK" PRIMARY KEY ("EXTOVS_SEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."PROCESSOT_APPROVESTS_IDX" ON "PIBICSDM2"."PROCESSOT" ("APPROVE_STS") 
  ;
CREATE INDEX "PIBICSDM2"."PROCESSOT_CPASSPORTNO_IDX" ON "PIBICSDM2"."PROCESSOT" ("CPASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."PROCESSOT_NATIONSEQNO_IDX" ON "PIBICSDM2"."PROCESSOT" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."PROCESSOT_OPASSPORTNO_IDX" ON "PIBICSDM2"."PROCESSOT" ("OPASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."EXTOVERSTAY_PK" ON "PIBICSDM2"."PROCESSOT" ("EXTOVS_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."PROCESSOT" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."PROCESSOT" TO "DL_BORDERCONTROL";
