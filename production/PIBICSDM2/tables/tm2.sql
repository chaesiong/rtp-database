CREATE TABLE "PIBICSDM2"."TM2" 
   (	"TM2_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"IODTE" TIMESTAMP (6), 
	"CARDTYPE" CHAR(1 CHAR), 
	"CONVNM" VARCHAR2(250 CHAR), 
	"CONVNATIONCD" NUMBER, 
	"CONVREGNO" VARCHAR2(50 CHAR), 
	"CONVOWNER" VARCHAR2(250 CHAR), 
	"TM2DEPT" NUMBER, 
	"IOCOUNTCD" NUMBER, 
	"IOPORTNM" VARCHAR2(250 CHAR), 
	"TM5_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"TM2NO" VARCHAR2(20 CHAR), 
	"TM2DTE" DATE, 
	"TM2USR" VARCHAR2(250 CHAR), 
	"FLIGHTNO" VARCHAR2(25 CHAR), 
	"CONVCODE" VARCHAR2(20 CHAR), 
	"IONOTE" VARCHAR2(250 CHAR), 
	"IODEPT" NUMBER, 
	"IODEPTTH" NUMBER, 
	"AMOUNT_CRW" NUMBER, 
	"AMOUNT_PSG" NUMBER, 
	"AMOUNT_IO" NUMBER, 
	"AMOUNT_T" NUMBER, 
	"AMOUNT_S" NUMBER, 
	"CONVTYPE_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"TM2MAIN_SEQNO" NUMBER, 
	"NOTE" VARCHAR2(500 CHAR), 
	"CREATE_IP" VARCHAR2(25 CHAR), 
	"UPDATE_IP" VARCHAR2(25 CHAR), 
	"SHIFT_SEQNO" NUMBER, 
	"PD_SEQNO" NUMBER, 
	"ZONE_SEQNO" NUMBER, 
	"HEALTHFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TM2" ADD CONSTRAINT "TM2_PK" PRIMARY KEY ("TM2_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."TM2" ADD FOREIGN KEY ("CONV_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVEYANCE" ("CONV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM2" ADD CONSTRAINT "TM2_R01" FOREIGN KEY ("CONVTYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."CONVTYPE" ("CONVTYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM2" ADD FOREIGN KEY ("CONVNATIONCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM2" ADD FOREIGN KEY ("IOCOUNTCD")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."TM2" ADD CONSTRAINT "TM2_R04" FOREIGN KEY ("TM2MAIN_SEQNO")
	  REFERENCES "PIBICSDM2"."TM2MAIN" ("TM2MAIN_SEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."CONVREGNO_IDX" ON "PIBICSDM2"."TM2" ("CONVREGNO") 
  ;
CREATE INDEX "PIBICSDM2"."IDX_TM2_IODTE_TRNS1" ON "PIBICSDM2"."TM2" (TO_CHAR("IODTE",'dd/mm/yyyy','nls_calendar=''Thai Buddha''')) 
  ;
CREATE INDEX "PIBICSDM2"."TM2DEPT_IDX" ON "PIBICSDM2"."TM2" ("TM2DEPT") 
  ;
CREATE INDEX "PIBICSDM2"."TM2_CARDTYPE_IDX" ON "PIBICSDM2"."TM2" ("CARDTYPE") 
  ;
CREATE INDEX "PIBICSDM2"."TM2_IODTE_IDX" ON "PIBICSDM2"."TM2" (TO_CHAR("IODTE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."TM2_IODTE_IDX1" ON "PIBICSDM2"."TM2" ("IODTE") 
  ;
CREATE INDEX "PIBICSDM2"."TM2_U_FLIGHTNO_IDX" ON "PIBICSDM2"."TM2" (UPPER("FLIGHTNO")) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."TM2_PK" ON "PIBICSDM2"."TM2" ("TM2_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TM2" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TM2" TO "BIOSAADM";
