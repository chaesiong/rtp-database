CREATE TABLE "PIBICSDM2"."SHORTAVL" 
   (	"URNO" NUMBER(10,0), 
	"FLNO" CHAR(9 CHAR), 
	"STOAD" DATE, 
	"ETOA" DATE, 
	"ORG3" CHAR(3 CHAR), 
	"ONBL" DATE, 
	"ACT5" CHAR(5 CHAR), 
	"REGN" CHAR(12 CHAR), 
	"VIAL" CHAR(18 CHAR), 
	"LAND" DATE, 
	"PSTA" CHAR(6 CHAR), 
	"PAXT" CHAR(3 CHAR), 
	"FTYP" CHAR(1 CHAR), 
	"FLTI" CHAR(1 CHAR), 
	"GTA1" CHAR(5 CHAR), 
	"GA1B" CHAR(14 CHAR), 
	"GA1E" CHAR(14 CHAR), 
	"GA1X" CHAR(14 CHAR), 
	"GA1Y" CHAR(14 CHAR), 
	"GTA2" CHAR(5 CHAR), 
	"GA2B" CHAR(14 CHAR), 
	"GA2E" CHAR(14 CHAR), 
	"GA2X" CHAR(14 CHAR), 
	"GA2Y" CHAR(14 CHAR), 
	"VIAL1" CHAR(3 CHAR), 
	"VIAL2" CHAR(3 CHAR), 
	"VIAL3" CHAR(3 CHAR), 
	"VIAL4" CHAR(3 CHAR), 
	"VIAL5" CHAR(3 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."SHORTAVL" ADD CONSTRAINT "PK_SHORTAVL" PRIMARY KEY ("URNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PK_SHORTAVL" ON "PIBICSDM2"."SHORTAVL" ("URNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SHORTAVL" TO "BIOSAADM";
