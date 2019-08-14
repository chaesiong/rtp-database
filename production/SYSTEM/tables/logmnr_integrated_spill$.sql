CREATE TABLE "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" SHARING=METADATA 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"FLAG" NUMBER, 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" DATE, 
	"SPARE5" DATE
   ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" ADD CONSTRAINT "LOGMNR_INTEG_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "FLAG")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_INTEG_SPILL$_PK" ON "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "FLAG") 
  ;
CREATE UNIQUE INDEX "SYSTEM"."SYS_IL0000001454C00009$$" ON "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" (
  ;
