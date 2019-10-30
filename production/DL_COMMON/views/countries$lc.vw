CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."COUNTRIES$LC" ("KEY_VALUE", "LOCALE", "LOCALE$DLC", "DISPLAY_VALUE", "DISPLAY_VALUE$DLC", "DISPLAY_ORDER", "IS_ACTIVE", "INS_AT", "INS_BY", "DML_AT", "DML_BY", "DML_TYPE", "NOTICE", "NOTICE$DLC", "ISO3166_A3", "ISO3166_A2", "ISO3166_NUM", "TL_DOMAIN", "PHONE_AREA_CODE", "ICAO_LOC_PART", "NATIONALITY", "NATIONALITY$DLC", "NUM_VALUE", "ROW_FLAG_MASK", "ROW_FLAG_MASK$I18N", "OFFICIAL_LANGUAGE", "OWNER", "OWNER$I18N", "COUNTRIES$RI", "COUNTRIES$I18N$RI", "ICAO", "COUNTRY") AS 
  select "KEY_VALUE","LOCALE","LOCALE$DLC","DISPLAY_VALUE","DISPLAY_VALUE$DLC","DISPLAY_ORDER","IS_ACTIVE","INS_AT","INS_BY","DML_AT","DML_BY","DML_TYPE","NOTICE","NOTICE$DLC","ISO3166_A3","ISO3166_A2","ISO3166_NUM","TL_DOMAIN","PHONE_AREA_CODE","ICAO_LOC_PART","NATIONALITY","NATIONALITY$DLC","NUM_VALUE","ROW_FLAG_MASK","ROW_FLAG_MASK$I18N","OFFICIAL_LANGUAGE","OWNER","OWNER$I18N","COUNTRIES$RI","COUNTRIES$I18N$RI","ICAO","COUNTRY" from
	 -- Aus ICAO_DOC_CODES  Zwischentabelle
	(SELECT
			t3.key_value  as key_value
			,t1.LOCALE
			,t1.LOCALE            as LOCALE$DLC
			,t1.DISPLAY_VALUE
			,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
			,t1.DISPLAY_ORDER
			,t1.IS_ACTIVE
			,t1.INS_AT
			,t1.INS_BY
			,t1.DML_AT
			,t1.DML_BY
			,t1.DML_TYPE
			,t1.NOTICE
			,t1.NOTICE            as NOTICE$DLC
			,t1.ISO3166_A3
			,t1.ISO3166_A2
			,t1.ISO3166_NUM
			,t1.TL_DOMAIN
			,t1.PHONE_AREA_CODE
			,t1.ICAO_LOC_PART
			,t1.NATIONALITY
			,t1.NATIONALITY       as NATIONALITY$DLC
			,t1.NUM_VALUE
			,t1.ROW_FLAG_MASK
			,null                 as ROW_FLAG_MASK$I18N
			,t1.OFFICIAL_LANGUAGE
			,t1.OWNER
			,null                 as OWNER$I18N
			,t1.rowid             as COUNTRIES$RI
			,null                 as COUNTRIES$I18N$RI
			,t3.key_value AS icao
			,t1.key_value as country
	FROM
		dl_common.countries t1
		LEFT JOIN dl_common.countries_icao_doc_codes t2 ON ( t1.key_value = t2.country )
		INNER JOIN dl_common.icao_doc_codes t3 ON t2.icao_code = t3.key_value
	WHERE
		t1.key_value IS NOT NULL 
		  and t1.is_active = 'Y'
		  and t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
		UNION 
		SELECT
		nvl(t4.key_value, t1.key_value) as key_value
			,t2.LOCALE
			,t1.LOCALE            as LOCALE$DLC
			,t2.DISPLAY_VALUE
			,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
			,t1.DISPLAY_ORDER
			,t1.IS_ACTIVE
			,t1.INS_AT
			,t1.INS_BY
			,t1.DML_AT as DML_AT
			,t1.DML_BY
			,t1.DML_TYPE
			,t3.NOTICE
			,t1.NOTICE            as NOTICE$DLC
			,t1.ISO3166_A3
			,t1.ISO3166_A2
			,t1.ISO3166_NUM
			,t1.TL_DOMAIN
			,t1.PHONE_AREA_CODE
			,t1.ICAO_LOC_PART
			,t1.NATIONALITY
			,t1.NATIONALITY       as NATIONALITY$DLC
			,t1.NUM_VALUE
			,t1.ROW_FLAG_MASK
			,t3.ROW_FLAG_MASK     as ROW_FLAG_MASK$I18N
			,t1.OFFICIAL_LANGUAGE
			,t1.OWNER
			,t1.OWNER             as OWNER$I18N
			,t1.rowid             as ICAO_DOC_CODES$RI
			,t3.rowid             as ICAO_DOC_CODES$I18N$RI
			,t3.key_value AS icao
			,t1.key_value as country
	FROM
	   DL_COMMON.COUNTRIES t1
		LEFT JOIN icao_doc_codes t3 ON ( t1.key_value = t3.key_value )
		left join DL_COMMON.COUNTRIES$I18N t2
		  on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_common.PKG_I18N.Get_Sess_Data_Locale())
			 LEFT JOIN countries_icao_doc_codes t3 ON ( t1.key_value = t3.country )
		INNER JOIN icao_doc_codes t4 ON t3.icao_code = t4.key_value 
	   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
			 and t1.is_active = 'Y')
	   UNION 
	 -- Aus COUNTRIES ohne ICAO Mapping
	   select "KEY_VALUE","LOCALE","LOCALE$DLC","DISPLAY_VALUE","DISPLAY_VALUE$DLC","DISPLAY_ORDER","IS_ACTIVE","INS_AT","INS_BY","DML_AT","DML_BY","DML_TYPE","NOTICE","NOTICE$DLC","ISO3166_A3","ISO3166_A2","ISO3166_NUM","TL_DOMAIN","PHONE_AREA_CODE","ICAO_LOC_PART","NATIONALITY","NATIONALITY$DLC","NUM_VALUE","ROW_FLAG_MASK","ROW_FLAG_MASK$I18N","OFFICIAL_LANGUAGE","OWNER","OWNER$I18N","COUNTRIES$RI","COUNTRIES$I18N$RI","ICAO","COUNTRY" from
	(SELECT
			 t3.key_value  as key_value
			,t1.LOCALE
			,t1.LOCALE            as LOCALE$DLC
			,t1.DISPLAY_VALUE
			,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
			,t1.DISPLAY_ORDER
			,t1.IS_ACTIVE
			,t1.INS_AT
			,t1.INS_BY
			,t1.DML_AT
			,t1.DML_BY
			,t1.DML_TYPE
			,t1.NOTICE
			,t1.NOTICE            as NOTICE$DLC
			,t1.ISO3166_A3
			,t1.ISO3166_A2
			,t1.ISO3166_NUM
			,t1.TL_DOMAIN
			,t1.PHONE_AREA_CODE
			,t1.ICAO_LOC_PART
			,t1.NATIONALITY
			,t1.NATIONALITY       as NATIONALITY$DLC
			,t1.NUM_VALUE
			,t1.ROW_FLAG_MASK
			,null                 as ROW_FLAG_MASK$I18N
			,t1.OFFICIAL_LANGUAGE
			,t1.OWNER
			,null                 as OWNER$I18N
			,t1.rowid             as COUNTRIES$RI
			,null                 as COUNTRIES$I18N$RI
			,t3.key_value AS icao
			,t1.key_value as country
	FROM
		dl_common.countries t1
		  INNER JOIN dl_common.icao_doc_codes t3 ON t3.key_value = t1.key_value
	WHERE t1.key_value IS NOT NULL 
			and t1.LOCALE = DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() 
		  AND NOT EXISTS (
	SELECT
	   *
	FROM
		countries_icao_doc_codes t4
		INNER JOIN countries t5 ON t4.country = t5.key_value
	WHERE
		t5.is_active = 'Y' and t4.ICAO_CODE = t3.key_value)
		UNION ALL
		SELECT
		nvl(t3.key_value, t1.key_value) as key_value
			,t2.LOCALE
			,t1.LOCALE            as LOCALE$DLC
			,t2.DISPLAY_VALUE
			,t1.DISPLAY_VALUE     as DISPLAY_VALUE$DLC
			,t1.DISPLAY_ORDER
			,t1.IS_ACTIVE
			,t1.INS_AT
			,t1.INS_BY
			,t1.DML_AT as DML_AT
			,t1.DML_BY
			,t1.DML_TYPE
			,t3.NOTICE
			,t1.NOTICE            as NOTICE$DLC
			,t1.ISO3166_A3
			,t1.ISO3166_A2
			,t1.ISO3166_NUM
			,t1.TL_DOMAIN
			,t1.PHONE_AREA_CODE
			,t1.ICAO_LOC_PART
			,t1.NATIONALITY
			,t1.NATIONALITY       as NATIONALITY$DLC
			,t1.NUM_VALUE
			,t3.ROW_FLAG_MASK
			,t1.ROW_FLAG_MASK     as ROW_FLAG_MASK$I18N
			,t1.OFFICIAL_LANGUAGE
			,t1.OWNER
			,t1.OWNER             as OWNER$I18N
			,t1.rowid             as ICAO_DOC_CODES$RI
			,t3.rowid             as ICAO_DOC_CODES$I18N$RI
			,t3.key_value AS icao
			,t1.key_value as country
	FROM
	   DL_COMMON.COUNTRIES t1
		LEFT JOIN icao_doc_codes t3 ON ( t1.key_value = t3.key_value )
		left join DL_COMMON.COUNTRIES$I18N t2
		  on (t1.KEY_VALUE = t2.KEY_VALUE and t2.LOCALE = DL_common.PKG_I18N.Get_Sess_Data_Locale())
	   where t1.LOCALE != DL_COMMON.PKG_I18N.Get_Sess_Data_Locale()
		AND t3.key_value IS NOT NULL
		AND NOT EXISTS (
	SELECT
	   *
	FROM
		countries_icao_doc_codes t4
		INNER JOIN countries t5 ON t4.country = t5.key_value
	WHERE
		t5.is_active = 'Y' and t4.ICAO_CODE = t3.key_value));
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$LC" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$LC" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES$LC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$LC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES$LC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$LC" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$LC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$LC" TO "BIOSUPPORT";
