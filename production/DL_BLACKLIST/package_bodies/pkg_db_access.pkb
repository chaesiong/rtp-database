CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_DB_ACCESS" IS

    c_scope_prefix   CONSTANT VARCHAR2(31) := lower($$plsql_unit)
                                            || '.';
    --

    -- Changes
    -- 25.06.2018 e1jkropp new Lost-Passport Columns (THA20675-692)
    -- 25.07.2018 e1HAnders delete_traveldov
    --                      delete_address
    --                      delete identity (THA20675-1065)
    -- 27.02.2019 MTheis    handle data type CT_PARTIAL_DATE

    PROCEDURE put_address_for_identity (
        pio_address IN OUT NOCOPY address_1_r,
        pi_identity   IN            pkg_utils.id_t
    ) IS
        l_cnt   NUMBER;
    BEGIN
        IF pi_identity IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        IF pio_address.id IS NULL THEN
            INSERT INTO addresses (
                road,
                zipcode,
                address_name,
                moo,
                district,
                building,
                country,
                sub_district,
                province,
                identity
            ) VALUES (
                pio_address.road,
                pio_address.zipcode,
                pio_address.address_name,
                pio_address.moo,
                pio_address.district,
                pio_address.building,
                pio_address.country,
                pio_address.sub_district,
                pio_address.province,
                pi_identity
            ) RETURNING id,
                        identity INTO pio_address.id, pio_address.identity;

        ELSE
            UPDATE addresses
            SET
                road = pio_address.road,
                zipcode = pio_address.zipcode,
                address_name = pio_address.address_name,
                moo = pio_address.moo,
                district = pio_address.district,
                building = pio_address.building,
                country = pio_address.country,
                sub_district = pio_address.sub_district,
                province = pio_address.province,
                identity = pi_identity
            WHERE
                id = pio_address.id
            RETURNING id,
                      identity INTO pio_address.id, pio_address.identity;

            l_cnt := SQL%rowcount;
            IF l_cnt = 0 THEN
                RAISE no_data_found;
            END IF;
        END IF;

    END put_address_for_identity;

    PROCEDURE delete_address (
        pi_id   IN      addresses.id%TYPE
    ) IS
    BEGIN
        DELETE FROM addresses
        WHERE
            id = pi_id;

    END delete_address;

    PROCEDURE put_addresses_for_identity (
        pio_addresses IN OUT NOCOPY addresses_1_tt,
        pi_identity   IN            pkg_utils.id_t
    ) IS
        i   PLS_INTEGER;
    BEGIN
        IF pi_identity IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        i := pio_addresses.first;
        WHILE i IS NOT NULL LOOP
            put_address_for_identity(pio_address => pio_addresses(i), pi_identity => pi_identity);
            i := pio_addresses.next(i);
        END LOOP;

    END put_addresses_for_identity;

    PROCEDURE get_addresses_for_identity (
        pi_identity   IN            pkg_utils.id_t,
        po_addresses OUT NOCOPY addresses_1_tt
    ) IS
    BEGIN
        IF pi_identity IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        FOR r IN (
            SELECT
                road,
                zipcode,
                address_name,
                moo,
                district,
                building,
                country,
                sub_district,
                province,
                id,
                identity,
                ROW_NUMBER() OVER(
                    ORDER BY
                        dml_at
                ) AS rn
            FROM
                addresses
            WHERE
                identity = pi_identity
        ) LOOP
            po_addresses(r.rn).road := r.road;
            po_addresses(r.rn).zipcode := r.zipcode;
            po_addresses(r.rn).address_name := r.address_name;
            po_addresses(r.rn).moo := r.moo;
            po_addresses(r.rn).district := r.district;
            po_addresses(r.rn).building := r.building;
            po_addresses(r.rn).country := r.country;
            po_addresses(r.rn).sub_district := r.sub_district;
            po_addresses(r.rn).province := r.province;
            po_addresses(r.rn).id := r.id;
            po_addresses(r.rn).identity := r.identity;
        END LOOP;

    END get_addresses_for_identity;

    PROCEDURE put_traveldoc_for_identity (
        pio_traveldoc IN OUT NOCOPY traveldoc_1_r,
        pi_identity   IN            pkg_utils.id_t
    ) IS
        l_cnt   NUMBER;
    BEGIN
        IF pi_identity IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        IF pio_traveldoc.id IS NULL THEN
            INSERT INTO travel_docs (
                nationality,
                doc_type,
                surname,
                middle_name,
                given_name,
                place_of_birth,
                issuing_country,
                doc_number,
                date_of_expiry,
                date_of_expiry$vc,
                sex,
                date_of_birth_partial,
                --date_of_birth,
                date_of_birth$vc,
                date_of_issue,
                identity,
                face_id,
                doc_class
            ) VALUES (
                pio_traveldoc.nationality,
                pio_traveldoc.doc_type,
                pio_traveldoc.surname,
                pio_traveldoc.middle_name,
                pio_traveldoc.given_name,
                pio_traveldoc.place_of_birth,
                pio_traveldoc.issuing_country,
                pio_traveldoc.doc_number,
                pio_traveldoc.date_of_expiry,
                TO_CHAR(pio_traveldoc.date_of_expiry, 'YYMMDD'),
                case upper(substr(pio_traveldoc.sex, 1, 1)) when 'U' then 'X' else upper(substr(pio_traveldoc.sex, 1, 1)) end,
                pkg_dl_utils.get_partial_from_varchar(pio_traveldoc.date_of_birth),
                -- to_date(pio_traveldoc.date_of_birth,'DD.MM.YY'),
                pkg_dl_utils.get_vs$date_from_varchar(pio_traveldoc.date_of_birth),
                pio_traveldoc.date_of_issue,
                pi_identity,
                pio_traveldoc.face_id,
                pio_traveldoc.doc_class
            ) RETURNING key_value,
                        identity INTO pio_traveldoc.id, pio_traveldoc.identity;

        ELSE
            UPDATE travel_docs
            SET
                nationality = pio_traveldoc.nationality,
                doc_type = pio_traveldoc.doc_type,
                surname = pio_traveldoc.surname,
                middle_name = pio_traveldoc.middle_name,
                given_name = pio_traveldoc.given_name,
                place_of_birth = pio_traveldoc.place_of_birth,
                issuing_country = pio_traveldoc.issuing_country,
                doc_number = pio_traveldoc.doc_number,
                date_of_expiry = pio_traveldoc.date_of_expiry,
                date_of_expiry$vc = TO_CHAR(pio_traveldoc.date_of_expiry, 'YYMMDD'),
                sex = case upper(substr(pio_traveldoc.sex, 1, 1)) when 'U' then 'X' else upper(substr(pio_traveldoc.sex, 1, 1)) end,
                date_of_birth_partial = pkg_dl_utils.get_partial_from_varchar(pio_traveldoc.date_of_birth),
                --date_of_birth = to_date(pio_traveldoc.date_of_birth,'DD.MM.YY'),
                date_of_birth$vc = pkg_dl_utils.get_vs$date_from_varchar(pio_traveldoc.date_of_birth),
                date_of_issue = pio_traveldoc.date_of_issue,
                face_id = pio_traveldoc.face_id,
                doc_class = pio_traveldoc.doc_class
            WHERE
                key_value = pio_traveldoc.id
            RETURNING key_value,
                      identity INTO pio_traveldoc.id, pio_traveldoc.identity;

            l_cnt := SQL%rowcount;
            IF l_cnt = 0 THEN
                RAISE no_data_found;
            END IF;
        END IF;

    END put_traveldoc_for_identity;

    PROCEDURE delete_traveldoc (
        pi_key_value   IN             travel_docs.key_value%TYPE
    ) IS
    BEGIN
        DELETE FROM travel_docs
        WHERE
            key_value = pi_key_value;

    END delete_traveldoc;

    PROCEDURE put_traveldocs_for_identity (
        pio_traveldocs IN OUT NOCOPY traveldocs_1_tt,
        pi_identity   IN            pkg_utils.id_t
    ) IS
        i   PLS_INTEGER;
    BEGIN
        IF pi_identity IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        i := pio_traveldocs.first;
        WHILE i IS NOT NULL LOOP
            put_traveldoc_for_identity(pio_traveldoc => pio_traveldocs(i), pi_identity => pi_identity);
            i := pio_traveldocs.next(i);
        END LOOP;

    END put_traveldocs_for_identity;

    PROCEDURE get_traveldocs_for_identity (
        pi_identity   IN            pkg_utils.id_t,
        po_traveldocs OUT NOCOPY traveldocs_1_tt
    ) IS
    BEGIN
        IF pi_identity IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        FOR r IN (
            SELECT
                nationality,
                doc_type,
                surname,
                given_name,
                place_of_birth,
                issuing_country,
                doc_number,
                date_of_expiry,
                sex,
                date_of_birth_partial,
                date_of_issue,
                key_value,
                identity,
                face_id,
                doc_class,
                ROW_NUMBER() OVER(
                    ORDER BY
                        dml_at
                ) AS rn
            FROM
                travel_docs
            WHERE
                identity = pi_identity
        ) LOOP
            po_traveldocs(r.rn).nationality := r.nationality;
            po_traveldocs(r.rn).doc_type := r.doc_type;
            po_traveldocs(r.rn).surname := r.surname;
            po_traveldocs(r.rn).given_name := r.given_name;
            po_traveldocs(r.rn).place_of_birth := r.place_of_birth;
            po_traveldocs(r.rn).issuing_country := r.issuing_country;
            po_traveldocs(r.rn).doc_number := r.doc_number;
            po_traveldocs(r.rn).date_of_expiry := r.date_of_expiry;
            po_traveldocs(r.rn).sex := r.sex;
            po_traveldocs(r.rn).date_of_birth := r.date_of_birth_partial.getFormatData('YYYY-MM-DD');
            po_traveldocs(r.rn).date_of_issue := r.date_of_issue;
            po_traveldocs(r.rn).id := r.key_value;
            po_traveldocs(r.rn).identity := r.identity;
            po_traveldocs(r.rn).face_id := r.face_id;
            po_traveldocs(r.rn).doc_class := r.doc_class;
        END LOOP;

    END get_traveldocs_for_identity;

    PROCEDURE insert_faces_for_biometric (
        pi_faces          IN                face_guid_1_tt,
        pi_biometric_id   IN                pkg_utils.id_t
    ) IS
        i                    PLS_INTEGER;
        l_face_position_id   pkg_utils.id_t;
    BEGIN
        i := pi_faces.first;
        WHILE i IS NOT NULL LOOP
            UPDATE images i
            SET
                i.lifetime = 0
            WHERE
                i.id = pi_faces(i).guid;

            SELECT
                id
            INTO l_face_position_id
            FROM
                face_positions
            WHERE
                ordinal = pi_faces(i).nist_position;

            INSERT INTO dl_blacklist.faces (
                image_id,
                biometric_id,
                face_position_id
            ) VALUES (
                pi_faces(i).guid,
                pi_biometric_id,
                l_face_position_id
            );

            i := pi_faces.next(i);
        END LOOP;

    END insert_faces_for_biometric;

    FUNCTION get_faces_for_biometric (
        pi_biometric_id IN   pkg_utils.id_t
    ) RETURN face_guid_1_tt IS
        l_object   face_guid_1_tt;
    BEGIN
        FOR r IN (
            SELECT
                f.image_id   AS guid,
                fp.ordinal   AS position,
                ROW_NUMBER() OVER(
                    ORDER BY
                        fp.ordinal, f.image_id
                ) AS rn
            FROM
                dl_blacklist.faces f
                INNER JOIN dl_blacklist.face_positions fp ON fp.id = f.face_position_id
            WHERE
                f.biometric_id = pi_biometric_id
            ORDER BY
                fp.ordinal,
                f.image_id
        ) LOOP
            l_object(r.rn).guid := r.guid;
            l_object(r.rn).nist_position := r.position;
        END LOOP;

        RETURN l_object;
    END get_faces_for_biometric;

    PROCEDURE insert_fingerprints_for_biometric (
        pi_fingerprints   IN                fingerprint_guid_1_tt,
        pi_biometric_id   IN                pkg_utils.id_t
    ) IS
        i                      PLS_INTEGER;
        l_finger_position_id   pkg_utils.id_t;
        l_impression_type_id   pkg_utils.id_t;
    BEGIN
        i := pi_fingerprints.first;
        WHILE i IS NOT NULL LOOP
            UPDATE images i
            SET
                i.lifetime = 0
            WHERE
                i.id = pi_fingerprints(i).guid;

            SELECT
                id
            INTO l_finger_position_id
            FROM
                finger_positions
            WHERE
                ordinal = pi_fingerprints(i).nist_position;

            SELECT
                id
            INTO l_impression_type_id
            FROM
                dl_blacklist.finger_impression_types
            WHERE
                ordinal = pi_fingerprints(i).nist_impression_type;

            INSERT INTO dl_blacklist.fingerprints (
                image_id,
                biometric_id,
                finger_position_id,
                impression_type_id
            ) VALUES (
                pi_fingerprints(i).guid,
                pi_biometric_id,
                l_finger_position_id,
                l_impression_type_id
            );

            i := pi_fingerprints.next(i);
        END LOOP;

    END insert_fingerprints_for_biometric;

    FUNCTION get_fingerprints_for_biometric (
        pi_biometric_id IN   pkg_utils.id_t
    ) RETURN fingerprint_guid_1_tt IS
        l_objects   fingerprint_guid_1_tt;
    BEGIN
        FOR r IN (
            SELECT
                f.image_id   AS guid,
                fp.ordinal   AS position,
                it.ordinal   AS impression_type,
                ROW_NUMBER() OVER(
                    ORDER BY
                        fp.ordinal, f.image_id
                ) AS rn
            FROM
                dl_blacklist.fingerprints f
                INNER JOIN dl_blacklist.finger_positions fp ON fp.id = f.finger_position_id
                INNER JOIN dl_blacklist.finger_impression_types it ON it.id = f.impression_type_id
            WHERE
                f.biometric_id = pi_biometric_id
            ORDER BY
                fp.ordinal,
                f.image_id
        ) LOOP
            l_objects(r.rn).guid := r.guid;
            l_objects(r.rn).nist_position := r.position;
            l_objects(r.rn).nist_impression_type := r.impression_type;
        END LOOP;

        RETURN l_objects;
    END get_fingerprints_for_biometric;

    PROCEDURE insert_biometric_for_blacklist (
        pi_biometric   IN             biometric_1_r,
        po_biometric_id OUT NOCOPY pkg_utils.id_t
    ) IS
    BEGIN
        INSERT INTO dl_blacklist.biometrics (
            blacklist_case_id,
            abis_id
        ) VALUES (
            pi_biometric.blacklist_id,
            pi_biometric.abis_id
        ) RETURNING id INTO po_biometric_id;

    END insert_biometric_for_blacklist;

    FUNCTION get_biometric_for_blacklist (
        pi_blacklist_case_id IN   pkg_utils.id_t
    ) RETURN biometric_1_r IS
        l_biometrics   dl_blacklist.biometrics%rowtype;
        l_res          biometric_1_r;
    BEGIN
        SELECT
            *
        INTO l_biometrics
        FROM
            dl_blacklist.biometrics
        WHERE
            blacklist_case_id = pi_blacklist_case_id;

        l_res.id := l_biometrics.id;
        l_res.abis_id := l_biometrics.abis_id;
        l_res.blacklist_id := pi_blacklist_case_id;
        RETURN l_res;
    END get_biometric_for_blacklist;

    PROCEDURE get_blacklist_id (
        pi_identity_id   IN               pkg_utils.id_t,
        po_blacklist_case_id OUT NOCOPY pkg_utils.id_t
    ) IS
        l_is_active   dl_blacklist.blacklist_cases.is_active%TYPE;
    BEGIN
        SELECT
            c.id,
            is_active
        INTO
            po_blacklist_case_id,
            l_is_active
        FROM
            dl_blacklist.blacklist_cases c
            INNER JOIN dl_blacklist.blacklist_case_identities ci ON c.id = ci.blacklist_case
        WHERE
            ci.identity = pi_identity_id;

        IF l_is_active = 'N' THEN
            RAISE pkg_utils.err_not_active;
        END IF;
    END get_blacklist_id;

    FUNCTION get_blacklistcase (
        pi_blacklist_id IN   pkg_utils.id_t
    ) RETURN case_1_r IS
        l_case   case_1_r;
    BEGIN
        SELECT
            id,
            authority,
            behavior,
            case_number,
            secret_level,
            reason,
            is_active,
            urgent_contact,
            contact_information,
            target_code,
            action_code,
            notice,
            reference_document,
            warrant_arrested_type,
            criminal_case_number,
            arrested_description,
            arrested_status,
            decided_case_number,
            arrested_warrant_expiry_date,
            related_document,
            arrested_warrant_number,
            arrested_warrant_date,
            arrested_warrant_year,
            undecided_case_number,
            travel_permit,
            travel_permit_from,
            travel_permit_to,
            travel_permit_date_insert,
            travel_permit_date_delete,
            travel_permit_note,
            owner_data,
            other_description,
            contact_telephone_number,
            contact_owner_data,
            associated_behavior,
            other,
            case_type,
            ostay_creation_date,
            ostay_self_indictment,
            ostay_status,
            ostay_no_days,
            ostay_arrival_date,
            ostay_departure_date,
            ostay_tm6,
            ostay_block_period,
            ostay_notice,
            lost_pp_lost_date,
            lost_pp_last_place,
            lost_pp_notify_date,
            lost_pp_notify_place,
            lost_pp_visa_on_arriv,
            lost_pp_visa_exp_date,
            lost_pp_notice,
            lost_pp_new_pp_type,
            lost_pp_new_pp_number,
            lost_pp_new_pp_issue_date,
            lost_pp_new_pp_place_of_issue,
            lost_pp_new_pp_expire_date
        INTO
                l_case
            .id,
            l_case.authority,
            l_case.behavior,
            l_case.case_number,
            l_case.secret_level,
            l_case.reason,
            l_case.is_active,
            l_case.urgent_contact,
            l_case.contact_information,
            l_case.target_code,
            l_case.action_code,
            l_case.notice,
            l_case.reference_document,
            l_case.warrant_arrested_type,
            l_case.criminal_case_number,
            l_case.arrested_description,
            l_case.arrested_status,
            l_case.decided_case_number,
            l_case.arrested_warrant_expiry_date,
            l_case.related_document,
            l_case.arrested_warrant_number,
            l_case.arrested_warrant_date,
            l_case.arrested_warrant_year,
            l_case.undecided_case_number,
            l_case.travel_permit,
            l_case.travel_permit_from,
            l_case.travel_permit_to,
            l_case.travel_permit_date_insert,
            l_case.travel_permit_date_delete,
            l_case.travel_permit_note,
            l_case.owner_data,
            l_case.other_description,
            l_case.contact_telephone_number,
            l_case.contact_owner_data,
            l_case.associated_behavior,
            l_case.other,
            l_case.case_type,
            l_case.ostay_creation_date,
            l_case.ostay_self_indictment,
            l_case.ostay_status,
            l_case.ostay_no_days,
            l_case.ostay_arrival_date,
            l_case.ostay_departure_date,
            l_case.ostay_tm6,
            l_case.ostay_block_period,
            l_case.ostay_notice,
            l_case.lost_pp_lost_date,
            l_case.lost_pp_last_place,
            l_case.lost_pp_notify_date,
            l_case.lost_pp_notify_place,
            l_case.lost_pp_visa_on_arriv,
            l_case.lost_pp_visa_exp_date,
            l_case.lost_pp_notice,
            l_case.lost_pp_new_pp_type,
            l_case.lost_pp_new_pp_number,
            l_case.lost_pp_new_pp_issue_date,
            l_case.lost_pp_new_pp_place_of_issue,
            l_case.lost_pp_new_pp_expire_date
        FROM
            dl_blacklist.blacklist_cases
        WHERE
            id = pi_blacklist_id;

        IF l_case.is_active = 'N' THEN
            RAISE pkg_utils.err_not_active;
        END IF;
        RETURN l_case;
    END get_blacklistcase;

    PROCEDURE put_blacklistcase (
        pi_case   IN        case_1_r,
        po_blacklist_id OUT NOCOPY pkg_utils.id_t
    ) IS
        l_cnt   PLS_INTEGER;
    BEGIN
        IF pi_case.id IS NULL THEN
            INSERT INTO dl_blacklist.blacklist_cases (
                authority,
                behavior,
                case_number,
                secret_level,
                reason,
                urgent_contact,
                contact_information,
                target_code,
                action_code,
                notice,
                reference_document,
                warrant_arrested_type,
                criminal_case_number,
                arrested_description,
                arrested_status,
                decided_case_number,
                arrested_warrant_expiry_date,
                related_document,
                arrested_warrant_number,
                arrested_warrant_date,
                arrested_warrant_year,
                undecided_case_number,
                travel_permit,
                travel_permit_from,
                travel_permit_to,
                travel_permit_date_insert,
                travel_permit_date_delete,
                travel_permit_note,
                owner_data,
                other_description,
                contact_telephone_number,
                contact_owner_data,
                associated_behavior,
                other,
                case_type,
                ostay_creation_date,
                ostay_self_indictment,
                ostay_status,
                ostay_no_days,
                ostay_arrival_date,
                ostay_departure_date,
                ostay_tm6,
                ostay_block_period,
                ostay_notice,
                lost_pp_lost_date,
                lost_pp_last_place,
                lost_pp_notify_date,
                lost_pp_notify_place,
                lost_pp_visa_on_arriv,
                lost_pp_visa_exp_date,
                lost_pp_notice,
                lost_pp_new_pp_type,
                lost_pp_new_pp_number,
                lost_pp_new_pp_issue_date,
                lost_pp_new_pp_place_of_issue,
                lost_pp_new_pp_expire_date
            ) VALUES (
                pi_case.authority,
                pi_case.behavior,
                pi_case.case_number,
                pi_case.secret_level,
                pi_case.reason,
                pi_case.urgent_contact,
                pi_case.contact_information,
                pi_case.target_code,
                pi_case.action_code,
                pi_case.notice,
                pi_case.reference_document,
                pi_case.warrant_arrested_type,
                pi_case.criminal_case_number,
                pi_case.arrested_description,
                pi_case.arrested_status,
                pi_case.decided_case_number,
                pi_case.arrested_warrant_expiry_date,
                pi_case.related_document,
                pi_case.arrested_warrant_number,
                pi_case.arrested_warrant_date,
                pi_case.arrested_warrant_year,
                pi_case.undecided_case_number,
                pi_case.travel_permit,
                pi_case.travel_permit_from,
                pi_case.travel_permit_to,
                pi_case.travel_permit_date_insert,
                pi_case.travel_permit_date_delete,
                pi_case.travel_permit_note,
                pi_case.owner_data,
                pi_case.other_description,
                pi_case.contact_telephone_number,
                pi_case.contact_owner_data,
                pi_case.associated_behavior,
                pi_case.other,
                pi_case.case_type,
                pi_case.ostay_creation_date,
                pi_case.ostay_self_indictment,
                pi_case.ostay_status,
                pi_case.ostay_no_days,
                pi_case.ostay_arrival_date,
                pi_case.ostay_departure_date,
                pi_case.ostay_tm6,
                pi_case.ostay_block_period,
                pi_case.ostay_notice,
                pi_case.lost_pp_lost_date,
                pi_case.lost_pp_last_place,
                pi_case.lost_pp_notify_date,
                pi_case.lost_pp_notify_place,
                pi_case.lost_pp_visa_on_arriv,
                pi_case.lost_pp_visa_exp_date,
                pi_case.lost_pp_notice,
                pi_case.lost_pp_new_pp_type,
                pi_case.lost_pp_new_pp_number,
                pi_case.lost_pp_new_pp_issue_date,
                pi_case.lost_pp_new_pp_place_of_issue,
                pi_case.lost_pp_new_pp_expire_date
            ) RETURNING id INTO po_blacklist_id;

        ELSE
            UPDATE dl_blacklist.blacklist_cases
            SET
                authority = pi_case.authority,
                behavior = pi_case.behavior,
                case_number = pi_case.case_number,
                secret_level = pi_case.secret_level,
                reason = pi_case.reason,
                is_active = pi_case.is_active,
                urgent_contact = pi_case.urgent_contact,
                contact_information = pi_case.contact_information,
                target_code = pi_case.target_code,
                action_code = pi_case.action_code,
                notice = pi_case.notice,
                reference_document = pi_case.reference_document,
                warrant_arrested_type = pi_case.warrant_arrested_type,
                criminal_case_number = pi_case.criminal_case_number,
                arrested_description = pi_case.arrested_description,
                arrested_status = pi_case.arrested_status,
                decided_case_number = pi_case.decided_case_number,
                arrested_warrant_expiry_date = pi_case.arrested_warrant_expiry_date,
                related_document = pi_case.related_document,
                arrested_warrant_number = pi_case.arrested_warrant_number,
                arrested_warrant_date = pi_case.arrested_warrant_date,
                arrested_warrant_year = pi_case.arrested_warrant_year,
                undecided_case_number = pi_case.undecided_case_number,
                travel_permit = pi_case.travel_permit,
                travel_permit_from = pi_case.travel_permit_from,
                travel_permit_to = pi_case.travel_permit_to,
                travel_permit_date_insert = pi_case.travel_permit_date_insert,
                travel_permit_date_delete = pi_case.travel_permit_date_delete,
                travel_permit_note = pi_case.travel_permit_note,
                owner_data = pi_case.owner_data,
                other_description = pi_case.other_description,
                contact_telephone_number = pi_case.contact_telephone_number,
                contact_owner_data = pi_case.contact_owner_data,
                associated_behavior = pi_case.associated_behavior,
                other = pi_case.other,
                case_type = pi_case.case_type,
                ostay_creation_date = pi_case.ostay_creation_date,
                ostay_self_indictment = pi_case.ostay_self_indictment,
                ostay_status = pi_case.ostay_status,
                ostay_no_days = pi_case.ostay_no_days,
                ostay_arrival_date = pi_case.ostay_arrival_date,
                ostay_departure_date = pi_case.ostay_departure_date,
                ostay_tm6 = pi_case.ostay_tm6,
                ostay_block_period = pi_case.ostay_block_period,
                ostay_notice = pi_case.ostay_notice,
                lost_pp_lost_date = pi_case.lost_pp_lost_date,
                lost_pp_last_place = pi_case.lost_pp_last_place,
                lost_pp_notify_date = pi_case.lost_pp_notify_date,
                lost_pp_notify_place = pi_case.lost_pp_notify_place,
                lost_pp_visa_on_arriv = pi_case.lost_pp_visa_on_arriv,
                lost_pp_visa_exp_date = pi_case.lost_pp_visa_exp_date,
                lost_pp_notice = pi_case.lost_pp_notice,
                lost_pp_new_pp_type = pi_case.lost_pp_new_pp_type,
                lost_pp_new_pp_number = pi_case.lost_pp_new_pp_number,
                lost_pp_new_pp_issue_date = pi_case.lost_pp_new_pp_issue_date,
                lost_pp_new_pp_place_of_issue = pi_case.lost_pp_new_pp_place_of_issue,
                lost_pp_new_pp_expire_date = pi_case.lost_pp_new_pp_expire_date
            WHERE
                id = pi_case.id
            RETURNING id INTO po_blacklist_id;

            l_cnt := SQL%rowcount;
            IF l_cnt = 0 THEN
                RAISE no_data_found;
            END IF;
        END IF;
    END put_blacklistcase;

    FUNCTION get_identities_for_blacklist (
        pi_blacklist IN   pkg_utils.id_t
    ) RETURN identities_1_tt IS
        l_objects   identities_1_tt;
    BEGIN
        FOR r IN (
            SELECT
                salutation,
                surname,
                middle_name,
                given_name,
                surname_thai,
                middlename_thai,
                givenname_thai,
                i.date_of_birth_partial.getformatdata('YYYY-MM-DD') AS a_date_of_birth,
                place_of_birth,
                country_of_birth,
                nationality,
                sex,
                notice,
                profession,
                body_height,
                body_weight,
                body_shape,
                hair_color,
                hair_characteristic,
                face_shape,
                eye_color,
                skin,
                dominant_characteristic,
                special_characteristic,
                key_value,
                ROW_NUMBER() OVER(
                    ORDER BY
                        i.dml_at
                ) AS rn
            FROM
                identities i
                INNER JOIN dl_blacklist.blacklist_case_identities ci ON ci.identity = i.key_value
            WHERE
                ci.blacklist_case = pi_blacklist
        ) LOOP
            l_objects(r.rn).salutation := r.salutation;
            l_objects(r.rn).surname := r.surname;
            l_objects(r.rn).middle_name := r.middle_name;
            l_objects(r.rn).given_name := r.given_name;
            l_objects(r.rn).surname_thai := r.surname_thai;
            l_objects(r.rn).middlename_thai := r.middlename_thai;
            l_objects(r.rn).givenname_thai := r.givenname_thai;
            l_objects(r.rn).date_of_birth := r.a_date_of_birth;
            l_objects(r.rn).place_of_birth := r.place_of_birth;
            l_objects(r.rn).country_of_birth := r.country_of_birth;
            l_objects(r.rn).nationality := r.nationality;
            l_objects(r.rn).sex := r.sex;
            l_objects(r.rn).notice := r.notice;
            l_objects(r.rn).profession := r.profession;
            l_objects(r.rn).body_height := r.body_height;
            l_objects(r.rn).body_weight := r.body_weight;
            l_objects(r.rn).body_shape := r.body_shape;
            l_objects(r.rn).hair_color := r.hair_color;
            l_objects(r.rn).hair_characteristic := r.hair_characteristic;
            l_objects(r.rn).face_shape := r.face_shape;
            l_objects(r.rn).eye_color := r.eye_color;
            l_objects(r.rn).skin := r.skin;
            l_objects(r.rn).dominant_characteristic := r.dominant_characteristic;
            l_objects(r.rn).special_characteristic := r.special_characteristic;
            l_objects(r.rn).id := r.key_value;
            l_objects(r.rn).blacklist := pi_blacklist;
            get_traveldocs_for_identity(pi_identity => r.key_value, po_traveldocs => l_objects(r.rn).traveldocs);

            get_addresses_for_identity(pi_identity => r.key_value, po_addresses => l_objects(r.rn).addresses);

        END LOOP;

        RETURN l_objects;
    END get_identities_for_blacklist;

    PROCEDURE put_identity_for_blacklist (
        pi_identity    IN             identity_1_r,
        pi_blacklist   IN             pkg_utils.id_t,
        po_identity_id OUT NOCOPY pkg_utils.id_t
    ) IS

        l_scope        logger_logs.scope%TYPE := c_scope_prefix || 'put_identity_for_blacklist';
        l_params       logger.tab_param;
        --
        l_addresses    addresses_1_tt;
        l_traveldocs   traveldocs_1_tt;
        l_partial   dl_blacklist.ct_partial_date;

    BEGIN

        logger.append_param(l_params, 'pi_identity.id', pi_identity.id);
        logger.append_param(l_params, 'pi_blacklist', pi_blacklist);
        logger.log('PUT IDENTITY FOR BLACKLIST: start', l_scope, NULL, l_params);

        IF pi_blacklist IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        IF pi_identity.id IS NULL THEN
            INSERT INTO dl_blacklist.identities (
                salutation,
                surname,
                middle_name,
                given_name,
                surname_thai,
                middlename_thai,
                givenname_thai,
                date_of_birth_partial,
               -- date_of_birth,
                place_of_birth,
                country_of_birth,
                nationality,
                sex,
                notice,
                profession,
                body_height,
                body_weight,
                body_shape,
                hair_color,
                hair_characteristic,
                face_shape,
                eye_color,
                skin,
                dominant_characteristic,
                special_characteristic
            ) VALUES (
                pi_identity.salutation,
                pi_identity.surname,
                pi_identity.middle_name,
                pi_identity.given_name,
                pi_identity.surname_thai,
                pi_identity.middlename_thai,
                pi_identity.givenname_thai,
                pkg_dl_utils.get_partial_from_varchar(pi_identity.date_of_birth),
                --to_date(pi_identity.date_of_birth,'DD.MM.YY'),
                pi_identity.place_of_birth,
                pi_identity.country_of_birth,
                pi_identity.nationality,
                upper(pi_identity.sex),
                pi_identity.notice,
                pi_identity.profession,
                pi_identity.body_height,
                pi_identity.body_weight,
                pi_identity.body_shape,
                pi_identity.hair_color,
                pi_identity.hair_characteristic,
                pi_identity.face_shape,
                pi_identity.eye_color,
                pi_identity.skin,
                pi_identity.dominant_characteristic,
                pi_identity.special_characteristic
            ) RETURNING key_value INTO po_identity_id;

            logger.append_param(l_params, 'po_identity_id', po_identity_id);
            BEGIN
                INSERT INTO dl_blacklist.blacklist_case_identities (
                    blacklist_case,
                    identity
                ) VALUES (
                    pi_blacklist,
                    po_identity_id
                );

            EXCEPTION
                WHEN dup_val_on_index THEN
                    NULL;
            END;

        ELSE
            UPDATE dl_blacklist.identities
            SET
                salutation = pi_identity.salutation,
                surname = pi_identity.surname,
                middle_name = pi_identity.middle_name,
                given_name = pi_identity.given_name,
                surname_thai = pi_identity.surname_thai,
                middlename_thai = pi_identity.middlename_thai,
                givenname_thai = pi_identity.givenname_thai,
                date_of_birth_partial = pkg_dl_utils.get_partial_from_varchar(pi_identity.date_of_birth),
                --date_of_birth = to_date(pi_identity.date_of_birth,'DD.MM.YY'),
                place_of_birth = pi_identity.place_of_birth,
                country_of_birth = pi_identity.country_of_birth,
                nationality = pi_identity.nationality,
                sex = pi_identity.sex,
                notice = pi_identity.notice,
                profession = pi_identity.profession,
                body_height = pi_identity.body_height,
                body_weight = pi_identity.body_weight,
                body_shape = pi_identity.body_shape,
                hair_color = pi_identity.hair_color,
                hair_characteristic = pi_identity.hair_characteristic,
                face_shape = pi_identity.face_shape,
                eye_color = pi_identity.eye_color,
                skin = pi_identity.skin,
                dominant_characteristic = pi_identity.dominant_characteristic,
                special_characteristic = pi_identity.special_characteristic
            WHERE
                key_value = pi_identity.id
            RETURNING key_value INTO po_identity_id;

        END IF;

        l_addresses := pi_identity.addresses;
        put_addresses_for_identity(pio_addresses => l_addresses, pi_identity => coalesce(pi_identity.id, po_identity_id));

        l_traveldocs := pi_identity.traveldocs;
        put_traveldocs_for_identity(pio_traveldocs => l_traveldocs, pi_identity => coalesce(pi_identity.id, po_identity_id));

        logger.log('PUT IDENTITY FOR BLACKLIST: done', l_scope, NULL, l_params);
    EXCEPTION
        WHEN OTHERS THEN
            logger.log_error('PUT IDENTITY FOR BLACKLIST: unhandled exeption', l_scope, NULL, l_params);
            RAISE;
    END put_identity_for_blacklist;

    PROCEDURE delete_identity_for_blacklist (
        pi_identity    IN             identities.key_value%TYPE,
        pi_blacklist   IN             blacklist_cases.id%TYPE
    ) IS

        l_count   PLS_INTEGER;
        CURSOR addresses (
            p_key_value identities.key_value%TYPE
        ) IS
        SELECT
            id
        FROM
            addresses
        WHERE
            identity = p_key_value;

        CURSOR travel_docs (
            p_key_value identities.key_value%TYPE
        ) IS
        SELECT
            key_value
        FROM
            travel_docs
        WHERE
            identity = p_key_value;

    BEGIN
        SELECT
            COUNT(*)
        INTO l_count
        FROM
            blacklist_case_identities
        WHERE
            identity = pi_identity;

        DELETE FROM blacklist_case_identities
        WHERE
            identity = pi_identity
            AND blacklist_case = pi_blacklist;

        IF l_count <= 1 THEN
            -- last entry of identity for all cases
            -- delete related information first
            FOR c IN addresses(pi_identity) LOOP
                delete_address(c.id);
            END LOOP;
            FOR c IN travel_docs(pi_identity) LOOP
                delete_traveldoc(c.key_value);
            END LOOP;
            DELETE FROM identities
            WHERE
                key_value = pi_identity;

        END IF;

    END;

    PROCEDURE put_identities_for_blacklist (
        pi_identities   IN              identities_1_tt,
        pi_blacklist    IN              pkg_utils.id_t
    ) IS
        i       PLS_INTEGER;
        dummy   pkg_utils.id_t;

    BEGIN
        IF pi_blacklist IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        i := pi_identities.first;
        WHILE i IS NOT NULL LOOP
            put_identity_for_blacklist(pi_identity => pi_identities(i), pi_blacklist => pi_blacklist, po_identity_id => dummy);
            i := pi_identities.next(i);
        END LOOP;

    END put_identities_for_blacklist;

    PROCEDURE put_related_persons_for_blacklist (
        pi_related_persons   IN                   related_persons_1_tt,
        pi_i_blacklist       IN                   pkg_utils.id_t
    ) IS
        i       PLS_INTEGER;
        dummy   pkg_utils.id_t;
    BEGIN
        IF pi_i_blacklist IS NULL THEN
            RAISE err_invalid_identity_given;
        END IF;
        CASE
            WHEN pi_related_persons IS NOT NULL THEN
                i := pi_related_persons.first;
            ELSE
                i := NULL;
        END CASE;

        WHILE i IS NOT NULL LOOP
            put_related_person_for_blacklist(pi_related_person => pi_related_persons(i), pi_i_blacklist => pi_i_blacklist, po_related_person
            => dummy);

            i := pi_related_persons.next(i);
        END LOOP;

    END put_related_persons_for_blacklist;

    PROCEDURE put_related_person_for_blacklist (
        pi_related_person   IN                  related_person_1_r,
        pi_i_blacklist      IN                  pkg_utils.id_t,
        po_related_person OUT NOCOPY pkg_utils.id_t
    ) IS
        l_result_person_id   pkg_utils.id_t;
    BEGIN
        IF pi_related_person.key_value IS NULL THEN
            INSERT INTO related_persons (
                first_name,
                middle_name,
                last_name,
                relationship,
                notice,
                blacklist_case_id
            ) VALUES (
                pi_related_person.first_name,
                pi_related_person.middle_name,
                pi_related_person.last_name,
                pi_related_person.relationship,
                pi_related_person.notice,
                pi_i_blacklist
            ) RETURNING key_value INTO l_result_person_id;

        ELSE
            UPDATE related_persons
            SET
                first_name = pi_related_person.first_name,
                middle_name = pi_related_person.middle_name,
                last_name = pi_related_person.last_name,
                relationship = pi_related_person.relationship,
                notice = pi_related_person.notice
            WHERE
                key_value = pi_related_person.key_value;

            l_result_person_id := pi_related_person.key_value;
        END IF;

        po_related_person := l_result_person_id;
    END put_related_person_for_blacklist;

    -- TODO: create trigger for table

    PROCEDURE delete_related_person_for_blacklist (
        pi_related_person   IN                  related_persons.key_value%TYPE,
        pi_blacklist_id     IN                  blacklist_cases.id%TYPE
    ) IS
    BEGIN
        DELETE FROM related_persons
        WHERE
            key_value = pi_related_person;

    END delete_related_person_for_blacklist;

    FUNCTION get_related_persons_for_blacklist (
        pi_blacklist_case IN   pkg_utils.id_t
    ) RETURN related_persons_1_tt IS
        l_result   related_persons_1_tt;
    BEGIN
        FOR r IN (
            SELECT
                key_value,
                first_name,
                middle_name,
                last_name,
                relationship,
                notice,
                ROW_NUMBER() OVER(
                    ORDER BY
                        dml_at
                ) AS rn
            FROM
                related_persons
            WHERE
                blacklist_case_id = pi_blacklist_case
        ) LOOP
            l_result(r.rn).key_value := r.key_value;
            l_result(r.rn).first_name := r.first_name;
            l_result(r.rn).middle_name := r.middle_name;
            l_result(r.rn).last_name := r.last_name;
            l_result(r.rn).relationship := r.relationship;
            l_result(r.rn).notice := r.notice;
        END LOOP;

        RETURN l_result;
    END get_related_persons_for_blacklist;

END pkg_db_access;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DB_ACCESS" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DB_ACCESS" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DB_ACCESS" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DB_ACCESS" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DB_ACCESS" TO "BIOSAADM";
