CREATE TABLE "LOGGER"."LOGGER_LOGS_APEX_ITEMS" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"LOG_ID" NUMBER NOT NULL ENABLE, 
	"APP_SESSION" NUMBER NOT NULL ENABLE, 
	"ITEM_NAME" VARCHAR2(1000) NOT NULL ENABLE, 
	"ITEM_VALUE" CLOB
   ) ;
  ALTER TABLE "LOGGER"."LOGGER_LOGS_APEX_ITEMS" ADD CONSTRAINT "LOGGER_LOGS_APX_ITMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "LOGGER"."LOGGER_LOGS_APEX_ITEMS" ADD CONSTRAINT "LOGGER_LOGS_APX_ITMS_FK" FOREIGN KEY ("LOG_ID")
	  REFERENCES "LOGGER"."LOGGER_LOGS" ("ID") ON DELETE CASCADE ENABLE;
  CREATE INDEX "LOGGER"."LOGGER_APEX_ITEMS_IDX1" ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" ("LOG_ID") 
  ;
CREATE UNIQUE INDEX "LOGGER"."LOGGER_LOGS_APX_ITMS_PK" ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" ("ID") 
  ;
CREATE UNIQUE INDEX "LOGGER"."SYS_IL0000310150C00005$$" ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" (
  ;
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_INTERFACE";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_DBA";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_COMMON";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_USER_MANAGEMENT";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "USER_MANAGEMENT";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_BLACKLIST";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DL_STAGING4PIBICS";
  GRANT DELETE ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "LOGGER"."LOGGER_LOGS_APEX_ITEMS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "LOGGER"."BIU_LOGGER_APEX_ITEMS" 
  before insert or update on logger_logs_apex_items
for each row
begin
  $if $$logger_no_op_install $then
    null;
  $else
    :new.id := logger_apx_items_seq.nextval;
  $end
end;
/
ALTER TRIGGER "LOGGER"."BIU_LOGGER_APEX_ITEMS" ENABLE;
