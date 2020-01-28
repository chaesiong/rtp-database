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
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."INSTALL_PARAMETER" TO "PUNYAWII_D";
