CREATE TABLE "PIBICSDM2"."AUTHPOSITION" 
   (	"AUTHPOSID" NUMBER(10,0), 
	"WKGCD" VARCHAR2(20 CHAR), 
	"POSLEVELID" CHAR(2 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."AUTHPOSITION" ADD CONSTRAINT "AUTHPOSID_PK" PRIMARY KEY ("AUTHPOSID")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."AUTHPOSITION" ADD CONSTRAINT "WKGCD_FK1" FOREIGN KEY ("WKGCD")
	  REFERENCES "PIBICSDM2"."WORKGROUP" ("WKGCD") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."AUTHPOSID_PK" ON "PIBICSDM2"."AUTHPOSITION" ("AUTHPOSID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."AUTHPOSITION" TO "BIOSAADM";
