CREATE TABLE "PIBICSDM2"."DEFAULTPICTURE" 
   (	"PICTURE_SEQNO" NUMBER, 
	"PICTURE" BLOB, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"PICTURE_DESC" VARCHAR2(2000 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300998C00002$$" ON "PIBICSDM2"."DEFAULTPICTURE" (
  ;
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DEFAULTPICTURE" TO "BIOSAADM";
