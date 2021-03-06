CREATE TABLE "PIBICSDM2"."EVISATIMELOG" 
   (	"SEQNO" NUMBER NOT NULL ENABLE, 
	"SERVICEDATE" DATE, 
	"TIMESTART" VARCHAR2(60), 
	"TIMEEND" VARCHAR2(60), 
	"FLAGSEND" CHAR(3), 
	"SERVICENAME" VARCHAR2(300), 
	"SEND_DATE" TIMESTAMP (6), 
	"ERRORDESC" VARCHAR2(300), 
	"RECORDCOUNT" NUMBER, 
	"ISSUCCESS" CHAR(3)
   ) ;
  ALTER TABLE "PIBICSDM2"."EVISATIMELOG" ADD CONSTRAINT "EVISATIMELOG_PK" PRIMARY KEY ("SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."SEQNO" IS 'ลำดับที่';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."SERVICEDATE" IS 'วันที่เรียกใช้ Service';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."TIMESTART" IS 'เวลารับ/ส่งเริ่มต้น';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."TIMEEND" IS 'เวลารับ/ส่งสิ้นสุด';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."FLAGSEND" IS 'สถานะการรับ/ส่ง S=Success, F=Fail, null=อยู่ระหว่างดำเนินการ';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."SERVICENAME" IS 'ชื่อ SERVICE ที่ส่งข้อมูล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."SEND_DATE" IS 'วันที่รับ/ส่งข้อมูล';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."ERRORDESC" IS 'ผลการใช้งานกรณี ไม่สำเร็จ';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."RECORDCOUNT" IS 'จำนวนข้อมูลที่รับ/ส่ง';
   COMMENT ON COLUMN "PIBICSDM2"."EVISATIMELOG"."ISSUCCESS" IS 'สถานะการรับส่งข้อมูล ''Y''=สำเร็จ, ''N''=ไม่สำเร็จ';
   COMMENT ON TABLE "PIBICSDM2"."EVISATIMELOG"  IS 'ตารางข้อมูลการส่งข้อมูลให้สถานกงสุล';
  CREATE UNIQUE INDEX "PIBICSDM2"."EVISATIMELOG_PK" ON "PIBICSDM2"."EVISATIMELOG" ("SEQNO") 
  ;
