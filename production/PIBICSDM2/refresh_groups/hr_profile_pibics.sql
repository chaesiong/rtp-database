BEGIN 
dbms_refresh.make('"PIBICSDM2"."HR_PROFILE_PIBICS"',list=>null,next_date=>'',interval=>'',implicit_destroy=>TRUE,lax=>FALSE,job=>8655,rollback_seg=>NULL,push_deferred_rpc=>TRUE,refresh_after_errors=>FALSE,purge_option=>1,parallelism=>0,heap_size=>0);
dbms_refresh.add(name=>'"PIBICSDM2"."HR_PROFILE_PIBICS"',list=>'"PIBICSDM2"."HR_PROFILE_PIBICS"',siteid=>0,export_db=>'BIOPRI');
 END; 
/
