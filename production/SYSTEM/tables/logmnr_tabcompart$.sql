CREATE TABLE "SYSTEM"."LOGMNR_TABCOMPART$" SHARING=METADATA 
   (	"OBJ#" NUMBER(22,0), 
	"BO#" NUMBER(22,0), 
	"PART#" NUMBER(22,0) NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_TABCOMPART$" ADD CONSTRAINT "LOGMNR_TABCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1TABCOMPART$" ON "SYSTEM"."LOGMNR_TABCOMPART$" ("LOGMNR_UID", "OBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE INDEX "SYSTEM"."LOGMNR_I2TABCOMPART$" ON "SYSTEM"."LOGMNR_TABCOMPART$" ("LOGMNR_UID", "BO#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
