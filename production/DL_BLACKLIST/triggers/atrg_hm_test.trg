CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."ATRG_HM_TEST" 
  after insert or update or delete
  on DL_BLACKLIST.HM_TEST
  for each row
declare
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_mode varchar2(1);
  v_rowid varchar2(18);
  v_colname dl_maintenance.trig_main.t_array;
  v_coldata_old dl_maintenance.trig_main.t_array;
  v_coldata_new dl_maintenance.trig_main.t_array;
begin
  /* Auto-generated by TRIG_TOOLS at 28.10.2019 21:00:43 */
  IF DELETING THEN
   v_mode:='D';
   v_rowid:=:old.rowid;
END IF;
IF INSERTING THEN
   v_mode:='I';
   v_rowid:=:new.rowid;
END IF;
IF UPDATING THEN
   v_mode:='U';
   v_rowid:=:old.rowid;
END IF;
v_colname:= dl_maintenance.trig_main.t_array ();
v_coldata_new:= dl_maintenance.trig_main.t_array ();
v_coldata_old:= dl_maintenance.trig_main.t_array ();
dl_maintenance.trig_main.trigger('DL_BLACKLIST','HM_TEST',v_rowid,v_mode,dl_common.pkg_session.get_audit_user(),v_colname,v_coldata_old,v_coldata_new);
commit;
exception when others then
  dl_maintenance.trig_main.log('Exception in trigger: HM_TEST',sqlerrm);
  commit;
end;
/
ALTER TRIGGER "DL_BLACKLIST"."ATRG_HM_TEST" ENABLE;
