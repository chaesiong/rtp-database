CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" ("QUEUE", "NAME", "ADDRESS", "PROTOCOL", "TRANSFORMATION", "QUEUE_TO_QUEUE") AS 
  SELECT queue_name QUEUE, name NAME , address ADDRESS , protocol PROTOCOL, trans_name TRANSFORMATION, decode(bitand(SUBSCRIBER_TYPE, 512), 512, 'TRUE', 'FALSE') QUEUE_TO_QUEUE  FROM "AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_S" s  WHERE (bitand(s.subscriber_type, 1) = 1)  WITH READ ONLY;
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB2_S" TO "BIOSAADM";