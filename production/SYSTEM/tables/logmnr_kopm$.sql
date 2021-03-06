CREATE TABLE "SYSTEM"."LOGMNR_KOPM$" SHARING=METADATA 
   (	"LENGTH" NUMBER, 
	"METADATA" RAW(255), 
	"NAME" VARCHAR2(384) NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_KOPM$" ADD CONSTRAINT "LOGMNR_KOPM$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1KOPM$" ON "SYSTEM"."LOGMNR_KOPM$" ("LOGMNR_UID", "NAME") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;
