CREATE TABLE "SYSTEM"."SYSTEM_CONFIG" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"TIMEOUT" NUMBER(*,0), 
	"ISSWITCHING" NUMBER(*,0), 
	"FIRSTSERVICE" NUMBER(*,0), 
	"CREATE_BY" VARCHAR2(50), 
	"CREATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(50), 
	"UPDATE_DATE" DATE
   ) ;
  ALTER TABLE "SYSTEM"."SYSTEM_CONFIG" ADD CONSTRAINT "XPK_SYSTEM_CONFIG" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "SYSTEM"."SYSTEM_CONFIG"."TIMEOUT" IS 'time out ของ service หน่วยเป็น วินาที';
   COMMENT ON COLUMN "SYSTEM"."SYSTEM_CONFIG"."ISSWITCHING" IS 'ถ้า service แรกไม่ได้ค่าหรือตายจะเรียก service สองต่อหรือไม่ 1=switch,0= ไม่ switch';
   COMMENT ON COLUMN "SYSTEM"."SYSTEM_CONFIG"."FIRSTSERVICE" IS 'Service แรกที่จะใช้ 1= MIND,2=FIND';
  CREATE UNIQUE INDEX "SYSTEM"."XPK_SYSTEM_CONFIG" ON "SYSTEM"."SYSTEM_CONFIG" ("ID") 
  ;
