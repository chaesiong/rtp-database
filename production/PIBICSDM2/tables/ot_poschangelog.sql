CREATE TABLE "PIBICSDM2"."OT_POSCHANGELOG" 
   (	"OTPOSCHANGELOGSEQNO" NUMBER, 
	"OTPOSCHANGESEQNO" NUMBER, 
	"ESTIMATEYEAR" CHAR(4 CHAR), 
	"ESTIMATEMONTH" CHAR(2 CHAR), 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"CONFIRMUSER" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."OT_POSCHANGELOG" ADD CONSTRAINT "OT_POSCHANGELOG_PK" PRIMARY KEY ("OTPOSCHANGELOGSEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."OT_POSCHANGELOG_PK" ON "PIBICSDM2"."OT_POSCHANGELOG" ("OTPOSCHANGELOGSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_POSCHANGELOG" TO "BIOSAADM";
