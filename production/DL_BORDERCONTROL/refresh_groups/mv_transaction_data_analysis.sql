BEGIN 
dbms_refresh.make('"DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS"',list=>null,next_date=>'19-DEC-19',interval=>'sysdate + 1 ',implicit_destroy=>TRUE,lax=>FALSE,job=>35374,rollback_seg=>NULL,push_deferred_rpc=>TRUE,refresh_after_errors=>FALSE,purge_option=>1,parallelism=>0,heap_size=>0);
dbms_refresh.add(name=>'"DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS"',list=>'"DL_BORDERCONTROL"."MV_TRANSACTION_DATA_ANALYSIS"',siteid=>0,export_db=>'BIOPRI');
 END; 
/
