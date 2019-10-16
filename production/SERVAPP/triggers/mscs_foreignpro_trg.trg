CREATE OR REPLACE EDITIONABLE TRIGGER "SERVAPP"."MSCS_FOREIGNPRO_TRG" 
BEFORE INSERT ON MSCS_FOREIGNPRO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.FOREIGN_SEQNO IS NULL THEN
      SELECT MSCS_FOREIGNPRO_SEQ.NEXTVAL INTO :NEW.FOREIGN_SEQNO FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SERVAPP"."MSCS_FOREIGNPRO_TRG" ENABLE;