CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "PROPAGATED_MSGID", "SENDER_NAME", "SENDER_ADDRESS", "SENDER_PROTOCOL", "ORIGINAL_MSGID", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON", "CONSUMER_NAME", "ADDRESS", "PROTOCOL") AS 
  SELECT  q_name QUEUE, qt.msgid MSG_ID, corrid CORR_ID,  priority MSG_PRIORITY,  decode(bitand(s.subscriber_type,2) , 2,'UNDELIVERABLE',
                                             decode(h.dequeue_time, NULL,decode(l.dequeue_time, NULL, decode(state, 0,   'READY',	     
                              		                                          1,   'WAIT',	     
                                                                                  2,   'PROCESSED',	     
                                                                                  3,   'EXPIRED',
                                                                                  8,   'DEFERRED',
                                                                                 10,  'BUFFERED_EXPIRED'),(decode(l.transaction_id, NULL, 'UNDELIVERABLE', 'PROCESSED'))), (decode(h.transaction_id, NULL, 'UNDELIVERABLE', 'PROCESSED')))
                          )                         MSG_STATE,  cast(FROM_TZ(qt.delay, '00:00')
                 at time zone sessiontimezone as date) delay,  cast(FROM_TZ(qt.delay, '00:00')
                 at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration,  cast(FROM_TZ(qt.enq_time, '00:00')
                 at time zone sessiontimezone as date) enq_time,  cast(FROM_TZ(qt.enq_time, '00:00')
                 at time zone sessiontimezone as timestamp)
                 enq_timestamp,   enq_uid ENQ_USER_ID,  qt.enq_tid ENQ_TXN_ID,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_DATE(NULL),cast(FROM_TZ(qt.deq_time, '00:00')
                 at time zone sessiontimezone as date)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, '00:00')
                 at time zone sessiontimezone as date)) DEQ_TIME,  decode(h.transaction_id, NULL, 
                 decode(l.transaction_id, NULL, 
                 decode(qt.deq_tid, NULL, TO_TIMESTAMP(NULL), cast(FROM_TZ(qt.deq_time, '00:00')
                 at time zone sessiontimezone as timestamp)), l.dequeue_time),
                        cast(FROM_TZ(h.dequeue_time, '00:00')
                 at time zone sessiontimezone as timestamp))
                 DEQ_TIMESTAMP,  decode(h.dequeue_user, NULL, l.dequeue_user, h.dequeue_user) 
	         DEQ_USER_ID,  decode(h.transaction_id, NULL, l.transaction_id, 
                 h.transaction_id) DEQ_TXN_ID,  h.retry_count retry_count,  decode (state, 0, exception_qschema, 
                                1, exception_qschema, 
                                2, exception_qschema,  
                                NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                1, exception_queue, 
                                2, exception_queue,  
                                NULL) EXCEPTION_QUEUE,  user_data,  h.propagated_msgid PROPAGATED_MSGID,  sender_name  SENDER_NAME, sender_address  SENDER_ADDRESS, sender_protocol  SENDER_PROTOCOL, dequeue_msgid ORIGINAL_MSGID,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_queue, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_queue)),
                   decode (h.transaction_id, NULL, NULL, exception_queue)) 
                                ORIGINAL_QUEUE_NAME,  decode (h.dequeue_time, NULL, decode (l.dequeue_time, NULL,
                   decode (state, 3, exception_qschema, NULL), 
                   decode (l.transaction_id, NULL, NULL, exception_qschema)),
                   decode (h.transaction_id, NULL, NULL, exception_qschema)) 
                                ORIGINAL_QUEUE_OWNER,  decode(bitand(s.subscriber_type, 2), 2,
                                         'Messages to be cleaned up later',
                        decode(h.dequeue_time, NULL, 
                               decode(state, 3, 
                                           decode(h.transaction_id, NULL, 
                                           decode (expiration , NULL , 
                                                   'MAX_RETRY_EXCEEDED',
                                                   'TIME_EXPIRATION'),
                                                   'INVALID_TRANSACTION', NULL,
                                                   'MAX_RETRY_EXCEEDED'), NULL),
                                           decode(h.transaction_id, NULL, 
                                                 'PROPAGATION_FAILURE', NULL)))
                 EXPIRATION_REASON,  decode(h.subscriber#, 0, decode(h.name, '0', NULL,
							        h.name),
					  s.name) CONSUMER_NAME,  s.address ADDRESS,  s.protocol PROTOCOL  FROM "AQ_BORDERCONTROL_HOOKS_TAB" qt, "AQ$_AQ_BORDERCONTROL_HOOKS_TAB_H" h LEFT OUTER JOIN  (SELECT fv.MSGID MSGID, fv.SUBSCRIBER# SUBSCRIBER#, fv.NAME NAME, 0 ADDRESS#, fv.DEQUEUE_TIME DEQUEUE_TIME,fv.TRANSACTION_ID TRANSACTION_ID, fv.DEQUEUE_USER DEQUEUE_USER, fv.FLAGS FLAGS FROM AQ$_UNFLUSHED_DEQUEUES fv WHERE fv.QTOBJNO = 311831 union select dl.MSGID MSGID, dl.SUBSCRIBER# SUBSCRIBER#, dl.NAME NAME, dl.ADDRESS# ADDRESS#, dl.DEQUEUE_TIME DEQUEUE_TIME, dl.TRANSACTION_ID TRANSACTION_ID, dl.DEQUEUE_USER DEQUEUE_USER, dl.FLAGS FLAGS from "DL_BORDERCONTROL"."AQ$_AQ_BORDERCONTROL_HOOKS_TAB_L" dl )  l  ON h.msgid = l.msgid AND h.subscriber# = l.subscriber# AND h.name = l.name AND h.address# = l.address#, "AQ$_AQ_BORDERCONTROL_HOOKS_TAB_S" s  WHERE  qt.msgid = h.msgid AND  ((h.subscriber# != 0 AND h.subscriber# = s.subscriber_id)  OR (h.subscriber# = 0 AND h.address# = s.subscriber_id)) AND (qt.state != 7 OR   qt.state != 9 )     WITH READ ONLY;
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."AQ$AQ_BORDERCONTROL_HOOKS_TAB" TO "DERMALOG_PROXY";
