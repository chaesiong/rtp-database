CREATE TABLE "DL_BORDERCONTROL"."LOG_AUTOCHANNEL_API" 
   (	"KEY_VALUE" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"REQUEST" CLOB, 
	"RESPONSE" CLOB, 
	"IP_CLIENT" VARCHAR2(100), 
	"API_PATH" VARCHAR2(300), 
	"INT_BY" VARCHAR2(100), 
	"INT_AT" DATE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."LOG_AUTOCHANNEL_API" ADD CONSTRAINT "XPKLOG_AUTOCHANNEL_API" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000729090C00002$$" ON "DL_BORDERCONTROL"."LOG_AUTOCHANNEL_API" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000729090C00003$$" ON "DL_BORDERCONTROL"."LOG_AUTOCHANNEL_API" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."XPKLOG_AUTOCHANNEL_API" ON "DL_BORDERCONTROL"."LOG_AUTOCHANNEL_API" ("KEY_VALUE") 
  ;
