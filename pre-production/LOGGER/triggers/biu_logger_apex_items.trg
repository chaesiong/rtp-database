CREATE OR REPLACE EDITIONABLE TRIGGER "LOGGER"."BIU_LOGGER_APEX_ITEMS" 
  before insert or update on logger_logs_apex_items
for each row
begin
  $if $$logger_no_op_install $then
    null;
  $else
    :new.id := logger_apx_items_seq.nextval;
  $end
end;
/
ALTER TRIGGER "LOGGER"."BIU_LOGGER_APEX_ITEMS" ENABLE;
