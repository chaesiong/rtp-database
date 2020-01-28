CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "SENDER_NAME", "SENDER_ADDRESS", "SENDER_PROTOCOL", "DEQUEUE_MSGID", "DELIVERY_MODE", "SEQUENCE_NUM", "MSG_NUM", "QUEUE_ID", "USER_PROP", "SUBSCRIBER_ID", "SUBSCRIBER_NAME", "QUEUE_EVTID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(iot) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA, qt.sender_name SENDER_NAME, qt.sender_address SENDER_ADDRESS, qt.sender_protocol SENDER_PROTOCOL, qt.dequeue_msgid DEQUEUE_MSGID, 'PERSISTENT' DELIVERY_MODE, 0 SEQUENCE_NUM, 0 MSG_NUM, qo.qid QUEUE_ID, qt.user_prop USER_PROP, iot.subscriber# SUBSCRIBER_ID, iot.name SUBSCRIBER_NAME, iot.queue# QUEUE_EVTID FROM "AQ_BORDERCONTROL_HOOKS_TAB2" qt, "AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_I" iot, SYS.ALL_INT_DEQUEUE_QUEUES qo WHERE qt.msgid=iot.msgid  and qt.q_name = qo.name  AND qo.owner = 'DL_BORDERCONTROL' AND iot.msg_enq_time = qt.enq_time AND  iot.msg_step_no = qt.step_no AND iot.msg_local_order_no = qt.local_order_no AND   iot.msg_chain_no = qt.chain_no  WITH READ ONLY;
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB2_F" TO "PUNYAWII_D";
