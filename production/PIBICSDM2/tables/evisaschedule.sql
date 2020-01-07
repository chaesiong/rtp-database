CREATE TABLE "PIBICSDM2"."EVISASCHEDULE" 
   (	"SEQNO" NUMBER NOT NULL ENABLE, 
	"STARTTIME" VARCHAR2(60), 
	"ENDTIME" VARCHAR2(60), 
	"STATUS" CHAR(3)
   ) ;
   COMMENT ON COLUMN "PIBICSDM2"."EVISASCHEDULE"."SEQNO" IS 'ลำดับที่';
   COMMENT ON COLUMN "PIBICSDM2"."EVISASCHEDULE"."STARTTIME" IS 'เวลาเริ่มต้น';
   COMMENT ON COLUMN "PIBICSDM2"."EVISASCHEDULE"."ENDTIME" IS 'เวลาสิ้นสุด';
   COMMENT ON COLUMN "PIBICSDM2"."EVISASCHEDULE"."STATUS" IS 'สถานะ ''A''=ใช้งาน, ''C''=ยกเลิก';