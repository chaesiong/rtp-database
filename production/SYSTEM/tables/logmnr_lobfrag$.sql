CREATE TABLE "SYSTEM"."LOGMNR_LOBFRAG$" SHARING=METADATA 
   (	"FRAGOBJ#" NUMBER, 
	"PARENTOBJ#" NUMBER, 
	"TABFRAGOBJ#" NUMBER, 
	"INDFRAGOBJ#" NUMBER, 
	"FRAG#" NUMBER NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_LOBFRAG$" ADD CONSTRAINT "LOGMNR_LOBFRAG$_PK" PRIMARY KEY ("LOGMNR_UID", "FRAGOBJ#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1LOBFRAG$" ON "SYSTEM"."LOGMNR_LOBFRAG$" ("LOGMNR_UID", "FRAGOBJ#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
