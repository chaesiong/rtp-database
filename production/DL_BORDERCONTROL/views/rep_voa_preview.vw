CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL"."REP_VOA_PREVIEW" ("KEY_VALUE", "VISA_NUMBER", "ISSUING_DATE", "ISSUING_PLACE", "ADDITIONAL_INFO", "APPLICANT_DATE", "NATIONALITY", "TRANS_NUMBER", "EXPIRY_DATE", "PERSON", "PASSPORT_NO", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "DATE_OF_BIRTH", "SEX", "PLACE_OF_BIRTH", "BIRTH_COUNTRY", "PHONE_NUMBER", "IMAGE", "TA_STREET", "TA_CITY", "PERMANENT_ADDRESS", "CONTACT_PERSON", "TM6_NO", "OCCUPATION") AS 
  SELECT v.key_value
        ,v.visa_number
        ,TO_CHAR(v.issuing_date, 'DD/MM/YYYY') AS issuing_date
        ,v.issuing_place
        ,v.additional_info
        ,v.applicant_date
        ,NVL(pn.display_value, pn.display_value$dlc) AS nationality
        ,v.trans_number
        ,v.expiry_date
        ,v.person
        ,vb.docno AS passport_no
        ,p.first_name
        ,p.middle_name
        ,p.last_name
        ,p.date_of_birth
        ,NVL(ps.display_value, ps.display_value$dlc) AS sex
        ,p.place_of_birth
        ,p.birth_country
        ,p.phone_number
        ,p.image
        ,NVL(p.ta_street, ' ') AS ta_street
        ,NVL(adm_prov.display_value, adm_prov.name$dlc)
            || CASE WHEN p.ta_adm_class_district    IS NOT NULL THEN ', ' || NVL(adm_dis.display_value, adm_dis.name$dlc)       ELSE NULL END
            || CASE WHEN p.ta_adm_class_subdistrict IS NOT NULL THEN ', ' || NVL(adm_subdis.display_value, adm_subdis.name$dlc) ELSE NULL END AS ta_city
        ,p.permanent_address
        ,p.contact_person
        ,p.tm6_no
        ,NVL(pr.display_value, pr.name$dlc) AS occupation
    FROM dl_bordercontrol.visas v
    LEFT JOIN dl_bordercontrol.borderdocuments vb                   ON vb.brddocid          = v.borderdocument
    LEFT JOIN dl_bordercontrol.person p                             ON v.person             = p.key_value
    LEFT JOIN dl_common.human_sexes$lc ps                           ON ps.key_value         = p.sex
    LEFT JOIN dl_common.icao_doc_codes$lc pn                        ON pn.key_value         = p.nationality
    LEFT JOIN dl_common.professions$lc pr                           ON pr.key_value         = p.profession
    LEFT JOIN dl_bordercontrol.adm_class_province$lc adm_prov       ON adm_prov.key_value   = p.ta_adm_class_province
    LEFT JOIN dl_bordercontrol.adm_class_district$lc adm_dis        ON adm_dis.key_value    = p.ta_adm_class_district
    LEFT JOIN dl_bordercontrol.adm_class_subdistrict$lc adm_subdis  ON adm_subdis.key_value = p.ta_adm_class_subdistrict
   WHERE v.visa_type = 10 -- VISA_TYPE 10 => Visa On Arrival
;
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "JASPER_REPORTING";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSUPPORT";
  GRANT DELETE ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."REP_VOA_PREVIEW" TO "PORNRUKSA_S";
