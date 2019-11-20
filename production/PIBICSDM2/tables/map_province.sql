CREATE TABLE "PIBICSDM2"."MAP_PROVINCE" 
   (	"MPV_SEQNO" NUMBER, 
	"MPV_ENGNAME" VARCHAR2(500 CHAR), 
	"MPV_THANAME" VARCHAR2(500 CHAR), 
	"MPV_COORDINATE" CLOB, 
	"PV_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"MPV_CODE" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."MAP_PROVINCE" ADD CONSTRAINT "MAP_PROVINCE_PK" PRIMARY KEY ("MPV_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."MAP_PROVINCE_PK" ON "PIBICSDM2"."MAP_PROVINCE" ("MPV_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301705C00004$$" ON "PIBICSDM2"."MAP_PROVINCE" (
  ;
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."MAP_PROVINCE" TO "BIOSAADM";
