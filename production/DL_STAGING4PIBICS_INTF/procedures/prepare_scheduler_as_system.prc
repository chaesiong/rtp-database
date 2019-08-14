CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."PREPARE_SCHEDULER_AS_SYSTEM" 
    AUTHID current_user
IS
    -- call this as a privileged user
    -- the jobclass  names are redundantly stored in DL_STAGING4PIBICS_INTFP�.pkg_maintenance
    -- KEEP THEM in line in case of changes !
    object_does_not_exist EXCEPTION;
    PRAGMA exception_init ( object_does_not_exist,-27476 );
BEGIN
    --
    BEGIN
        dbms_scheduler.drop_job_class(job_class_name => 'SYS.INITIAL_LOAD_PIBICS',force => true);
    EXCEPTION
        WHEN object_does_not_exist THEN
            NULL;
    END;

    dbms_scheduler.create_job_class(job_class_name => 'SYS.INITIAL_LOAD_PIBICS',resource_consumer_group => 'OTHER_GROUPS',comments
    => 'These jobs are for initial loads of data from PIBICS, they should not be necessary in normal operations.');

    EXECUTE IMMEDIATE 'grant EXECUTE ON SYS.INITIAL_LOAD_PIBICS to PUBLIC';
    --
    BEGIN
        dbms_scheduler.drop_job_class(job_class_name => 'SYS.ONGOING_SYNCHRONISATION_PIBICS',force => true);
    EXCEPTION
        WHEN object_does_not_exist THEN
            NULL;
    END;
        dbms_scheduler.create_job_class(job_class_name => 'SYS.ONGOING_SYNCHRONISATION_PIBICS',resource_consumer_group => 'OTHER_GROUPS'
       ,comments => 'These jobs are for the ongoing data synchronisation from PIBICS.',log_history => 3);

    EXECUTE IMMEDIATE 'grant EXECUTE ON SYS.ONGOING_SYNCHRONISATION_PIBICS to PUBLIC';
   --

END prepare_scheduler_as_system;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PREPARE_SCHEDULER_AS_SYSTEM" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PREPARE_SCHEDULER_AS_SYSTEM" TO "PIBICSAPP";
