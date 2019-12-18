CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" 
   (	"MSGID" RAW(16), 
	"SUBSCRIBER#" NUMBER, 
	"NAME" VARCHAR2(512), 
	"ADDRESS#" NUMBER, 
	"SIGN" "SYS"."AQ$_SIG_PROP" , 
	"DBS_SIGN" "SYS"."AQ$_SIG_PROP" , 
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS  INCLUDING "SIGN" OVERFLOW;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IOT_TOP_639275" ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") 
  ;
  GRANT ALTER ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_G" TO "PORNRUKSA_S";
