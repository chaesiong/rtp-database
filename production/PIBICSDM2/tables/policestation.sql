CREATE TABLE "PIBICSDM2"."POLICESTATION" 
   (	"PLS_SEQNO" NUMBER, 
	"ORG_CODE" CHAR(5 CHAR), 
	"SEQ" CHAR(2 CHAR), 
	"ORG" VARCHAR2(255 CHAR), 
	"ORG_ABBR" VARCHAR2(200 CHAR), 
	"FIND_DESC" VARCHAR2(150 CHAR), 
	"RELA_CODE" CHAR(5 CHAR), 
	"RELA_DESC" VARCHAR2(255 CHAR), 
	"RELA_ABBR" VARCHAR2(100 CHAR), 
	"FLAG" CHAR(1 CHAR), 
	"ORG_NO" VARCHAR2(10 CHAR), 
	"PROV_CODE" CHAR(2 CHAR), 
	"BH_CODE" CHAR(5 CHAR), 
	"BK_CODE" CHAR(5 CHAR), 
	"KK_CODE" CHAR(5 CHAR), 
	"ADDRESS" VARCHAR2(100 CHAR), 
	"TEL" VARCHAR2(50 CHAR), 
	"UNIT_EXP" CHAR(5 CHAR), 
	"CAN_INVEST" CHAR(1 CHAR), 
	"HEAD_LEVEL" CHAR(2 CHAR), 
	"ORG_TYPE" CHAR(1 CHAR), 
	"INV1" CHAR(5 CHAR), 
	"INV2" CHAR(5 CHAR), 
	"INV3" CHAR(5 CHAR), 
	"UPD_ID" VARCHAR2(13 CHAR), 
	"UPD_ORG" CHAR(5 CHAR), 
	"UPD_DATE" VARCHAR2(40 CHAR), 
	"FLAG_EXP" CHAR(1 CHAR), 
	"ORG_LONG" VARCHAR2(255 CHAR), 
	"FLG_ACTIVE" CHAR(1 CHAR), 
	"ORG_POS" VARCHAR2(100 CHAR), 
	"ORG_LEVEL" VARCHAR2(10 CHAR), 
	"ORG_FLG" CHAR(1 CHAR), 
	"STATION_CODE" CHAR(5 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."POLICESTATION" ADD CONSTRAINT "POLICESTATION_PK" PRIMARY KEY ("PLS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."POLICESTATION_PK" ON "PIBICSDM2"."POLICESTATION" ("PLS_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."POLICESTATION" TO "BIOSAADM";
