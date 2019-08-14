CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BLACKLIST"."VW_FOUNDBLACKLIST_BAK_13082019" ("FOUNDBLID", "OFFICER", "BLACKLIST_ID", "REASON_CODE", "REASON", "NOTICE", "TRANSACTIONDATE", "GENDERNO", "GENDERCODE", "GENDERNAMETH", "GENDERNAMEEN", "GENDERRPTSEQNO", "DOCUMENTNUMBER", "FIRSTNAMETH", "MIDNAMETH", "FAMILYNAMETH", "FIRSTNAMEEN", "MIDNAMEEN", "FAMILYNAMEEN", "INCIDENTFIRSTNAMEEN", "INCIDENTFAMILYNAMEEN", "INCIDENTBIRTHDATE", "BIRTHDATE", "COUNTRYNO", "COUNTRYCODE", "COUNTRYNAMEABBR", "NATIONALITYTH", "NATIONALITYNAMEEN", "COUNTRYNAMETH", "COUNTRYNAMEEN", "COUNTRYRPTSEQNO", "CONTINENTNAMETH", "CONTINENTNAMEEN", "TRAVELDOCTYPENO", "TRAVELDOCTYPECODE", "TRAVELDOCTYPENAMETH", "TRAVELDOCTYPENAMEEN", "TRAVELDOCTYPERPTSEQNO", "VISATYPECODE", "VISATYPETH", "VISATYPENAMEEN", "PERMITTDAYS", "VISATYPERPTSEQNO", "DEPARTMENTNO", "STATUS", "CREATEDATE", "UPDATEDATE", "BLACKLISTCREATEDATE", "BLACKLISTUPDATEDATE", "TM6", "WLCD", "DIRECTION") AS 
  SELECT INC.ID AS FOUNDBLID,
          INC.OFFICER AS OFFICER,
          BC.ID AS BLACKLIST_ID,
          RC.KEY_VALUE AS REASON_CODE,
          RC.DISPLAY_VALUE AS REASON,
          BC.NOTICE,
          INC.INS_AT AS TransactionDate,
          (SELECT NUM_VALUE
             FROM DL_COMMON.HUMAN_SEXES HS
            WHERE HS.ICAO = BID.SEX)
             AS GenderNo,
          BID.SEX AS GenderCode,
          (SELECT DISPLAY_VALUE
             FROM DL_COMMON.HUMAN_SEXES$I18N HST
            WHERE     HST.KEY_VALUE = (SELECT key_value
                                         FROM dl_common.human_sexes hs
                                        WHERE hs.icao = bid.sex)
                  AND HST.LOCALE = 'th_TH')
             AS GenderNameTH,
          (SELECT DISPLAY_VALUE
             FROM DL_COMMON.HUMAN_SEXES HS
            WHERE HS.ICAO = BID.SEX)
             AS GenderNameEN,
          (SELECT DISPLAY_ORDER
             FROM DL_COMMON.HUMAN_SEXES HS
            WHERE HS.ICAO = BID.SEX)
             AS GenderRptSeqNo,
          INC.DOCNO AS DocumentNumber,
          BID.GIVENNAME_THAI AS FirstNameTH,
          BID.MIDDLENAME_THAI AS MidNameTH,
          BID.SURNAME_THAI AS FamilyNameTH,
          BID.GIVEN_NAME AS FirstNameEN,
          BID.MIDDLE_NAME AS MidNameEN,
          BID.SURNAME AS FamilyNameEN,
          INC.GIVENNAME AS IncidentFirstNameEn,
          INC.LASTNAME AS IncidentFamilyNameEN,
          INC.DOB AS IncidentBirthdate,
          TO_CHAR (BID.DATE_OF_BIRTH, 'DD/MM/YYYY') AS BirthDate,
          CO.ISO3166_NUM AS CountryNo,
          CO.NOTICE AS CountryCode,
          CO.KEY_VALUE AS CountryNameAbbr,
          (SELECT COT.NATIONALITY
             FROM DL_COMMON."COUNTRIES#I18N" COT
            WHERE COT.KEY_VALUE = BID.NATIONALITY AND COT.LOCALE = 'th_TH')
             AS NationalityTH,
          CO.NATIONALITY AS NationalityNameEN,
          (SELECT COT.DISPLAY_VALUE
             FROM DL_COMMON."COUNTRIES#I18N" COT
            WHERE COT.KEY_VALUE = BID.NATIONALITY AND COT.LOCALE = 'th_TH')
             AS CountryNameTH,
          CO.DISPLAY_VALUE AS CountryNameEN,
          CO.DISPLAY_ORDER AS CountryRptSeqNo,
          (SELECT CONT.DISPLAY_VALUE
             FROM DL_COMMON."CONTINENTS#I18N" CONT
            WHERE CON.KEY_VALUE = CONT.KEY_VALUE AND CONT.LOCALE = 'th_TH')
             AS ContinentNameTH,
          CON.DISPLAY_VALUE AS ContinentNameEN,
          BD.DOCCLASS AS TravelDocTypeNo,
          BD.DOCCLASS AS TravelDocTypeCode,
          (SELECT DCT.DISPLAY_VALUE
             FROM DL_COMMON."BC_DOC_CLASS#I18N" DCT
            WHERE DCT.KEY_VALUE = DC.KEY_VALUE AND DCT.LOCALE = 'th_TH')
             AS TravelDoctypeNameTH,
          DC.DISPLAY_VALUE AS TravelDoctypeNameEN,
          DC.DISPLAY_ORDER AS TravelDocTypeRptSeqNo,
          VI.VISA_TYPE AS VisaTypeCode,
          (SELECT VTT.DISPLAY_VALUE
             FROM DL_COMMON."VISA_TYPES#I18N" VTT
            WHERE VT.KEY_VALUE = VTT.KEY_VALUE AND VTT.LOCALE = 'th_TH')
             AS VisaTypeTH,
          VT.DISPLAY_VALUE AS VisaTypeNameEN,
          VT.PERMIT_DAYS AS PermittDays,
          VT.DISPLAY_ORDER AS VisaTypeRptSeqNo,
          PIBICSDM2.get_deptfromuserid (LOWER (INC.OFFICER)) AS DepartmentNo,
          INC.BL_STATUS AS Status,
          INC.INS_AT AS CreateDate,
          INC.DML_AT AS UpdateDate,
          BC.INS_AT AS BlackListCreateDate,
          BC.DML_AT AS BlackListUpdateDate,
          EF.FORM_NO AS TM6,
          BC.CASE_NUMBER AS WLCD,
          CASE MV.EXITFLG WHEN 0 THEN 'Arrival' WHEN 1 THEN 'Departure' END
             AS Direction
     FROM DL_BORDERCONTROL.INCIDENTS INC
          INNER JOIN DL_BORDERCONTROL.BORDERDOCUMENTS BD
             ON INC.BRDDOCID = BD.BRDDOCID
          INNER JOIN DL_BORDERCONTROL.MOVEMENTS MV
             ON MV.BRDDOCID = BD.BRDDOCID AND MV.IS_FINISHED = 'Y'
          INNER JOIN DL_BORDERCONTROL.ENTRY_FORMS EF
             ON     EF.KEY_VALUE = MV.ENTRY_FORM
                AND TO_CHAR (EF.INS_AT, 'YYYY/MM/DD') =
                       TO_CHAR (INC.INS_AT, 'YYYY/MM/DD')
          LEFT JOIN DL_BORDERCONTROL.VISAS VI
             ON     BD.BRDDOCID = VI.BORDERDOCUMENT
                AND TO_CHAR (VI.INS_AT, 'YYYY/MM/DD') =
                       TO_CHAR (INC.INS_AT, 'YYYY/MM/DD')
          LEFT JOIN DL_COMMON.VISA_TYPES VT ON VI.VISA_TYPE = VT.KEY_VALUE
          INNER JOIN DL_BLACKLIST.IDENTITIES BID
             ON INC.BL_APPROVED_IDENTITY = BID.UNIQUE_VALUE
          INNER JOIN DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES CI
             ON INC.BL_APPROVED_IDENTITY = CI."IDENTITY"
          INNER JOIN DL_BLACKLIST.BLACKLIST_CASES BC
             ON CI.BLACKLIST_CASE = BC.ID
          LEFT JOIN DL_COMMON.REASON_CODES$I18N RC
             ON BC.REASON = RC.KEY_VALUE
          LEFT JOIN DL_COMMON.COUNTRIES CO ON BID.NATIONALITY = CO.KEY_VALUE
          LEFT JOIN DL_COMMON.CONTINENTS CON ON CON.KEY_VALUE = CO.CONTINENT
          LEFT JOIN DL_COMMON.BC_DOC_CLASS DC ON DC.KEY_VALUE = BD.DOCCLASS
    WHERE INC.BL_ACTION = 'A';
