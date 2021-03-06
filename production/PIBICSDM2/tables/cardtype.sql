CREATE TABLE "PIBICSDM2"."CARDTYPE" 
   (	"CARDTYPE_SEQNO" NUMBER, 
	"CARDTYPE" VARCHAR2(60 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CARDTYPE" ADD CONSTRAINT "CARDTYPE_PK" PRIMARY KEY ("CARDTYPE_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CARDTYPE" ADD CONSTRAINT "CARDTYPE_U01" UNIQUE ("CARDTYPE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CARDTYPE_PK" ON "PIBICSDM2"."CARDTYPE" ("CARDTYPE_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CARDTYPE_U01" ON "PIBICSDM2"."CARDTYPE" ("CARDTYPE") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CARDTYPE" TO "BIOSAADM";
