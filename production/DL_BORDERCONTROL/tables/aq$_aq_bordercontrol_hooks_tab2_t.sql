CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" 
   (	"NEXT_DATE" TIMESTAMP (6), 
	"TXN_ID" VARCHAR2(30), 
	"MSGID" RAW(16), 
	"ACTION" NUMBER, 
	 PRIMARY KEY ("NEXT_DATE", "TXN_ID", "MSGID") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IOT_TOP_639270" ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" ("NEXT_DATE", "TXN_ID", "MSGID") 
  ;
  GRANT ALTER ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_T" TO "PUNYAWII_D";
