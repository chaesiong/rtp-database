CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."XLIB_LOGS_BI_TRG" 
  before insert on DL_BORDERCONTROL.XLIB_LOGS
  referencing new as new old as old
  for each row
--
  --
  /*******************************************************************************
  *
  *                                                                              *
  *                                                                              *
  * Author    Date        Description                                            *
  * --------  ----------  -------------------------------------------------------*
  * WWirns    06.11.2017  Added as copy of BORDERCONTROL.CAMBODIA
  *******************************************************************************/
  --
  --
begin
  if :NEW.log_id is null
  then
    select XLIB_SEQ.NEXTVAL
      into :NEW.log_id
      from DUAL;
  end if;
end;
/
ALTER TRIGGER "DL_BORDERCONTROL"."XLIB_LOGS_BI_TRG" ENABLE;
