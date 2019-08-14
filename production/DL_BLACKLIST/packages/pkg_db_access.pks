CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_DB_ACCESS" AUTHID DEFINER IS

    -- Author  : E1NKLAMANN
    -- Created : 2018-06-22
    -- Purpose : Handling of db tables

    -- https://jira.dc.dermalog.com/browse/THA20675-586
    -- https://jira.dc.dermalog.com/browse/THA20675-651
    -- https://jira.dc.dermalog.com/browse/THA20675-964

    -- Changes
    -- 25.06.2018 e1jkropp new Lost-Passport Columns (THA20675-692)
    -- 25.07.2018 e1HAnders delete_traveldov
    --                      delete_address
    --                      delete identity (THA20675-1065)
    -- 27.02.2019 e1Mtheis  handle CT_PARTIAL_DATE

    err_invalid_identity_given EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_invalid_identity_given
                         ,-20001);

    TYPE address_1_r IS RECORD(
         road         addresses.road%TYPE
        ,zipcode      addresses.zipcode%TYPE
        ,address_name addresses.address_name%TYPE
        ,moo          addresses.moo%TYPE
        ,district     addresses.district%TYPE
        ,building     addresses.building%TYPE
        ,country      addresses.country%TYPE -- FK
        ,sub_district addresses.sub_district%TYPE
        ,province     addresses.province%TYPE
        -- these are empty during insert
        ,id       addresses.id%TYPE --PK   might be NULL for insert
        ,identity addresses.identity%TYPE --FK  during insert handled with another parameter
        );
    TYPE addresses_1_tt IS TABLE OF address_1_r INDEX BY PLS_INTEGER;

    TYPE traveldoc_1_r IS RECORD(
         nationality     travel_docs.nationality%TYPE
        ,doc_type        travel_docs.doc_type%TYPE
        ,surname         travel_docs.surname%TYPE
        ,given_name      travel_docs.given_name%TYPE
        ,middle_name     travel_docs.middle_name%TYPE
        ,place_of_birth  travel_docs.place_of_birth%TYPE
        ,issuing_country travel_docs.issuing_country%TYPE
        ,doc_number      travel_docs.doc_number%TYPE
        ,date_of_expiry  travel_docs.date_of_expiry %TYPE
        ,sex             travel_docs.sex%TYPE
        ,date_of_birth   VARCHAR2(10)
        ,date_of_issue   travel_docs.date_of_issue%TYPE
        ,face_id         travel_docs.face_id%TYPE
        ,doc_class       travel_docs.doc_class%TYPE
        -- these are empty during insert
        ,id       travel_docs.key_value%TYPE
        ,identity travel_docs.identity%TYPE);

    TYPE traveldocs_1_tt IS TABLE OF traveldoc_1_r INDEX BY PLS_INTEGER;

    TYPE identity_1_r IS RECORD(
         salutation              identities.salutation%TYPE
        ,surname                 identities.surname%TYPE
        ,middle_name             identities.middle_name%TYPE
        ,given_name              identities.given_name%TYPE
        ,surname_thai            identities.surname_thai%TYPE
        ,middlename_thai         identities.middlename_thai%TYPE
        ,givenname_thai          identities.givenname_thai%TYPE
        ,date_of_birth           VARCHAR2(10)
        ,place_of_birth          identities.place_of_birth%TYPE
        ,country_of_birth        identities.country_of_birth%TYPE
        ,nationality             identities.nationality%TYPE
        ,sex                     identities.sex%TYPE
        ,notice                  identities.notice%TYPE
        ,profession              identities.profession%TYPE
        ,body_height             identities.body_height%TYPE
        ,body_weight             identities.body_weight%TYPE
        ,body_shape              identities.body_shape%TYPE
        ,hair_color              identities.hair_color%TYPE
        ,hair_characteristic     identities.hair_characteristic%TYPE
        ,face_shape              identities.face_shape%TYPE
        ,eye_color               identities.eye_color%TYPE
        ,skin                    identities.skin%TYPE
        ,dominant_characteristic identities.dominant_characteristic%TYPE
        ,special_characteristic  identities.special_characteristic%TYPE
        ,traveldocs              traveldocs_1_tt
        ,addresses               addresses_1_tt
        -- NULL during insert
        ,id        identities.key_value%TYPE
        ,blacklist pkg_utils.id_t);

    TYPE identities_1_tt IS TABLE OF identity_1_r INDEX BY PLS_INTEGER;

    TYPE fingerprint_guid_1_r IS RECORD(
         guid                 pkg_utils.id_t
        ,nist_impression_type NUMBER
        ,nist_position        NUMBER);

    TYPE fingerprint_guid_1_tt IS TABLE OF fingerprint_guid_1_r INDEX BY PLS_INTEGER;

    TYPE face_guid_1_r IS RECORD(
         guid          faces.image_id%TYPE --pkg_utils.id_t
        ,nist_position NUMBER);

    TYPE face_guid_1_tt IS TABLE OF face_guid_1_r INDEX BY PLS_INTEGER;

    TYPE biometric_1_r IS RECORD(
         id           pkg_utils.id_t
        ,abis_id      NUMBER
        ,blacklist_id pkg_utils.id_t);

    TYPE related_person_1_r IS RECORD(
         key_value    related_persons.key_value%TYPE
        ,first_name   related_persons.first_name%TYPE
        ,middle_name  related_persons.middle_name%TYPE
        ,last_name    related_persons.last_name%TYPE
        ,relationship related_persons.relationship%TYPE
        ,notice       related_persons.notice%TYPE);

    TYPE related_persons_1_tt IS TABLE OF related_person_1_r INDEX BY PLS_INTEGER;

    TYPE case_1_r IS RECORD(
         authority                     blacklist_cases.authority%TYPE
        ,behavior                      blacklist_cases.behavior%TYPE
        ,case_number                   blacklist_cases.case_number%TYPE
        ,secret_level                  blacklist_cases.secret_level%TYPE
        ,reason                        blacklist_cases.reason%TYPE
        ,is_active                     blacklist_cases.is_active%TYPE
        ,urgent_contact                blacklist_cases.urgent_contact%TYPE
        ,contact_information           blacklist_cases.contact_information%TYPE
        ,target_code                   blacklist_cases.target_code%TYPE
        ,action_code                   blacklist_cases.action_code%TYPE
        ,notice                        blacklist_cases.notice%TYPE
        ,reference_document            blacklist_cases.reference_document%TYPE
        ,warrant_arrested_type         blacklist_cases.warrant_arrested_type%TYPE
        ,criminal_case_number          blacklist_cases.criminal_case_number%TYPE
        ,arrested_description          blacklist_cases.arrested_description%TYPE
        ,arrested_status               blacklist_cases.arrested_status%TYPE
        ,decided_case_number           blacklist_cases.decided_case_number%TYPE
        ,arrested_warrant_expiry_date  blacklist_cases.arrested_warrant_expiry_date%TYPE
        ,related_document              blacklist_cases.related_document%TYPE
        ,arrested_warrant_number       blacklist_cases.arrested_warrant_number%TYPE
        ,arrested_warrant_date         blacklist_cases.arrested_warrant_date%TYPE
        ,arrested_warrant_year         blacklist_cases.arrested_warrant_year%TYPE
        ,undecided_case_number         blacklist_cases.undecided_case_number%TYPE
        ,travel_permit                 blacklist_cases.travel_permit%TYPE
        ,travel_permit_from            blacklist_cases.travel_permit_from%TYPE
        ,travel_permit_to              blacklist_cases.travel_permit_to%TYPE
        ,travel_permit_date_insert     blacklist_cases.travel_permit_date_insert%TYPE
        ,travel_permit_date_delete     blacklist_cases.travel_permit_date_delete%TYPE
        ,travel_permit_note            blacklist_cases.travel_permit_note%TYPE
        ,owner_data                    blacklist_cases.owner_data%TYPE
        ,other_description             blacklist_cases.other_description%TYPE
        ,contact_telephone_number      blacklist_cases.contact_telephone_number%TYPE
        ,contact_owner_data            blacklist_cases.contact_owner_data%TYPE
        ,associated_behavior           blacklist_cases.associated_behavior%TYPE
        ,abis_id                       biometrics.abis_id%TYPE
        ,other                         blacklist_cases.other%TYPE
        ,id                            blacklist_cases.id%TYPE
        ,case_type                     blacklist_cases.case_type%TYPE
        ,ostay_creation_date           blacklist_cases.ostay_creation_date%TYPE
        ,ostay_self_indictment         blacklist_cases.ostay_self_indictment%TYPE
        ,ostay_status                  blacklist_cases.ostay_status%TYPE
        ,ostay_no_days                 blacklist_cases.ostay_no_days%TYPE
        ,ostay_arrival_date            blacklist_cases.ostay_arrival_date%TYPE
        ,ostay_departure_date          blacklist_cases.ostay_departure_date%TYPE
        ,ostay_tm6                     blacklist_cases.ostay_tm6%TYPE
        ,ostay_block_period            blacklist_cases.ostay_block_period%TYPE
        ,ostay_notice                  blacklist_cases.ostay_notice%TYPE
        ,lost_pp_lost_date             blacklist_cases.lost_pp_lost_date%TYPE
        ,lost_pp_last_place            blacklist_cases.lost_pp_last_place%TYPE
        ,lost_pp_notify_date           blacklist_cases.lost_pp_notify_date%TYPE
        ,lost_pp_notify_place          blacklist_cases.lost_pp_notify_place%TYPE
        ,lost_pp_visa_on_arriv         blacklist_cases.lost_pp_visa_on_arriv%TYPE
        ,lost_pp_visa_exp_date         blacklist_cases.lost_pp_visa_exp_date%TYPE
        ,lost_pp_notice                blacklist_cases.lost_pp_notice%TYPE
        ,lost_pp_new_pp_type           blacklist_cases.lost_pp_new_pp_type%TYPE
        ,lost_pp_new_pp_number         blacklist_cases.lost_pp_new_pp_number%TYPE
        ,lost_pp_new_pp_issue_date     blacklist_cases.lost_pp_new_pp_issue_date%TYPE
        ,lost_pp_new_pp_place_of_issue blacklist_cases.lost_pp_new_pp_place_of_issue%TYPE
        ,lost_pp_new_pp_expire_date    blacklist_cases.lost_pp_new_pp_expire_date%TYPE);

    /*
     the put_xx_for_identity - reoutines
      * take the p_identity parameter to link the data. This info has prioriy over ciontent of record fields
      * handle update / insert :
               if the id column is null, it is considered an insert,
               otherwise it is an update on all non key fields

    */

    PROCEDURE put_address_for_identity(pio_address IN OUT NOCOPY address_1_r
                                      ,pi_identity IN pkg_utils.id_t);
    PROCEDURE delete_address(pi_id IN addresses.id%TYPE);
    PROCEDURE put_addresses_for_identity(pio_addresses IN OUT NOCOPY addresses_1_tt
                                        ,pi_identity   IN pkg_utils.id_t);
    PROCEDURE get_addresses_for_identity(pi_identity  IN pkg_utils.id_t
                                        ,po_addresses OUT NOCOPY addresses_1_tt);

    PROCEDURE put_traveldoc_for_identity(pio_traveldoc IN OUT NOCOPY traveldoc_1_r
                                        ,pi_identity   IN pkg_utils.id_t);
    PROCEDURE delete_traveldoc(pi_key_value IN travel_docs.key_value%TYPE);
    PROCEDURE put_traveldocs_for_identity(pio_traveldocs IN OUT NOCOPY traveldocs_1_tt
                                         ,pi_identity    IN pkg_utils.id_t);
    PROCEDURE get_traveldocs_for_identity(pi_identity   IN pkg_utils.id_t
                                         ,po_traveldocs OUT NOCOPY traveldocs_1_tt);

    PROCEDURE insert_faces_for_biometric(pi_faces        IN face_guid_1_tt
                                        ,pi_biometric_id IN pkg_utils.id_t);
    FUNCTION get_faces_for_biometric(pi_biometric_id IN pkg_utils.id_t) RETURN face_guid_1_tt;

    PROCEDURE insert_fingerprints_for_biometric(pi_fingerprints IN fingerprint_guid_1_tt
                                               ,pi_biometric_id IN pkg_utils.id_t);
    FUNCTION get_fingerprints_for_biometric(pi_biometric_id IN pkg_utils.id_t) RETURN fingerprint_guid_1_tt;

    PROCEDURE insert_biometric_for_blacklist(pi_biometric    IN biometric_1_r
                                            ,po_biometric_id OUT NOCOPY pkg_utils.id_t);
    FUNCTION get_biometric_for_blacklist(pi_blacklist_case_id IN pkg_utils.id_t) RETURN biometric_1_r;

    PROCEDURE get_blacklist_id(pi_identity_id       IN pkg_utils.id_t
                              ,po_blacklist_case_id OUT NOCOPY pkg_utils.id_t);

    FUNCTION get_blacklistcase(pi_blacklist_id IN pkg_utils.id_t) RETURN case_1_r;
    PROCEDURE put_blacklistcase(pi_case         IN case_1_r
                               ,po_blacklist_id OUT NOCOPY pkg_utils.id_t);

    FUNCTION get_identities_for_blacklist(pi_blacklist IN pkg_utils.id_t) RETURN identities_1_tt;
    PROCEDURE delete_identity_for_blacklist(pi_identity  IN identities.key_value%TYPE
                                           ,pi_blacklist IN blacklist_cases.id%TYPE);

    PROCEDURE put_identity_for_blacklist(pi_identity    IN identity_1_r
                                        ,pi_blacklist   IN pkg_utils.id_t
                                        ,po_identity_id OUT NOCOPY pkg_utils.id_t);
    PROCEDURE put_identities_for_blacklist(pi_identities IN identities_1_tt
                                          ,pi_blacklist  IN pkg_utils.id_t);

    PROCEDURE put_related_persons_for_blacklist(pi_related_persons IN related_persons_1_tt
                                               ,pi_i_blacklist     IN pkg_utils.id_t);

    PROCEDURE put_related_person_for_blacklist(pi_related_person IN related_person_1_r
                                              ,pi_i_blacklist    IN pkg_utils.id_t
                                              ,po_related_person OUT NOCOPY pkg_utils.id_t);

    PROCEDURE delete_related_person_for_blacklist(pi_related_person IN related_persons.key_value%TYPE
                                                 ,pi_blacklist_id   IN blacklist_cases.id%TYPE);

    FUNCTION get_related_persons_for_blacklist(pi_blacklist_case IN pkg_utils.id_t) RETURN related_persons_1_tt;

END pkg_db_access;
/
