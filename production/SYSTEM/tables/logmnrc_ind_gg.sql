CREATE TABLE "SYSTEM"."LOGMNRC_IND_GG" SHARING=METADATA 
   (	"LOGMNR_UID" NUMBER NOT NULL ENABLE, 
	"OBJ#" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(384) NOT NULL ENABLE, 
	"COMMIT_SCN" NUMBER NOT NULL ENABLE, 
	"DROP_SCN" NUMBER, 
	"BASEOBJ#" NUMBER NOT NULL ENABLE, 
	"BASEOBJV#" NUMBER NOT NULL ENABLE, 
	"FLAGS" NUMBER NOT NULL ENABLE, 
	"OWNER#" NUMBER NOT NULL ENABLE, 
	"OWNERNAME" VARCHAR2(384) NOT NULL ENABLE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(4000), 
	"SPARE5" VARCHAR2(4000), 
	"SPARE6" VARCHAR2(4000)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNRC_IND_GG" ADD CONSTRAINT "LOGMNRC_IND_GG_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "COMMIT_SCN")
  USING INDEX  LOCAL
 (PARTITION "P_LESSTHAN100" )  ENABLE;
  CREATE INDEX "SYSTEM"."LOGMNRC_I1INDGG" ON "SYSTEM"."LOGMNRC_IND_GG" ("LOGMNR_UID", "BASEOBJ#", "BASEOBJV#", "COMMIT_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE INDEX "SYSTEM"."LOGMNRC_I2INDGG" ON "SYSTEM"."LOGMNRC_IND_GG" ("LOGMNR_UID", "DROP_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_IND_GG_PK" ON "SYSTEM"."LOGMNRC_IND_GG" ("LOGMNR_UID", "OBJ#", "COMMIT_SCN") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
