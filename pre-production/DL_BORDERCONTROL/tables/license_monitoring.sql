CREATE TABLE "DL_BORDERCONTROL"."LICENSE_MONITORING" 
   (	"CHECK_TIME" TIMESTAMP (6) DEFAULT sysdate NOT NULL ENABLE, 
	"ABIS_SYSTEM" VARCHAR2(20) NOT NULL ENABLE, 
	"REMAINING_FACE" NUMBER(10,0), 
	"REMAINING_FINGER" NUMBER(10,0)
   ) ;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."LICENSE_MONITORING"."ABIS_SYSTEM" IS 'BLACKLIST or MOVEMENTS';
  CREATE INDEX "DL_BORDERCONTROL"."LICENSE_MONITORING$IX00" ON "DL_BORDERCONTROL"."LICENSE_MONITORING" ("CHECK_TIME") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."LICENSE_MONITORING" TO "TESTADM";
