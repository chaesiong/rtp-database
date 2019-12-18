CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_READY_INVALID_TM6NUM_FORMAT" (SENDDATE IN DATE) AS 

V_SENDDATE    DATE; 

BEGIN
  V_SENDDATE := SENDDATE;
  
  INSERT INTO DL_INTERFACE.UNSUCCESS_LIST 
  ( SENDER_OBJECT_ID, UNSUCCESS, SENDER_OBJECT, BRDDOCID )
  ( SELECT distinct (a.SENDER_OBJECT_ID), 4, null, m.BRDDOCID	
    FROM dl_interface.log_sync_webservices a
    INNER JOIN dl_bordercontrol.movements m on a.SENDER_OBJECT_ID = m.MVMNTID
    WHERE (1=1)
    AND trunc(a.dml_at) = trunc(V_SENDDATE)
    --AND trunc(a.dml_at) = trunc(sysdate)
    --AND trunc(a.dml_at) = date '2019-12-06'
    AND a.SENDER_OBJECT = 'CREW'
    AND m.IS_FINISHED = 'Y'
    AND a.DML_TYPE = 'I'
    AND a.SENDER_RESPONSE_CODE = '200'
    AND a.SENDER_RESPONSE_MESSAGE like '%personData.tm6Number%'
    AND a.SENDER_RESPONSE_MESSAGE not like '%"Success"%'
    AND NOT EXISTS (select 1 from dl_interface.log_sync_webservices a1
                    where a1.SENDER_RESPONSE_MESSAGE like '%"Success"%'
                    and a1.DML_TYPE = 'I'
                    and a.sender_object_id = a1.sender_object_id));
                    
END SP_READY_INVALID_TM6NUM_FORMAT;
/
