CREATE TABLE "PIBICSDM2"."LA_MOVESTAMP" 
   (	"MOVESTAMP_SEQNO" NUMBER, 
	"PERSON_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"VISANO" VARCHAR2(50 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"BIRTHPLACE" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"OCC_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"OPASSPORT_ISSUEDATE" DATE, 
	"OPASSPORT_ISSUEAT" VARCHAR2(60 CHAR), 
	"OPASSPORT_EXPDATE" DATE, 
	"NPASSPORTNO" VARCHAR2(20 CHAR), 
	"NPASSPORT_ISSUEDATE" DATE, 
	"NPASSPORT_ISSUEAT" VARCHAR2(60 CHAR), 
	"NPASSPORT_EXPDATE" DATE, 
	"ARRIVED_BY" NUMBER, 
	"ARRIVED_DATE" DATE, 
	"ARRIVED_DEPT" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"VISA_SEQNO" NUMBER, 
	"REASONDESC" VARCHAR2(500 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLIGHTNO" VARCHAR2(30 CHAR), 
	"VISA_DATE" DATE, 
	"MOVESTAMP_DATE" DATE, 
	"IPCREATE" VARCHAR2(20 CHAR), 
	"IPUPDATE" VARCHAR2(20 CHAR), 
	"CDEPT_SEQNO" NUMBER, 
	"UDEPT_SEQNO" NUMBER, 
	"CZONE_SEQNO" NUMBER, 
	"UZONE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"REMARK" VARCHAR2(500 CHAR), 
	"REMARKTYPE" CHAR(1 CHAR), 
	"TL38" VARCHAR2(20 CHAR), 
	"NIMGPASS" BLOB, 
	"OIMGPASS" BLOB
   ) ;
  ALTER TABLE "PIBICSDM2"."LA_MOVESTAMP" ADD CONSTRAINT "LA_MOVESTAMP_R06" FOREIGN KEY ("VISA_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_MOVESTAMP" ADD CONSTRAINT "LA_MOVESTAMP_R09" FOREIGN KEY ("CZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_MOVESTAMP" ADD CONSTRAINT "LA_MOVESTAMP_R10" FOREIGN KEY ("UZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_MOVESTAMP" ADD CONSTRAINT "LA_MOVESTAMP_R03" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_MOVESTAMP" ADD CONSTRAINT "LA_MOVESTAMP_R04" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_MOVESTAMP" ADD CONSTRAINT "LA_MOVESTAMP_R05" FOREIGN KEY ("ARRIVED_BY")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."LA_MOVESTAMP_PK" ON "PIBICSDM2"."LA_MOVESTAMP" ("MOVESTAMP_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301650C00046$$" ON "PIBICSDM2"."LA_MOVESTAMP" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301650C00047$$" ON "PIBICSDM2"."LA_MOVESTAMP" (
  ;
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LA_MOVESTAMP" TO "BIOSAADM";
