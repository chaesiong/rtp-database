CREATE TABLE "SERVAPP"."MSCS_SETTING_STATUS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CODE" VARCHAR2(200 CHAR), 
	"TEXT" VARCHAR2(200 CHAR), 
	"TEXT_EN" VARCHAR2(200 CHAR), 
	"STATUS" VARCHAR2(20 CHAR), 
	"ORDER_SEQ" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_SETTING_STATUS" ADD CONSTRAINT "MSCS_SETTING_STATUS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_SETTING_STATUS_PK" ON "SERVAPP"."MSCS_SETTING_STATUS" ("ID") 
  ;
