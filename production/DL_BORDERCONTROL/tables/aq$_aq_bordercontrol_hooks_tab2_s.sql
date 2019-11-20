CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" 
   (	"SUBSCRIBER_ID" NUMBER NOT NULL ENABLE, 
	"QUEUE_NAME" VARCHAR2(128) NOT NULL ENABLE, 
	"NAME" VARCHAR2(512), 
	"ADDRESS" VARCHAR2(1024), 
	"PROTOCOL" NUMBER, 
	"SUBSCRIBER_TYPE" NUMBER, 
	"RULE_NAME" VARCHAR2(128), 
	"TRANS_NAME" VARCHAR2(261), 
	"RULESET_NAME" VARCHAR2(261), 
	"NEGATIVE_RULESET_NAME" VARCHAR2(261), 
	"CREATION_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"MODIFICATION_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"DELETION_TIME" TIMESTAMP (6) WITH TIME ZONE, 
	"SCN_AT_REMOVE" NUMBER, 
	"SCN_AT_ADD" NUMBER
   ) USAGE QUEUE ;
  ALTER TABLE "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" ADD PRIMARY KEY ("SUBSCRIBER_ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_C00386765" ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" ("SUBSCRIBER_ID") 
  ;
  GRANT ALTER ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";