CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_OPERATING" IS
    PROCEDURE reset_lifetime_unreferenced_images IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_cnt NUMBER;
    BEGIN
        UPDATE images
        SET lifetime = 84400
        WHERE id NOT IN (SELECT image_id
                         FROM faces
                         UNION
                         SELECT image_id
                         FROM fingerprints)
        AND lifetime = 0;
        l_cnt := SQL%ROWCOUNT;
        COMMIT;
        dbms_output.put_line('deleted ' || l_cnt);
    END reset_lifetime_unreferenced_images;

    PROCEDURE delete_case(pi_case_id IN pkg_utils.id_t) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
        l_case blacklist_cases%ROWTYPE;
        l_bio  biometrics%ROWTYPE;
        TYPE identities_tt IS TABLE OF identities.key_value%TYPE;
        identities_table identities_tt;
        i                PLS_INTEGER;
    BEGIN

        SELECT *
        INTO l_case
        FROM blacklist_cases
        WHERE id = pi_case_id;

        BEGIN
            SELECT *
            INTO l_bio
            FROM biometrics
            WHERE blacklist_case_id = pi_case_id;

            DELETE FROM faces
            WHERE biometric_id = l_bio.id;
            DELETE FROM fingerprints
            WHERE biometric_id = l_bio.id;

            DELETE FROM biometrics
            WHERE id = l_bio.id;
        EXCEPTION
            WHEN no_data_found THEN
                NULL;
        END;
        identities_table := identities_tt();
        SELECT identity
        BULK COLLECT
        INTO identities_table
        FROM dl_blacklist.blacklist_case_identities
        WHERE blacklist_case = l_case.id;
        DELETE FROM travel_docs
        WHERE identity IN (SELECT identity
                           FROM dl_blacklist.blacklist_case_identities
                           WHERE blacklist_case = l_case.id);
        DELETE FROM addresses
        WHERE identity IN (SELECT identity
                           FROM dl_blacklist.blacklist_case_identities
                           WHERE blacklist_case = l_case.id);

        i := identities_table.first;
        WHILE i IS NOT NULL
        LOOP
            DELETE FROM dl_blacklist.blacklist_case_identities
            WHERE identity = identities_table(i);
            DELETE FROM identities
            WHERE key_value = identities_table(i);
            i := identities_table.next(i);
        END LOOP;

        DELETE FROM related_persons
        WHERE blacklist_case_id = l_case.id;
        DELETE FROM blacklist_cases
        WHERE id = l_case.id;

        COMMIT;
    END delete_case;

    PROCEDURE delete_cases_for_abis_id(pi_abis_id IN NUMBER) IS
    BEGIN
        FOR r IN (SELECT blacklist_case_id AS id
                  FROM biometrics
                  WHERE abis_id = pi_abis_id
                  ORDER BY 1)
        LOOP
            dbms_output.put_line(r.id);
            pkg_operating.delete_case(r.id);

        END LOOP;
    END delete_cases_for_abis_id;

    PROCEDURE delete_cases_without_biometric IS
    BEGIN
        FOR r IN (SELECT id
                  FROM blacklist_cases
                  WHERE id NOT IN (SELECT blacklist_case_id
                                   FROM biometrics)
                  ORDER BY 1)
        LOOP
            dbms_output.put_line(r.id);
            pkg_operating.delete_case(r.id);
        END LOOP;
    END delete_cases_without_biometric;

BEGIN
    NULL;
END pkg_operating;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_OPERATING" TO "DL_STAGING4PIBICS_INTF";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_OPERATING" TO "DERMALOG_PROXY";
