CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."MODULE_VERSIONS" ("KEY_VALUE", "TITLE", "REMARK", "MAJOR", "MINOR", "PATCH", "ADDITIONAL_VERSION_NUMBER", "START_INVALID_DB_OBJECTS", "END_INVALID_DB_OBJECTS", "END_EXIT_CODE", "DML_AT", "DML_BY", "DML_TYPE") AS 
  select t."KEY_VALUE",t."TITLE",t."REMARK",t."MAJOR",t."MINOR",t."PATCH",t."ADDITIONAL_VERSION_NUMBER",t."START_INVALID_DB_OBJECTS",t."END_INVALID_DB_OBJECTS",t."END_EXIT_CODE",t."DML_AT",t."DML_BY",t."DML_TYPE"
    from DL_DBA.MODULE_INSTALLS t;
  GRANT INSERT ON "DL_COMMON"."MODULE_VERSIONS" TO "DBA";
  GRANT SELECT ON "DL_COMMON"."MODULE_VERSIONS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."MODULE_VERSIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."MODULE_VERSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MODULE_VERSIONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."MODULE_VERSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MODULE_VERSIONS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."MODULE_VERSIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."MODULE_VERSIONS" TO "BIOSUPPORT";
