CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."INSTALL_PARAMETER" ("PARAMETER_1", "PARAMETER_2", "PARAMETER_3", "PARAMETER_4", "PARAMETER_5", "PARAMETER_6", "PARAMETER_7", "PARAMETER_8", "PARAMETER_9") AS 
  select cast('DL_BORDERCONTROL' as varchar2(4000 char)) as PARAMETER_1
        ,cast('DATASTORE' as varchar2(4000 char)) as PARAMETER_2
        ,cast('' as varchar2(4000 char)) as PARAMETER_3
        ,cast('DL_BORDERCONTROL' as varchar2(4000 char)) as PARAMETER_4
        ,cast('1672400873050999' as varchar2(4000 char)) as PARAMETER_5
        ,cast('' as varchar2(4000 char)) as PARAMETER_6
        ,cast(' ' as varchar2(4000 char)) as PARAMETER_7
        ,cast(' ' as varchar2(4000 char)) as PARAMETER_8
        ,cast(' ' as varchar2(4000 char)) as PARAMETER_9
    from dual;
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "TESTADM";
