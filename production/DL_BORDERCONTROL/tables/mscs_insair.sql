CREATE TABLE "DL_BORDERCONTROL"."MSCS_INSAIR" 
   (	"INSAIR_SEQNO" NUMBER, 
	"TM5_SEQNO" NUMBER, 
	"DEPT_AIR" NUMBER, 
	"FLIGHTNO" VARCHAR2(15 CHAR), 
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
  ALTER TABLE "DL_BORDERCONTROL"."MSCS_INSAIR" ADD CONSTRAINT "MSCS_INSAIR_PK" PRIMARY KEY ("INSAIR_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MSCS_INSAIR" ADD CONSTRAINT "MSCS_INSAIR$FK00" FOREIGN KEY ("TM5_SEQNO")
	  REFERENCES "DL_BORDERCONTROL"."MSCS_TM5" ("TM5_SEQNO") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."INSAIR_SEQNO" IS 'Surrogate key ประกันทางอากาศ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."TM5_SEQNO" IS 'Surrogate key การเพิ่ม/ลด คนประจำพาหนะ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."DEPT_AIR" IS 'Surrogate key ด่านอากาศ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."FLIGHTNO" IS 'เที่ยวบิน';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."VERSION" IS 'ลำดับข้อมูลในการcheck query';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."ACTFLAG" IS 'สถานะการใช้งาน Y=ใช้งาน,N=ยกเลิก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."INS_AT" IS 'วันที่บันทัก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."INS_BY" IS 'รหัสผู้บันทึก';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."DML_AT" IS 'วันที่ปรับปรุง';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MSCS_INSAIR"."DML_BY" IS 'รหัสผู้ปรับปรุง';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MSCS_INSAIR"  IS 'ตารางข้อมูลประกันทางอากาศ';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."MSCS_INSAIR_PK" ON "DL_BORDERCONTROL"."MSCS_INSAIR" ("INSAIR_SEQNO") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."MSCS_INSAIR" TO "BIOSAADM";
