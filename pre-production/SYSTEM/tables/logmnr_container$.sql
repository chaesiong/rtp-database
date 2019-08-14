CREATE TABLE "SYSTEM"."LOGMNR_CONTAINER$" SHARING=METADATA 
   (	"OBJ#" NUMBER NOT NULL ENABLE, 
	"CON_ID#" NUMBER NOT NULL ENABLE, 
	"DBID" NUMBER NOT NULL ENABLE, 
	"CON_UID" NUMBER NOT NULL ENABLE, 
	"CREATE_SCNWRP" NUMBER NOT NULL ENABLE, 
	"CREATE_SCNBAS" NUMBER NOT NULL ENABLE, 
	"FLAGS" NUMBER, 
	"STATUS" NUMBER NOT NULL ENABLE, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0), 
	"VSN" NUMBER, 
	"FED_ROOT_CON_ID#" NUMBER
   ) 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) ) ;
  ALTER TABLE "SYSTEM"."LOGMNR_CONTAINER$" ADD CONSTRAINT "LOGMNR_CONTAINER$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  CREATE INDEX "SYSTEM"."LOGMNR_I1CONTAINER$" ON "SYSTEM"."LOGMNR_CONTAINER$" ("LOGMNR_UID", "CON_ID#") 
   LOCAL
 (PARTITION "P_LESSTHAN100" ) ;