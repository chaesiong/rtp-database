CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_BORDERCONTROL"."SP_INSERT_TO_ENTRY_FORMS" AS 

      cursor send_again is SELECT a.KEY_NO
                                  ,a.INS_AT
                                  ,a.INS_BY
                                  ,a.DML_AT
                                  ,a.DML_BY

                                  ,a.DML_TYPE
                                  ,a.INS_TERMINAL
                                  ,a.INS_BORDERPOST
                                  ,a.FORM_IMAGE
                                  ,a.FORM_NO

                                  ,a.PROVINCE
                                  ,a.DISTRICT
                                  ,a.SUBDISTRICT
                                  ,a.ADDRESS
                                  ,a.NOTE	
                                  
                                  ,a.MVMNTID
                           FROM DL_BORDERCONTROL.ENTRY_FORMS_ATC a;
                           
BEGIN

    DECLARE
        sKeyValue VARCHAR2(32); 
        
    begin    
    for LoopInfo in send_again
        loop 
        
          SELECT SYS_GUID() into sKeyValue FROM DUAL;
          
          INSERT INTO DL_BORDERCONTROL.ENTRY_FORMS  (
                                                      KEY_VALUE, INS_AT, INS_BY, DML_AT, DML_BY
                                                    , DML_TYPE, INS_TERMINAL, INS_BORDERPOST, FORM_IMAGE, FORM_NO
                                                    , PROVINCE, DISTRICT, SUBDISTRICT, ADDRESS, NOTE
                                                    )
                                            VALUES  (
                                                      sKeyValue, LoopInfo.INS_AT, LoopInfo.INS_BY, LoopInfo.DML_AT, LoopInfo.DML_BY
                                                    , LoopInfo.DML_TYPE, LoopInfo.INS_TERMINAL, LoopInfo.INS_BORDERPOST, LoopInfo.FORM_IMAGE, LoopInfo.FORM_NO
                                                    , LoopInfo.PROVINCE, LoopInfo.DISTRICT, LoopInfo.SUBDISTRICT, LoopInfo.ADDRESS, LoopInfo.NOTE                                            
                                                    );
                                                    
          UPDATE DL_BORDERCONTROL.MOVEMENTS SET ENTRY_FORM = sKeyValue WHERE MVMNTID = LoopInfo.MVMNTID AND ENTRY_FORM is null;
          COMMIT;
          
      end loop;
      end;
      
END SP_INSERT_TO_ENTRY_FORMS;
/
