CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."USERS" 
    after insert or delete on dl_user_management.users
declare
  l_job number;
begin
  dbms_job.submit(l_job, q'[dbms_mview.refresh( 'dl_user_management.apex_menu_permissions' );]');
end;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."USERS" ENABLE;
