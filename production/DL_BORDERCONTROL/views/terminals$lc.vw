CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."TERMINALS$LC" ("ID", "IPADDRESS", "DEFAULTEXITFLG", "ACTIVE", "TRNSPRTMODEID", "ISGATE", "POS_X", "POS_Y", "WIDTH", "HEIGHT", "FLOOR_ID", "BIO_CAPTURING", "NAME", "NAME$DLC", "BORDER_POST", "LOCALE", "LOCALE$DLC", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "TERMINALS$RI", "TERMINALS$I18N$RI") AS 
  select t1.ID
        ,t1.IPADDRESS
        ,t1.DEFAULTEXITFLG
        ,t1.ACTIVE
        ,t1.TRNSPRTMODEID
        ,t1.ISGATE
        ,t1.POS_X
        ,t1.POS_Y
        ,t1.WIDTH
        ,t1.HEIGHT
        ,t1.FLOOR_ID
        ,t1.BIO_CAPTURING
        ,t1.NAME
        ,t1.NAME           as NAME$DLC
        ,t1.BORDER_POST
        ,t1.LOCALE
        ,t1.LOCALE         as LOCALE$DLC
        ,t1.INS_AT
        ,t1.INS_BY
        ,t1.DML_AT
        ,t1.DML_BY
        ,t1.DML_TYPE
        ,t1.rowid          as TERMINALS$RI
        ,null              as TERMINALS$I18N$RI
    from DL_BORDERCONTROL.TERMINALS t1
   where t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
  union all
  select t1.ID
        ,t1.IPADDRESS
        ,t1.DEFAULTEXITFLG
        ,t1.ACTIVE
        ,t1.TRNSPRTMODEID
        ,t1.ISGATE
        ,t1.POS_X
        ,t1.POS_Y
        ,t1.WIDTH
        ,t1.HEIGHT
        ,t1.FLOOR_ID
        ,t1.BIO_CAPTURING
        ,t2.NAME
        ,t1.NAME           as NAME$DLC
        ,t1.BORDER_POST
        ,t2.LOCALE
        ,t1.LOCALE         as LOCALE$DLC
        ,t2.INS_AT
        ,t2.INS_BY
        ,t2.DML_AT
        ,t2.DML_BY
        ,t2.DML_TYPE
        ,t1.rowid          as TERMINALS$RI
        ,t2.rowid          as TERMINALS$I18N$RI
    from DL_BORDERCONTROL.TERMINALS t1
    left join DL_BORDERCONTROL.TERMINALS$I18N t2
      on (t1.ID = t2.KEY_VALUE and t2.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale())
   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale();
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."TERMINALS$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TERMINALS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TERMINALS$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$LC" TO "APPSUP";