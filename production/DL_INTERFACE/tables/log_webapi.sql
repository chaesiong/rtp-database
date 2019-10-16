CREATE TABLE "DL_INTERFACE"."LOG_WEBAPI" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"OPERATE_DATE" DATE, 
	"REQUEST" CLOB, 
	"RESPONSE" CLOB, 
	"IP" VARCHAR2(50), 
	"API_PATH" VARCHAR2(500), 
	"CREATE_BY" VARCHAR2(50), 
	"CREATE_DATE" DATE
   ) ;
  ALTER TABLE "DL_INTERFACE"."LOG_WEBAPI" ADD CONSTRAINT "XPKLOG_WEBAPI" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ;
  ;