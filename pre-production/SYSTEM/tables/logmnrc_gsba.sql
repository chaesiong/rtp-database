CREATE TABLE "SYSTEM"."LOGMNRC_GSBA" SHARING=METADATA 
   (	"LOGMNR_UID" NUMBER NOT NULL ENABLE, 
	"AS_OF_SCN" NUMBER NOT NULL ENABLE, 
	"FDO_LENGTH" NUMBER, 
	"FDO_VALUE" RAW(255), 
	"CHARSETID" NUMBER, 
	"NCHARSETID" NUMBER, 
	"DBTIMEZONE_LEN" NUMBER, 
	"DBTIMEZONE_VALUE" VARCHAR2(192), 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000), 
	"LOGMNR_SPARE4" DATE, 
	"DB_GLOBAL_NAME" VARCHAR2(384)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNRC_GSBA" ADD CONSTRAINT "LOGMNRC_GSBA_PK" PRIMARY KEY ("LOGMNR_UID", "AS_OF_SCN")
  USING INDEX  LOCAL
 (PARTITION "P_LESSTHAN100" )  ENABLE;
  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_GSBA_PK" ON "SYSTEM"."LOGMNRC_GSBA" ("LOGMNR_UID", "AS_OF_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
