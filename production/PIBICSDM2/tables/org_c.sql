CREATE TABLE "PIBICSDM2"."ORG_C" 
   (	"ORG_CODE" VARCHAR2(5 CHAR), 
	"SEQ" NUMBER(7,0), 
	"ORG" VARCHAR2(255 CHAR), 
	"ORG_ABBR" VARCHAR2(200 CHAR), 
	"FIND_DESC" VARCHAR2(150 CHAR), 
	"RELA_CODE" VARCHAR2(5 CHAR), 
	"RELA_DESC" VARCHAR2(255 CHAR), 
	"RELA_ABBR" VARCHAR2(100 CHAR), 
	"FLAG" VARCHAR2(1 CHAR), 
	"ORG_NO" NUMBER(7,2), 
	"PROV_CODE" VARCHAR2(2 CHAR), 
	"BH_CODE" VARCHAR2(5 CHAR), 
	"BK_CODE" VARCHAR2(5 CHAR), 
	"KK_CODE" VARCHAR2(5 CHAR), 
	"ADDRESS" VARCHAR2(100 CHAR), 
	"TEL" VARCHAR2(50 CHAR), 
	"UNIT_EXP" VARCHAR2(5 CHAR), 
	"CAN_INVEST" VARCHAR2(1 CHAR), 
	"HEAD_LEVEL" VARCHAR2(2 CHAR), 
	"ORG_TYPE" VARCHAR2(1 CHAR), 
	"INV1" VARCHAR2(5 CHAR), 
	"INV2" VARCHAR2(5 CHAR), 
	"INV3" VARCHAR2(5 CHAR), 
	"UPD_ID" VARCHAR2(13 CHAR), 
	"UPD_ORG" VARCHAR2(5 CHAR), 
	"UPD_DATE" TIMESTAMP (6), 
	"FLAG_EXP" VARCHAR2(1 CHAR), 
	"ORG_LONG" VARCHAR2(255 CHAR), 
	"FLG_ACTIVE" VARCHAR2(1 CHAR), 
	"ORG_POS" VARCHAR2(100 CHAR), 
	"ORG_LEVEL" VARCHAR2(10 CHAR), 
	"ORG_FLG" VARCHAR2(1 CHAR), 
	"STATION_CODE" VARCHAR2(5 CHAR), 
	"ORG_ORDER" VARCHAR2(8 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."ORG_C" ADD PRIMARY KEY ("ORG_CODE", "SEQ")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207325" ON "PIBICSDM2"."ORG_C" ("ORG_CODE", "SEQ") 
  ;
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ORG_C" TO "BIOSAADM";
