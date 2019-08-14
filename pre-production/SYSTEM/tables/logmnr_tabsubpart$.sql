CREATE TABLE "SYSTEM"."LOGMNR_TABSUBPART$" SHARING=METADATA 
   (	"OBJ#" NUMBER(22,0), 
	"DATAOBJ#" NUMBER(22,0), 
	"POBJ#" NUMBER(22,0), 
	"SUBPART#" NUMBER(22,0), 
	"TS#" NUMBER(22,0) NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_TABSUBPART$" ADD CONSTRAINT "LOGMNR_TABSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1TABSUBPART$" ON "SYSTEM"."LOGMNR_TABSUBPART$" ("LOGMNR_UID", "OBJ#", "POBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE INDEX "SYSTEM"."LOGMNR_I2TABSUBPART$" ON "SYSTEM"."LOGMNR_TABSUBPART$" ("LOGMNR_UID", "POBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
