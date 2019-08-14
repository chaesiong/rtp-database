CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NOTICE$DLC", "NUM_VALUE", "ROW_FLAG_MASK", "ROW_FLAG_MASK$I18N", "DISPLAY_CODE", "COSTS_REGULAR", "COSTS_LIMIT", "PAYMENT_TYPE", "OWNER", "DISPLAY_VALUE_SHORT", "FAF_PAYMENT_RATE$RI", "FAF_PAYMENT_RATE$I18N$RI") AS 
  select t1.KEY_VALUE
        ,t1.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t1.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.NOTICE
        ,t1.NOTICE        as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,null             as ROW_FLAG_MASK$I18N
        ,t1.display_code
        ,t1.costs_regular
        ,t1.costs_limit
        ,t1.payment_type
        ,t1.owner
        ,t1.display_value_short
        ,t1.rowid            as FAF_PAYMENT_RATE$RI
        ,null                as FAF_PAYMENT_RATE$I18N$RI
    from DL_BORDERCONTROL.FAF_PAYMENT_RATE t1
  union all
  select t1.KEY_VALUE
        ,t2.LOCALE
        ,t1.LOCALE           as LOCALE$DLC
        ,t2.DISPLAY_VALUE
        ,t1.DISPLAY_VALUE    as DISPLAY_VALUE$DLC
        ,t1.DISPLAY_ORDER
        ,t1.IS_ACTIVE
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t2.NOTICE
        ,t1.NOTICE           as NOTICE$DLC
        ,t1.NUM_VALUE
        ,t1.ROW_FLAG_MASK
        ,t2.ROW_FLAG_MASK as ROW_FLAG_MASK$I18N
        ,t1.display_code
        ,t1.costs_regular
        ,t1.costs_limit
        ,t1.payment_type
        ,t1.owner
        ,t1.display_value_short
        ,t1.rowid            as FAF_PAYMENT_RATE$RI
        ,t2.rowid            as FAF_PAYMENT_RATE$I18N$RI
    from DL_BORDERCONTROL.FAF_PAYMENT_RATE t1
   inner join DL_BORDERCONTROL.FAF_PAYMENT_RATE$I18N t2
      on (t1.KEY_VALUE = t2.KEY_VALUE);
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE#I18N" TO "APPSUP";
