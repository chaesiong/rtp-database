CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_SEND_TO_PIBICS_CASE_TM6NUM" AS 

      cursor send_again is SELECT a.SENDER_OBJECT, a.SENDER_OBJECT_ID	
                           FROM DL_INTERFACE.UNSUCCESS_LIST a
                           WHERE a.UNSUCCESS = 4;

BEGIN
      -- Start Transaction
      -- Create save point
      -- SAVEPOINT save_point;
      
      UPDATE DL_BORDERCONTROL.ENTRY_FORMS SET 
      FORM_NO = '0000000'
      WHERE KEY_VALUE in (select m.ENTRY_FORM
                    from dl_bordercontrol.movements m
                    where m.MVMNTID in (SELECT un.SENDER_OBJECT_ID 
                                        FROM DL_INTERFACE.UNSUCCESS_LIST un 
                                        WHERE un.UNSUCCESS = 4))
      AND FORM_NO is null;                                        
      COMMIT; 


      for LoopInfo in send_again
      loop 
          DL_INTERFACE.PKG_LISTENER.send_bordercontrol_crew(LoopInfo.SENDER_OBJECT_ID, 'I');
      end loop;
      
      
      DELETE FROM DL_INTERFACE.UNSUCCESS_LIST WHERE UNSUCCESS = 4;
      COMMIT;

      -- Exception 
      /*
      EXCEPTION
          WHEN OTHERS THEN
              BEGIN
                  --DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
                  ROLLBACK TO save_point;
              END;
      */
      
--BEGIN
--NULL;
END SP_SEND_TO_PIBICS_CASE_TM6NUM;
/
