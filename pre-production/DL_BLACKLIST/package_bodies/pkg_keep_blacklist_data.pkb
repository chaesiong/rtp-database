CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_KEEP_BLACKLIST_DATA" AS


PROCEDURE P_BK_SYNC_BLACKLIST_CASES (p_wlcd in varchar2) IS
  BEGIN
          INSERT INTO dl_staging4pibics_intf.sync_blacklist_cases_bk 
                (wlcd, seqno, ownerage, expirydate, nationcd
                , passportno, case_id, identity_id, address_id, travel_docs_id
                , create_date, pibics_table_cd, is_active_in_mvlog, dml_type, dml_start_ts
                , currentness_in_pibics, currentness_in_bc, row_shall_be_ignored
                --, cnt_errors
                )
                
          (select wlcd, seqno, ownerage, expirydate, nationcd
                , passportno, case_id, identity_id, address_id, travel_docs_id
                , create_date, pibics_table_cd, is_active_in_mvlog, dml_type, dml_start_ts
                , currentness_in_pibics, currentness_in_bc, row_shall_be_ignored
                --, cnt_errors
          from dl_staging4pibics_intf.sync_blacklist_cases 
          where wlcd = p_wlcd);
          COMMIT;
  END P_BK_SYNC_BLACKLIST_CASES;
  
 
  PROCEDURE P_BK_BLACKLIST_CASES (p_wlcd in varchar2) IS 
  BEGIN
          INSERT INTO DL_BLACKLIST.BLACKLIST_CASES_BK (id, authority, behavior, case_number, secret_level
                , reason, is_active, ins_by, ins_at, dml_by
                , dml_at, dml_type, urgent_contact, contact_information, target_code
                , action_code, notice, reference_document, warrant_arrested_type, criminal_case_number
                , arrested_description, arrested_status, decided_case_number, arrested_warrant_expiry_date, related_document
                , arrested_warrant_number, arrested_warrant_date, travel_permit, travel_permit_from, travel_permit_to
                , travel_permit_date_insert, travel_permit_date_delete, travel_permit_note, owner_data, other_description
                , contact_telephone_number, contact_owner_data, associated_behavior, other, case_type
                , ostay_creation_date, ostay_self_indictment, ostay_status, ostay_no_days, ostay_arrival_date
                , ostay_departure_date, ostay_tm6, ostay_block_period, ostay_notice, lost_pp_lost_date
                , lost_pp_last_place, lost_pp_notify_date, lost_pp_notify_place, lost_pp_visa_on_arriv, lost_pp_visa_exp_date
                , lost_pp_notice, lost_pp_new_pp_type, lost_pp_new_pp_number, lost_pp_new_pp_issue_date, lost_pp_new_pp_place_of_issue
                , lost_pp_new_pp_expire_date, arrested_warrant_year, undecided_case_number)

          (SELECT id, authority, behavior, case_number, secret_level
                , reason, is_active, ins_by, ins_at, dml_by
                , dml_at, dml_type, urgent_contact, contact_information, target_code
                , action_code, notice, reference_document, warrant_arrested_type, criminal_case_number
                , arrested_description, arrested_status, decided_case_number, arrested_warrant_expiry_date, related_document
                , arrested_warrant_number, arrested_warrant_date, travel_permit, travel_permit_from, travel_permit_to
                , travel_permit_date_insert, travel_permit_date_delete, travel_permit_note, owner_data, other_description
                , contact_telephone_number, contact_owner_data, associated_behavior, other, case_type
                , ostay_creation_date, ostay_self_indictment, ostay_status, ostay_no_days, ostay_arrival_date
                , ostay_departure_date, ostay_tm6, ostay_block_period, ostay_notice, lost_pp_lost_date
                , lost_pp_last_place, lost_pp_notify_date, lost_pp_notify_place, lost_pp_visa_on_arriv, lost_pp_visa_exp_date
                , lost_pp_notice, lost_pp_new_pp_type, lost_pp_new_pp_number, lost_pp_new_pp_issue_date, lost_pp_new_pp_place_of_issue
                , lost_pp_new_pp_expire_date, arrested_warrant_year, undecided_case_number
          FROM DL_BLACKLIST.BLACKLIST_CASES
          WHERE case_number = p_wlcd);
          COMMIT;
  END P_BK_BLACKLIST_CASES;
  
  PROCEDURE P_BK_BLACKLIST_CASE_IDENT (p_wlcd in varchar2) IS
  BEGIN
        DECLARE blacklist_case_id VARCHAR2(32);

          begin
        
                select DL_BLACKLIST.BLACKLIST_CASES.ID into blacklist_case_id from DL_BLACKLIST.BLACKLIST_CASES where CASE_NUMBER = p_wlcd; 

                insert into DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES_BK 
                (id, blacklist_case, identity)
         
                (select id, blacklist_case, identity from DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES
                where blacklist_case = blacklist_case_id);
          COMMIT;
          end;

  END P_BK_BLACKLIST_CASE_IDENT;
  
  PROCEDURE P_BK_IDENTITIES (p_wlcd in varchar2) IS
  BEGIN
        DECLARE blacklist_case_id VARCHAR2(32);

          begin
                select DL_BLACKLIST.BLACKLIST_CASES.ID into blacklist_case_id from DL_BLACKLIST.BLACKLIST_CASES where CASE_NUMBER = p_wlcd; 
        
                insert into DL_BLACKLIST.IDENTITIES_BK 
                (KEY_VALUE, UNIQUE_VALUE, SALUTATION, SURNAME, MIDDLE_NAME
                , GIVEN_NAME, SURNAME_THAI, MIDDLENAME_THAI, GIVENNAME_THAI, DATE_OF_BIRTH
                , PLACE_OF_BIRTH, COUNTRY_OF_BIRTH, NATIONALITY, SEX, NOTICE
                , PROFESSION, PHONE_NUMBER_0, PHONE_NUMBER_1, PHONE_NUMBER_2, ADDRESS_0
                , ADDRESS_1, ADDRESS_2, BODY_HEIGHT, BODY_WEIGHT, BODY_SHAPE
                , HAIR_COLOR, HAIR_CHARACTERISTIC, FACE_SHAPE, EYE_COLOR, SKIN
                , DOMINANT_CHARACTERISTIC, SPECIAL_CHARACTERISTIC, PHONETIC_SURNAME, PHONETIC_MIDDLE_NAME, PHONETIC_GIVEN_NAME
                , OWNER, EXTENDED_DATA_SOURCE, EXTENDED_DATA_PK_0, EXTENDED_DATA_PK_1, EXTENDED_DATA_PK_2
                , AUTHORITY, BEHAVIOUR, CASENUMBER, LEVEL_CONFIDENTIALITY, REASON
                , IS_ACTIVE, INS_AT, INS_BY, DML_AT, DML_BY
                , DML_TYPE, CRD_FLAG, CRD_RESULT_FLAG, CRD_UPDATED_DATETIME, CRD_RESULT_XML
                )
        
                (select KEY_VALUE, UNIQUE_VALUE, SALUTATION, SURNAME, MIDDLE_NAME
                , GIVEN_NAME, SURNAME_THAI, MIDDLENAME_THAI, GIVENNAME_THAI, DATE_OF_BIRTH
                , PLACE_OF_BIRTH, COUNTRY_OF_BIRTH, NATIONALITY, SEX, NOTICE
                , PROFESSION, PHONE_NUMBER_0, PHONE_NUMBER_1, PHONE_NUMBER_2, ADDRESS_0
                , ADDRESS_1, ADDRESS_2, BODY_HEIGHT, BODY_WEIGHT, BODY_SHAPE
                , HAIR_COLOR, HAIR_CHARACTERISTIC, FACE_SHAPE, EYE_COLOR, SKIN
                , DOMINANT_CHARACTERISTIC, SPECIAL_CHARACTERISTIC, PHONETIC_SURNAME, PHONETIC_MIDDLE_NAME, PHONETIC_GIVEN_NAME
                , OWNER, EXTENDED_DATA_SOURCE, EXTENDED_DATA_PK_0, EXTENDED_DATA_PK_1, EXTENDED_DATA_PK_2
                , AUTHORITY, BEHAVIOUR, CASENUMBER, LEVEL_CONFIDENTIALITY, REASON
                , IS_ACTIVE, INS_AT, INS_BY, DML_AT, DML_BY
                , DML_TYPE, CRD_FLAG, CRD_RESULT_FLAG, CRD_UPDATED_DATETIME, CRD_RESULT_XML 
                from DL_BLACKLIST.IDENTITIES 
                where KEY_VALUE in (select DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES.IDENTITY from DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES where BLACKLIST_CASE = blacklist_case_id));   
          COMMIT;
          end;
  END P_BK_IDENTITIES;
  
  PROCEDURE P_BK_TRAVEL_DOCS(p_wlcd in varchar2) IS
  BEGIN
        DECLARE blacklist_case_id VARCHAR2(32);

            begin
                  select DL_BLACKLIST.BLACKLIST_CASES.ID into blacklist_case_id from DL_BLACKLIST.BLACKLIST_CASES where CASE_NUMBER = p_wlcd; 
        
                   insert into DL_BLACKLIST.TRAVEL_DOCS_BK 
                   (KEY_VALUE, UNIQUE_VALUE, DOC_TYPE, ISSUING_COUNTRY, DOC_NUMBER
                   , DATE_OF_ISSUE, DATE_OF_EXPIRY$VC, DATE_OF_EXPIRY, SURNAME, GIVEN_NAME
                   , NATIONALITY, PLACE_OF_BIRTH, SEX, ISSUING_AUTHORITY, DATE_OF_BIRTH$VC
                   , DATE_OF_BIRTH, MRZ_FORMAT, MRZ_DATA, DATA_ACQUISITION_TYPE, INS_AT
                   , INS_BY, DML_AT, DML_BY, DML_TYPE, OWNER
                   , IDENTITY, DOC_CLASS, HAIR_COLOR, HAIR_CHARACTERISTIC, MIDDLE_NAME
                   , EXTENDED_DATA_SOURCE, EXTENDED_DATA_PK_0, EXTENDED_DATA_PK_1, EXTENDED_DATA_PK_2, FACE_ID)
        
                   (select KEY_VALUE, UNIQUE_VALUE, DOC_TYPE, ISSUING_COUNTRY, DOC_NUMBER
                   , DATE_OF_ISSUE, DATE_OF_EXPIRY$VC, DATE_OF_EXPIRY, SURNAME, GIVEN_NAME
                   , NATIONALITY, PLACE_OF_BIRTH, SEX, ISSUING_AUTHORITY, DATE_OF_BIRTH$VC
                   , DATE_OF_BIRTH, MRZ_FORMAT, MRZ_DATA, DATA_ACQUISITION_TYPE, INS_AT
                   , INS_BY, DML_AT, DML_BY, DML_TYPE, OWNER
                   , IDENTITY, DOC_CLASS, HAIR_COLOR, HAIR_CHARACTERISTIC, MIDDLE_NAME
                   , EXTENDED_DATA_SOURCE, EXTENDED_DATA_PK_0, EXTENDED_DATA_PK_1, EXTENDED_DATA_PK_2, FACE_ID
                   from DL_BLACKLIST.TRAVEL_DOCS 
                   where IDENTITY in (select DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES.IDENTITY from DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES where BLACKLIST_CASE = blacklist_case_id));
          COMMIT;                   
          end;
  END P_BK_TRAVEL_DOCS;
  
  PROCEDURE P_BK_STEP_DELETE (p_wlcd in varchar2) IS
  BEGIN

        DECLARE blacklist_case_id VARCHAR2(32);

          begin
                    select DL_BLACKLIST.BLACKLIST_CASES.ID into blacklist_case_id from DL_BLACKLIST.BLACKLIST_CASES where CASE_NUMBER = p_wlcd; 
                    
                    delete from DL_BLACKLIST.TRAVEL_DOCS where IDENTITY in (select DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES.IDENTITY from DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES where BLACKLIST_CASE = blacklist_case_id);
                    delete from DL_BLACKLIST.IDENTITIES where KEY_VALUE in (select DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES.IDENTITY from DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES where BLACKLIST_CASE = blacklist_case_id);
                    delete from DL_BLACKLIST.BLACKLIST_CASE_IDENTITIES where BLACKLIST_CASE = blacklist_case_id;
                    delete from DL_BLACKLIST.BLACKLIST_CASES where CASE_NUMBER = p_wlcd;
                    delete from DL_STAGING4PIBICS_INTF.sync_blacklist_cases where wlcd = p_wlcd;
          COMMIT;
          end;

 END P_BK_STEP_DELETE;
  
 PROCEDURE DELETE_KEEP_BLACKLIST_DATA IS
 BEGIN 
            DELETE FROM DL_BLACKLIST.KEEP_BLACKLIST_DATA
            COMMIT;
 END DELETE_KEEP_BLACKLIST_DATA;
  

END PKG_KEEP_BLACKLIST_DATA;
/
