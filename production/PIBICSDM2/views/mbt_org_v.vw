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
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."MBT_ORG_V" TO "BIOSAADM";
