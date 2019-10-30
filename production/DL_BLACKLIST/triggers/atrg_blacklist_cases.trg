CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."ATRG_BLACKLIST_CASES" 
  after insert or update or delete
  on DL_BLACKLIST.BLACKLIST_CASES
  for each row
declare
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_mode varchar2(1);
  v_rowid varchar2(18);
  v_colname dl_maintenance.trig_main.t_array;
  v_coldata_old dl_maintenance.trig_main.t_array;
  v_coldata_new dl_maintenance.trig_main.t_array;
begin
  /* Auto-generated by TRIG_TOOLS at 30.10.2019 01:00:51 */
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
v_colname:= dl_maintenance.trig_main.t_array ( 'ID','AUTHORITY','BEHAVIOR','CASE_NUMBER','SECRET_LEVEL','REASON','IS_ACTIVE','INS_BY','DML_BY','DML_TYPE','URGENT_CONTACT','CONTACT_INFORMATION','TARGET_CODE','ACTION_CODE','NOTICE','REFERENCE_DOCUMENT','WARRANT_ARRESTED_TYPE','CRIMINAL_CASE_NUMBER','ARRESTED_DESCRIPTION','ARRESTED_STATUS','DECIDED_CASE_NUMBER','ARRESTED_WARRANT_EXPIRY_DATE','RELATED_DOCUMENT','ARRESTED_WARRANT_NUMBER','ARRESTED_WARRANT_DATE','TRAVEL_PERMIT','TRAVEL_PERMIT_FROM','TRAVEL_PERMIT_TO','TRAVEL_PERMIT_DATE_INSERT','TRAVEL_PERMIT_DATE_DELETE','TRAVEL_PERMIT_NOTE','OWNER_DATA','OTHER_DESCRIPTION','CONTACT_TELEPHONE_NUMBER','CONTACT_OWNER_DATA','ASSOCIATED_BEHAVIOR','OTHER','CASE_TYPE','OSTAY_CREATION_DATE','OSTAY_SELF_INDICTMENT','OSTAY_STATUS','OSTAY_NO_DAYS','OSTAY_ARRIVAL_DATE','OSTAY_DEPARTURE_DATE','OSTAY_TM6','OSTAY_BLOCK_PERIOD','OSTAY_NOTICE','LOST_PP_LOST_DATE','LOST_PP_LAST_PLACE','LOST_PP_NOTIFY_DATE','LOST_PP_NOTIFY_PLACE','LOST_PP_VISA_ON_ARRIV','LOST_PP_VISA_EXP_DATE','LOST_PP_NOTICE','LOST_PP_NEW_PP_TYPE','LOST_PP_NEW_PP_NUMBER','LOST_PP_NEW_PP_ISSUE_DATE','LOST_PP_NEW_PP_PLACE_OF_ISSUE','LOST_PP_NEW_PP_EXPIRE_DATE','ARRESTED_WARRANT_YEAR','UNDECIDED_CASE_NUMBER','CLOSING_REASON');
v_coldata_new:= dl_maintenance.trig_main.t_array ( :new.ID,:new.AUTHORITY,:new.BEHAVIOR,:new.CASE_NUMBER,:new.SECRET_LEVEL,:new.REASON,:new.IS_ACTIVE,:new.INS_BY,:new.DML_BY,:new.DML_TYPE,:new.URGENT_CONTACT,:new.CONTACT_INFORMATION,:new.TARGET_CODE,:new.ACTION_CODE,:new.NOTICE,:new.REFERENCE_DOCUMENT,:new.WARRANT_ARRESTED_TYPE,:new.CRIMINAL_CASE_NUMBER,:new.ARRESTED_DESCRIPTION,:new.ARRESTED_STATUS,:new.DECIDED_CASE_NUMBER,to_char(:new.ARRESTED_WARRANT_EXPIRY_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.RELATED_DOCUMENT,:new.ARRESTED_WARRANT_NUMBER,to_char(:new.ARRESTED_WARRANT_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.TRAVEL_PERMIT,to_char(:new.TRAVEL_PERMIT_FROM,'dd.mm.yyyy hh24:mi:ss'),to_char(:new.TRAVEL_PERMIT_TO,'dd.mm.yyyy hh24:mi:ss'),to_char(:new.TRAVEL_PERMIT_DATE_INSERT,'dd.mm.yyyy hh24:mi:ss'),to_char(:new.TRAVEL_PERMIT_DATE_DELETE,'dd.mm.yyyy hh24:mi:ss'),:new.TRAVEL_PERMIT_NOTE,:new.OWNER_DATA,:new.OTHER_DESCRIPTION,:new.CONTACT_TELEPHONE_NUMBER,:new.CONTACT_OWNER_DATA,:new.ASSOCIATED_BEHAVIOR,:new.OTHER,:new.CASE_TYPE,to_char(:new.OSTAY_CREATION_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.OSTAY_SELF_INDICTMENT,:new.OSTAY_STATUS,:new.OSTAY_NO_DAYS,to_char(:new.OSTAY_ARRIVAL_DATE,'dd.mm.yyyy hh24:mi:ss'),to_char(:new.OSTAY_DEPARTURE_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.OSTAY_TM6,:new.OSTAY_BLOCK_PERIOD,:new.OSTAY_NOTICE,to_char(:new.LOST_PP_LOST_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.LOST_PP_LAST_PLACE,to_char(:new.LOST_PP_NOTIFY_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.LOST_PP_NOTIFY_PLACE,:new.LOST_PP_VISA_ON_ARRIV,to_char(:new.LOST_PP_VISA_EXP_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.LOST_PP_NOTICE,:new.LOST_PP_NEW_PP_TYPE,:new.LOST_PP_NEW_PP_NUMBER,to_char(:new.LOST_PP_NEW_PP_ISSUE_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.LOST_PP_NEW_PP_PLACE_OF_ISSUE,to_char(:new.LOST_PP_NEW_PP_EXPIRE_DATE,'dd.mm.yyyy hh24:mi:ss'),:new.ARRESTED_WARRANT_YEAR,:new.UNDECIDED_CASE_NUMBER,:new.CLOSING_REASON);
v_coldata_old:= dl_maintenance.trig_main.t_array ( :old.ID,:old.AUTHORITY,:old.BEHAVIOR,:old.CASE_NUMBER,:old.SECRET_LEVEL,:old.REASON,:old.IS_ACTIVE,:old.INS_BY,:old.DML_BY,:old.DML_TYPE,:old.URGENT_CONTACT,:old.CONTACT_INFORMATION,:old.TARGET_CODE,:old.ACTION_CODE,:old.NOTICE,:old.REFERENCE_DOCUMENT,:old.WARRANT_ARRESTED_TYPE,:old.CRIMINAL_CASE_NUMBER,:old.ARRESTED_DESCRIPTION,:old.ARRESTED_STATUS,:old.DECIDED_CASE_NUMBER,to_char(:old.ARRESTED_WARRANT_EXPIRY_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.RELATED_DOCUMENT,:old.ARRESTED_WARRANT_NUMBER,to_char(:old.ARRESTED_WARRANT_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.TRAVEL_PERMIT,to_char(:old.TRAVEL_PERMIT_FROM,'dd.mm.yyyy hh24:mi:ss'),to_char(:old.TRAVEL_PERMIT_TO,'dd.mm.yyyy hh24:mi:ss'),to_char(:old.TRAVEL_PERMIT_DATE_INSERT,'dd.mm.yyyy hh24:mi:ss'),to_char(:old.TRAVEL_PERMIT_DATE_DELETE,'dd.mm.yyyy hh24:mi:ss'),:old.TRAVEL_PERMIT_NOTE,:old.OWNER_DATA,:old.OTHER_DESCRIPTION,:old.CONTACT_TELEPHONE_NUMBER,:old.CONTACT_OWNER_DATA,:old.ASSOCIATED_BEHAVIOR,:old.OTHER,:old.CASE_TYPE,to_char(:old.OSTAY_CREATION_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.OSTAY_SELF_INDICTMENT,:old.OSTAY_STATUS,:old.OSTAY_NO_DAYS,to_char(:old.OSTAY_ARRIVAL_DATE,'dd.mm.yyyy hh24:mi:ss'),to_char(:old.OSTAY_DEPARTURE_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.OSTAY_TM6,:old.OSTAY_BLOCK_PERIOD,:old.OSTAY_NOTICE,to_char(:old.LOST_PP_LOST_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.LOST_PP_LAST_PLACE,to_char(:old.LOST_PP_NOTIFY_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.LOST_PP_NOTIFY_PLACE,:old.LOST_PP_VISA_ON_ARRIV,to_char(:old.LOST_PP_VISA_EXP_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.LOST_PP_NOTICE,:old.LOST_PP_NEW_PP_TYPE,:old.LOST_PP_NEW_PP_NUMBER,to_char(:old.LOST_PP_NEW_PP_ISSUE_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.LOST_PP_NEW_PP_PLACE_OF_ISSUE,to_char(:old.LOST_PP_NEW_PP_EXPIRE_DATE,'dd.mm.yyyy hh24:mi:ss'),:old.ARRESTED_WARRANT_YEAR,:old.UNDECIDED_CASE_NUMBER,:old.CLOSING_REASON);
dl_maintenance.trig_main.trigger('DL_BLACKLIST','BLACKLIST_CASES',v_rowid,v_mode,dl_common.pkg_session.get_audit_user(),v_colname,v_coldata_old,v_coldata_new);
commit;
exception when others then
  dl_maintenance.trig_main.log('Exception in trigger: BLACKLIST_CASES',sqlerrm);
  commit;
end;
/
ALTER TRIGGER "DL_BLACKLIST"."ATRG_BLACKLIST_CASES" ENABLE;
