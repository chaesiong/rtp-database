CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_INTERFACE"."SP_SEND_TO_PIBICS_CASE_GIVEN" AS 

      cursor send_again is SELECT a.SENDER_OBJECT, a.SENDER_OBJECT_ID	
                           FROM DL_INTERFACE.UNSUCCESS_LIST a
                           WHERE a.UNSUCCESS = 3;

BEGIN
      -- Start Transaction
      -- Create save point
      -- SAVEPOINT save_point;
      
      UPDATE  DL_BORDERCONTROL.BORDERDOCUMENTS set 
      GIVENNAME = ' ' 
      where BRDDOCID in (SELECT un.BRDDOCID FROM DL_INTERFACE.UNSUCCESS_LIST un WHERE un.UNSUCCESS = 3) 
      AND GIVENNAME is null;
      commit;


      for LoopInfo in send_again
      loop 
          DL_INTERFACE.PKG_LISTENER.send_bordercontrol_crew(LoopInfo.SENDER_OBJECT_ID, 'I');
      end loop;
      
      
      DELETE FROM DL_INTERFACE.UNSUCCESS_LIST WHERE UNSUCCESS = 3;
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
END SP_SEND_TO_PIBICS_CASE_GIVEN;
/
