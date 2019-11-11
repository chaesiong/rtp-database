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
  CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000605138C00003$$" ON "DL_INTERFACE"."LOG_WEBAPI" (
  ;
CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000605138C00004$$" ON "DL_INTERFACE"."LOG_WEBAPI" (
  ;
  GRANT INSERT ON "DL_INTERFACE"."LOG_WEBAPI" TO "INTERPOL_ADMIN";
  GRANT DELETE ON "DL_INTERFACE"."LOG_WEBAPI" TO "INTERPOL_ADMIN";
  GRANT SELECT ON "DL_INTERFACE"."LOG_WEBAPI" TO "INTERPOL_ADMIN";
  GRANT UPDATE ON "DL_INTERFACE"."LOG_WEBAPI" TO "INTERPOL_ADMIN";
  GRANT SELECT ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT DELETE ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT INDEX ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT INSERT ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT SELECT ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT UPDATE ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT READ ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT DEBUG ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_INTERFACE"."LOG_WEBAPI" TO "BIOSAADM";
