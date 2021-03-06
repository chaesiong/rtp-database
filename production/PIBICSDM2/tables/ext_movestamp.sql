CREATE TABLE "PIBICSDM2"."EXT_MOVESTAMP" 
   (	"EXTMOVESTAMP_SEQNO" NUMBER, 
	"EXTPERSON_SEQNO" NUMBER, 
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
	"REASONDESC" VARCHAR2(1000 CHAR), 
	"PERMIT_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TMFLAG" VARCHAR2(2 CHAR), 
	"TM_SEQNO" NUMBER, 
	"FLIGHTNO" VARCHAR2(30 CHAR), 
	"VISA_DATE" DATE, 
	"UDEPT_SEQNO" NUMBER, 
	"FLAGMOVE" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"BOIVISATYPE_SEQNO" NUMBER, 
	"BOIVISASUBTYPE_SEQNO" NUMBER, 
	"BOIVISADATE" DATE, 
	"BOIPERMITDATE" DATE, 
	"BOIREMARK" VARCHAR2(2000 CHAR), 
	"MOVESTAMP_TYPE" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_PK" PRIMARY KEY ("EXTMOVESTAMP_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_R01" FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_R02" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_R07" FOREIGN KEY ("EXTPERSON_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_PERSON" ("EXTPERSON_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_R03" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."EXT_MOVESTAMP" ADD CONSTRAINT "EXT_MOVESTAMP_R06" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_MOVESTAMP_PK" ON "PIBICSDM2"."EXT_MOVESTAMP" ("EXTMOVESTAMP_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_MOVESTAMP" TO "BIOSAADM";
