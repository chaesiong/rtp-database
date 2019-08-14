CREATE TABLE "SYSTEM"."LOGMNR_INDSUBPART$" SHARING=METADATA 
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
  ALTER TABLE "SYSTEM"."LOGMNR_INDSUBPART$" ADD CONSTRAINT "LOGMNR_INDSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1INDSUBPART$" ON "SYSTEM"."LOGMNR_INDSUBPART$" ("LOGMNR_UID", "OBJ#", "POBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;