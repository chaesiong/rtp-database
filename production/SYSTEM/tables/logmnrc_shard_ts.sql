CREATE TABLE "SYSTEM"."LOGMNRC_SHARD_TS" SHARING=METADATA 
   (	"LOGMNR_UID" NUMBER NOT NULL ENABLE, 
	"TABLESPACE_NAME" VARCHAR2(90) NOT NULL ENABLE, 
	"CHUNK_NUMBER" NUMBER NOT NULL ENABLE, 
	"START_SCN" NUMBER NOT NULL ENABLE, 
	"DROP_SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(4000)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNRC_SHARD_TS" ADD CONSTRAINT "LOGMNRC_SHARD_TS_PK" PRIMARY KEY ("LOGMNR_UID", "TABLESPACE_NAME", "START_SCN")
  USING INDEX  LOCAL
 (PARTITION "P_LESSTHAN100" )  ENABLE;
  CREATE INDEX "SYSTEM"."LOGMNRC_I1SHARD_TS" ON "SYSTEM"."LOGMNRC_SHARD_TS" ("LOGMNR_UID", "DROP_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_SHARD_TS_PK" ON "SYSTEM"."LOGMNRC_SHARD_TS" ("LOGMNR_UID", "TABLESPACE_NAME", "START_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
