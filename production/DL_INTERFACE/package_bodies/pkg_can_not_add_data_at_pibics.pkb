CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_INTERFACE"."PKG_CAN_NOT_ADD_DATA_AT_PIBICS" AS

  PROCEDURE SEND_TO_PIBIC_AGAIN(p_date in date) AS
     cursor send_again is SELECT ROWNUM as iRow, a.SENDER_OBJECT, a.SENDER_OBJECT_ID	
FROM
    dl_interface.log_sync_webservices a
    inner join dl_bordercontrol.movements m on a.SENDER_OBJECT_ID = m.MVMNTID
    where (1=1)
    and trunc(a.dml_at) = trunc(p_date)
    and m.IS_FINISHED = 'Y'
    and a.SENDER_RESPONSE_MESSAGE not like '%"Success"%'
    and ((SENDER_RESPONSE_MESSAGE like '%"Can%') and (SENDER_RESPONSE_MESSAGE like '%not%') and (SENDER_RESPONSE_MESSAGE like '%add%') and (SENDER_RESPONSE_MESSAGE like '%Pibics"%'))
    and a.DML_TYPE = 'I'
    and a.SENDER_RESPONSE_CODE = '200'
    --and a.SENDER_OBJECT = 'MOVEMENTS'
    --and a.SENDER_OBJECT = 'CREW'
    and not exists (select 1 from dl_interface.log_sync_webservices a1
                    where a1.SENDER_RESPONSE_MESSAGE like '%"Success"%'
                    and a1.DML_TYPE = 'I'
                    and a.sender_object_id = a1.sender_object_id)
    order by a.SENDER_OBJECT, a.dml_at desc;  

BEGIN
      -- Start Transaction
      -- Create save point
      -- SAVEPOINT save_point;


      for LoopInfo in send_again
      loop 
          if (LoopInfo.SENDER_OBJECT = 'CREW')
          then
              begin
                    --DBMS_OUTPUT.PUT_LINE(LoopInfo.iRow);
                    --DBMS_OUTPUT.PUT_LINE('CREW' || ' ' || LoopInfo.SENDER_OBJECT_ID);
                    --DBMS_OUTPUT.PUT_LINE('Success');
                    EXEC DL_INTERFACE.PKG_LISTENER.send_bordercontrol_crew(LoopInfo.SENDER_OBJECT_ID, 'I');
              end;      
          else 
              begin
                    --DBMS_OUTPUT.PUT_LINE(LoopInfo.iRow);
                    --DBMS_OUTPUT.PUT_LINE('MOVEMENTS' || ' ' || LoopInfo.SENDER_OBJECT_ID);
                    --DBMS_OUTPUT.PUT_LINE('Success');
                    EXEC DL_INTERFACE.PKG_LISTENER.send_bordercontrol_movement(LoopInfo.SENDER_OBJECT_ID, 'I');
              end;      
          end if;
      end loop;

      -- Exception 
      /*
      EXCEPTION
          WHEN OTHERS THEN
              BEGIN
                  --DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
                  ROLLBACK TO save_point;
              END;
      */
  END SEND_TO_PIBIC_AGAIN;

END PKG_CAN_NOT_ADD_DATA_AT_PIBICS;
/
  GRANT EXECUTE ON "DL_INTERFACE"."PKG_CAN_NOT_ADD_DATA_AT_PIBICS" TO "APPSUP";
