CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR$TIUD0" 
	before update on DL_BORDERCONTROL.OFFLINE_SYNC_ERROR for each row
--
/*******************************************************************************
* Author    Date        Description                                            *
* --------  ----------  -------------------------------------------------------
* MStahl    24.04.2019  Added
*******************************************************************************/
--
begin
	:new.dml_at := systimestamp;
	:new.dml_by := dl_common.pkg_session.get_audit_user();
end;
/
ALTER TRIGGER "DL_BORDERCONTROL"."OFFLINE_SYNC_ERROR$TIUD0" ENABLE;
