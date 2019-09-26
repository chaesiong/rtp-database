BEGIN 
dbms_refresh.make('"PIBICSDM2"."FW_USER_PIBICS"',list=>null,next_date=>'',interval=>'',implicit_destroy=>TRUE,lax=>FALSE,job=>8654,rollback_seg=>NULL,push_deferred_rpc=>TRUE,refresh_after_errors=>FALSE,purge_option=>1,parallelism=>0,heap_size=>0);
dbms_refresh.add(name=>'"PIBICSDM2"."FW_USER_PIBICS"',list=>'"PIBICSDM2"."FW_USER_PIBICS"',siteid=>0,export_db=>'BIOPRI');
 END; 
/
