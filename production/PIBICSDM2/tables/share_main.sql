CREATE TABLE "PIBICSDM2"."SHARE_MAIN" 
   (	"SH_SEQNO" NUMBER(20,0), 
	"MF_SEQNO" NUMBER, 
	"MFNAME" VARCHAR2(255 CHAR), 
	"HOLD_SEQNO" NUMBER, 
	"SHNUM" NUMBER, 
	"SHRECDATE" DATE, 
	"REMARK" VARCHAR2(400 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."SHARE_MAIN" ADD CONSTRAINT "SHARE_MAIN_PK" PRIMARY KEY ("SH_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."SHARE_MAIN" ADD CONSTRAINT "SHARE_MAIN_R01" FOREIGN KEY ("MF_SEQNO")
	  REFERENCES "PIBICSDM2"."MAIN_T" ("MF_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."SHARE_MAIN" ADD CONSTRAINT "SHARE_MAIN_R02" FOREIGN KEY ("HOLD_SEQNO")
	  REFERENCES "PIBICSDM2"."HOLDER_TYPE_R" ("HOLD_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SHARE_MAIN_PK" ON "PIBICSDM2"."SHARE_MAIN" ("SH_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SHARE_MAIN" TO "BIOSAADM";
