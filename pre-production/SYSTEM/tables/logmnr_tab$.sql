CREATE TABLE "SYSTEM"."LOGMNR_TAB$" SHARING=METADATA 
   (	"TS#" NUMBER(22,0), 
	"COLS" NUMBER(22,0), 
	"PROPERTY" NUMBER, 
	"INTCOLS" NUMBER(22,0), 
	"KERNELCOLS" NUMBER(22,0), 
	"BOBJ#" NUMBER(22,0), 
	"TRIGFLAG" NUMBER(22,0), 
	"FLAGS" NUMBER(22,0), 
	"OBJ#" NUMBER(22,0) NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0), 
	"ACDRFLAGS" NUMBER, 
	"ACDRTSOBJ#" NUMBER, 
	"ACDRROWTSINTCOL#" NUMBER
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_TAB$" ADD CONSTRAINT "LOGMNR_TAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1TAB$" ON "SYSTEM"."LOGMNR_TAB$" ("LOGMNR_UID", "OBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
CREATE INDEX "SYSTEM"."LOGMNR_I2TAB$" ON "SYSTEM"."LOGMNR_TAB$" ("LOGMNR_UID", "BOBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;