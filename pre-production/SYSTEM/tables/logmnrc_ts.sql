CREATE TABLE "SYSTEM"."LOGMNRC_TS" SHARING=METADATA 
   (	"LOGMNR_UID" NUMBER NOT NULL ENABLE, 
	"TS#" NUMBER(22,0), 
	"NAME" VARCHAR2(90), 
	"START_SCN" NUMBER NOT NULL ENABLE, 
	"DROP_SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(4000)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNRC_TS" ADD CONSTRAINT "LOGMNRC_TS_PK" PRIMARY KEY ("LOGMNR_UID", "TS#", "START_SCN")
  USING INDEX  LOCAL
 (PARTITION "P_LESSTHAN100" )  ENABLE;
  CREATE INDEX "SYSTEM"."LOGMNRC_I1TS" ON "SYSTEM"."LOGMNRC_TS" ("LOGMNR_UID", "DROP_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_TS_PK" ON "SYSTEM"."LOGMNRC_TS" ("LOGMNR_UID", "TS#", "START_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
