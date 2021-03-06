CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."TRAVEL_DOCS#TAG" ("KEY_VALUE", "UNIQUE_VALUE", "DOC_TYPE", "ISSUING_COUNTRY", "DOC_NUMBER", "DATE_OF_ISSUE", "DATE_OF_EXPIRY$VC", "DATE_OF_EXPIRY", "SURNAME", "GIVEN_NAME", "NATIONALITY", "PLACE_OF_BIRTH", "SEX", "ISSUING_AUTHORITY", "DATE_OF_BIRTH$VC", "DATE_OF_BIRTH", "MRZ_FORMAT", "MRZ_DATA", "DATA_ACQUISITION_TYPE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "OWNER", "EXTENDED_DATA_SOURCE", "EXTENDED_DATA_PK_0", "EXTENDED_DATA_PK_1", "EXTENDED_DATA_PK_2", "OWNER$TAG", "TAG", "NOTICE$TAG", "INS_AT$TAG", "INS_BY$TAG", "DML_AT$TAG", "DML_BY$TAG", "DML_TYPE$TAG", "ROW_FLAG_MASK$TAG", "TRAVEL_DOCS$RI", "TRAVEL_DOCS$TAG$RI") AS 
  select t1.KEY_VALUE
        ,t1.UNIQUE_VALUE
        ,t1.DOC_TYPE
        ,t1.ISSUING_COUNTRY
        ,t1.DOC_NUMBER
        ,t1.DATE_OF_ISSUE
        ,t1.DATE_OF_EXPIRY$VC
        ,t1.DATE_OF_EXPIRY
        ,t1.SURNAME
        ,t1.GIVEN_NAME
        ,t1.NATIONALITY
        ,t1.PLACE_OF_BIRTH
        ,t1.SEX
        ,t1.ISSUING_AUTHORITY
        ,t1.DATE_OF_BIRTH$VC
        ,t1.DATE_OF_BIRTH
        ,t1.MRZ_FORMAT
        ,t1.MRZ_DATA
          ,t1.DATA_ACQUISITION_TYPE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.OWNER
        ,t1.EXTENDED_DATA_SOURCE
        ,t1.EXTENDED_DATA_PK_0
        ,t1.EXTENDED_DATA_PK_1
        ,t1.EXTENDED_DATA_PK_2
        ,t2.OWNER                 as OWNER$TAG
        ,t2.TAG
        ,t2.NOTICE                as NOTICE$TAG
        ,t2.INS_AT                as INS_AT$TAG
        ,t2.INS_BY                as INS_BY$TAG
        ,t2.DML_AT                as DML_AT$TAG
        ,t2.DML_BY                as DML_BY$TAG
        ,t2.DML_TYPE              as DML_TYPE$TAG
        ,t2.ROW_FLAG_MASK         as ROW_FLAG_MASK$TAG
        ,t1.rowid                 as TRAVEL_DOCS$RI
        ,t2.rowid                 as TRAVEL_DOCS$TAG$RI
    from DL_BLACKLIST.TRAVEL_DOCS t1
    left join DL_BLACKLIST.TRAVEL_DOCS$TAG t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO PUBLIC;
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS#TAG" TO "APPSUP";
