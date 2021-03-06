CREATE TABLE "SERVAPP"."LOG_PREREGISTOR_API" 
   (	"KEY_VALUE" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"REQUEST" CLOB, 
	"RESPONSE" CLOB, 
	"IP_CLIENT" VARCHAR2(100), 
	"API_PATH" VARCHAR2(300), 
	"INT_BY" VARCHAR2(100), 
	"INT_AT" DATE
   ) ;
  ALTER TABLE "SERVAPP"."LOG_PREREGISTOR_API" ADD CONSTRAINT "XPKLOG_PREREGISTOR_API" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."SYS_IL0000724008C00002$$" ON "SERVAPP"."LOG_PREREGISTOR_API" (
  ;
CREATE UNIQUE INDEX "SERVAPP"."SYS_IL0000724008C00003$$" ON "SERVAPP"."LOG_PREREGISTOR_API" (
  ;
CREATE UNIQUE INDEX "SERVAPP"."XPKLOG_PREREGISTOR_API" ON "SERVAPP"."LOG_PREREGISTOR_API" ("KEY_VALUE") 
  ;
