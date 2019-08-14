CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_READY_ADD_DATA_TO_PIBICS" AS 
BEGIN
  INSERT INTO DL_INTERFACE.UNSUCCESS_LIST 
  ( SENDER_OBJECT_ID, UNSUCCESS, SENDER_OBJECT, BRDDOCID )
  ( SELECT a.SENDER_OBJECT_ID, 1, a.SENDER_OBJECT, null
    FROM dl_interface.log_sync_webservices a
    INNER JOIN dl_bordercontrol.movements m on a.SENDER_OBJECT_ID = m.MVMNTID
    WHERE (1=1)
    AND m.IS_FINISHED = 'Y'
    AND trunc(a.dml_at) = trunc(sysdate)
    --and trunc(a.dml_at) = date '2019-07-28'
    AND a.SENDER_RESPONSE_MESSAGE not like '%"Success"%'
    AND a.SENDER_RESPONSE_MESSAGE like '%Pibics"%'
    AND a.DML_TYPE = 'I'
    AND a.SENDER_RESPONSE_CODE = '200'
    AND not exists (select 1 from dl_interface.log_sync_webservices a1
                    where a1.SENDER_RESPONSE_MESSAGE like '%"Success"%'
                    and a1.DML_TYPE = 'I'
                    and a.sender_object_id = a1.sender_object_id) );   
                    
END SP_READY_ADD_DATA_TO_PIBICS;
/
