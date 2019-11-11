CREATE TABLE "DL_BORDERCONTROL"."MSCS_INSCASH" 
   (	"INSCASH_SEQNO" NUMBER, 
	"TM5_SEQNO" NUMBER, 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."MSCS_INSCASH" ADD CONSTRAINT "MSCS_INSCASH_PK" PRIMARY KEY ("INSCASH_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MSCS_INSCASH" ADD CONSTRAINT "MSCS_INSCASH$FK00" FOREIGN KEY ("TM5_SEQNO")
	  REFERENCES "DL_BORDERCONTROL"."MSCS_TM5" ("TM5_SEQNO") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."INSCASH_SEQNO" IS 'Surrogate key ประกันเงินสด';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."TM5_SEQNO" IS 'Surrogate key การเพิ่ม/ลด คนประจำพาหนะ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."VERSION" IS 'ลำดับข้อมูลในการcheck query';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."ACTFLAG" IS 'สถานะการใช้งาน Y=ใช้งาน,N=ยกเลิก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."INS_AT" IS 'วันที่บันทัก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."INS_BY" IS 'รหัสผู้บันทึก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."DML_AT" IS 'วันที่ปรับปรุง';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSCASH"."DML_BY" IS 'รหัสผู้ปรับปรุง';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MSCS_INSCASH"  IS 'ตารางข้อมูลประกันเงินสด';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."MSCS_INSCASH_PK" ON "DL_BORDERCONTROL"."MSCS_INSCASH" ("INSCASH_SEQNO") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."MSCS_INSCASH" TO "BIOSAADM";
