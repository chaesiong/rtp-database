CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" 
   (	"SUBSCRIBER#" NUMBER, 
	"NAME" VARCHAR2(512), 
	"QUEUE#" NUMBER, 
	"MSG_ENQ_TIME" TIMESTAMP (6), 
	"MSG_STEP_NO" NUMBER, 
	"MSG_CHAIN_NO" NUMBER, 
	"MSG_LOCAL_ORDER_NO" NUMBER, 
	"MSGID" RAW(16), 
	"HINT" ROWID, 
	"SPARE" RAW(16), 
	 PRIMARY KEY ("SUBSCRIBER#", "NAME", "QUEUE#", "MSG_ENQ_TIME", "MSG_STEP_NO", "MSG_CHAIN_NO", "MSG_LOCAL_ORDER_NO", "MSGID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IOT_TOP_698356" ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" ("SUBSCRIBER#", "NAME", "QUEUE#", "MSG_ENQ_TIME", "MSG_STEP_NO", "MSG_CHAIN_NO", "MSG_LOCAL_ORDER_NO", "MSGID") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_EVOA_HOOKS_TAB_I" TO "PUNYAWII_D";
