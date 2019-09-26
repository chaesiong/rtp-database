CREATE TABLE "PIBICSDM2"."RELIGION" 
   (	"REL_CODE" VARCHAR2(2 CHAR), 
	"REL" VARCHAR2(30 CHAR), 
	"UPD_ID" VARCHAR2(13 CHAR), 
	"UPD_DATE" TIMESTAMP (6), 
	"UPD_ORG" VARCHAR2(5 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."RELIGION" ADD PRIMARY KEY ("REL_CODE")
  USING INDEX  ENABLE;
  ;
