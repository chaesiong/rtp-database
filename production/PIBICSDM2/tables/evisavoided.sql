CREATE TABLE "PIBICSDM2"."EVISAVOIDED" 
   (	"VISASEQNO" NUMBER, 
	"VISANO" VARCHAR2(30), 
	"TRAVELDOCNO" VARCHAR2(60), 
	"NATIONALITYCODE" CHAR(9), 
	"TRAVELDOCTYPE" CHAR(3), 
	"FNAME" VARCHAR2(300), 
	"MNAME" VARCHAR2(300), 
	"LNAME" VARCHAR2(300), 
	"DOB" VARCHAR2(30), 
	"GENDER" CHAR(3), 
	"VISAISSUDATE" DATE, 
	"VISAEXPIREDATE" DATE, 
	"VISATYPECD" CHAR(12), 
	"CREATE_BY" VARCHAR2(60), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(60), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REMARK" VARCHAR2(600), 
	"UPDFLAG" CHAR(3), 
	"VOIDDATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."EVISAVOIDED" ADD CONSTRAINT "EVISAVOIDED_PK" PRIMARY KEY ("VISASEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."VISASEQNO" IS 'Surrogate key ข้อมูลการยกเลิกการตรวจลงตราคนต่างด้าว';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."VISANO" IS 'หมายเลขลงตรา';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."TRAVELDOCNO" IS 'หมายเลขหนังสือเดินทาง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."NATIONALITYCODE" IS 'รหัสสัญชาตื';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."TRAVELDOCTYPE" IS 'ประเภทของหนังสือเดินทาง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."FNAME" IS 'ชื่อ';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."MNAME" IS 'ชื่อกลาง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."LNAME" IS 'นามสกุล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."DOB" IS 'วันดือนปีเกิด';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."GENDER" IS 'เพศ M=ชาย. F=หญิง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."VISAISSUDATE" IS 'วันที่ตรวจลงตรา';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."VISAEXPIREDATE" IS 'วันหมดอายุของลงตรา';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."VISATYPECD" IS 'ประเภทของลงตรา';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."CREATE_BY" IS 'ผู้บันทึก';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."CREATE_DATE" IS 'วันที่บันทึก';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."UPDATE_BY" IS 'ผู้แก้ไข';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."UPDATE_DATE" IS 'วันที่แก้ไข';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."VERSION" IS 'ลำดับในการ Query ข้อมูล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."REMARK" IS 'หมายเหตุ';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAVOIDED"."UPDFLAG" IS '''Y''= ปรับปรุง,''N''=ยังไม่ปรับปรุง';
   COMMENT ON TABLE "PIBICSDM2"."EVISAVOIDED"  IS 'ตารางข้อมูลการยกเลิกการตรวจลงตราคนต่างด้าว';
  CREATE UNIQUE INDEX "PIBICSDM2"."EVISAVOIDED_PK" ON "PIBICSDM2"."EVISAVOIDED" ("VISASEQNO") 
  ;
