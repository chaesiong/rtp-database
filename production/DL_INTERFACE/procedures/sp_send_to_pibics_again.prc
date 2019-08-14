CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_SEND_TO_PIBICS_AGAIN" AS 

      cursor send_again is SELECT a.SENDER_OBJECT, a.SENDER_OBJECT_ID	
                           FROM DL_INTERFACE.UNSUCCESS_LIST a
                           WHERE a.UNSUCCESS = 1;

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
                    DL_INTERFACE.PKG_LISTENER.send_bordercontrol_crew(LoopInfo.SENDER_OBJECT_ID, 'I');
              end;      
          else 
              begin
                    --DBMS_OUTPUT.PUT_LINE(LoopInfo.iRow);
                    --DBMS_OUTPUT.PUT_LINE('MOVEMENTS' || ' ' || LoopInfo.SENDER_OBJECT_ID);
                    --DBMS_OUTPUT.PUT_LINE('Success');
                    DL_INTERFACE.PKG_LISTENER.send_bordercontrol_movement(LoopInfo.SENDER_OBJECT_ID, 'I');
              end;      
          end if;
      end loop;
      
      
      DELETE FROM DL_INTERFACE.UNSUCCESS_LIST WHERE UNSUCCESS = 1;
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
END SP_SEND_TO_PIBICS_AGAIN;
/
  GRANT EXECUTE ON "DL_INTERFACE"."SP_SEND_TO_PIBICS_AGAIN" TO "APPSUP";
