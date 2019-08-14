CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_DBA"."INSTALLED_MODULES" ("TITLE", "MAJOR", "MINOR", "PATCH", "DML_AT") AS 
  select t2.TITLE
        ,max(t2.MAJOR) as MAJOR
        ,max(t2.MINOR) as MINOR
        ,max(t2.PATCH) as PATCH
        ,max(t2.DML_AT) as DML_AT
    from DL_DBA.MODULE_INSTALLS t2
   where (t2.TITLE, t2.MAJOR, t2.MINOR) in (
                                            --
                                            select t1.TITLE
                                                   ,max(t1.MAJOR) as MAJOR
                                                   ,max(t1.MINOR) as MINOR
                                              from DL_DBA.MODULE_INSTALLS t1
                                             where (t1.TITLE, t1.MAJOR) in (
                                                                            --
                                                                            select t0.TITLE
                                                                                   ,max(t0.MAJOR) as MAJOR
                                                                              from DL_DBA.MODULE_INSTALLS t0
                                                                             group by t0.TITLE
                                                                            --
                                                                            )
                                             group by t1.TITLE
                                            --
                                            )
   group by t2.TITLE;
  GRANT SELECT ON "DL_DBA"."INSTALLED_MODULES" TO PUBLIC;
  GRANT SELECT ON "DL_DBA"."INSTALLED_MODULES" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."INSTALLED_MODULES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."INSTALLED_MODULES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."INSTALLED_MODULES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."INSTALLED_MODULES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."INSTALLED_MODULES" TO "TESTADM";
