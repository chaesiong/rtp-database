CREATE TABLE "PIBICSDM2"."FUNCTIONAREA" 
   (	"FAID" NUMBER(10,0), 
	"AREAID" VARCHAR2(20 CHAR), 
	"FUNCTIONCD" VARCHAR2(20 CHAR), 
	"MAXROW" NUMBER(10,0), 
	"TIMEOUT" NUMBER(10,0)
   ) ;
  ALTER TABLE "PIBICSDM2"."FUNCTIONAREA" ADD CONSTRAINT "FAIDPK" PRIMARY KEY ("FAID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."FUNCTIONAREA" ADD CONSTRAINT "FUNCTIONCDFK" FOREIGN KEY ("FUNCTIONCD")
	  REFERENCES "PIBICSDM2"."FUNCTION" ("FUNCTIONCD") ENABLE;
  ALTER TABLE "PIBICSDM2"."FUNCTIONAREA" ADD CONSTRAINT "AREAIDFK" FOREIGN KEY ("AREAID")
	  REFERENCES "PIBICSDM2"."AREA" ("AREAID") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FAIDPK" ON "PIBICSDM2"."FUNCTIONAREA" ("FAID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FUNCTIONAREA" TO "BIOSAADM";
