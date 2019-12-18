CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."INTERFACE_ADDON_TRG" 
BEFORE INSERT ON INTERFACE_ADDON 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.KEY_VALUE IS NULL THEN
      SELECT INTERFACE_ADDON_SEQ.NEXTVAL INTO :NEW.KEY_VALUE FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "DL_BORDERCONTROL"."INTERFACE_ADDON_TRG" ENABLE;
