CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."MBT_ORG_V" ("ORG_CODE", "ORG", "ORG_ABBR", "FIND_DESC", "RELA_CODE", "RELA_DESC", "RELA_ABBR", "FLAG", "ORG_NO", "PROV_CODE", "ADDRESS", "TEL", "BH_CODE", "BK_CODE", "KK_CODE", "UNIT_EXP", "CAN_INVEST", "HEAD_LEVEL", "ORG_TYPE", "INV1", "INV2", "INV3", "FLAG_EXP", "UPD_ID", "UPD_DATE", "UPD_ORG", "STATION_CODE", "ORG_ORDER") AS 
  SELECT   ORG_CODE,
            ORG_LONG,
            ORG_ABBR,
            FIND_DESC,
            RELA_CODE,
            RELA_DESC,
            RELA_ABBR,
            FLAG,
            ORG_NO,
            PROV_CODE,
            ADDRESS,
            TEL,
            BH_CODE,
            BK_CODE,
            KK_CODE,
            UNIT_EXP,
            CAN_INVEST,
            HEAD_LEVEL,
            ORG_TYPE,
            INV1,
            INV2,
            INV3,
            FLAG_EXP,
            UPD_ID,
            UPD_DATE,
            UPD_ORG,
            STATION_CODE,
            ORG_ORDER
     FROM   ORG_C
    WHERE   FLAG <> '2' AND FLG_ACTIVE = '0' ;
