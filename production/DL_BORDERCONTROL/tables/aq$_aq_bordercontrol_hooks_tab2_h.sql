CREATE TABLE "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" 
   (	"MSGID" RAW(16), 
	"SUBSCRIBER#" NUMBER, 
	"NAME" VARCHAR2(512), 
	"ADDRESS#" NUMBER, 
	"DEQUEUE_TIME" TIMESTAMP (6), 
	"TRANSACTION_ID" VARCHAR2(30), 
	"DEQUEUE_USER" VARCHAR2(128), 
	"PROPAGATED_MSGID" RAW(16), 
	"RETRY_COUNT" NUMBER, 
	"HINT" ROWID, 
	"SPARE" RAW(16), 
	 PRIMARY KEY ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") ENABLE
   ) USAGE QUEUE ORGANIZATION INDEX NOCOMPRESS ;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IOT_TOP_639272" ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" ("MSGID", "SUBSCRIBER#", "NAME", "ADDRESS#") 
  ;
  GRANT ALTER ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_H" TO "BIOSAADM";
