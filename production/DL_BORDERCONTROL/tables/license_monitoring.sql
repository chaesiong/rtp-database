CREATE TABLE "DL_BORDERCONTROL"."LICENSE_MONITORING" 
   (	"CHECK_TIME" TIMESTAMP (6) DEFAULT sysdate NOT NULL ENABLE, 
	"ABIS_SYSTEM" VARCHAR2(20) NOT NULL ENABLE, 
	"REMAINING_FACE" NUMBER(10,0), 
	"REMAINING_FINGER" NUMBER(10,0)
   ) ;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LICENSE_MONITORING"."ABIS_SYSTEM" IS 'BLACKLIST or MOVEMENTS';
  CREATE INDEX "DL_BORDERCONTROL"."LICENSE_MONITORING$IX00" ON "DL_BORDERCONTROL"."LICENSE_MONITORING" ("CHECK_TIME") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "PORNRUKSA_S";
