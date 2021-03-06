CREATE TABLE "SYSTEM"."LOGMNR_CDEF$" SHARING=METADATA 
   (	"CON#" NUMBER, 
	"COLS" NUMBER, 
	"TYPE#" NUMBER, 
	"ROBJ#" NUMBER, 
	"RCON#" NUMBER, 
	"ENABLED" NUMBER, 
	"DEFER" NUMBER, 
	"OBJ#" NUMBER NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_CDEF$" ADD CONSTRAINT "LOGMNR_CDEF$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1CDEF$" ON "SYSTEM"."LOGMNR_CDEF$" ("LOGMNR_UID", "CON#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE INDEX "SYSTEM"."LOGMNR_I2CDEF$" ON "SYSTEM"."LOGMNR_CDEF$" ("LOGMNR_UID", "ROBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE INDEX "SYSTEM"."LOGMNR_I3CDEF$" ON "SYSTEM"."LOGMNR_CDEF$" ("LOGMNR_UID", "OBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
