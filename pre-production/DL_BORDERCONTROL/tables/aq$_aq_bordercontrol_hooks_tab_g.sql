CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" 
   (	"MSGID" RAW(16), 
	"SUBSCRIBER#" NUMBER, 
	"NAME" VARCHAR2(512 CHAR), 
	"ADDRESS#" NUMBER, 
	"SIGN" "SYS"."AQ$_SIG_PROP" , 
	"DBS_SIGN" "SYS"."AQ$_SIG_PROP" , 
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS  INCLUDING "SIGN" OVERFLOW;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IOT_TOP_311847" ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_G" TO "TRAINEE";
