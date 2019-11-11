CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_BLACKLIST_CASE" AS

    -- change
    -- 27.01.2019 e1mtheis  handle CT_PARTIAL_DATE

    FUNCTION fingerprints_to_json(pi_fingerprints IN pkg_db_access.fingerprint_guid_1_tt) RETURN json_array_t IS
        l_guid_json   json_object_t;
        l_finger_json json_object_t;
        l_json        json_array_t;
        i             NUMBER;
    BEGIN
        l_json := NEW json_array_t;
        i      := pi_fingerprints.first;
        WHILE i IS NOT NULL
        LOOP
            l_finger_json := json_object_t.parse('{}');
            l_guid_json   := json_object_t.parse('{}');
            l_guid_json.put('guid'
                           ,pi_fingerprints(i).guid);
            l_finger_json.put('image'
                             ,l_guid_json);
            l_finger_json.put('nistPosition'
                             ,pi_fingerprints(i).nist_position);
            l_finger_json.put('nistImpressionType'
                             ,pi_fingerprints(i).nist_impression_type);
            l_json.append(l_finger_json);
            i := pi_fingerprints.next(i);
        END LOOP;
        RETURN l_json;
    END fingerprints_to_json;

    FUNCTION fingerprints_from_json(pi_json IN json_array_t) RETURN pkg_db_access.fingerprint_guid_1_tt IS
        l_finger_json json_object_t;
        l_finger      pkg_db_access.fingerprint_guid_1_r;
        l_objects     pkg_db_access.fingerprint_guid_1_tt;
    BEGIN
        IF pi_json IS NOT NULL THEN
            FOR i IN 0 .. pi_json.get_size - 1
            LOOP
                l_finger_json                 := json_object_t(pi_json.get(i));
                l_finger.guid                 := l_finger_json.get_object('image').get_string('guid');
                l_finger.nist_position        := l_finger_json.get_number('nistPosition');
                l_finger.nist_impression_type := l_finger_json.get_number('nistImpressionType');

                l_objects(i + 1) := l_finger;
            END LOOP;
        END IF;
        RETURN l_objects;
    END fingerprints_from_json;

    FUNCTION faces_to_json(pi_faces IN pkg_db_access.face_guid_1_tt) RETURN json_array_t IS
        l_guid_json json_object_t;
        l_face_json json_object_t;
        l_json      json_array_t;
        i           NUMBER;
    BEGIN
        l_json := NEW json_array_t;
        i      := pi_faces.first;
        WHILE i IS NOT NULL
        LOOP
            l_face_json := NEW json_object_t;
            l_guid_json := NEW json_object_t;
            l_guid_json.put('guid'
                           ,pi_faces(i).guid);
            l_face_json.put('image'
                           ,l_guid_json);
            l_face_json.put('nistPosition'
                           ,pi_faces(i).nist_position);

            l_json.append(l_face_json);
            i := pi_faces.next(i);
        END LOOP;
        RETURN l_json;

    END faces_to_json;

    FUNCTION faces_from_json(pi_json IN json_array_t) RETURN pkg_db_access.face_guid_1_tt IS
        l_face_json json_object_t;
        l_face      pkg_db_access.face_guid_1_r;
        l_objects   pkg_db_access.face_guid_1_tt;
    BEGIN
        IF pi_json IS NOT NULL THEN
            FOR i IN 0 .. pi_json.get_size - 1
            LOOP
                l_face_json          := json_object_t(pi_json.get(i));
                l_face.guid          := l_face_json.get_object('image').get_string('guid');
                l_face.nist_position := l_face_json.get_number('nistPosition');

                l_objects(i + 1) := l_face;
            END LOOP;
        END IF;
        RETURN l_objects;
    END faces_from_json;

    PROCEDURE from_json(pi_json            IN json_object_t
                       ,po_case            OUT NOCOPY pkg_db_access.case_1_r
                       ,po_faces           OUT NOCOPY pkg_db_access.face_guid_1_tt
                       ,po_fingerprints    OUT NOCOPY pkg_db_access.fingerprint_guid_1_tt
                       ,po_identities      OUT NOCOPY pkg_db_access.identities_1_tt
                       ,po_related_persons OUT NOCOPY pkg_db_access.related_persons_1_tt) IS
        l_case_json      json_object_t;
        l_biometric_json json_object_t;

        FUNCTION related_persons_from_json(pi_json IN json_array_t) RETURN pkg_db_access.related_persons_1_tt IS

            l_related_person json_object_t;
            l_objects        pkg_db_access.related_persons_1_tt;
        BEGIN

            IF pi_json IS NOT NULL THEN

                FOR i IN 0 .. (pi_json.get_size - 1)
                LOOP
                    l_related_person := json_object_t(pi_json.get(i));
                    l_objects(i + 1).first_name := l_related_person.get_string('givenName');
                    l_objects(i + 1).middle_name := l_related_person.get_string('middleName');
                    l_objects(i + 1).last_name := l_related_person.get_string('lastName');
                    l_objects(i + 1).relationship := l_related_person.get_string('relationship');
                    l_objects(i + 1).notice := l_related_person.get_string('notice');
                    l_objects(i + 1).key_value := l_related_person.get_string('id');
                END LOOP;
            END IF;

            RETURN l_objects;
        END related_persons_from_json;

        FUNCTION identities_from_json(pi_json IN json_array_t) RETURN pkg_db_access.identities_1_tt IS
            l_identity     json_object_t;
            l_objects      pkg_db_access.identities_1_tt;
            i              PLS_INTEGER;
            dummy_identity pkg_db_access.identity_1_r;
            FUNCTION traveldocs_from_json(pi_json IN json_array_t) RETURN pkg_db_access.traveldocs_1_tt IS
                l_traveldoc json_object_t;
                l_objects   pkg_db_access.traveldocs_1_tt;
            BEGIN
                IF pi_json IS NOT NULL THEN
                    FOR i IN 0 .. pi_json.get_size - 1
                    LOOP
                        l_traveldoc := json_object_t(pi_json.get(i));
                        l_objects(i + 1).nationality := l_traveldoc.get_string('nationality');
                        l_objects(i + 1).doc_type := l_traveldoc.get_string('docType');
                        l_objects(i + 1).surname := l_traveldoc.get_string('surName');
                        l_objects(i + 1).middle_name := l_traveldoc.get_string('middleName');
                        l_objects(i + 1).given_name := l_traveldoc.get_string('givenName');
                        l_objects(i + 1).place_of_birth := l_traveldoc.get_string('placeOfBirth');
                        l_objects(i + 1).issuing_country := l_traveldoc.get_string('issuingCountry');
                        l_objects(i + 1).doc_number := l_traveldoc.get_string('docNumber');
                        l_objects(i + 1).date_of_expiry := l_traveldoc.get_date('dateOfExpiry');
                        l_objects(i + 1).sex := l_traveldoc.get_string('sex');
                        l_objects(i + 1).date_of_birth := substr(l_traveldoc.get_string('dateOfBirth'),1,10);
                        l_objects(i + 1).date_of_issue := l_traveldoc.get_date('dateOfIssue');
                        l_objects(i + 1).id := l_traveldoc.get_string('id');
                        l_objects(i + 1).identity := l_traveldoc.get_string('identity');
                        l_objects(i + 1).face_id := l_traveldoc.get_string('documentPhoto');
                    END LOOP;
                END IF;
                RETURN l_objects;
            END traveldocs_from_json;

            FUNCTION addresses_from_json(pi_json IN json_array_t) RETURN pkg_db_access.addresses_1_tt IS
                l_address json_object_t;
                l_objects pkg_db_access.addresses_1_tt;
            BEGIN
                IF pi_json IS NOT NULL THEN
                    FOR i IN 0 .. pi_json.get_size - 1
                    LOOP
                        l_address := json_object_t(pi_json.get(i));
                        l_objects(i + 1).road := l_address.get_string('road');
                        l_objects(i + 1).zipcode := l_address.get_string('zipcode');
                        l_objects(i + 1).address_name := l_address.get_string('addressName');
                        l_objects(i + 1).moo := l_address.get_string('moo');
                        l_objects(i + 1).district := l_address.get_string('district');
                        l_objects(i + 1).building := l_address.get_string('building');
                        l_objects(i + 1).country := l_address.get_string('country');
                        l_objects(i + 1).sub_district := l_address.get_string('subDistrict');
                        l_objects(i + 1).province := l_address.get_string('province');
                        l_objects(i + 1).id := l_address.get_string('id');
                        l_objects(i + 1).identity := l_address.get_string('identity');
                    END LOOP;
                END IF;
                RETURN l_objects;
            END addresses_from_json;
        BEGIN
            IF pi_json IS NOT NULL THEN
                FOR i IN 0 .. pi_json.get_size - 1
                LOOP
                    l_identity := json_object_t(pi_json.get(i));
                    l_objects(i + 1).id := l_identity.get_string('id ');
                    l_objects(i + 1).salutation := l_identity.get_string('salutation ');
                    l_objects(i + 1).surname := l_identity.get_string('surName');
                    l_objects(i + 1).middle_name := l_identity.get_string('middleName');
                    l_objects(i + 1).given_name := l_identity.get_string('givenName');
                    l_objects(i + 1).surname_thai := l_identity.get_string('surNameThai');
                    l_objects(i + 1).middlename_thai := l_identity.get_string('middleNameThai');
                    l_objects(i + 1).givenname_thai := l_identity.get_string('givenNameThai');
                    l_objects(i + 1).date_of_birth := substr(l_identity.get_string('dateOfBirth'),1,10);
                    l_objects(i + 1).place_of_birth := l_identity.get_string('placeOfBirth');
                    l_objects(i + 1).country_of_birth := l_identity.get_string('countryOfBirth');
                    l_objects(i + 1).nationality := l_identity.get_string('nationality');
                    l_objects(i + 1).sex := l_identity.get_string('sex');
                    l_objects(i + 1).notice := l_identity.get_string('notice');
                    l_objects(i + 1).profession := l_identity.get_string('profession');
                    l_objects(i + 1).body_height := l_identity.get_string('bodyHeight');
                    l_objects(i + 1).body_weight := l_identity.get_string('bodyWeight');
                    l_objects(i + 1).body_shape := l_identity.get_string('bodyShape');
                    l_objects(i + 1).hair_color := l_identity.get_string('hairColor');
                    l_objects(i + 1).hair_characteristic := l_identity.get_string('hairCharacteristic');
                    l_objects(i + 1).face_shape := l_identity.get_string('faceShape');
                    l_objects(i + 1).eye_color := l_identity.get_string('eyeColor');
                    l_objects(i + 1).skin := l_identity.get_string('skin');
                    l_objects(i + 1).dominant_characteristic := l_identity.get_string('dominantCharacteristic');
                    l_objects(i + 1).special_characteristic := l_identity.get_string('specialCharacteristic');
                    l_objects(i + 1).addresses := addresses_from_json(l_identity.get_array('addresses'));
                    l_objects(i + 1).traveldocs := traveldocs_from_json(l_identity.get_array('traveldocs'));

                END LOOP;
            ELSE
                l_objects(1) := dummy_identity;
            END IF;
            RETURN l_objects;
        END identities_from_json;
    BEGIN
        po_case := NULL;

        l_case_json                           := pi_json.get_object('case');
        po_case.authority                     := l_case_json.get_string('authority');
        po_case.behavior                      := l_case_json.get_string('behavior');
        po_case.case_number                   := l_case_json.get_string('caseNumber');
        po_case.secret_level                  := l_case_json.get_string('secretLevel');
        po_case.reason                        := l_case_json.get_string('reason');
        po_case.urgent_contact                := l_case_json.get_string('urgentContact');
        po_case.contact_information           := l_case_json.get_string('contactInformation');
        po_case.target_code                   := l_case_json.get_string('targetCode');
        po_case.action_code                   := l_case_json.get_string('actionCode');
        po_case.notice                        := l_case_json.get_string('notice');
        po_case.reference_document            := l_case_json.get_string('referenceDocument');
        po_case.warrant_arrested_type         := l_case_json.get_string('warrantArrestedType');
        po_case.criminal_case_number          := l_case_json.get_string('criminalCaseNumber');
        po_case.arrested_description          := l_case_json.get_string('arrestedDescription');
        po_case.arrested_status               := l_case_json.get_string('arrestedStatus');
        po_case.decided_case_number           := l_case_json.get_string('decidedCaseNumber');
        po_case.arrested_warrant_expiry_date  := l_case_json.get_date('arrestedWarrantExpiryDate');
        po_case.related_document              := l_case_json.get_string('relatedDocument');
        po_case.arrested_warrant_number       := l_case_json.get_string('arrestedWarrantNumber');
        po_case.arrested_warrant_date         := l_case_json.get_date('arrestedWarrantDate');
        po_case.arrested_warrant_year         := l_case_json.get_number('arrestedWarrantYear');
        po_case.undecided_case_number         := l_case_json.get_date('undecidedCaseNumber');
        po_case.travel_permit                 := l_case_json.get_string('travelPermit');
        po_case.travel_permit_from            := l_case_json.get_date('travelPermitFrom');
        po_case.travel_permit_to              := l_case_json.get_date('travelPermitTo');
        po_case.travel_permit_date_insert     := l_case_json.get_date('travelPermitDateInsert');
        po_case.travel_permit_date_delete     := l_case_json.get_date('travelPermitDateDelete');
        po_case.travel_permit_note            := l_case_json.get_string('travelPermitNote');
        po_case.owner_data                    := l_case_json.get_string('ownerData');
        po_case.other_description             := l_case_json.get_string('otherDescription');
        po_case.contact_telephone_number      := l_case_json.get_string('contactTelephoneNumber');
        po_case.contact_owner_data            := l_case_json.get_string('contactOwnerData');
        po_case.associated_behavior           := l_case_json.get_string('associatedBehavior');
        po_case.other                         := l_case_json.get_string('other');
        po_case.id                            := l_case_json.get_string('id');
        po_case.case_type                     := l_case_json.get_string('caseType');
        po_case.ostay_creation_date           := l_case_json.get_date('ostayCreationDate');
        po_case.ostay_self_indictment         := l_case_json.get_string('ostaySelfIndictment');
        po_case.ostay_status                  := l_case_json.get_string('ostayStatus');
        po_case.ostay_no_days                 := l_case_json.get_number('ostayNoDays');
        po_case.ostay_arrival_date            := l_case_json.get_date('ostayArrivalDate');
        po_case.ostay_departure_date          := l_case_json.get_date('ostayDepartureDate');
        po_case.ostay_tm6                     := l_case_json.get_string('ostayTM6');
        po_case.ostay_block_period            := l_case_json.get_number('ostayBlockPeriod');
        po_case.ostay_notice                  := l_case_json.get_string('ostayNotice');
        po_case.lost_pp_lost_date             := l_case_json.get_date('lostPassportLostDate');
        po_case.lost_pp_last_place            := l_case_json.get_string('lostPassportLastPlace');
        po_case.lost_pp_notify_date           := l_case_json.get_date('lostPassportNotifyDate');
        po_case.lost_pp_notify_place          := l_case_json.get_string('lostPassportNotifyPlace');
        po_case.lost_pp_visa_on_arriv         := l_case_json.get_string('lostPassportVisaOnArriv');
        po_case.lost_pp_visa_exp_date         := l_case_json.get_date('lostPassportVisaExpDate');
        po_case.lost_pp_notice                := l_case_json.get_string('lostPassportNotice');
        po_case.lost_pp_new_pp_type           := l_case_json.get_string('lostPassportNewPassportType');
        po_case.lost_pp_new_pp_number         := l_case_json.get_string('lostPassportNewPassportNumber');
        po_case.lost_pp_new_pp_issue_date     := l_case_json.get_date('lostPassportNewPassportIssueDate');
        po_case.lost_pp_new_pp_place_of_issue := l_case_json.get_string('lostPassportNewPassportPlaceOfIssue');
        po_case.lost_pp_new_pp_expire_date    := l_case_json.get_date('lostPassportNewPassportExpireDate');
        po_identities                         := identities_from_json(l_case_json.get_array('identities'));
        l_biometric_json                      := pi_json.get_object('biometric');
        po_related_persons                    := related_persons_from_json(l_case_json.get_array('relatedPersons'));
        IF l_biometric_json IS NOT NULL THEN
            po_case.abis_id := l_biometric_json.get_number('abisId');

            po_faces        := faces_from_json(pi_json => l_biometric_json.get_array('faces'));
            po_fingerprints := fingerprints_from_json(pi_json => l_biometric_json.get_array('fingerprints'));

        END IF;
    END from_json;

    PROCEDURE to_json(pi_case            IN pkg_db_access.case_1_r
                     ,pi_faces           IN pkg_db_access.face_guid_1_tt
                     ,pi_fingerprints    IN pkg_db_access.fingerprint_guid_1_tt
                     ,pi_identities      IN pkg_db_access.identities_1_tt
                     ,pi_related_persons IN pkg_db_access.related_persons_1_tt
                     ,po_json            OUT NOCOPY json_object_t) IS
        l_case_json      json_object_t;
        l_biometric_json json_object_t;

        FUNCTION related_persons_to_json(pi_related_persons IN pkg_db_access.related_persons_1_tt) RETURN json_array_t IS
            l_related_person json_object_t;
            l_json           json_array_t;
            i                PLS_INTEGER := NULL;
        BEGIN

            l_json := NEW json_array_t;

            i := pi_related_persons.first;
            WHILE i IS NOT NULL
            LOOP

                l_related_person := NEW json_object_t;
                l_related_person.put('id'
                                    ,pi_related_persons(i).key_value);
                l_related_person.put('givenName'
                                    ,pi_related_persons(i).first_name);
                l_related_person.put('surName'
                                    ,pi_related_persons(i).last_name);
                l_related_person.put('middleName'
                                    ,pi_related_persons(i).middle_name);
                l_related_person.put('relationship'
                                    ,pi_related_persons(i).relationship);
                l_related_person.put('notice'
                                    ,pi_related_persons(i).notice);

                i := pi_related_persons.next(i);
                l_json.append(l_related_person);
            END LOOP;

            RETURN l_json;

        END related_persons_to_json;

        FUNCTION identities_to_json(pi_identities IN pkg_db_access.identities_1_tt) RETURN json_array_t IS
            l_identity json_object_t;
            l_json     json_array_t;
            i          PLS_INTEGER;
            FUNCTION traveldocs_to_json(pi_traveldocs IN pkg_db_access.traveldocs_1_tt) RETURN json_array_t IS
                l_traveldoc json_object_t;
                l_json      json_array_t;
                i           PLS_INTEGER;
            BEGIN
                l_json := NEW json_array_t;
                i      := pi_traveldocs.first;
                WHILE i IS NOT NULL
                LOOP
                    l_traveldoc := NEW json_object_t;
                    l_traveldoc.put('nationality'
                                   ,pi_traveldocs(i).nationality);
                    l_traveldoc.put('docType'
                                   ,pi_traveldocs(i).doc_type);
                    l_traveldoc.put('surName'
                                   ,pi_traveldocs(i).surname);
                    l_traveldoc.put('middleName'
                                   ,pi_traveldocs(i).middle_name);
                    l_traveldoc.put('givenName'
                                   ,pi_traveldocs(i).given_name);
                    l_traveldoc.put('placeOfBirth'
                                   ,pi_traveldocs(i).place_of_birth);
                    l_traveldoc.put('issuingCountry'
                                   ,pi_traveldocs(i).issuing_country);
                    l_traveldoc.put('docNumber'
                                   ,pi_traveldocs(i).doc_number);
                    l_traveldoc.put('dateOfExpiry'
                                   ,pi_traveldocs(i).date_of_expiry);
                    l_traveldoc.put('sex'
                                   ,pi_traveldocs(i).sex);
                    l_traveldoc.put('dateOfBirth'
                                   ,pi_traveldocs(i).date_of_birth);
                    l_traveldoc.put('dateOfIssue'
                                   ,pi_traveldocs(i).date_of_issue);
                    l_traveldoc.put('id'
                                   ,pi_traveldocs(i).id);
                    l_traveldoc.put('identity'
                                   ,pi_traveldocs(i).identity);
                    l_traveldoc.put('documentPhoto'
                                   ,pi_traveldocs(i).face_id);
                    i := pi_traveldocs.next(i);
                    l_json.append(l_traveldoc);
                END LOOP;
                RETURN l_json;
            END traveldocs_to_json;

            FUNCTION addresses_to_json(pi_addresses IN pkg_db_access.addresses_1_tt) RETURN json_array_t IS
                l_address json_object_t;
                l_json    json_array_t;
                i         PLS_INTEGER;
            BEGIN
                l_json := NEW json_array_t;
                i      := pi_addresses.first;
                WHILE i IS NOT NULL
                LOOP
                    l_address := NEW json_object_t;
                    l_address.put('road'
                                 ,pi_addresses(i).road);
                    l_address.put('zipcode'
                                 ,pi_addresses(i).zipcode);
                    l_address.put('addressName'
                                 ,pi_addresses(i).address_name);
                    l_address.put('moo'
                                 ,pi_addresses(i).moo);
                    l_address.put('district'
                                 ,pi_addresses(i).district);
                    l_address.put('building'
                                 ,pi_addresses(i).building);
                    l_address.put('country'
                                 ,pi_addresses(i).country);
                    l_address.put('subDistrict'
                                 ,pi_addresses(i).sub_district);
                    l_address.put('province'
                                 ,pi_addresses(i).province);
                    l_address.put('id'
                                 ,pi_addresses(i).id);
                    l_address.put('identity'
                                 ,pi_addresses(i).identity);

                    i := pi_addresses.next(i);
                    l_json.append(l_address);
                END LOOP;
                RETURN l_json;
            END addresses_to_json;
        BEGIN
            l_json := NEW json_array_t;
            i      := pi_identities.first;
            WHILE i IS NOT NULL
            LOOP
                l_identity := NEW json_object_t;
                l_identity.put('salutation'
                              ,pi_identities(i).salutation);
                l_identity.put('surName'
                              ,pi_identities(i).surname);
                l_identity.put('middleName'
                              ,pi_identities(i).middle_name);
                l_identity.put('givenName'
                              ,pi_identities(i).given_name);
                l_identity.put('dateOfBirth'
                              ,pi_identities(i).date_of_birth);
                l_identity.put('placeOfBirth'
                              ,pi_identities(i).place_of_birth);
                l_identity.put('countryOfBirth'
                              ,pi_identities(i).country_of_birth);
                l_identity.put('nationality'
                              ,pi_identities(i).nationality);
                l_identity.put('sex'
                              ,pi_identities(i).sex);
                l_identity.put('notice'
                              ,pi_identities(i).notice);
                l_identity.put('profession'
                              ,pi_identities(i).profession);
                l_identity.put('bodyHeight'
                              ,pi_identities(i).body_height);
                l_identity.put('bodyWeight'
                              ,pi_identities(i).body_weight);
                l_identity.put('bodyShape'
                              ,pi_identities(i).body_shape);
                l_identity.put('hairColor'
                              ,pi_identities(i).hair_color);
                l_identity.put('hairCharacteristic'
                              ,pi_identities(i).hair_characteristic);
                l_identity.put('faceShape'
                              ,pi_identities(i).face_shape);
                l_identity.put('eyeColor'
                              ,pi_identities(i).eye_color);
                l_identity.put('skin'
                              ,pi_identities(i).skin);
                l_identity.put('dominantCharacteristic'
                              ,pi_identities(i).dominant_characteristic);
                l_identity.put('specialCharacteristic'
                              ,pi_identities(i).special_characteristic);
                l_identity.put('surNameThai'
                              ,pi_identities(i).surname_thai);
                l_identity.put('middleNameThai'
                              ,pi_identities(i).middlename_thai);
                l_identity.put('givenNameThai'
                              ,pi_identities(i).givenname_thai);
                l_identity.put('id'
                              ,pi_identities(i).id);
                l_identity.put('addresses'
                              ,addresses_to_json(pi_addresses => pi_identities(i).addresses));
                l_identity.put('traveldocs'
                              ,traveldocs_to_json(pi_traveldocs => pi_identities(i).traveldocs));
                i := pi_identities.next(i);
                l_json.append(l_identity);
            END LOOP;
            RETURN l_json;
        END identities_to_json;
    BEGIN
        po_json := NEW json_object_t;

        l_case_json := NEW json_object_t;
        l_case_json.put('isActive'
                       ,pi_case.is_active);
        l_case_json.put('authority'
                       ,pi_case.authority);
        l_case_json.put('behavior'
                       ,pi_case.behavior);
        l_case_json.put('caseNumber'
                       ,pi_case.case_number);
        l_case_json.put('secretLevel'
                       ,pi_case.secret_level);
        l_case_json.put('reason'
                       ,pi_case.reason);
        l_case_json.put('urgentContact'
                       ,pi_case.urgent_contact);
        l_case_json.put('contactInformation'
                       ,pi_case.contact_information);
        l_case_json.put('targetCode'
                       ,pi_case.target_code);
        l_case_json.put('actionCode'
                       ,pi_case.action_code);
        l_case_json.put('notice'
                       ,pi_case.notice);
        l_case_json.put('referenceDocument'
                       ,pi_case.reference_document);
        l_case_json.put('warrantArrestedType'
                       ,pi_case.warrant_arrested_type);
        l_case_json.put('criminalCaseNumber'
                       ,pi_case.criminal_case_number);
        l_case_json.put('arrestedDescription'
                       ,pi_case.arrested_description);
        l_case_json.put('arrestedStatus'
                       ,pi_case.arrested_status);
        l_case_json.put('decidedCaseNumber'
                       ,pi_case.decided_case_number);
        l_case_json.put('arrestedWarrantExpiryDate'
                       ,pi_case.arrested_warrant_expiry_date);
        l_case_json.put('relatedDocument'
                       ,pi_case.related_document);
        l_case_json.put('arrestedWarrantNumber'
                       ,pi_case.arrested_warrant_number);
        l_case_json.put('arrestedWarrantDate'
                       ,pi_case.arrested_warrant_date);
        l_case_json.put('arrestedWarrantYear'
                       ,pi_case.arrested_warrant_year);
        l_case_json.put('undecidedCaseNumber'
                       ,pi_case.undecided_case_number);
        l_case_json.put('travelPermit'
                       ,pi_case.travel_permit);
        l_case_json.put('travelPermitFrom'
                       ,pi_case.travel_permit_from);
        l_case_json.put('travelPermitTo'
                       ,pi_case.travel_permit_to);
        l_case_json.put('travelPermitDateInsert'
                       ,pi_case.travel_permit_date_insert);
        l_case_json.put('travelPermitDateDelete'
                       ,pi_case.travel_permit_date_delete);
        l_case_json.put('travelPermitNote'
                       ,pi_case.travel_permit_note);
        l_case_json.put('ownerData'
                       ,pi_case.owner_data);
        l_case_json.put('otherDescription'
                       ,pi_case.other_description);
        l_case_json.put('contactTelephoneNumber'
                       ,pi_case.contact_telephone_number);
        l_case_json.put('contactOwnerData'
                       ,pi_case.contact_owner_data);
        l_case_json.put('associatedBehavior'
                       ,pi_case.associated_behavior);
        l_case_json.put('other'
                       ,pi_case.other);
        l_case_json.put('caseType'
                       ,pi_case.case_type);
        l_case_json.put('ostayCreationDate'
                       ,pi_case.ostay_creation_date);
        l_case_json.put('ostaySelfIndictment'
                       ,pi_case.ostay_self_indictment);
        l_case_json.put('ostayStatus'
                       ,pi_case.ostay_status);
        l_case_json.put('ostayNoDays'
                       ,pi_case.ostay_no_days);
        l_case_json.put('ostayArrivalDate'
                       ,pi_case.ostay_arrival_date);
        l_case_json.put('ostayDepartureDate'
                       ,pi_case.ostay_departure_date);
        l_case_json.put('ostayTM6'
                       ,pi_case.ostay_tm6);
        l_case_json.put('ostayBlockPeriod'
                       ,pi_case.ostay_block_period);
        l_case_json.put('ostayNotice'
                       ,pi_case.ostay_notice);
        l_case_json.put('lostPassportLostDate'
                       ,pi_case.lost_pp_lost_date);
        l_case_json.put('lostPassportLastPlace'
                       ,pi_case.lost_pp_last_place);
        l_case_json.put('lostPassportNotifyDate'
                       ,pi_case.lost_pp_notify_date);
        l_case_json.put('lostPassportNotifyPlace'
                       ,pi_case.lost_pp_notify_place);
        l_case_json.put('lostPassportVisaOnArriv'
                       ,pi_case.lost_pp_visa_on_arriv);
        l_case_json.put('lostPassportVisaExpDate'
                       ,pi_case.lost_pp_visa_exp_date);
        l_case_json.put('lostPassportNotice'
                       ,pi_case.lost_pp_notice);
        l_case_json.put('lostPassportNewPassportType'
                       ,pi_case.lost_pp_new_pp_type);
        l_case_json.put('lostPassportNewPassportNumber'
                       ,pi_case.lost_pp_new_pp_number);
        l_case_json.put('lostPassportNewPassportIssueDate'
                       ,pi_case.lost_pp_new_pp_issue_date);
        l_case_json.put('lostPassportNewPassportPlaceOfIssue'
                       ,pi_case.lost_pp_new_pp_place_of_issue);
        l_case_json.put('lostPassportNewPassportExpireDate'
                       ,pi_case.lost_pp_new_pp_expire_date);
        l_case_json.put('id'
                       ,pi_case.id);
        l_case_json.put('identities'
                       ,identities_to_json(pi_identities));
        l_case_json.put('relatedPersons'
                       ,related_persons_to_json(pi_related_persons => pi_related_persons));
        l_biometric_json := NEW json_object_t();
        l_biometric_json.put('abisId'
                            ,pi_case.abis_id);
        l_biometric_json.put('faces'
                            ,faces_to_json(pi_faces => pi_faces));
        l_biometric_json.put('fingerprints'
                            ,fingerprints_to_json(pi_fingerprints => pi_fingerprints));
        po_json.put('case'
                   ,l_case_json);
        po_json.put('biometric'
                   ,l_biometric_json);
    END to_json;

    PROCEDURE insert_case(pi_case            IN pkg_db_access.case_1_r
                         ,pi_faces           IN pkg_db_access.face_guid_1_tt
                         ,pi_fingerprints    IN pkg_db_access.fingerprint_guid_1_tt
                         ,pi_identities      IN pkg_db_access.identities_1_tt
                         ,pi_related_persons IN pkg_db_access.related_persons_1_tt
                         ,po_id              OUT NOCOPY pkg_utils.id_t) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_blacklist_case_id pkg_utils.id_t;
        l_biometric         pkg_db_access.biometric_1_r;

    BEGIN

        pkg_db_access.put_blacklistcase(pi_case         => pi_case
                                       ,po_blacklist_id => l_blacklist_case_id);

        pkg_db_access.put_identities_for_blacklist(pi_identities => pi_identities
                                                  ,pi_blacklist  => l_blacklist_case_id);

        pkg_db_access.put_related_persons_for_blacklist(pi_related_persons => pi_related_persons
                                                       ,pi_i_blacklist     => l_blacklist_case_id);

        IF pi_case.abis_id IS NOT NULL THEN
            l_biometric.abis_id      := pi_case.abis_id;
            l_biometric.blacklist_id := l_blacklist_case_id;
            pkg_db_access.insert_biometric_for_blacklist(pi_biometric    => l_biometric
                                                        ,po_biometric_id => l_biometric.id);
            pkg_db_access.insert_faces_for_biometric(pi_faces        => pi_faces
                                                    ,pi_biometric_id => l_biometric.id);
            pkg_db_access.insert_fingerprints_for_biometric(pi_fingerprints => pi_fingerprints
                                                           ,pi_biometric_id => l_biometric.id);

        END IF;

        COMMIT;
        po_id := l_blacklist_case_id;
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error(SQLERRM);
            RAISE;

    END insert_case;

    PROCEDURE get_case(pi_case_id         IN pkg_utils.id_t
                      ,po_case            OUT NOCOPY pkg_db_access.case_1_r
                      ,po_identities      OUT NOCOPY pkg_db_access.identities_1_tt
                      ,po_faces           OUT NOCOPY pkg_db_access.face_guid_1_tt
                      ,po_fingerprints    OUT NOCOPY pkg_db_access.fingerprint_guid_1_tt
                      ,po_related_persons OUT NOCOPY pkg_db_access.related_persons_1_tt) IS
        l_biometric pkg_db_access.biometric_1_r;
    BEGIN
        po_case       := pkg_db_access.get_blacklistcase(pi_blacklist_id => pi_case_id);
        po_identities := pkg_db_access.get_identities_for_blacklist(pi_blacklist => pi_case_id);
        BEGIN
            l_biometric     := pkg_db_access.get_biometric_for_blacklist(pi_blacklist_case_id => pi_case_id);
            po_case.abis_id := l_biometric.abis_id;
            po_faces        := pkg_db_access.get_faces_for_biometric(pi_biometric_id => l_biometric.id);
            po_fingerprints := pkg_db_access.get_fingerprints_for_biometric(pi_biometric_id => l_biometric.id);
        EXCEPTION
            WHEN no_data_found THEN
                po_faces        := CAST(NULL AS pkg_db_access.face_guid_1_tt);
                po_fingerprints := CAST(NULL AS pkg_db_access.fingerprint_guid_1_tt);

        END;
        BEGIN
            po_related_persons := pkg_db_access.get_related_persons_for_blacklist(pi_blacklist_case => pi_case_id);
        EXCEPTION
            WHEN no_data_found THEN
                po_related_persons := CAST(NULL AS pkg_db_access.related_persons_1_tt);
        END;
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error(SQLERRM);
            RAISE;

    END get_case;

    PROCEDURE update_case(pi_case            IN pkg_db_access.case_1_r
                         ,pi_identities      IN pkg_db_access.identities_1_tt
                         ,pi_related_persons IN pkg_db_access.related_persons_1_tt) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_case pkg_db_access.case_1_r;
        dummy  pkg_utils.id_t;

    BEGIN
        l_case := pi_case;
        pkg_db_access.put_identities_for_blacklist(pi_identities => pi_identities
                                                  ,pi_blacklist  => pi_case.id);
        pkg_db_access.put_blacklistcase(pi_case         => l_case
                                       ,po_blacklist_id => dummy);

        pkg_db_access.put_related_persons_for_blacklist(pi_related_persons => pi_related_persons
                                                       ,pi_i_blacklist     => pi_case.id);

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error(SQLERRM);
            RAISE;

    END update_case;

    PROCEDURE delete_case(pi_case_id IN pkg_utils.id_t
                         ,po_return  OUT NOCOPY json_object_t) IS
    BEGIN
        IF pi_case_id IS NULL THEN
            RAISE pkg_utils.err_invalid_input;
        END IF;
        pkg_utils.log_input(pi_string => pi_case_id);
        UPDATE blacklist_cases b
        SET is_active = 'N'
        WHERE id = pi_case_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE no_data_found;
        END IF;
        pkg_utils.log_output(pi_json => po_return);
    EXCEPTION
        WHEN pkg_utils.err_invalid_input THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_invalid_input);
        WHEN no_data_found THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_no_data_found);
        WHEN OTHERS THEN
            logger.log_error(SQLERRM);
            RAISE;
    END delete_case;

    PROCEDURE insert_case$json(pi_json   IN json_object_t
                              ,po_return OUT NOCOPY json_object_t) IS
        l_case pkg_db_access.case_1_r;

        l_face_guids        pkg_db_access.face_guid_1_tt;
        l_fingerprint_guids pkg_db_access.fingerprint_guid_1_tt;
        l_identities        pkg_db_access.identities_1_tt;
        l_related_persons   pkg_db_access.related_persons_1_tt;

        l_blacklist_id pkg_utils.id_t;
    BEGIN
        pkg_utils.log_input(pi_json => pi_json);
        from_json(pi_json            => pi_json
                 ,po_case            => l_case
                 ,po_faces           => l_face_guids
                 ,po_fingerprints    => l_fingerprint_guids
                 ,po_identities      => l_identities
                 ,po_related_persons => l_related_persons);

        insert_case(pi_case            => l_case
                   ,pi_faces           => l_face_guids
                   ,pi_fingerprints    => l_fingerprint_guids
                   ,pi_identities      => l_identities
                   ,pi_related_persons => l_related_persons
                   ,po_id              => l_blacklist_id);

        po_return := pkg_utils.build_return$json(pi_id      => l_blacklist_id
                                                ,pi_code    => pkg_utils.gc_success
                                                ,pi_reasons => NULL);
        pkg_utils.log_output(po_return);

    END insert_case$json;

    PROCEDURE update_case$json(pi_json   IN json_object_t
                              ,po_return OUT NOCOPY json_object_t) IS
        l_case              pkg_db_access.case_1_r;
        l_face_guids        pkg_db_access.face_guid_1_tt;
        l_fingerprint_guids pkg_db_access.fingerprint_guid_1_tt;
        l_identities        pkg_db_access.identities_1_tt;
        l_related_person    pkg_db_access.related_persons_1_tt;

        l_id pkg_utils.id_t;
    BEGIN
        -- biometrics don't get updated
        pkg_utils.log_input(pi_json => pi_json);
        from_json(pi_json            => pi_json
                 ,po_case            => l_case
                 ,po_faces           => l_face_guids
                 ,po_fingerprints    => l_fingerprint_guids
                 ,po_identities      => l_identities
                 ,po_related_persons => l_related_person);

        update_case(pi_case            => l_case
                   ,pi_identities      => l_identities
                   ,pi_related_persons => l_related_person);

        po_return := pkg_utils.build_return$json(pi_id      => l_id
                                                ,pi_code    => pkg_utils.gc_success
                                                ,pi_reasons => NULL);
        pkg_utils.log_output(po_return);
    EXCEPTION
        WHEN no_data_found THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_no_data_found);
        WHEN pkg_utils.err_not_active THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_not_active);
        WHEN pkg_utils.err_invalid_input THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_invalid_input);
    END update_case$json;

    PROCEDURE get_case$json(pi_case_id IN pkg_utils.id_t
                           ,po_case    OUT NOCOPY json_object_t
                           ,po_return  OUT NOCOPY json_object_t) IS
        l_case            pkg_db_access.case_1_r;
        l_identities      pkg_db_access.identities_1_tt;
        l_faces           pkg_db_access.face_guid_1_tt;
        l_fingerprints    pkg_db_access.fingerprint_guid_1_tt;
        l_related_persons pkg_db_access.related_persons_1_tt;
    BEGIN
        IF pi_case_id IS NULL THEN
            RAISE pkg_utils.err_invalid_input;
        END IF;
        pkg_utils.log_input(pi_string => pi_case_id);
        get_case(pi_case_id         => pi_case_id
                ,po_case            => l_case
                ,po_identities      => l_identities
                ,po_faces           => l_faces
                ,po_fingerprints    => l_fingerprints
                ,po_related_persons => l_related_persons);

        to_json(pi_case            => l_case
               ,pi_identities      => l_identities
               ,pi_faces           => l_faces
               ,pi_fingerprints    => l_fingerprints
               ,pi_related_persons => l_related_persons
               ,po_json            => po_case);
        pkg_utils.log_output(pi_json => po_case);
        po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_success
                                                ,pi_reasons => NULL
                                                ,pi_id      => pi_case_id);
    EXCEPTION
        WHEN no_data_found THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_no_data_found);
        WHEN pkg_utils.err_invalid_input THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_invalid_input);
        WHEN pkg_utils.err_not_active THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_not_active);
    END get_case$json;

    PROCEDURE get_faces_by_identity$json(pi_identity_id IN pkg_utils.id_t
                                        ,po_biometrics  OUT NOCOPY json_array_t
                                        ,po_return      OUT NOCOPY json_object_t) IS
        l_biometric  pkg_db_access.biometric_1_r;
        l_faces      pkg_db_access.face_guid_1_tt;
        l_faces_json json_object_t;
        l_bio_json   json_object_t;

    BEGIN
        IF pi_identity_id IS NULL THEN
            RAISE pkg_utils.err_invalid_input;
        END IF;
        pkg_utils.log_input(pi_string => pi_identity_id);
        po_biometrics := NEW json_array_t();
        FOR r IN (SELECT blacklist_case AS id
                  FROM dl_blacklist.blacklist_case_identities
                  WHERE identity = pi_identity_id)
        LOOP
            l_biometric  := pkg_db_access.get_biometric_for_blacklist(pi_blacklist_case_id => r.id);
            l_faces      := pkg_db_access.get_faces_for_biometric(pi_biometric_id => l_biometric.id);
            l_faces_json := NEW json_object_t();
            l_bio_json   := NEW json_object_t();
            l_faces_json.put('abisId'
                            ,l_biometric.abis_id);
            l_faces_json.put('faces'
                            ,faces_to_json(pi_faces => l_faces));
            l_bio_json.put('biometric'
                          ,l_faces_json);
            po_biometrics.append(l_bio_json);
        END LOOP;
        po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_success
                                                ,pi_reasons => NULL);
        pkg_utils.log_output(pi_json => po_biometrics);

    EXCEPTION
        WHEN no_data_found THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_no_data_found);
        WHEN pkg_utils.err_invalid_input THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_invalid_input);
        WHEN pkg_utils.err_not_active THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_not_active);
    END get_faces_by_identity$json;

    PROCEDURE get_cases_by_identity$json(pi_identity_id IN pkg_utils.id_t
                                        ,po_cases       OUT NOCOPY json_array_t
                                        ,po_return      OUT NOCOPY json_object_t) IS
        l_case       json_object_t;
        l_return     json_object_t;
        l_cnt_errors PLS_INTEGER := 0;
        l_cases      json_object_t;
    BEGIN
        IF pi_identity_id IS NULL THEN
            RAISE pkg_utils.err_invalid_input;
        END IF;
        pkg_utils.log_input(pi_string => pi_identity_id);
        po_cases := NEW json_array_t();
        FOR r IN (SELECT blacklist_case AS id
                  FROM dl_blacklist.blacklist_case_identities
                  WHERE identity = pi_identity_id)
        LOOP
            get_case$json(pi_case_id => r.id
                         ,po_case    => l_case
                         ,po_return  => l_return);
            IF pkg_utils.is_return_success(l_return) THEN
                po_cases.append(l_case);
            ELSE
                l_cnt_errors := l_cnt_errors + 1;
            END IF;
        END LOOP;
        po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_success
                                                ,pi_reasons => sys.utl_lms.format_message('%d cases were in error'
                                                                                         ,l_cnt_errors));
        l_cases   := NEW json_object_t;
        l_cases.put('array'
                   ,po_cases);
        pkg_utils.log_output(pi_json => l_cases);

    EXCEPTION
        WHEN no_data_found THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_no_data_found);
        WHEN pkg_utils.err_invalid_input THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_invalid_input);
        WHEN pkg_utils.err_not_active THEN
            po_return := pkg_utils.build_return$json(pi_code    => pkg_utils.gc_error
                                                    ,pi_reasons => pkg_utils.gc_not_active);
    END get_cases_by_identity$json;

BEGIN
    pkg_utils.get_and_use_logger_preferences;
END pkg_blacklist_case;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_BLACKLIST_CASE" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_BLACKLIST_CASE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_BLACKLIST_CASE" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_BLACKLIST_CASE" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_BLACKLIST_CASE" TO "BIOSAADM";
