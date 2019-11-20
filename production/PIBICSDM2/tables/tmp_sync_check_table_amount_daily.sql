CREATE TABLE "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" 
   (	"TABLE_NAME" VARCHAR2(500), 
	"CONDITION_NAME" VARCHAR2(200), 
	"DATE_CHECK" VARCHAR2(20), 
	"AMOUNT_SOURCE" NUMBER, 
	"AMOUNT_DESTINATION" NUMBER, 
	"DIFF_AMOUNT" NUMBER
   ) ;
   COMMENT ON COLUMN "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY"."TABLE_NAME" IS 'ชื่อตาราง';
   COMMENT ON COLUMN "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY"."CONDITION_NAME" IS 'ชื่อเงื่อนไข';
   COMMENT ON COLUMN "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY"."DATE_CHECK" IS 'วันที่ตรวจสอบ';
   COMMENT ON COLUMN "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY"."AMOUNT_SOURCE" IS 'จำนวนที่ตรวจสอบได้ ต้นทาง';
   COMMENT ON COLUMN "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY"."AMOUNT_DESTINATION" IS 'จำนวนที่ตรวจสอบได้ ปลายทาง';
   COMMENT ON COLUMN "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY"."DIFF_AMOUNT" IS 'ส่วนต่าง';
  GRANT SELECT ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_SYNC_CHECK_TABLE_AMOUNT_DAILY" TO "BIOSAADM";
