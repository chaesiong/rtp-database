CREATE OR REPLACE EDITIONABLE TRIGGER "DL_USER_MANAGEMENT"."AFTER_DB_LOGON_SET_CUSTOM_CTX" 
  after LOGON on database
  declare
  v_STMT varchar2(4000 char);
begin
  v_STMT := q'[begin
  pkg_set_custom_ctx.post_db_logon();
exception
  when others then
    raise;
end;]';
  execute immediate v_STMT;
exception
  when others then
    null;
end After_DB_LogON_Set_Custom_Ctx;
/
ALTER TRIGGER "DL_USER_MANAGEMENT"."AFTER_DB_LOGON_SET_CUSTOM_CTX" ENABLE;
