CREATE TABLE "PIBICSDM2"."VOA_CHECKPOINTLIST" 
   (	"CPL_SEQNO" NUMBER, 
	"CP_SEQNO" NUMBER, 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."VOA_CHECKPOINTLIST" ADD CONSTRAINT "VOA_CHECKPOINTLIST_PK" PRIMARY KEY ("CPL_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."VOA_CHECKPOINTLIST" ADD FOREIGN KEY ("CP_SEQNO")
	  REFERENCES "PIBICSDM2"."VOA_CHECKPOINT" ("CP_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."VOA_CHECKPOINTLIST_PK" ON "PIBICSDM2"."VOA_CHECKPOINTLIST" ("CPL_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VOA_CHECKPOINTLIST" TO "BIOSAADM";
