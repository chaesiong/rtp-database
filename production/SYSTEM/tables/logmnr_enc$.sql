CREATE TABLE "SYSTEM"."LOGMNR_ENC$" SHARING=METADATA 
   (	"OBJ#" NUMBER, 
	"OWNER#" NUMBER, 
	"ENCALG" NUMBER, 
	"INTALG" NUMBER, 
	"COLKLC" RAW(2000), 
	"KLCLEN" NUMBER, 
	"FLAG" NUMBER, 
	"MKEYID" VARCHAR2(192) NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_ENC$" ADD CONSTRAINT "LOGMNR_ENC$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OWNER#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1ENC$" ON "SYSTEM"."LOGMNR_ENC$" ("LOGMNR_UID", "OBJ#", "OWNER#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
