CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING"."V_WANTED_POLIS" ("WPSEQNO", "WPCD", "FIRST_NAME", "NICKNAME", "LAST_NAME", "ENG_FIRST_NAME", "ENG_MIDDLE_NAME", "ENG_LAST_NAME", "BIRTH_DATE", "BIRTH_DATE_FORMATTED", "SEX", "NATION_CODE", "POLIS_NAME", "MOBILENO", "WARRANTNO", "WARRANT_DATE", "WARRANT_DATE_FORMATTED", "WARRANT_DUE_DATE", "WARRANT_DUE_DATE_FORMATTED", "ADDR", "CMAJOR_CODE", "ID_NO", "CRIME_NO", "CRIME_YEAR", "ORG_CODE", "OFFENDER_NO", "RELEASE_FLAG", "RELEASE_DATE", "CAUSE", "LOGIN_ID", "KEY_DATE", "UPDUSR", "UPDDTE", "FLAGPROCESS", "REMARKPROCESS") AS 
  SELECT 
    wpseqno,
    wpcd,
    first_name,
    nickname,
    last_name,
    eng_first_name,
    eng_middle_name,
    eng_last_name,
    ------------
    birth_date,
    ------------
    CASE 
        WHEN LENGTH(birth_date) = 8 THEN TO_DATE(TO_CHAR(TO_NUMBER(SUBSTR(birth_date, 1, 4)) - 543) || SUBSTR(birth_date, 5) DEFAULT NULL ON CONVERSION ERROR, 'YYYYMMDD')
        ELSE NULL
    END BIRTH_DATE_FORMATTED,
    ------------
    sex,
    nation_code,
    polis_name,
    mobileno,
    warrantno,
    ------------
    warrant_date,
    ------------
    CASE 
        WHEN LENGTH(warrant_date) = 8 THEN TO_DATE(TO_CHAR(TO_NUMBER(SUBSTR(warrant_date, 1, 4)) - 543) || SUBSTR(warrant_date, 5) DEFAULT NULL ON CONVERSION ERROR, 'YYYYMMDD')
        ELSE NULL
    END WARRANT_DATE_FORMATTED,
    ------------
    warrant_due_date,
    ------------
    CASE 
        WHEN LENGTH(warrant_due_date) = 8 THEN TO_DATE(TO_CHAR(TO_NUMBER(SUBSTR(warrant_due_date, 1, 4)) - 543) || SUBSTR(warrant_due_date, 5) DEFAULT NULL ON CONVERSION ERROR, 'YYYYMMDD')
        ELSE NULL
    END WARRANT_DUE_DATE_FORMATTED,
    ------------
    addr,
    cmajor_code,
    id_no,
    crime_no,
    crime_year,
    org_code,
    offender_no,
    release_flag,
    release_date,
    cause,
    login_id,
    key_date,
    updusr,
    upddte,
    flagprocess,
    remarkprocess
FROM pibicsdm2.wanted_polis;
  GRANT SELECT ON "DL_STAGING"."V_WANTED_POLIS" TO "DL_BORDERCONTROL";
