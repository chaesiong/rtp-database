CREATE TABLE "PIBICSDM2"."EVISAREJECTED" 
   (	"VISASEQNO" NUMBER NOT NULL ENABLE, 
	"TRAVELDOCNO" VARCHAR2(60), 
	"NATIONALITYCODE" CHAR(9), 
	"TRAVELDOCTYPE" CHAR(3), 
	"FNAME" VARCHAR2(300), 
	"MNAME" VARCHAR2(300), 
	"LNAME" VARCHAR2(300), 
	"DOB" VARCHAR2(30), 
	"GENDER" CHAR(3), 
	"REASONDESC" VARCHAR2(4000), 
	"CREATE_BY" VARCHAR2(60), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(60), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"UPDFLAG" CHAR(3)
   ) ;
  ALTER TABLE "PIBICSDM2"."EVISAREJECTED" ADD CONSTRAINT "EVISAREJECTED02_PK" PRIMARY KEY ("VISASEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."VISASEQNO" IS 'Surrogate Key ข้อมูลตรวจลงตรา';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."TRAVELDOCNO" IS 'หมายเลขหนังสือเดินทาง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."NATIONALITYCODE" IS 'รหัสสัญชาติ';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."TRAVELDOCTYPE" IS 'ประเภทของหนังสือเดินทาง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."FNAME" IS 'ชื่อ';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."MNAME" IS 'ชื่อกลาง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."LNAME" IS 'นามสกุล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."DOB" IS 'วันดือนปีเกิด';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."GENDER" IS 'เพศ M=ชาย. F=หญิง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."REASONDESC" IS 'เหตุผลยกเลิกตรวจลงตรา';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."CREATE_BY" IS 'ผู้บันทึก';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."CREATE_DATE" IS 'วันที่บันทึก';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."UPDATE_BY" IS 'ผู้แก้ไขข้อมูล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."UPDATE_DATE" IS 'วันที่แก้ไขข้อมูล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."VERSION" IS 'ลำดับ ในการ Query ข้อมูล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISAREJECTED"."UPDFLAG" IS '''Y''= ปรับปรุง,''N''=ยังไม่ปรับปรุง';
   COMMENT ON TABLE "PIBICSDM2"."EVISAREJECTED"  IS 'ตารางข้อมูลการปฏิเสธลงตราคนต่างด้าว';
  CREATE UNIQUE INDEX "PIBICSDM2"."EVISAREJECTED02_PK" ON "PIBICSDM2"."EVISAREJECTED" ("VISASEQNO") 
  ;
