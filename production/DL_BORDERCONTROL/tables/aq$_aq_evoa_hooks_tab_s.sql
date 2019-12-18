CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" 
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
  ALTER TABLE "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" ADD PRIMARY KEY ("SUBSCRIBER_ID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_C00413023" ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" ("SUBSCRIBER_ID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_S" TO "PORNRUKSA_S";
